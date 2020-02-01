<?php

namespace App\Http\Controllers;

use App\Jobs\SendMessageNotification;
use App\Models2\User;
use App\Models2\messages_list;
use Illuminate\Support\Facades\Auth;

class MessagesController extends Controller {

	var $data = array();
	var $panelInit ;
	var $layout = 'dashboard';

	public function __construct(){
		if(app('request')->header('Authorization') != "" || \Input::has('token')){
			$this->middleware('jwt.auth');
		}else{
			$this->middleware('authApplication');
		}

		$this->panelInit = new \DashboardInit();
		$this->data['panelInit'] = $this->panelInit;
		$this->data['breadcrumb']['Settings'] = \URL::to('/dashboard/languages');
		$this->data['users'] = $this->panelInit->getAuthUser();
		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}
	}

	public function listMessages($page = 1)
	{
		$toReturn = array();

		User::$withoutAppends = true;
		$toReturn['messages'] = messages_list::where('userId', Auth::guard('web')->user()->id)
	    ->with('user')
		  ->orderBy('lastMessageDate','DESC')
		  ->take(all_pagination_number())
		  ->skip(all_pagination_number() * ($page - 1))
		  ->get();

		foreach ($toReturn['messages'] as $key => $value) {
			$toReturn['messages'][$key]['students'] = [];
			$toReturn['messages'][$key]['sender_receiver_data'] = User::find($value->toId);
			if($toReturn['messages'][$key]['sender_receiver_data']) {
				$toReturn['messages'][$key]['receiver_role'] = $toReturn['messages'][$key]['sender_receiver_data']->role;
			}

			if($toReturn['messages'][$key]['receiver_role'] == 'parent') {
				$students_ids = User::getStudentsIdsFromParentId($value->toId);
				$student_collection = User::whereIn('id', $students_ids)
				  ->select('id', 'fullName')
				  ->get()->toArray();
				$toReturn['messages'][$key]['students'] = $student_collection;
			}

		}

		$toReturn['totalItems'] = messages_list::where('userId', Auth::guard('web')->user()->id)->count();

		foreach ($toReturn['messages'] as $key => $value) {
			$toReturn['messages'][$key]->lastMessageDate = $this->panelInit->unix_to_date($toReturn['messages'][$key]->lastMessageDate, $this->panelInit->settingsArray['dateformat']." hr:mn a");
		}

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'messages', null);

		return json_encode($toReturn);
	}

	public function fetch($messageId,$page = 1)
	{
		$toReturn = array();
		$toReturn['user'] = $this->data['users'];
		$toReturn['messageDet'] = \DB::select(\DB::raw("
			SELECT messages_list.id as id,
			messages_list.lastMessageDate as lastMessageDate,
			messages_list.enable_reply as enableReply,
			messages_list.userId as fromId,
			messages_list.toId as toId,users.fullName as fullName,users.id as userId,users.photo as photo from messages_list LEFT JOIN users ON users.id=messages_list.toId where messages_list.id='$messageId' AND userId='".$this->data['users']->id."' order by id DESC"));
		if(count($toReturn['messageDet']) > 0){
			$toReturn['messageDet'] = $toReturn['messageDet'][0];
		}else{
			return json_encode(array("jsTitle"=>$this->panelInit->language['readMessage'],"jsStatus"=>"0","jsMessage"=>$this->panelInit->language['messageNotExist'] ));
			exit;
		}

		$toReturn['messages'] = \DB::select(\DB::raw("
			SELECT messages.id as id,
			messages.fromId as fromId,
			messages.messageText as messageText,
			messages.dateSent as dateSent,
			messages.enable_reply as enableReply,
			users.fullName as fullName,
			users.id as userId,users.photo as photo FROM messages LEFT JOIN users ON users.id=messages.fromId where messages.userId='".$this->data['users']->id."' AND ( (messages.fromId='".$this->data['users']->id."' OR messages.fromId='".$toReturn['messageDet']->toId."' ) AND (messages.toId='".$this->data['users']->id."' OR messages.toId='".$toReturn['messageDet']->toId."' ) ) order by id DESC limit 20"));

		foreach ($toReturn['messages'] as $key => $value) {
			$toReturn['messages'][$key]->dateSentH = $this->panelInit->unix_to_date($toReturn['messages'][$key]->dateSent, $this->panelInit->settingsArray['dateformat']." hr:mn a");
		}

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'messages', $messageId);

		return json_encode($toReturn);
	}

	public function reply($id){
		$messages = new \messages();
		$messages->messageId = $id;
		$messages->userId = $this->data['users']->id;
		$messages->fromId = $this->data['users']->id;
		$messages->toId = \Input::get('toId');
		$messages->messageText = \Input::get('reply');
		$messages->dateSent = time();
		$messages->enable_reply = 1;
		$messages->save();

		$messages = new \messages();
		$messages->messageId = $id;
		$messages->userId = \Input::get('toId');
		$messages->fromId = $this->data['users']->id;
		$messages->toId = \Input::get('toId');
		$messages->messageText = \Input::get('reply');
		$messages->dateSent = time();
		$messages->enable_reply = 1;
		$messages->save();

		$messagesList = \messages_list::where('userId',$this->data['users']->id)->where('toId',\Input::get('toId'));
		if($messagesList->count() == 0){
			$messagesList = new \messages_list();
			$messagesList->userId = $this->data['users']->id;
			$messagesList->toId = \Input::get('toId');
		}else{
			$messagesList = $messagesList->first();
		}
		$messagesList->lastMessage = \Input::get('reply');
		$messagesList->lastMessageDate = time();
		$messagesList->messageStatus = 0;
		$messagesList->enable_reply = 1;
		$messagesList->save();

		$messagesList_ = \messages_list::where('userId',\Input::get('toId'))->where('toId',$this->data['users']->id);
		if($messagesList_->count() == 0){
			$messagesList_ = new \messages_list();
			$messagesList_->userId = \Input::get('toId');
			$messagesList_->toId = $this->data['users']->id;
		}else{
			$messagesList_ = $messagesList_->first();
		}
		$messagesList_->lastMessage = \Input::get('reply');
		$messagesList_->lastMessageDate = time();
		$messagesList_->messageStatus = 1;
		$messagesList_->enable_reply = 1;
		$messagesList_->save();


		//Send Push Notifications
		$tokens_list = array();
		$user_ids = array();

		$to_user = \User::where('id',\Input::get('toId'))->select('id', 'firebase_token')->first();
		if(is_array(json_decode($to_user->firebase_token))) {
			foreach (json_decode($to_user->firebase_token) as $token) {
				$tokens_list[] = $token;
			}
		} else {
			$tokens_list[] = $to_user->firebase_token;
		}
		$user_ids[] = $to_user->id;

		if($to_user->firebase_token != ""){
			$this->panelInit->send_push_notification(
				$tokens_list,
				$user_ids,
				$this->panelInit->language['newMessageFrom']." ".$this->data['users']->fullName,
				$this->panelInit->language['Messages'],
				"messages",
				$messagesList_->id
			);
		} else {
			$this->panelInit->save_notifications_toDB(
				$tokens_list,
				$user_ids,
				$this->panelInit->language['newMessageFrom']." ".$this->data['users']->fullName,
				$this->panelInit->language['Messages'],
				"messages",
				$messagesList_->id
			);
		}

		echo 1;
		exit;
	}

	public function before($from,$to,$before = 0){
		$toReturn['messages'] = \DB::select(\DB::raw("SELECT messages.id as id,messages.fromId as fromId, messages.enable_reply as enableReply, messages.messageText as messageText,messages.dateSent as dateSent,users.fullName as fullName,users.id as userId,users.photo as photo FROM messages LEFT JOIN users ON users.id=messages.fromId where userId='".$this->data['users']->id."' AND ( (fromId='$from' OR fromId='$to' ) AND (toId='$from' OR toId='$to' ) ) AND dateSent < '$before' order by id DESC limit 20"));
		foreach ($toReturn['messages'] as $key => $value) {
			$toReturn['messages'][$key]->dateSentH = $this->panelInit->unix_to_date($toReturn['messages'][$key]->dateSent, $this->panelInit->settingsArray['dateformat']." hr:mn a");
		}
		return $toReturn['messages'];
	}

	public function ajax($from,$to,$after = 0){
		$messagesList = \messages_list::where('userId',$this->data['users']->id)->where('toId',$to);
		if($messagesList->count() == 0){
			exit;
		}
		$messagesList = $messagesList->first();
		$messagesList->messageStatus = 0;
		$messagesList->save();
		$toReturn['messages'] = \DB::select(\DB::raw("SELECT messages.id as id,messages.fromId as fromId, messages.enable_reply as enableReply, messages.messageText as messageText,messages.dateSent as dateSent,users.fullName as fullName,users.id as userId,users.photo as photo FROM messages LEFT JOIN users ON users.id=messages.fromId where userId='".$this->data['users']->id."' AND ( (fromId='$from' OR fromId='$to' ) AND (toId='$from' OR toId='$to' ) ) AND dateSent>'$after' order by id DESC"));

		foreach ($toReturn['messages'] as $key => $value) {
			$toReturn['messages'][$key]->dateSentH = $this->panelInit->unix_to_date($toReturn['messages'][$key]->dateSent, $this->panelInit->settingsArray['dateformat']." hr:mn a");
		}

		return $toReturn['messages'];
	}

	public function read(){
		if(\Input::get('items')){
			if(count(\Input::get('items')) > 0){
				$items = implode(",",\Input::get('items'));
				\DB::update(\DB::raw("UPDATE messages_list SET messageStatus='0' where id IN (".$items.")"));
			}
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['chgMessage'],$this->panelInit->language['messIsRead']);
	}

	public function unread(){
		if(\Input::get('items')){
			if(count(\Input::get('items')) > 0){
				$items = implode(",",\Input::get('items'));
				\DB::update(\DB::raw("UPDATE messages_list SET messageStatus='1' where id IN (".$items.")"));
			}
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['chgMessage'],$this->panelInit->language['messIsUnread']);
	}

	public function delete(){
		if(\Input::get('items')){
			if(count(\Input::get('items')) > 0){
				$arr = \Input::get('items');
				foreach($arr as $value){
					$messagesList = \messages_list::where('id',$value)->first();
					\DB::delete(\DB::raw("DELETE from messages where userId='".$this->data['users']->id."' AND ( (fromId = '".$messagesList->userId."' AND toId = '".$messagesList->toId."') OR (fromId = '".$messagesList->toId."' AND toId = '".$messagesList->userId."') ) "));
					\DB::delete(\DB::raw("DELETE from messages_list where id = '$value'"));
				}
				user_log('Messages', 'delete');
			}
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['delMess'],$this->panelInit->language['messDel']);
	}

	public function create(){
		ini_set('max_execution_time', 1000);

		$users_list = array();
		$enable_reply_array = [];
		User::$withoutAppends = true;

		if( is_array(\Input::get('toId')) ){
			$users_ids = array();
			$toId_list = \Input::get('toId');
			foreach ($toId_list as $key => $id) {
				$users_ids[] = $id;
			}

			$users = \User::whereIn('id',$users_ids);
			if($users->count() == 0){
				echo $this->panelInit->language['userisntExist'];
				exit;
			}
			$users_array = $users->get();

			foreach ($users_array as $key => $user) {
				if($user->role == 'student') {
					foreach (User::getRealParentIdsFromStudentId($user->id) as $key => $parent_id) {
						$users_list[] = $parent_id;
					}
				} else {
					$users_list[] = $user->id;
				}
			}
		}else{
			$users = \User::where('username',\Input::get('toId'))->orWhere('email',\Input::get('toId'));
			if($users->count() == 0){
				echo $this->panelInit->language['userisntExist'];
				exit;
			}
			$users_list[] = $users->first()->id;
		}

		$tokens_list = array();
		$user_ids = array();

		foreach ($users_list as $key => $user_id) {
			if($user_id == $this->data['users']->id){
				continue;
			}

			$messagesList = \messages_list::where('userId',$this->data['users']->id)->where('toId',$user_id);
			if($messagesList->count() == 0){
				$messagesList = new \messages_list();
				$messagesList->userId = $this->data['users']->id;
				$messagesList->toId = $user_id;
			}else{
				$messagesList = $messagesList->first();
			}
			$messagesList->lastMessage = \Input::get('messageText');
			$messagesList->lastMessageDate = time();
			$messagesList->messageStatus = 0;
			if(!is_null(\Input::get('is_enable_reply')))
				$messagesList->enable_reply = 1;
			else
				$messagesList->enable_reply = 0;
			$messagesList->save();
			$toReturnId = $messagesList->id;

			$messagesList_ = \messages_list::where('userId',$user_id)->where('toId',$this->data['users']->id);
			if($messagesList_->count() == 0){
				$messagesList_ = new \messages_list();
				$messagesList_->userId = $user_id;
				$messagesList_->toId = $this->data['users']->id;
			}else{
				$messagesList_ = $messagesList_->first();
			}
			$messagesList_->lastMessage = \Input::get('messageText');
			$messagesList_->lastMessageDate = time();
			$messagesList_->messageStatus = 1;
			if(!is_null(\Input::get('is_enable_reply')))
				$messagesList_->enable_reply = 1;
			else
				$messagesList_->enable_reply = 0;
			$messagesList_->save();
			$toReturnId_ = $messagesList_->id;

			$messages = new \messages();
			$messages->messageId = $toReturnId;
			$messages->userId = $this->data['users']->id;
			$messages->fromId = $this->data['users']->id;
			$messages->toId = $user_id;
			$messages->messageText = \Input::get('messageText');
			$messages->dateSent = time();
			if(!is_null(\Input::get('is_enable_reply')))
				$messages->enable_reply = 1;
			else
				$messages->enable_reply = 0;
			$messages->save();

			$messages = new \messages();
			$messages->messageId = $toReturnId_;
			$messages->userId = $user_id;
			$messages->fromId = $this->data['users']->id;
			$messages->toId = $user_id;
			$messages->messageText = \Input::get('messageText');
			$messages->dateSent = time();
			if(!is_null(\Input::get('is_enable_reply')))
				$messages->enable_reply = 1;
			else
				$messages->enable_reply = 0;
			$messages->save();

			$firebase_token = User::find($user_id)->firebase_token;
			if(is_array(json_decode($firebase_token))) {
				foreach (json_decode($firebase_token) as $token) {
					$tokens_list[] = $token;
					// \Log::debug("Array Message Token: " . $token);
				}
			} else if ($this->isJson($firebase_token)) {
				foreach (json_decode($firebase_token) as $token) {
					$tokens_list[] = $token;
					// \Log::debug("Json Message Token: " . $token);
				}
			} else {
				$tokens_list[] = $firebase_token;
				// \Log::debug("String Message Token: " . $firebase_token);
			}
			$user_ids[] = $user_id;

			// Queue code
			// dispatch(new SendMessageNotification(
			// 	$user_id,
			// 	$tokens_list,
			// 	$user_ids,
			// 	$messagesList_->id,
			// 	Auth::guard('web')->user()->fullName
			// ));
		}

		user_log('Messages', 'create');

		// Send Push Notifications
		if(count($tokens_list) > 0){
			$this->panelInit->send_push_notification(
				$tokens_list,
				$user_ids,
				$this->panelInit->language['newMessageFrom']." ".$this->data['users']->fullName,
				$this->panelInit->language['Messages'],
				"messages",
				""
			);
		} else {
			$this->panelInit->save_notifications_toDB(
				$tokens_list,
				$user_ids,
				$this->panelInit->language['newMessageFrom']." ".$this->data['users']->fullName,
				$this->panelInit->language['Messages'],
				"messages",
				""
			);
		}

		if(count($users_list) == 1 AND isset($toReturnId)){
			return json_encode(array('messageId'=>$toReturnId));
		}else{
			return json_encode(array('messageId'=>"home"));
		}
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	public function searchUser($user){
		$Users = \User::where('fullName','like','%'.$user.'%')->orWhere('username','like','%'.$user.'%')->orWhere('email','like','%'.$user.'%')->get();
		$retArray = array();
		foreach ($Users as $user) {
			$retArray[$user->id] = array("id"=>$user->id,"name"=>$user->fullName,"email"=>$user->email,"role"=>$user->role,"username"=>$user->username);
		}
		return json_encode($retArray);
	}

}
