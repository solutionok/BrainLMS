<?php

namespace App\Http\Controllers;

use App\Jobs\SendAttendance;
use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\Section;
use App\Models2\Subject;
use App\Models2\User;
use Illuminate\Support\Facades\Auth;

class AttendanceController extends Controller {

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
		if(!$this->panelInit->can( array("Attendance.takeAttendance","Attendance.attReport") )){
			exit;
		}

		$toReturn = array();
		$toReturn['attendanceModel'] = $this->data['panelInit']->settingsArray['attendanceModel'];

		if($this->data['users']->role == "teacher"){
			// 1- get sections ids of current class teacher
			$sectionsIds = Main::getSectionsOfClassTeacher($this->data['users']->id);
	    // 2- get classes of sections ids
			$toReturn['classes'] = Main::getClassesBySectionIds($sectionsIds)
				->where('classAcademicYear', $this->panelInit->selectAcYear)
			  ->get()->toArray();
		} else {
			$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		}

		$toReturn['userRole'] = $this->data['users']->role;
		return $toReturn;
	}

	public function listAttendance(){

		if(!$this->panelInit->can( "Attendance.takeAttendance" )){
			exit;
		}

		$toReturn = array();

		$toReturn['class'] = \classes::where('id',\Input::get('classId'));
		if($toReturn['class']->count() == 0){
			return $toReturn;
		}
		$toReturn['class'] = $toReturn['class']->first()->toArray();

		if(\Input::get('subjectId')){
			$toReturn['subject'] = \subject::where('id',\Input::get('subjectId'))->first()->toArray();
		}

		$toReturn['students'] = array();
		$studentArray = \User::where('role','student')->where('activated','1')->where('studentClass',\Input::get('classId'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$studentArray = $studentArray->where('studentSection',\Input::get('sectionId'));
		}
		$toReturn['sechow'] = \sections::where('id',\Input::get('sectionId'))->first()->toArray();
		if($this->data['panelInit']->settingsArray['studentsSort'] != ""){
			$studentArray = $studentArray->orderByRaw("studentRollId + 0 ASC");
		}

		$studentArray = $studentArray->get();

		$attendanceList = array();
		$vacationList = array();

		$vacationArray = \vacation::where('vacDate',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->where('acYear',$this->panelInit->selectAcYear)->where('role','student')->get();

		if(\Input::get('subjectId')){
			$attendanceArray = \attendance::where('classId',\Input::get('classId'))->where('subjectId',\Input::get('subjectId'))->where('date',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->get();
		}else{
			$attendanceArray = \attendance::where('classId',\Input::get('classId'))->where('date',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->get();
		}
		foreach ($attendanceArray as $stAttendance) {
			$attendanceList[$stAttendance->studentId] = $stAttendance;
		}
		foreach ($vacationArray as $vacation) {
			$vacationList[$vacation->userid] = $vacation->acceptedVacation;
		}

		$i = 0;
		foreach ($studentArray as $stOne) {
			$toReturn['students'][$i] = array('name'=>$stOne->fullName,'id'=>$stOne->id,'studentRollId'=>$stOne->studentRollId,'attendance'=> '', );

			if(isset($attendanceList[$stOne->id])){
				$toReturn['students'][$i]['attendance'] = $attendanceList[$stOne->id]->status;
				$toReturn['students'][$i]['attNotes'] = $attendanceList[$stOne->id]->attNotes;
			}

			if(isset($vacationList[$stOne->id])){
				$toReturn['students'][$i]['vacation'] = true;
				$toReturn['students'][$i]['vacationStat'] = $vacationList[$stOne->id];
			}

			$i ++ ;
		}

		return json_encode($toReturn);
	}

	public function saveAttendance(){

		if(!$this->panelInit->can( "Attendance.takeAttendance" )){
			exit;
		}

		User::$withoutAppends = true;

		$vacationArray = array();
		$vacationList = \vacation::where('vacDate',$this->panelInit->date_to_unix(\Input::get('attendanceDay')))->where('acYear',$this->panelInit->selectAcYear)->where('role','student')->get();
		foreach ($vacationList as $vacation) {
			$vacationArray[$vacation->userid] = $vacation->id;
		}

		if($this->panelInit->settingsArray['absentNotif'] == "mail" || $this->panelInit->settingsArray['absentNotif'] == "mailsms"){
			$mail = true;
		}
		if($this->panelInit->settingsArray['absentNotif'] == "sms" || $this->panelInit->settingsArray['absentNotif'] == "mailsms"){
			$sms = true;
		}
		if(isset($mail) || isset($sms)){
			$mailTemplate = \mailsms_templates::where('templateTitle','Student Absent')->first();
		}

		// $MailSmsHandler = new \MailSmsHandler();

		$stAttendance = \Input::get('stAttendance');

		dispatch(new SendAttendance(
			$stAttendance,
			\Input::get('classId'),
			$this->panelInit->date_to_unix(\Input::get('attendanceDay')),
			\Input::get('subjectId'),
			$this->data['panelInit']->settingsArray['attendanceModel'],
			$this->panelInit->settingsArray['absentNotif'],
			\Input::get('attendanceDay'),
			$this->data['panelInit'],
			(array) $this->panelInit->settingsArray
		));

		$class_and_section = '';
		$class_name = MClass::find(\Input::get('classId'))->className;
		$class_and_section .= 'For class: ' . $class_name;

		if(!is_null(\Input::get('sectionName'))) {
			$section_name = \Input::get('sectionName');
			$class_and_section .= ' - sec: ' . $section_name;
		}

		user_log('Attendance', 'take_attendance', $class_and_section);

		return $this->panelInit->apiOutput(true,"Attendance",'attendance save successfully');
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	public function reportAttendance(){
		if(!$this->panelInit->can( "Attendance.attReport" )){
			exit;
		}

		$toReturn = array();

		$toReturn['class'] = \classes::where('id',\Input::get('classId'));
		if($toReturn['class']->count() == 0){
			return $toReturn;
		}
		$toReturn['class'] = $toReturn['class']->first()->toArray();

		if(\Input::get('subjectId')){
			$toReturn['subject'] = \subject::where('id',\Input::get('subjectId'))->first()->toArray();
		}

		if(\Input::get('sectionId')){
			$toReturn['section'] = Section::where('id',\Input::get('sectionId'))->first()->toArray();
		}

		//Prepare users list
		$toReturn['students'] = array();
		$student_ids = array();
		$studentArray = \User::where('role','student')->where('activated','1')->where('studentClass',\Input::get('classId'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$studentArray = $studentArray->where('studentSection',\Input::get('sectionId'));
		}
		if($this->data['panelInit']->settingsArray['studentsSort'] != ""){
			$studentArray = $studentArray->orderByRaw("studentRollId + 0 ASC");
		}
		$studentArray = $studentArray->get();

		foreach ($studentArray as $key => $value) {
			$toReturn['students'][$value->id] = array("id"=>$value->id,"fullName"=>$value->fullName,"studentRollId"=>$value->studentRollId,"precentage"=>array("0"=>0,"1"=>0,"2"=>0,"3"=>0,"4"=>0),"attendance"=>array(),"vacation"=>array());
			$student_ids[] = $value->id;
		}

		$attendanceDayFrom = \Input::get('attendanceDayFrom');
		$attendanceDayTo = \Input::get('attendanceDayTo');

		// set custom attendance range for 1 month only
		$choosen_month = \Input::get('forMonth');
		$attendanceDayFrom = "1/" . $choosen_month . '/' . date('Y');
		$attendanceDayTo = cal_days_in_month(CAL_GREGORIAN, (integer) $choosen_month, (integer) date('Y')) . "/" . $choosen_month . '/' . date('Y');

		$toReturn['date_range'] = $this->panelInit->date_ranges($attendanceDayFrom,$attendanceDayTo);

		//Prepare attendance List
		$attendanceN = \attendance::where('date','>=', $this->panelInit->date_to_unix($attendanceDayFrom))
		  ->where('date','<=',$this->panelInit->date_to_unix($attendanceDayTo))
		  ->where('classId',\Input::get('classId'));


		if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject"){
			$attendanceN = $attendanceN->where('subjectId', \Input::get('subjectId') );
		}
		$attendanceN = $attendanceN->get();

		foreach ($attendanceN as $key => $value) {
			if(isset($toReturn['students'][$value->studentId])){
				if(!isset($toReturn['students'][$value->studentId]['attendance'][$value->date])){
					$toReturn['students'][$value->studentId]['attendance'][$value->date] = array();
				}
				$toReturn['students'][$value->studentId]['attendance'][$value->date]['status'] = $value->status;
				$toReturn['students'][$value->studentId]['attendance'][$value->date]['attNotes'] = $value->attNotes;
			}
		}

		if(count($student_ids) > 0){
			$vacationArray = \vacation::where('vacDate','>=',$this->panelInit->date_to_unix($attendanceDayFrom))
			  ->where('vacDate','<=',$this->panelInit->date_to_unix($attendanceDayTo))
			  ->whereIn('userid',$student_ids)
			  ->get();
			foreach ($vacationArray as $key => $value) {
				if(isset($toReturn['students'][$value->userid])){
					$toReturn['students'][$value->userid]['vacation'][$value->vacDate] = $value->acceptedVacation;
				}
			}
		}

		foreach ($toReturn['students'] as $key => $value) {
			$total = 0;
			$attendance_perc = array("0"=>0,"1"=>0,"2"=>0,"3"=>0,"4"=>0);
			foreach ($toReturn['students'][$key]['attendance'] as $key_ => $value_) {
				if(!isset($attendance_perc[$value_['status']])){
					$attendance_perc[$value_['status']] = 0;
				}
				$attendance_perc[$value_['status']]++;
				$total ++;
			}
			if($total == 0){
				continue;
			}
			$toReturn['students'][$key]['precentage'][0] = round(($attendance_perc[0] / $total)*100,1);
			$toReturn['students'][$key]['precentage'][1] = round(($attendance_perc[1] / $total)*100,1);
			$toReturn['students'][$key]['precentage'][2] = round(($attendance_perc[2] / $total)*100,1);
			$toReturn['students'][$key]['precentage'][3] = round(($attendance_perc[3] / $total)*100,1);
			$toReturn['students'][$key]['precentage'][4] = round(($attendance_perc[4] / $total)*100,1);
		}

		user_log('Attendance', 'report_attendance', 'For class: ' . MClass::find(\Input::get('classId'))->className);

		return $toReturn;
	}

	public function getStats($date = ""){
		if($date == ""){
			$date = date('m/Y');
		}

		$startTime = time() - (30*60*60*24);
		$endTime = time() + (60*60*24);

		$toReturn = array();
		$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();

		if($this->data['users']->role == "teacher"){
			$class_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
			$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)
				->whereIn('id', $class_ids)
				->get();
		}else{
			$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();
		}

		$toReturn['classes'] = array();
		$subjList = array();
		foreach ($classes as $class) {
			$class['classSubjects'] = Main::getSubjectIdsByClassId($class['id']);
			if(is_array($class['classSubjects'])){
				foreach ($class['classSubjects'] as $subject) {
					$subjList[] = $subject;
				}
			}
			$toReturn['classes'][$class->id] = $class->className ;
		}

		$subjList = array_unique($subjList);
		if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject"){
			$toReturn['subjects'] = array();
			if(count($subjList) > 0){
				$subjects = \subject::whereIN('id',$subjList)->get();
				foreach ($subjects as $subject) {
					$toReturn['subjects'][$subject->id] = $subject->subjectTitle ;
				}
			}
		}

		$toReturn['role'] = $this->data['users']->role;
		$toReturn['attendanceModel'] = $this->data['panelInit']->settingsArray['attendanceModel'];

		if($this->data['users']->role == "admin" || $this->data['users']->role == "teacher"){
			$attendanceArray = \attendance::where('date','>=',$startTime)->where('date','<=',$endTime)->orderBy('date','asc')->get();

		}elseif($this->data['users']->role == "student"){
			$attendanceArray = \attendance::where('studentId',$this->data['users']->id)->where('date','>=',$startTime)->where('date','<=',$endTime)->orderBy('date','asc')->get();
			foreach ($attendanceArray as $value) {
				$toReturn['studentAttendance'][] = array("date"=>$this->panelInit->unix_to_date($value->date),"status"=>$value->status,"subject"=>isset($toReturn['subjects'][$value->subjectId])?$toReturn['subjects'][$value->subjectId]:"" ) ;
			}
		}elseif($this->data['users']->role == "parent"){
			if($this->data['users']->parentOf != ""){
				$parentOf = json_decode($this->data['users']->parentOf,true);
				if(!is_array($parentOf)){
					$parentOf = array();
				}
				$ids = array();
				foreach($parentOf as $value){
					$ids[] = $value['id'];
				}

				$studentArray = \User::where('role','student')->whereIn('id',$ids)->get();
				foreach ($studentArray as $stOne) {
					$students[$stOne->id] = array('name'=>$stOne->fullName,'studentRollId'=>$stOne->studentRollId);
				}

				if(count($ids) > 0){
					$attendanceArray = \attendance::whereIn('studentId',$ids)->where('date','>=',$startTime)->where('date','<=',$endTime)->orderBy('date','asc')->get();
					foreach ($attendanceArray as $value) {
						if(isset($students[$value->studentId]) AND !isset($toReturn['studentAttendance'][$value->studentId])){
							$toReturn['studentAttendance'][$value->studentId]['n'] = $students[$value->studentId];
							$toReturn['studentAttendance'][$value->studentId]['d'] = array();
						}
						if(isset($toReturn['studentAttendance'][$value->studentId]['d'])){
							$toReturn['studentAttendance'][$value->studentId]['d'][] = array("date"=>$this->panelInit->unix_to_date($value->date),"status"=>$value->status,"subject"=>isset($toReturn['subjects'][$value->subjectId])?$toReturn['subjects'][$value->subjectId]:"" );
						}
					}
				}
			}
		}

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'attendance', null);

		return $toReturn;
	}

	public function biometric(){
		//update devices list
		$update_bio_devices = array();
		$devices_list = \Input::get('devices');
		foreach ($devices_list as $key => $value) {
			$update_bio_devices[] = array("ip"=>$key,"status"=>$value,"time"=>time());
		}

		$device_time = \Input::get('time');

		$update_attendance = \Input::get('attendance');
	}

	public function currentSectionsSubjectsList($classId = ""){
		$toReturn = array();
		$toReturn['sections'] = $this->sectionsList($classId);
		$toReturn['subjects'] = $this->subjectList($classId);
		return $toReturn;
	}

	protected function sectionsList($classId = ""){
		$sectionsList = array();

		if($classId == ""){
			if(!\Input::has('classId')){
				return $sectionsList;
			}
			$classId = \Input::get('classId');
		}

		$teacher_id = Auth::guard('web')->user()->id;
		$query = Section::where('classId', $classId);

		if(Auth::guard('web')->user()->role == 'teacher') {
			$query->where('classTeacherId', 'LIKE',  '%"' . $teacher_id . '"%');
		}

		$sections = $query->get()->toArray();

		return $sections;
	}

	protected function subjectList($classId = ""){
		$subjectList = array();
		$classesCount = 1;

		if($classId == ""){
			$classId = \Input::get('classId');
			if(!\Input::has('classId')){
				return $subjectList;
			}
		}

		$classes = \classes::where('id',$classId)->get()->toArray();

		foreach($classes as $value){
			$value['classSubjects'] = Main::getSubjectIdsByClassId($value['id']);
			if(is_array($value['classSubjects'])){
				foreach($value['classSubjects'] as $value2){
					$subjectList[] = $value2;
				}
			}
		}

		if($classesCount == 1){
			$finalClasses = $subjectList;
		}else{
			$subjectList = array_count_values($subjectList);

			$finalClasses = array();
			foreach($subjectList as $key => $value){
				if($value == $classesCount){
					$finalClasses[] = $key;
				}
			}
		}

		if(count($finalClasses) > 0){
			if($this->data['users']->role == "teacher"){
				$subject_ids = Main::getSubjectsIdsByTeacherId($this->data['users']->id);
				return \subject::whereIn('id', $subject_ids)
					->whereIn('id',$finalClasses)
					->get()->toArray();
			}else{
				return \subject::whereIn('id',$finalClasses)->get()->toArray();
			}
		}

		return array();
	}

}
