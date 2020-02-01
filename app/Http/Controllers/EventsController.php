<?php
namespace App\Http\Controllers;

use App\Models2\Newsboard;
use App\Models2\NotificationMobHistory;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class EventsController extends Controller {

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

	public function listAll()
	{
		if(!$this->panelInit->can( array("events.list","events.View","events.addEvent","events.editEvent","events.delEvent") )){
			exit;
		}

		$toReturn = array();
		if($this->data['users']->role == "admin" ){
			$toReturn['events'] = \events::orderby('eventDate','DESC')->get()->toArray();
		}else{
			$toReturn['events'] = \events::where('eventFor',$this->data['users']->role)
			  ->orWhere('eventFor','all')
			  ->orderby('eventDate','DESC')
			  ->get()->toArray();
		}

		foreach ($toReturn['events'] as $key => $item) {
			$toReturn['events'][$key]['eventDescription'] = strip_tags(htmlspecialchars_decode($toReturn['events'][$key]['eventDescription'],ENT_QUOTES));
			$toReturn['events'][$key]['eventDate'] = $this->panelInit->unix_to_date($toReturn['events'][$key]['eventDate']);
		}

		return $toReturn;
	}

	public function listAllEventAndNotices() {
		if(!$this->panelInit->can( array("events.list","events.View","events.addEvent","events.editEvent","events.delEvent") )){
			exit;
		}

		$newsboard_query = Newsboard::orderBy('newsDate', 'DESC')
			->select([
				'newsTitle as eventTitle',
				'newsText as eventDescription',
				'newsFor as eventFor',
				'newsDate as eventDate',
				'newsImage as eventImage',
				'fe_active as fe_active',
			]);

		$toReturn = array();
		if($this->data['users']->role == "admin" ){
			$toReturn['events'] = \events::orderby('eventDate','DESC')->get()->toArray();
			$toReturn['notices'] = $newsboard_query->get()->toArray();
		}else{
			$toReturn['events'] = \events::where('eventFor',$this->data['users']->role)
			  ->orWhere('eventFor','all')
			  ->orderby('eventDate','DESC')
			  ->get()->toArray();
			$toReturn['notices'] = $newsboard_query->where('newsFor', $this->data['users']->role)
				->orWhere('newsFor', 'all')
			  ->get()->toArray();
		}

		foreach ($toReturn['events'] as $key => $item) {
			$toReturn['events'][$key]['eventDescription'] = strip_tags(htmlspecialchars_decode($toReturn['events'][$key]['eventDescription'],ENT_QUOTES));
			$toReturn['events'][$key]['eventDate'] = $this->panelInit->unix_to_date($toReturn['events'][$key]['eventDate']);
			$toReturn['events'][$key]['__type'] = 'event';
		}
		foreach ($toReturn['notices'] as $key => $value) {
			$toReturn['notices'][$key]['eventDescription'] = strip_tags(htmlspecialchars_decode($toReturn['notices'][$key]['eventDescription'],ENT_QUOTES));
			$toReturn['notices'][$key]['eventDate'] = $this->panelInit->unix_to_date($toReturn['notices'][$key]['eventDate']);
			$toReturn['notices'][$key]['__type'] = 'notice';
		}

		$toReturn['events'] = array_merge($toReturn['events'], $toReturn['notices']);

		return $toReturn;
	}

	public function listAllUpcoming() {
		if(!$this->panelInit->can( array("events.list","events.View","events.addEvent","events.editEvent","events.delEvent") )){
			exit;
		}

		$toReturn = array();
		$today_minus_days = Carbon::now()->subDays(3)->timestamp;
		$today_plus_days = Carbon::now()->addDays(7)->timestamp;

		if($this->data['users']->role == "admin" ){
			$toReturn['events'] = \events::orderby('eventDate','DESC')
				->whereBetween('eventDate', [$today_minus_days, $today_plus_days])
			  ->get()->toArray();
		}else{
			$toReturn['events'] = \events::where('eventFor',$this->data['users']->role)
			  ->orWhere('eventFor','all')
			  ->orderby('eventDate','DESC')
			  ->whereBetween('eventDate', [$today_minus_days, $today_plus_days])
			  ->get()->toArray();
		}

		foreach ($toReturn['events'] as $key => $item) {
			$toReturn['events'][$key]['date_diffForHumans'] = Carbon::createFromTimestamp($toReturn['events'][$key]['eventDate'])->diffForHumans();
			$toReturn['events'][$key]['eventDescription'] = strip_tags(htmlspecialchars_decode($toReturn['events'][$key]['eventDescription'],ENT_QUOTES));
			$toReturn['events'][$key]['eventDate'] = $this->panelInit->unix_to_date($toReturn['events'][$key]['eventDate']);
			$toReturn['events'][$key]['__type'] = 'event';
		}

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "events.delEvent" )){
			exit;
		}

		if ( $postDelete = \events::where('id', $id)->first() ) {
    		user_log('Events', 'delete', $postDelete->eventTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delEvent'],$this->panelInit->language['eventDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delEvent'],$this->panelInit->language['eventNotEist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "events.addEvent" )){
			exit;
		}

		$events = new \events();
		$events->eventTitle = \Input::get('eventTitle');
		$events->eventDescription = htmlspecialchars(\Input::get('eventDescription'),ENT_QUOTES);
		$events->eventFor = \Input::get('eventFor');
		$events->enentPlace = \Input::get('enentPlace');
		$events->eventDate = $this->panelInit->date_to_unix(\Input::get('eventDate'));
		$events->fe_active = \Input::get('fe_active');

		if (\Input::hasFile('eventImage')) {
			$fileInstance = \Input::file('eventImage');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addEvent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'jpg' || $fileInstance->getClientOriginalExtension() != 'png' || $fileInstance->getClientOriginalExtension() != 'jpeg'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addEvent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/events/',$newFileName);

			$events->eventImage = $newFileName;
		}

		$events->save();

		user_log('Events', 'create', $events->eventTitle);

		//Send Push Notifications
		$tokens_list = array();
		$user_ids = array();
		if($events->eventFor == "all"){
			$user_list = \User::select('id', 'firebase_token')->get();
		}else{
			$user_list = \User::where('role',$events->eventFor)->select('id', 'firebase_token')->get();
		}
		foreach ($user_list as $value) {
			if($value['firebase_token'] != ""){
				if(is_array(json_decode($value['firebase_token']))) {
					foreach (json_decode($value['firebase_token']) as $token) {
						$tokens_list[] = $token;
						// \Log::debug("Event Token: " . $token);
					}
				} else if ($this->isJson($value['firebase_token'])) {
					foreach (json_decode($value['firebase_token']) as $token) {
						$tokens_list[] = $token;
						// \Log::debug("Event Token: " . $token);
					}
				} else {
					$tokens_list[] = $value['firebase_token'];
					// \Log::debug("Event Token: " . $value['firebase_token']);
				}
			}
			$user_ids[] = $value['id'];
		}

		// $tokens_list = array_unique($tokens_list);

		$eventDescription = strip_tags(\Input::get('eventDescription'));
		if(count($tokens_list) > 0){
			$this->panelInit->send_push_notification(
				$tokens_list,
				$user_ids,
				$eventDescription,
				$events->eventTitle,
				"events",
				$events->id
			);
		} else {
			$this->panelInit->save_notifications_toDB(
				$tokens_list,
				$user_ids,
				$eventDescription,
				$events->eventTitle,
				"events",
				$events->id
			);
		}

		$events->eventDescription = strip_tags(htmlspecialchars_decode($events->eventDescription));
		$events->eventDate = $this->panelInit->unix_to_date($events->eventDate);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addEvent'],$this->panelInit->language['eventCreated'],$events->toArray() );
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	function fetch($id){

		if(!$this->panelInit->can( array("events.View","events.editEvent") )){
			exit;
		}

		if(\events::where('id',$id)->count() <= 0) {
			exit;
		}

		$data = \events::where('id',$id)->first()->toArray();
		$data['eventDescription'] = htmlspecialchars_decode($data['eventDescription'],ENT_QUOTES);
		$data['eventDate'] = $this->panelInit->unix_to_date($data['eventDate']);

		// make notification seen
		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'events', $id);

		return json_encode($data);
	}

	function edit($id){

		if(!$this->panelInit->can( "events.editEvent" )){
			exit;
		}

		$events = \events::find($id);
		$events->eventTitle = \Input::get('eventTitle');
		$events->eventDescription = htmlspecialchars(\Input::get('eventDescription'),ENT_QUOTES);
		$events->eventFor = \Input::get('eventFor');
		$events->enentPlace = \Input::get('enentPlace');
		$events->eventDate = $this->panelInit->date_to_unix(\Input::get('eventDate'));
		$events->fe_active = \Input::get('fe_active');

		if (\Input::hasFile('eventImage')) {
			$fileInstance = \Input::file('eventImage');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editEvent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'jpg' || $fileInstance->getClientOriginalExtension() != 'png' || $fileInstance->getClientOriginalExtension() != 'jpeg'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addEvent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/events/',$newFileName);

			$events->eventImage = $newFileName;
		}

		$events->save();

		user_log('Events', 'edit', $events->eventTitle);

		$events->eventDescription = strip_tags(htmlspecialchars_decode($events->eventDescription));
		$events->eventDate = $this->panelInit->unix_to_date($events->eventDate);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editEvent'],$this->panelInit->language['eventModified'],$events->toArray() );
	}

	function fe_active($id){

		if(!$this->panelInit->can( "events.editEvent" )){
			exit;
		}

		$events = \events::find($id);

		if($events->fe_active == 1){
			$events->fe_active = 0;
		}else{
			$events->fe_active = 1;
		}

		$events->save();

		user_log('Events', 'update_status', $events->eventTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editEvent'],$this->panelInit->language['eventModified'], array("fe_active"=>$events->fe_active) );
	}
}
