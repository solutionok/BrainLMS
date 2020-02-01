<?php
namespace App\Http\Controllers;

class SAttendanceController extends Controller {

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

	public function listAttendance(){

		if(!$this->panelInit->can( array("staffAttendance.takeAttendance","staffAttendance.attReport") )){
			exit;
		}

		$toReturn = array();
		$toReturn['teachers'] = array();
		$studentArray = \User::whereIn('role',array('teacher','employee'));

		if($this->data['panelInit']->settingsArray['teachersSort'] != ""){
			$studentArray = $studentArray->orderByRaw($this->data['panelInit']->settingsArray['teachersSort']);
		}

		$studentArray = $studentArray->get();

		$attendanceList = array();
		$vacationList = array();


		$attendanceArray = \attendance::where('date',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->get();
		foreach ($attendanceArray as $sAttendance) {
			$attendanceList[$sAttendance->studentId]['attendance'] = $sAttendance->status;
			$attendanceList[$sAttendance->studentId]['attNotes'] = $sAttendance->attNotes;
			$attendanceList[$sAttendance->studentId]['in_time'] = $sAttendance->in_time;
			$attendanceList[$sAttendance->studentId]['out_time'] = $sAttendance->out_time;

			if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1 && \Input::has('InOut')){
				if(\Input::get('InOut') == "in" && $sAttendance->in_time != ""){
					$check_in = explode(":", $sAttendance->in_time);
					$check_in[1] = explode(" ", $check_in[1]);

					$attendanceList[$sAttendance->studentId]['check_in']['hour'] = $check_in[0];
					$attendanceList[$sAttendance->studentId]['check_in']['min'] = $check_in[1][0];
					$attendanceList[$sAttendance->studentId]['check_in']['ampm'] = $check_in[1][1];
				}
				if(\Input::get('InOut') == "out" && $sAttendance->out_time != ""){
					$check_out = explode(":", $sAttendance->out_time);
					$check_out[1] = explode(" ", $check_out[1]);

					$attendanceList[$sAttendance->studentId]['check_out']['hour'] = $check_out[0];
					$attendanceList[$sAttendance->studentId]['check_out']['min'] = $check_out[1][0];
					$attendanceList[$sAttendance->studentId]['check_out']['ampm'] = $check_out[1][1];
				}
			}

		}

		$vacationArray = \vacation::where('vacDate',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->where('acYear',$this->panelInit->selectAcYear)->whereIn('role',array('teacher','employee'))->get();
		foreach ($vacationArray as $vacation) {
			$vacationList[$vacation->userid] = $vacation->acceptedVacation;
		}

		$i = 0;
		foreach ($studentArray as $stOne) {
			$toReturn['teachers'][$i] = array('name'=>$stOne->fullName,'id'=>$stOne->id,'attendance'=>'');

			if(isset($attendanceList[$stOne->id])){
				$toReturn['teachers'][$i]['attendance'] = $attendanceList[$stOne->id]['attendance'];
				$toReturn['teachers'][$i]['attNotes'] = $attendanceList[$stOne->id]['attNotes'];

				if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1){
					if(isset($attendanceList[$stOne->id]['check_in'])){
						$toReturn['teachers'][$i]['check_in'] = $attendanceList[$stOne->id]['check_in'];
					}
					if(isset($attendanceList[$stOne->id]['check_out'])){
						$toReturn['teachers'][$i]['check_out'] = $attendanceList[$stOne->id]['check_out'];
					}
				}

			}else{
				if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1){
					$toReturn['teachers'][$i]['no_in_time'] = true;
				}
			}

			if(isset($vacationList[$stOne->id])){
				$toReturn['teachers'][$i]['vacation'] = true;
				$toReturn['teachers'][$i]['vacationStat'] = $vacationList[$stOne->id];
			}

			$i ++;
		}

