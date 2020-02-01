<?php
namespace App\Http\Controllers;

class biometricController extends Controller {

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
	}

	public function get_devices()
	{
		if($this->data['users']->role != "admin") exit;

		$devices = array();
		if($this->panelInit->settingsArray['biometric_device_ip'] != ""){
			$devices[] = $this->panelInit->settingsArray['biometric_device_ip'];
		}

		return $devices;
	}

	public function sync_devices(){

		if($this->data['users']->role != "admin") exit;

		$devices = json_decode(\Input::get('devices'),true);
		$attendance = json_decode(\Input::get('attendance'),true);

		if(!isset($this->panelInit->settingsArray['timezone'])){
			$this->panelInit->settingsArray['timezone'] = "Europe/London";
		}

		if(is_array($devices)){

			$settings = \settings::where('fieldName','biometric_device_status')->first();
			$settings->fieldValue = json_encode($devices);
			$settings->save();

		}

		//Get attendance array
		$user_bio_ids = array();
		$user_ids = array();
		$user_att = array();
		$user_list = array();
		if(is_array($attendance)){
			foreach ($attendance as $key => $value) {
				$user_bio_ids[] = $value['userId'];

				//2018-6-30 22:33:30
				$value['original_date'] = $value['date'];
				$splitted_date = explode(" ", $value['date']);
				$value['date'] = $splitted_date[0];
				$timezone = new \DateTimeZone($this->panelInit->settingsArray['timezone']);
				$d = \DateTime::createFromFormat('Y-m-d', $value['date'] ,$timezone);
				$d->setTime(0,0,0);

				$value['timestamp'] = $d->getTimestamp();
				$user_att[ $value['userId'] ] = $value;
			}
		}

		//Get users list
		$users_list = \User::whereIn('biometric_id',$user_bio_ids)->select('id','fullName','role','biometric_id','studentClass','firebase_token')->get()->toArray();
		foreach ($users_list as $key => $value) {
			$user_list[ $value['biometric_id'] ] = $value;
		}

		//Filter attendance
		$send_notifications = array();
		foreach ($user_att as $key => $value) {
			if(!isset($user_list[ $value['userId'] ])){
				continue;
			}
			if($user_list[ $value['userId'] ]['role'] == "student" && $this->panelInit->settingsArray['attendanceModel'] == "subject"){
				continue;
			}

			$attendanceN = \attendance::where('date', $value['timestamp'] )->where('studentId', $user_list[ $value['userId'] ]['id'] );
			if($attendanceN->count() > 0){
				$attendanceN = $attendanceN->first();
				$attendanceN->status = 1;
				$attendanceN->save();
			}else{
				$attendanceN = new \attendance();
				if( $user_list[ $value['userId'] ]['studentClass'] != "" AND $user_list[ $value['userId'] ]['studentClass'] != 0){
					$attendanceN->classId = $user_list[ $value['userId'] ]['studentClass'];
				}else{
					$attendanceN->classId = 0;
				}
				$attendanceN->date = $value['timestamp'];
				$attendanceN->studentId = $user_list[ $value['userId'] ]['id'];
				$attendanceN->status = 1;
				$attendanceN->subjectId = 0;
				$attendanceN->save();
			}

			if( $this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1 AND isset( $value['state'] ) AND ( $user_list[ $value['userId'] ]['role'] = "teacher" || $user_list[ $value['userId'] ]['role'] == "employee" ) ){

				$timezone = new \DateTimeZone($this->panelInit->settingsArray['timezone']);
				$d = \DateTime::createFromFormat('Y-m-d H:i:s', $value['original_date'] ,$timezone );

				if( $value['state'] == "0" ){
					$attendanceN->in_time = $d->format('g:i a');
				}
				if( $value['state'] == "1" ){
					$attendanceN->out_time = $d->format('g:i a');
				}
			}
			$attendanceN->save();


			$send_notifications[] = array(
				"role" => $user_list[ $value['userId'] ]['role'],
				"id"=> $user_list[ $value['userId'] ]['id'],
				"fullName"=> $user_list[ $value['userId'] ]['fullName'],
				"firebase_token"=>$user_list[ $value['userId'] ]['firebase_token'],
				"date"=>$value['date']
			);
		}

		//Send Push Notifications
		$tokens_list = array();

		foreach ($send_notifications as $value) {
			if($value['role'] == "teacher"){
				if($value['firebase_token'] != "") {
					if(is_array(json_decode($value['firebase_token']))) {
						$token = json_decode($value['firebase_token']);
					} else if ($this->isJson($value['firebase_token'])) {
						$token = json_decode($value['firebase_token']);
					} else {
						$token[] = $value['firebase_token'];
					}
					$this->panelInit->send_push_notification(
						$token,
						$value['id'],
						"Your attendance is : ".$this->panelInit->language['Present']." - Date :".$value['date'],
						$this->panelInit->language['staffAttendance']
					);
				} else {
					$this->panelInit->save_notifications_toDB(
						$token,
						$value['id'],
						"Your attendance is : ".$this->panelInit->language['Present']." - Date :".$value['date'],
						$this->panelInit->language['staffAttendance']
					);
				}
			}

			if( $value['role'] == "student" ){
				$parents = \User::where('parentOf','like','%"'.$value['id'].'"%')->orWhere('parentOf','like','%:'.$value['id'].'}%')->select('id','firebase_token')->get()->toArray();
				foreach ($parents as $key => $parent) {
					if($value['firebase_token'] != "")){
						if(is_array(json_decode($value['firebase_token']))) {
							$token = json_decode($value['firebase_token']);
						} else if ($this->isJson($value['firebase_token'])) {
							$token = json_decode($value['firebase_token']);
						} else {
							$token[] = $value['firebase_token'];
						}
						$this->panelInit->send_push_notification(
							$token,
							$parent['id'],
							"Attendance for student : " . $value['fullName'] . " is " . $this->panelInit->language['Present'] . " - Date : " . $value['date'],
							$this->panelInit->language['Attendance'],
							"attendance"
						);
					} else {
						$this->panelInit->save_notifications_toDB(
							$token,
							$parent['id'],
							"Attendance for student : " . $value['fullName'] . " is " . $this->panelInit->language['Present'] . " - Date : " . $value['date'],
							$this->panelInit->language['Attendance'],
							"attendance"
						);
					}
				}

			}

		}


		echo "Updated Attendance for : ".count($send_notifications);
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

}
