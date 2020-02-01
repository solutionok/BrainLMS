<?php
namespace App\Http\Controllers;

use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\NotificationMobHistory;
use App\Models2\Subject;
use App\Models2\User;
use Illuminate\Support\Facades\URL;

class mobileNotifController extends Controller {

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
		$this->data['users'] = $this->panelInit->getAuthUser();
		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}

		if(!$this->panelInit->can( array("mobileNotifications.sendNewNotification") )){
			exit;
		}
	}

	public function listAll($page = 1)
	{
		$return = array();
		$return['totalItems'] = 0;
		$all_pagination_number = all_pagination_number();

		if($this->panelInit->getAuthUser()->role == 'admin') {
			$mobNotifications = \mob_notifications::orderBy('id','desc');
			$return['totalItems'] += $mobNotifications->count();

			$current_pag_take = round($all_pagination_number / 2);
			$current_pag_skip = round(($all_pagination_number * ($page - 1)) / 2);
		} else {
			$mobNotifications = \mob_notifications::where('notifToIds', 'like', '%'.$this->panelInit->getAuthUser()->id.'%');
			$return['totalItems'] += $mobNotifications->count();

			$current_pag_take = $all_pagination_number;
			$current_pag_skip = $all_pagination_number * ($page - 1);
		}

		// automatic of attendance, homeworks, etc... of current user
		$getDynamicNotificationsQuery = NotificationMobHistory::where('user_id', $this->panelInit->getAuthUser()->id);
		$getDynamicNotifications = $getDynamicNotificationsQuery
	    ->take($current_pag_take)
	    ->skip($current_pag_skip)
	    ->orderBy('id','desc')
		  ->get()->toArray();
		$return['totalItems'] += NotificationMobHistory::where('user_id', $this->panelInit->getAuthUser()->id)->count();

		// for manual notification from admin for example
		$mobNotifications = $mobNotifications
		  ->take($current_pag_take)
	    ->skip($current_pag_skip)
		  ->orderBy('id','desc')
		  ->get()->toArray();

		foreach ($mobNotifications as $value) {
			$value['notifData'] = htmlspecialchars_decode($value['notifData'], ENT_QUOTES);
			$value['notifDate'] = $this->panelInit->unix_to_date($value['notifDate']);
			$value['notifCurrentRedirectLink'] = '';
			$value['main_type'] = 'general';
			$return['items'][] = $value;
		}

		foreach ($getDynamicNotifications as $value) {
			$value['notifTo'] = User::find($value['user_id'])->fullName;
			$value['notifToIds'] = [];
			$value['notifData'] = htmlspecialchars_decode($value['value'], ENT_QUOTES);
			$value['notifDate'] = $value['date'];
			$value['notifSender'] = 'System';
			$value['notifCurrentRedirectLink'] = $value['redirect_link'];
			$value['main_type'] = 'custom';
			$return['items'][] = $value;
		}

		return $return;
	}

	public function create(){
		$mobNotifications = new \mob_notifications();

		if(\Input::get('userType') == "users"){

			if(!is_array(\Input::get('toId')) || ( is_array(\Input::get('toId')) AND count(\Input::get('toId')) == 0 ) ){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['mobileNotifications'],"No users selected !");
			}

			$mobNotifications->notifTo = "users";
			$mobNotifications->notifToIds = json_encode(\Input::get('toId'));
		}elseif(\Input::get('userType') == "students"){
			$mobNotifications->notifTo = "students";
			$mobNotifications->notifToIds = json_encode(\Input::get('classId'));
		}else{
			$mobNotifications->notifTo = \Input::get('userType');
			$mobNotifications->notifToIds = "";
		}

		$mobNotifications->notifData = htmlspecialchars(\Input::get('notifData'),ENT_QUOTES);

		$mobNotifications->notifDate = time();
		$mobNotifications->notifSender = $this->data['users']->fullName . " [ " . $this->data['users']->id . " ] ";
		$mobNotifications->save();

		user_log('Mobile notification', 'create');

		if(isset($this->panelInit->settingsArray['firebase_apikey']) AND $this->panelInit->settingsArray['firebase_apikey'] != ""){
			//Send the PUSH Notifs.

			$users_list = \User::select('id', 'firebase_token');
			$usersList = \Input::get('toId');

			if(\Input::get('userType') == "users"){
				$users_list = $users_list->whereIn('id',$usersList);
			}elseif(\Input::get('userType') == "teachers"){
				$toIdArray =  array();
				$subject = \subject::whereIn('id',\Input::get('subjectId'))->get()->toArray();
				foreach($subject as $value){
					$value['teacherId'] = json_decode($value['teacherId'],true);
					if(is_array($value['teacherId'])){
						foreach($value['teacherId'] as $value_){
							$toIdArray[] = $value_;
						}
					}
				}

				$users_list = $users_list->where('role','teacher')->whereIn('id',$toIdArray);
			}elseif(\Input::get('userType') == "students"){
				$users_list = $users_list->where('role','student')->whereIn('studentClass',\Input::get('classId'));
				if(\Input::has('sectionId')){
					$users_list = $users_list->whereIn('studentSection',\Input::get('sectionId'));
				}
			}elseif(\Input::get('userType') == "parents"){
				$users_list = $users_list->where('role','parent');

				$stdInClassIds = \User::where('role','student')->whereIn('studentClass',\Input::get('classId'))->select('id');
				if($this->panelInit->settingsArray['enableSections'] == true){
					$stdInClassIds = $stdInClassIds->whereIn('studentClass',\Input::get('sectionId'));
				}
				$stdInClassIds = $stdInClassIds->get()->toArray();

				$users_list = $users_list->where('role','parent')->where(function ($query) use ($stdInClassIds) {
					foreach($stdInClassIds as $value){
						$query = $query->orWhere('parentOf', 'like', '%"'.$value['id'].'"%');
					}
				});
			}else{
				$users_list = $users_list;
			}
			$users_list = $users_list->get()->toArray();

			//Send Push Notifications
			$tokens_list = array();
			$user_ids = array();
			foreach ($users_list as $value) {
				if($value['firebase_token'] != ""){
					if(is_array(json_decode($value['firebase_token']))) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list[] = $token;
						}
					} else if ($this->isJson($value['firebase_token'])) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list[] = $token;
						}
					} else {
						$tokens_list[] = $value['firebase_token'];
					}
				} else {
					$user_ids[] = $value['id'];
				}
			}
			if(count($tokens_list) > 0){
				$this->panelInit->send_push_notification($tokens_list, $user_ids, \Input::get('notifData'), "Notification", 'notification');
			} else {
				$this->panelInit->save_notifications_toDB($tokens_list, $user_ids, \Input::get('notifData'), "Notification", 'notification');
			}
			//END of sending real-notifications
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['mobileNotifications'],$this->panelInit->language['messQueued'],$this->listAll());
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	public function delete($id){
		if ( $postDelete = \mob_notifications::where('id', $id)->first() ){
			user_log('Mobile notification', 'delete');
			$postDelete->delete();
			return $this->panelInit->apiOutput(true,"Delete Notification","Notification deleted");
		}else{
			return $this->panelInit->apiOutput(false,"Delete Notification","Notification isn't exist");
		}
	}

	public function list_classes()
	{

		$toReturn = array();
		$teachers = \User::where('role','teacher')->select('id','fullName')->get()->toArray();
		// $toReturn['dormitory'] =  \dormitories::get()->toArray();

		$toReturn['subject'] = array();
		$subjects =  \subject::get();
		foreach ($subjects as $value) {
		    $toReturn['subject'][$value->id] = $value->subjectTitle;
		}

		$toReturn['classes'] = array();
		$classes = \classes::leftJoin('dormitories', 'dormitories.id', '=', 'classes.dormitoryId')
					->select('classes.id as id',
					'classes.className as className',
					// 'classes.classTeacher as classTeacher',
					// 'classes.classSubjects as classSubjects',
					'dormitories.id as dormitory',
					'dormitories.dormitory as dormitoryName');

		if($this->data['users']->role == "teacher"){
			$class_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
			$classes = $classes->whereIn('classes.id', $class_ids);
		}

		$classes = $classes->where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();

		$toReturn['teachers'] = array();
		foreach($teachers as $teacherKey => $teacherValue){
			$toReturn['teachers'][$teacherValue['id']] = $teacherValue;
		}

		foreach($classes as $key => $class){
			$toReturn['classes'][$key] = $class;
			$toReturn['classes'][$key]['classSubjects'] = Main::getSubjectIdsByClassId($class['id']);
			$toReturn['classes'][$key]['classTeacher'] = Main::getTeacherIdsByClassId($class['id']);
		}

		return $toReturn;
	}

}