		if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1){
			$toReturn['InOut'] = \Input::get('InOut');
		}

		return json_encode($toReturn);
	}

	public function saveAttendance(){

		if(!$this->panelInit->can( array("staffAttendance.takeAttendance") )){
			exit;
		}

		$attendanceList = array();
		$attendanceArray = \attendance::where('date',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->get();
		foreach ($attendanceArray as $stAttendance) {
			$attendanceList[$stAttendance->studentId] = $stAttendance->status;
		}

		$vacationArray = array();
		$vacationList = \vacation::where('vacDate',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->where('acYear',$this->panelInit->selectAcYear)->whereIn('role',array('teacher','employee'))->get();
		foreach ($vacationList as $vacation) {
			$vacationArray[$vacation->userid] = $vacation->id;
		}

		$teachers_list = array();
		$attendance_list = array();
		$stAttendance = \Input::get('stAttendance');
		foreach($stAttendance as $key => $value){
			if(isset($value['attendance']) AND strlen($value['attendance']) > 0){
				$teachers_list[] = $value['id'];
				$attendance_list[$value['id']] = $value['attendance'];
				if(!isset($attendanceList[$value['id']])){
					$attendanceN = new \attendance();
					$attendanceN->classId = 0;
					$attendanceN->date = $this->panelInit->date_to_unix(\Input::get('attendanceDay'));
					$attendanceN->studentId = $value['id'];
					$attendanceN->status = $value['attendance'];
					$attendanceN->subjectId = 0;
					if(isset($value['attNotes'])){
						$attendanceN->attNotes = $value['attNotes'];
					}
					if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1 && \Input::has('InOut') && \Input::get('InOut') == "in" && isset($value['check_in']) && count($value['check_in']) == 3){
						$attendanceN->in_time = $value['check_in']['hour'].":".$value['check_in']['min']." ".$value['check_in']['ampm'];
					}
					if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1 && \Input::has('InOut') && \Input::get('InOut') == "out" && isset($value['check_out']) && count($value['check_out']) == 3){
						$attendanceN->out_time = $value['check_out']['hour'].":".$value['check_out']['min']." ".$value['check_out']['ampm'];
					}
					$attendanceN->save();
				}else{
					$attendanceN = \attendance::where('studentId',$value['id'])->where('date',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->first();
					$attendanceN->status = $value['attendance'];
					$attendanceN->subjectId = 0;
					if(isset($value['attNotes'])){
						$attendanceN->attNotes = $value['attNotes'];
					}
					if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1 && \Input::has('InOut') && \Input::get('InOut') == "in" && isset($value['check_in']) && count($value['check_in']) == 3){
						$attendanceN->in_time = $value['check_in']['hour'].":".$value['check_in']['min']." ".$value['check_in']['ampm'];
					}
					if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1 && \Input::has('InOut') && \Input::get('InOut') == "out" && isset($value['check_out']) && count($value['check_out']) == 3){
						$attendanceN->out_time = $value['check_out']['hour'].":".$value['check_out']['min']." ".$value['check_out']['ampm'];
					}
					$attendanceN->save();
				}
			}
		}

		user_log('Staff attendance', 'take_attendance');

		//Send Push Notifications
		$tokens_list = [
			'token' => [],
			'user_id' => [],
		];
		$user_ids = array();
		$user_list = \User::whereIn('role',array('teacher','employee'))->whereIn('id',$teachers_list)
		 ->select('id','firebase_token')->get();

		foreach ($user_list as $value) {
			if($value['firebase_token'] != ""){
				if(is_array(json_decode($value['firebase_token']))) {
					$tokens_list['token'] = json_decode($value['firebase_token']);
				} else {
					$tokens_list['token'][] = $value['firebase_token'];
				}
				$tokens_list['user_id'][] = $value['id'];
			}
			$user_ids[] = $value['id'];
		}

		$absentStatus = array();
		$absentStatus[0] = $this->panelInit->language['Absent'];
		$absentStatus[1] = $this->panelInit->language['Present'];
		$absentStatus[2] = $this->panelInit->language['Late'];
		$absentStatus[3] = $this->panelInit->language['LateExecuse'];

		// dd('testing');
		// if(count($tokens_list) > 0){
		// 	foreach ($tokens_list as $key => $value) {
		// 		if(isset($absentStatus[ $attendance_list[$key] ])){
		// 			$this->panelInit->send_push_notification(
		// 				$value['token'],
		// 				$value['user_id'],
		// 				$this->panelInit->language['yrAttIs']." : ".$absentStatus[ $attendance_list[$key] ]." - ".$this->panelInit->language['Date']." :".\Input::get('attendanceDay'),
		// 				$this->panelInit->language['staffAttendance']
		// 			);
		// 		}
		// 	}
		// } else {
		// 	foreach ($user_ids as $key => $user_id) {
		// 		if(isset($absentStatus[ $attendance_list[$key] ])){
		// 			$this->panelInit->save_notifications_toDB(
		// 				[],
		// 				[$user_id],
		// 				$this->panelInit->language['yrAttIs']." : ".$absentStatus[ $attendance_list[$key] ]." - ".$this->panelInit->language['Date']." :".\Input::get('attendanceDay'),
		// 				$this->panelInit->language['staffAttendance']
		// 			);
		// 		}
		// 	}
		// }

		return $this->panelInit->apiOutput(true,"Attendance",$this->panelInit->language['attendanceSaved'] );
	}

	public function reportAttendance(){

		if(!$this->panelInit->can( array("staffAttendance.attReport") )){
			exit;
		}

		$toReturn = array();

		//Prepare users list
		$toReturn['employees'] = array();
		$student_ids = array();
		$studentArray = \User::whereIn('role',array('teacher','employee'))->where('activated','1');
		if($this->data['panelInit']->settingsArray['teachersSort'] != ""){
			$studentArray = $studentArray->orderByRaw($this->data['panelInit']->settingsArray['teachersSort']);
		}
		$studentArray = $studentArray->get();

		foreach ($studentArray as $key => $value) {
			$toReturn['employees'][$value->id] = array("id"=>$value->id,"fullName"=>$value->fullName,"precentage"=>array("0"=>0,"1"=>0,"2"=>0,"3"=>0),"attendance"=>array(),"vacation"=>array());
			$student_ids[] = $value->id;
		}

		$toReturn['date_range'] = $this->panelInit->date_ranges(\Input::get('attendanceDayFrom'),\Input::get('attendanceDayTo'));

		//Prepare attendance List
		$attendanceN = \attendance::where('date','>=',$this->panelInit->date_to_unix(\Input::get('attendanceDayFrom')))->where('date','<=',$this->panelInit->date_to_unix(\Input::get('attendanceDayTo')))->whereIn('studentId',$student_ids)->get();

		foreach ($attendanceN as $key => $value) {
			if(isset($toReturn['employees'][$value->studentId])){
				if(!isset($toReturn['employees'][$value->studentId]['attendance'][$value->date])){
					$toReturn['employees'][$value->studentId]['attendance'][$value->date] = array();
				}
				$toReturn['employees'][$value->studentId]['attendance'][$value->date]['status'] = $value->status;
				$toReturn['employees'][$value->studentId]['attendance'][$value->date]['attNotes'] = $value->attNotes;

				if($this->data['panelInit']->settingsArray['sAttendanceInOut'] == 1){
					if($value->in_time != ""){
						$toReturn['employees'][$value->studentId]['attendance'][$value->date]['in_time'] = $value->in_time;
					}
					if($value->out_time != ""){
						$toReturn['employees'][$value->studentId]['attendance'][$value->date]['out_time'] = $value->out_time;
					}
				}

			}
		}

		if(count($student_ids) > 0){
			$vacationArray = \vacation::where('vacDate','>=',$this->panelInit->date_to_unix(\Input::get('attendanceDayFrom')))->where('vacDate','<=',$this->panelInit->date_to_unix(\Input::get('attendanceDayTo')))->whereIn('userid',$student_ids)->get();
			foreach ($vacationArray as $key => $value) {
				if(isset($toReturn['employees'][$value->userid])){
					$toReturn['employees'][$value->userid]['vacation'][$value->vacDate] = $value->acceptedVacation;
				}
			}
		}


		foreach ($toReturn['employees'] as $key => $value) {
			$total = 0;
			$attendance_perc = array("0"=>0,"1"=>0,"2"=>0,"3"=>0);
			foreach ($toReturn['employees'][$key]['attendance'] as $key_ => $value_) {
				if(!isset($attendance_perc[$value_['status']])){
					$attendance_perc[$value_['status']] = 0;
				}
				$attendance_perc[$value_['status']]++;
				$total ++;
			}
			if($total == 0){
				continue;
			}
			$toReturn['employees'][$key]['precentage'][0] = round(($attendance_perc[0] / $total)*100,1);
			$toReturn['employees'][$key]['precentage'][1] = round(($attendance_perc[1] / $total)*100,1);
			$toReturn['employees'][$key]['precentage'][2] = round(($attendance_perc[2] / $total)*100,1);
			$toReturn['employees'][$key]['precentage'][3] = round(($attendance_perc[3] / $total)*100,1);
		}

		user_log('Staff attendance', 'view_report');

		return $toReturn;
	}
}
