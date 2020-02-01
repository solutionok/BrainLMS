<?php
namespace App\Http\Controllers;

use App\Models2\ClassSchedule;
use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\Section;
use App\Models2\Subject;
use App\Models2\User;
use Cache;
use Carbon\Carbon;

class ClassScheduleController extends Controller {

	var $data = array();
	var $panelInit ;
	var $layout = 'dashboard';
	var $temp_empty_timetable_parameter = '#';

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

	public function listAll() {

		if(!$this->panelInit->can( array("classSch.list","classSch.addSch","classSch.editSch","classSch.delSch") )){
			exit;
		}

		$toReturn = array();
		$toReturn['classes'] = array();
		if($this->panelInit->settingsArray['enableSections'] == true){

			$toReturn['sections'] = array();
			if($this->data['users']->role == "student"){

				$classesIn = array();
				$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();
				foreach ($classes as $value) {
					$toReturn['classes'][$value->id] = $value->className;
					$classesIn[] = $value->id;
				}

				$sections = \DB::table('sections')
							->select('sections.id as id',
							'sections.sectionName as sectionName',
							'sections.classId as classId')
							->where('id',$this->data['users']->studentSection)
							->get();

				foreach ($sections as $key => $section) {
					// $sections[$key]->teacherId = json_decode($sections[$key]->teacherId,true);
					if(isset($toReturn['classes'][$section->classId])){
						$toReturn['sections'][$toReturn['classes'][$section->classId]][] = $section;
					}
				}
			}elseif($this->data['users']->role == "parent"){

				$classesIn = array();
				$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)
					->whereIn('id', Main::getClassesIdsByParentId($this->data['users']->id))
				  ->get();

				foreach ($classes as $value) {
					$toReturn['classes'][$value->id] = $value->className;
					$classesIn[] = $value->id;
				}

				$parentOf = json_decode($this->data['users']->parentOf,true);
				if(!is_array($parentOf)){
					$parentOf = array();
				}
				$ids = array();
				foreach($parentOf as $value){
					$ids[] = $value['id'];
				}
				if(count($ids) > 0){
					$studentArray = \User::where('role','student')->whereIn('id',$ids)->get();
					foreach ($studentArray as $stOne) {
						$sectionsId[] = $stOne->studentSection;
					}

					if(count($sectionsId)){
						$sections = \DB::table('sections')
									->select('sections.id as id',
									'sections.sectionName as sectionName',
									'sections.classId as classId')
									->whereIn('id',$sectionsId)
									->get();

						foreach ($sections as $key => $section) {
							// $sections[$key]->teacherId = json_decode($sections[$key]->teacherId,true);
							if(isset($toReturn['classes'][$section->classId])){
								$toReturn['sections'][$toReturn['classes'][$section->classId]][] = $section;
							}
						}
					}

				}
			}elseif($this->data['users']->role == "teacher"){
				$teacher_id = $this->data['users']->id;
				$class_ids = Main::getClassesIdsByTeacherId($teacher_id);
				$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->whereIn('id', $class_ids)->get();

				$classesIn = array();
				foreach ($classes as $value) {
					$toReturn['classes'][$value->id] = $value->className;
					$classesIn[] = $value->id;
				}

				$toReturn['sections'] = array();
				if(count($classesIn) > 0){
					$sections = Section::whereIn('classId', $classesIn)->get();

					foreach ($sections as $key => $section) {
						$check_timetable = ClassSchedule::where('sectionId', $section->id)->where('teacherId', $this->data['users']->id)->count();

						if($check_timetable) {
							if(isset($toReturn['classes'][$section->classId])){
								$toReturn['sections'][$toReturn['classes'][$section->classId]][] = $section;
							}
						}
					}
				}
			}else{

				$classesIn = array();
				$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();
				foreach ($classes as $value) {
					$toReturn['classes'][$value->id] = $value->className;
					$classesIn[] = $value->id;
				}

				$toReturn['sections'] = array();
				if(count($classesIn) > 0){
					$sections = \DB::table('sections')
								->select('sections.id as id',
								'sections.sectionName as sectionName',
								'sections.classId as classId')
								->whereIn('sections.classId',$classesIn)
								->get();

					foreach ($sections as $key => $section) {
						// $sections[$key]->teacherId = json_decode($sections[$key]->teacherId,true);
						if(isset($toReturn['classes'][$section->classId])){
							$toReturn['sections'][$toReturn['classes'][$section->classId]][] = $section;
						}
					}
				}
			}
		}else{
			if($this->data['users']->role == "student"){
				$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->where('id',$this->data['users']->studentClass)->get()->toArray();
			}elseif($this->data['users']->role == "teacher"){
				$teacher_id = $this->data['users']->id;
				$class_ids = Main::getClassesIdsByTeacherId($teacher_id);
				$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)
					->whereIn('id', $class_ids)
					->get()->toArray();
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
					if(count($ids) > 0){
						$studentArray = \User::where('role','student')->whereIn('id',$ids)->get();
						foreach ($studentArray as $stOne) {
							$classesIds[] = $stOne->studentClass;
						}
						$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->whereIn('id',$classesIds)->get()->toArray();
					}
				}
			}else{
				$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
			}
		}

		$toReturn['subject'] = \subject::get()->toArray();

		$toReturn['days'] = array(
				1=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][1],
				2=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][2],
				3=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][3],
				4=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][4],
				5=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][5],
				6=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][6],
				7=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][7]
			);

		$toReturn['teachers'] = \User::where('role','teacher')->where('activated','1')->select('id','fullName');
		if($this->data['panelInit']->settingsArray['teachersSort'] != ""){
			$toReturn['teachers'] = $toReturn['teachers']->orderByRaw($this->data['panelInit']->settingsArray['teachersSort']);
		}
		$toReturn['teachers'] = $toReturn['teachers']->get();

		$toReturn['userRole'] = $this->data['users']->role;
		return $toReturn;
	}

	public function listTeacherwise($day_number, $page = 1){

		if(!$this->panelInit->can( "classSch.list" )){
			exit;
		}

		$paginate = ClassSchedule::where('dayOfWeek', $day_number)->groupBy('teacherId');
		$totalItems = count($paginate->get());

		// filtring teachers
		if(\Input::has('search_value')){
			$searchInput = \Input::get('search_value');
			$teacher_ids = User::where('fullName', 'like', '%' . $searchInput . '%')
				->orWhere('id', $searchInput)
				->orWhere('phoneNo', 'like', '%' . $searchInput . '%')
				->pluck('id');
			$paginate->whereIn('teacherID', $teacher_ids);
		} else {
			$paginate->take(5)->skip(5 * ($page - 1));
		}

		$paginate = $paginate->pluck('teacherId');

		$query = ClassSchedule::where('dayOfWeek', $day_number)
			->whereIn('teacherId', $paginate);

		$break_subject = Subject::where('subjectTitle', 'Break')->first();
		if($break_subject != null) {
			$query = $query->where('subjectId', '!=', $break_subject->id);
		}

		$classes = MClass::pluck('className', 'id');
		$sections = Section::pluck('sectionName', 'id');
		$subjects = Subject::pluck('subjectTitle', 'id');

		$group_data = [];

		if($query->count()) {
			$data = $query->get()->toArray();
			foreach ($data as $key => $item) {
				$data[$key]['class_name'] = '';
				$data[$key]['section_name'] = '';
				$data[$key]['subject_name'] = '';

				if(isset($classes[Main::getClassIdBySectionId($item['sectionId'])])) {
					$data[$key]['class_name'] = $classes[Main::getClassIdBySectionId($item['sectionId'])];
				} else {
					unset($data[$key]);
				}

				if(isset($sections[$item['sectionId']])) {
					$data[$key]['section_name'] = $sections[$item['sectionId']];
				}

				if(isset($subjects[$item['subjectId']])) {
					$data[$key]['subject_name'] = $subjects[$item['subjectId']];
				}

				$data[$key]['startTime'] = implode(":", str_split($item['startTime'], 2));
				$data[$key]['endTime'] = implode(":", str_split($item['endTime'], 2));

				// for orderBy
				$data[$key]['_startTime'] = (integer) $item['startTime'];

				$data[$key]['disabled_status'] = true;
			}
			foreach ($data as $key => $item) {
				if(isset($item['teacherId'])) {
					$group_data[$item['teacherId']][$key] = $item;
				}
			}
		}

		return response()->json([
			'data' => $group_data,
			'totalItems' => $totalItems
		]);
	}

	public function listClasswise($day_number, $page = 1){

		if(!$this->panelInit->can( "classSch.list" )){
			exit;
		}

		$paginate = ClassSchedule::where('dayOfWeek', $day_number)->groupBy('sectionId');
		$totalItems = count($paginate->get());

		// filtring teachers
		if(\Input::has('class_id') || \Input::has('section_id')){
			$class_id = \Input::get('class_id');
			$section_id = \Input::get('section_id');

			if($class_id > 0 && $section_id > 0) {
				$paginate->where('sectionId', $section_id);
			} else if ($class_id > 0) {
				$section_ids = Section::where('classId', $class_id)->pluck('id')->toArray();
				$paginate->whereIn('sectionId', $section_ids);
			}
		} else {
			$paginate->take(4)->skip(4 * ($page - 1));
		}

		$paginate = $paginate->pluck('sectionId');

		$query = ClassSchedule::where('dayOfWeek', $day_number)
			->whereIn('sectionId', $paginate)
			->orderBy('startTime', 'ASC');

		// $i = 1;
		// $query_count = 0;
		// while($query_count == 0) {
		// 	$paginate2 = ClassSchedule::where('dayOfWeek', $day_number)->groupBy('sectionId');
		// 	$totalItems = count($paginate2->get());
		// 	$paginate2 = $paginate2->take(4)->skip(4 * (($page + $i) - 1))->pluck('sectionId');
		// 	$query = ClassSchedule::where('dayOfWeek', $day_number)
		// 		->whereIn('sectionId', $paginate2)
		// 		->orderBy('startTime', 'ASC');
		// 	$query_count = $query->count();
		// 	$i++;
		// }

		// $break_subject = Subject::where('subjectTitle', 'Break')->first();
		// if($break_subject != null) {
		// 	$query = $query->where('subjectId', '!=', $break_subject->id);
		// }

		$classes = MClass::pluck('className', 'id');
		$teachers = User::where('role', 'teacher')->pluck('fullName', 'id');
		$subjects = Subject::pluck('subjectTitle', 'id');
		$sections = Section::pluck('sectionName', 'id');

		$group_data = [];

		if($query->count()) {
			$data = $query->get()->toArray();
			foreach ($data as $key => $item) {
				$data[$key]['class_name'] = '';
				$data[$key]['teacher_name'] = '';
				$data[$key]['subject_name'] = '';
				$data[$key]['section_name'] = '';

				if(isset($classes[Main::getClassIdBySectionId($item['sectionId'])])) {
					$data[$key]['class_name'] = $classes[Main::getClassIdBySectionId($item['sectionId'])];
				}

				if(isset($teachers[$item['teacherId']])) {
					$data[$key]['teacher_name'] = $teachers[$item['teacherId']];
				}

				if(isset($sections[$item['sectionId']])) {
					$data[$key]['section_name'] = $sections[$item['sectionId']];
				}

				if(isset($subjects[$item['subjectId']])) {
					$data[$key]['subject_name'] = $subjects[$item['subjectId']];
				}

				$data[$key]['startTime'] = implode(":", str_split($item['startTime'], 2));
				$data[$key]['endTime'] = implode(":", str_split($item['endTime'], 2));

				// for orderBy
				$data[$key]['_startTime'] = (integer) $item['startTime'];

				$data[$key]['disabled_status'] = true;
			}
			foreach ($data as $key => $item) {
				if(isset($item['sectionId'])) {
					$group_data[$item['sectionId']][$key] = $item;
				}
			}
		}

		return response()->json([
			'data' => $group_data,
			'totalItems' => $totalItems
		]);
	}

	protected function optimizeAdvTimetableTime($time) {
		$time = str_replace(' ', '', $time);
		$time = str_replace(':', '', $time);

		if(substr($time, -2) == 'PM') {
			$mins = substr($time, -4, 2);
			if(strlen($time) == 5) {
				$hrs = substr($time, -6, 1);
			} else {
				$hrs = substr($time, -6, 2);
			}

			$time = (((integer) $hrs) + 12) . '' . $mins;
		} else if(substr($time, -2) == 'AM') {
			$mins = substr($time, -4, 2);
			if(strlen($time) == 5) {
				$hrs = substr($time, -6, 1);
			} else {
				$hrs = substr($time, -6, 2);
			}

			$time = ((integer) $hrs) . '' . $mins;

			if(strlen($time) == 3) {
				$time = '0'. $time;
			}
		}

		return $time;
	}

	public function advancedTimetableTeacherwiseStore() {
		$timetable = request()->input('timetable');
		$day = request()->input('currentDisplayDay');

		$days_array = [
			2 => 'Monday',
			3 => 'Tuesday',
			4 => 'Wednesday',
			5 => 'Thursday',
			6 => 'Friday',
			7 => 'Saturday'
		];
		$days_array = array_flip($days_array);
		$day_number = $days_array[$day];

		$classes = MClass::pluck('id', 'className');
		$subjects = Subject::pluck('id', 'subjectTitle');

		foreach ($timetable as $key1 => $item) {
			$teacher_id = $item[0];
			$periods = $item[1];

			foreach ($periods as $key2 => $period) {
				if(
					$period['startTime'] == '' ||
					$period['endTime'] == '' ||
					$period['class_name'] == '' ||
					$period['section_name'] == '' ||
					$period['subject_name'] == '' ||
					!isset($classes[$period['class_name']]) ||
					!isset($subjects[$period['subject_name']])
				) {
					return $this->panelInit->apiOutput(false, 'Data is missing', 'Please fill all inputs of periods');
				}

				$start_time = $this->optimizeAdvTimetableTime($period['startTime']);
				$end_time = $this->optimizeAdvTimetableTime($period['endTime']);
				$class_id = $classes[$period['class_name']];
				$section_id = Section::where('classId', $class_id)->where('sectionName', $period['section_name'])->first()->id;

				if(isset($period['id'])) {
					// update current period

					$check_exists_period = ClassSchedule::where([
						'dayOfWeek' => $day_number,
						'startTime' => $start_time,
						'endTime' => $end_time,
						'sectionId' => $section_id
					])->where('id', '!=', $period['id'])
					->count();

					if($check_exists_period) {
						return $this->panelInit->apiOutput(false, 'Period was exists', '');
					} else {
						$current = ClassSchedule::where('dayOfWeek', $day_number)->find($period['id']);
						$current->startTime = $start_time;
						$current->endTime = $end_time;
						$current->classId = $classes[$period['class_name']];
						$current->sectionId = $section_id;
						$current->subjectId = $subjects[$period['subject_name']];
						$current->save();
					}

				} else {
					// create new period

					$check_exists_period = ClassSchedule::where([
						'dayOfWeek' => $day_number,
						'startTime' => $start_time,
						'endTime' => $end_time,
						'sectionId' => $section_id
					])->count();

					if($check_exists_period) {
						return $this->panelInit->apiOutput(false, 'Period was exists', '');
					} else {
						$current = new ClassSchedule;
						$current->dayOfWeek = $day_number;
						$current->startTime = $start_time;
						$current->endTime = $end_time;
						$current->classId = $classes[$period['class_name']];
						$current->sectionId = $section_id;
						$current->subjectId = $subjects[$period['subject_name']];
						$current->teacherId = $teacher_id;
						$current->save();
					}
				}
			}
		}

		return $this->panelInit->apiOutput(true, 'Success save changes.', '');
	}

	public function advancedTimetableClasswiseStore() {
		$timetable = request()->input('timetable');
		$day = request()->input('currentDisplayDay');

		$days_array = [
			2 => 'Monday',
			3 => 'Tuesday',
			4 => 'Wednesday',
			5 => 'Thursday',
			6 => 'Friday',
			7 => 'Saturday'
		];
		$days_array = array_flip($days_array);
		$day_number = $days_array[$day];

		$subjects = Subject::pluck('id', 'subjectTitle');
		$teachers = User::where('role', 'teacher')->pluck('id', 'fullName');

		foreach ($timetable as $key1 => $item) {
			$section_id = $item[0];
			$periods = $item[1];

			foreach ($periods as $key2 => $period) {
				if(
					$period['startTime'] == '' ||
					$period['endTime'] == '' ||
					$period['teacher_name'] == '' ||
					$period['subject_name'] == '' ||
					!isset($subjects[$period['subject_name']]) ||
					!isset($teachers[$period['teacher_name']])
				) {
					return $this->panelInit->apiOutput(false, 'Data is missing', 'Please fill all inputs of periods');
				}

				$start_time = $this->optimizeAdvTimetableTime($period['startTime']);
				$end_time = $this->optimizeAdvTimetableTime($period['endTime']);
				$classes = MClass::pluck('id', 'className');
				$teacher_id = $teachers[$period['teacher_name']];

				if(isset($period['id'])) {
					// update current period

					$check_exists_period = ClassSchedule::where([
						'dayOfWeek' => $day_number,
						'startTime' => $start_time,
						'endTime' => $end_time,
						'sectionId' => $section_id
					])->where('id', '!=', $period['id'])
					->count();

					if($check_exists_period) {
						return $this->panelInit->apiOutput(false, 'Period was exists', '');
					} else {
						$current = ClassSchedule::where('dayOfWeek', $day_number)->find($period['id']);
						$current->startTime = $start_time;
						$current->endTime = $end_time;
						$current->teacherId = $teacher_id;
						$current->subjectId = $subjects[$period['subject_name']];
						$current->save();
					}
				} else {
					// create new period
					$check_exists_period = ClassSchedule::where([
						'dayOfWeek' => $day_number,
						'startTime' => $start_time,
						'endTime' => $end_time,
						'sectionId' => $section_id
					])->count();

					if($check_exists_period) {
						return $this->panelInit->apiOutput(false, 'Period was exists', '');
					} else {
						$current = new ClassSchedule;
						$current->dayOfWeek = $day_number;
						$current->startTime = $start_time;
						$current->endTime = $end_time;
						$current->classId = $classes[$period['class_name']];
						$current->sectionId = $section_id;
						$current->subjectId = $subjects[$period['subject_name']];
						$current->teacherId = $teacher_id;
						$current->save();
					}
				}
			}
		}

		return $this->panelInit->apiOutput(true, 'Success save changes.', '');
	}

	public function advancedTimetableExcludeTeacher() {
		$day = request()->input('currentDisplayDay');
		$teacher_id = request()->input('teacher_id');
		$days_array = [
			2 => 'Monday',
			3 => 'Tuesday',
			4 => 'Wednesday',
			5 => 'Thursday',
			6 => 'Friday',
			7 => 'Saturday'
		];
		$days_array = array_flip($days_array);
		$day_number = $days_array[$day];

		ClassSchedule::where([
			'dayOfWeek' => $day_number,
			'teacherId' => $teacher_id
		])->delete();

		$teacher_name = User::find($teacher_id)->fullName;

		return $this->panelInit->apiOutput(true, 'Teacher $teacher_name was excluded.', '');
	}

	public function advancedTimetableRemovePeriod() {
		$period_id = request()->input('period_id');
		ClassSchedule::where('id', $period_id)->delete();
		return $this->panelInit->apiOutput(true, 'Period was removed.', '');
	}

	function fetch($id){

		if(!$this->panelInit->can( "classSch.list" )){
			exit;
		}

		$arrayOfDays = array(
			2=>$this->panelInit->language['Monday'],
			3=>$this->panelInit->language['Tuesday'],
			4=>$this->panelInit->language['Wednesday'],
			5=>$this->panelInit->language['Thurusday'],
			6=>$this->panelInit->language['Friday'],
			7=>$this->panelInit->language['Saturday']
		);

		$subjectArray = array();
		$subjectObject = \subject::get();
		foreach ($subjectObject as $subject) {
			$subjectArray[$subject->id] = $subject->subjectTitle;
		}

		$toReturn = array();

		$toReturn['schedule'] = array(
			2=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][2],'data'=>array()),
			3=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][3],'data'=>array()),
			4=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][4],'data'=>array()),
			5=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][5],'data'=>array()),
			6=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][6],'data'=>array()),
			7=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][7],'data'=>array())
		);

		if($this->panelInit->settingsArray['enableSections'] == true){
			if($this->data['users']->role == "teacher"){
					$classSchedule = \class_schedule::where('sectionId',$id)
						// ->where('teacherId',$this->data['users']->id)
						->orderBy('startTime')
						->get();
			}else{
					$classSchedule = \class_schedule::where('sectionId',$id)->orderBy('startTime')->get();
			}

			foreach ($classSchedule as $schedule) {
				if($this->data['users']->role == "teacher"){
					$teacherTmp = \User::where('id',$schedule->teacherId)->select('fullName')->first();
				}else{
					$teacherTmp = \User::where('id',$schedule->teacherId)->select('fullName')->first();
				}

				if($teacherTmp){
					$teacherName = $teacherTmp->fullName;
				}else{
					$teacherName = "none";
				}
				$toReturn['schedule'][$schedule->dayOfWeek]['sub'][] = array(
					'id'=>$schedule->id,
					'teacherId'=>$schedule->teacherId,
					'teacherName' => $teacherName,
					'sectionId'=>$schedule->sectionId,
					'subjectId'=> isset($subjectArray[$schedule->subjectId])?$subjectArray[$schedule->subjectId]:"" ,
					'start'=>wordwrap($schedule->startTime,2,':',true),
					'end'=>wordwrap($schedule->endTime,2,':',true)
				);

			}

			$toReturn['section'] = \sections::where('id',$id)->first();
			$toReturn['class'] = \classes::where('id',$toReturn['section']->classId)->select('className')->first();
		}else{
			$classSchedule = \class_schedule::where('classId',$id)->orderBy('startTime')->get();
			foreach ($classSchedule as $schedule) {
				$toReturn['schedule'][$schedule->dayOfWeek]['sub'][] = array('id'=>$schedule->id,'classId'=>$schedule->classId,'subjectId'=> isset($subjectArray[$schedule->subjectId])?$subjectArray[$schedule->subjectId]:"" ,'start'=>wordwrap($schedule->startTime,2,':',true),'end'=>wordwrap($schedule->endTime,2,':',true) );
			}

			$toReturn['class'] = \classes::where('id',$id)->select('className')->first();
		}

		return $toReturn;
	}

	function fetchForTeacher(){

		if(!$this->panelInit->can( "classSch.list" )){
			exit;
		}

		$arrayOfDays = array(
			2=>$this->panelInit->language['Monday'],
			3=>$this->panelInit->language['Tuesday'],
			4=>$this->panelInit->language['Wednesday'],
			5=>$this->panelInit->language['Thurusday'],
			6=>$this->panelInit->language['Friday'],
			7=>$this->panelInit->language['Saturday']
		);

		$subjectArray = array();
		$subjectObject = \subject::get();
		foreach ($subjectObject as $subject) {
			$subjectArray[$subject->id] = $subject->subjectTitle;
		}

		$toReturn = array();

		$toReturn['schedule'] = array(
			2=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][2],'data'=>array()),
			3=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][3],'data'=>array()),
			4=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][4],'data'=>array()),
			5=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][5],'data'=>array()),
			6=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][6],'data'=>array()),
			7=>array('dayName'=>$this->panelInit->weekdays[ $this->panelInit->settingsArray['gcalendar'] ][7],'data'=>array())
		);

		if($this->panelInit->settingsArray['enableSections'] == true){
			if($this->data['users']->role == "teacher"){
				$classSchedule = \class_schedule::where('teacherId',$this->data['users']->id)
					->orderBy('startTime')
					->get();
			}

			$classes = MClass::pluck('className', 'id');
			$sections = Section::pluck('sectionName', 'id');

			foreach ($classSchedule as $schedule) {
				if($this->data['users']->role == "teacher"){
					$teacherTmp = \User::where('id',$schedule->teacherId)->select('fullName')->first();
				}

				if($teacherTmp){
					$teacherName = $teacherTmp->fullName;
				}else{
					$teacherName = "none";
				}

				// get class id from section id
				if(Section::where('id', $schedule->sectionId)->count()) {
					$current_class_id = Section::where('id', $schedule->sectionId)->first()->classId;

					$toReturn['schedule'][$schedule->dayOfWeek]['sub'][] = array(
						'id'=>$schedule->id,
						'teacherId'=> $schedule->teacherId,
						'teacherName' => $teacherName,
						'className'=> $classes[$current_class_id],
						'sectionName'=> $sections[$schedule->sectionId],
						'subjectId'=> isset($subjectArray[$schedule->subjectId])?$subjectArray[$schedule->subjectId]:"" ,
						'start'=>wordwrap($schedule->startTime,2,':',true),
						'end'=>wordwrap($schedule->endTime,2,':',true)
					);
				}

			}
		}

		return $toReturn;
	}

	public function exportFull(){
		ini_set('memory_limit', '-1');

		$data = [1 => [
			'Num', 'Teachers', 'C.T',
			'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday',  'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday',
			'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday',
			'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday',
			'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday',
			'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday',
			'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday',
			'Teachers'
		]];
		$data[] = [
			'', '', '',
			'08:20-09:00', '09:00-09:40', '09:40-10:20', '10:20-10:35 (Break)', '10:35-11:15', '11:15-11:55', '11:55-12:35', '12:35-13:05 (Break)', '13:05-13:45', '13:45-14:25',
			'07:20-08:00', '08:00-08:40', '08:40-09:20', '09:20-09:35 (Break)', '09:35-10:15', '10:15-10:55', '10:55-11:35', '11:35-12:05 (Break)', '12:05-12:45', '12:45-01:25',
			'07:50-08:50', '08:50-09:50', '09:50-10:05 (Break)', '10:05-11:05', '11:05-12:05', '12:05-12:30', '12:30-13:10', '13:10-13:50',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28',
			''
		];

		$timetable_teacher_ids = ClassSchedule::orderBy('teacherId', 'DESC')
			->groupBy('teacherId')
			->pluck('teacherId', 'id');

		$classes = MClass::pluck('className', 'id');
		$sections = Section::pluck('sectionName', 'id');
		$subjects = Subject::pluck('subjectTitle', 'id');
		$teachers = User::where('role', 'teacher')->pluck('fullName', 'id');

		$counter = 1;
		foreach ($timetable_teacher_ids as $key => $teacher_id) {
			$teacher_rows = ClassSchedule::where('teacherId', $teacher_id)->get();

			if(isset($teachers[$teacher_id])) {
				$teacher_name = $teachers[$teacher_id];

				if(strlen($teacher_name) > 3) {
					$excel_row = [];
					$full_rows_collection = [];

					$days_array = [
						2 => 'Monday',
						3 => 'Tuesday',
						4 => 'Wednesday',
						5 => 'Thursday',
						6 => 'Friday',
						7 => 'Saturday',
					];

					$teacher_append_status = 1;
					foreach ($days_array as $day_number => $day_name) {
						$fill_values = [];

						$per1_value = ''; $per2_value = ''; $per3_value = '';
						$per4_value = ''; $per5_value = ''; $per6_value = '';
						$per7_value = ''; $per8_value = ''; $per9_value = '';
						$per10_value = '';
						$per11_value = ''; $per12_value = ''; $per13_value = '';
						$per14_value = ''; $per15_value = ''; $per16_value = '';
						$per17_value = ''; $per18_value = ''; $per19_value = '';
						$per20_value = '';
						$per21_value = ''; $per22_value = ''; $per23_value = '';
						$per24_value = ''; $per25_value = ''; $per26_value = '';
						$per27_value = ''; $per28_value = '';

						foreach ($teacher_rows as $key => $row) {
							if($row->dayOfWeek == $day_number) {
								$class_id = Main::getClassIdBySectionId($row->sectionId);

								// get pattern [class section subject]
								{
									if($class_id > 0) {
										if(isset($classes[$class_id])) {
											$class_name = $classes[$class_id];
										} else {
											$class_name = '-';
										}
									} else {
										$class_name = '-';
									}
									if(isset($sections[$row->sectionId])) {
										$section_name = $sections[$row->sectionId];
									} else {
										$section_name = '-';
									}
									if(isset($subjects[$row->subjectId])) {
										$subject_name = $subjects[$row->subjectId];
									} else {
										$subject_name = '-';
									}
									$value = $class_name .",". $section_name .",". $subject_name;
								}

								if($per1_value == '') {
									if($row->startTime == '0820' && $row->endTime == '0900') {
										$per1_value = $value;
									}
								}
								if($per2_value == '') {
									if($row->startTime == '0900' && $row->endTime == '0940') {
										$per2_value = $value;
									}
								}
								if($per3_value == '') {
									if($row->startTime == '0940' && $row->endTime == '1020') {
										$per3_value = $value;
									}
								}
								if($per4_value == '') {
									if($row->startTime == '1020' && $row->endTime == '1035') {
										$per4_value = $value;
									}
								}
								if($per5_value == '') {
									if($row->startTime == '1035' && $row->endTime == '1115') {
										$per5_value = $value;
									}
								}
								if($per6_value == '') {
									if($row->startTime == '1115' && $row->endTime == '1155') {
										$per6_value = $value;
									}
								}
								if($per7_value == '') {
									if($row->startTime == '1155' && $row->endTime == '1235') {
										$per7_value = $value;
									}
								}
								if($per8_value == '') {
									if($row->startTime == '1235' && $row->endTime == '1305') {
										$per8_value = $value;
									}
								}
								if($per9_value == '') {
									if($row->startTime == '1305' && $row->endTime == '1345') {
										$per9_value = $value;
									}
								}
								if($per10_value == '') {
									if($row->startTime == '1345' && $row->endTime == '1425') {
										$per10_value = $value;
									}
								}
								if($per11_value == '') {
									if($row->startTime == '0720' && $row->endTime == '0800') {
										$per11_value = $value;
									}
								}
								if($per12_value == '') {
									if($row->startTime == '0800' && $row->endTime == '0840') {
										$per12_value = $value;
									}
								}
								if($per13_value == '') {
									if($row->startTime == '0840' && $row->endTime == '0920') {
										$per13_value = $value;
									}
								}
								if($per14_value == '') {
									if($row->startTime == '0920' && $row->endTime == '0935') {
										$per14_value = $value;
									}
								}
								if($per15_value == '') {
									if($row->startTime == '0935' && $row->endTime == '1015') {
										$per15_value = $value;
									}
								}
								if($per16_value == '') {
									if($row->startTime == '1015' && $row->endTime == '1055') {
										$per16_value = $value;
									}
								}
								if($per17_value == '') {
									if($row->startTime == '1055' && $row->endTime == '1135') {
										$per17_value = $value;
									}
								}
								if($per18_value == '') {
									if($row->startTime == '1135' && $row->endTime == '1205') {
										$per18_value = $value;
									}
								}
								if($per19_value == '') {
									if($row->startTime == '1205' && $row->endTime == '1245') {
										$per19_value = $value;
									}
								}
								if($per20_value == '') {
									if($row->startTime == '1245' && $row->endTime == '0125') {
										$per20_value = $value;
									}
								}
								if($per21_value == '') {
									if($row->startTime == '0750' && $row->endTime == '0850') {
										$per21_value = $value;
									}
								}
								if($per22_value == '') {
									if($row->startTime == '0850' && $row->endTime == '0950') {
										$per22_value = $value;
									}
								}
								if($per23_value == '') {
									if($row->startTime == '0950' && $row->endTime == '1005') {
										$per23_value = $value;
									}
								}
								if($per24_value == '') {
									if($row->startTime == '1005' && $row->endTime == '1105') {
										$per24_value = $value;
									}
								}
								if($per25_value == '') {
									if($row->startTime == '1105' && $row->endTime == '1205') {
										$per25_value = $value;
									}
								}
								if($per26_value == '') {
									if($row->startTime == '1205' && $row->endTime == '1230') {
										$per26_value = $value;
									}
								}
								if($per27_value == '') {
									if($row->startTime == '1230' && $row->endTime == '1310') {
										$per27_value = $value;
									}
								}
								if($per28_value == '') {
									if($row->startTime == '1310' && $row->endTime == '1350') {
										$per28_value = $value;
									}
								}

							}
						}

						$value_of_per1 = $per1_value == '' ? $this->temp_empty_timetable_parameter : $per1_value;
						$value_of_per2 = $per2_value == '' ? $this->temp_empty_timetable_parameter : $per2_value;
						$value_of_per3 = $per3_value == '' ? $this->temp_empty_timetable_parameter : $per3_value;
						$value_of_per4 = $per4_value == '' ? $this->temp_empty_timetable_parameter : $per4_value;
						$value_of_per5 = $per5_value == '' ? $this->temp_empty_timetable_parameter : $per5_value;
						$value_of_per6 = $per6_value == '' ? $this->temp_empty_timetable_parameter : $per6_value;
						$value_of_per7 = $per7_value == '' ? $this->temp_empty_timetable_parameter : $per7_value;
						$value_of_per8 = $per8_value == '' ? $this->temp_empty_timetable_parameter : $per8_value;
						$value_of_per9 = $per9_value == '' ? $this->temp_empty_timetable_parameter : $per9_value;
						$value_of_per10 = $per10_value == '' ? $this->temp_empty_timetable_parameter : $per10_value;
						$value_of_per11 = $per11_value == '' ? $this->temp_empty_timetable_parameter : $per11_value;
						$value_of_per12 = $per12_value == '' ? $this->temp_empty_timetable_parameter : $per12_value;
						$value_of_per13 = $per13_value == '' ? $this->temp_empty_timetable_parameter : $per13_value;
						$value_of_per14 = $per14_value == '' ? $this->temp_empty_timetable_parameter : $per14_value;
						$value_of_per15 = $per15_value == '' ? $this->temp_empty_timetable_parameter : $per15_value;
						$value_of_per16 = $per16_value == '' ? $this->temp_empty_timetable_parameter : $per16_value;
						$value_of_per17 = $per17_value == '' ? $this->temp_empty_timetable_parameter : $per17_value;
						$value_of_per18 = $per18_value == '' ? $this->temp_empty_timetable_parameter : $per18_value;
						$value_of_per19 = $per19_value == '' ? $this->temp_empty_timetable_parameter : $per19_value;
						$value_of_per20 = $per20_value == '' ? $this->temp_empty_timetable_parameter : $per20_value;
						$value_of_per21 = $per21_value == '' ? $this->temp_empty_timetable_parameter : $per21_value;
						$value_of_per22 = $per22_value == '' ? $this->temp_empty_timetable_parameter : $per22_value;
						$value_of_per23 = $per23_value == '' ? $this->temp_empty_timetable_parameter : $per23_value;
						$value_of_per24 = $per24_value == '' ? $this->temp_empty_timetable_parameter : $per24_value;
						$value_of_per25 = $per25_value == '' ? $this->temp_empty_timetable_parameter : $per25_value;
						$value_of_per26 = $per26_value == '' ? $this->temp_empty_timetable_parameter : $per26_value;
						$value_of_per27 = $per27_value == '' ? $this->temp_empty_timetable_parameter : $per27_value;
						$value_of_per28 = $per28_value == '' ? $this->temp_empty_timetable_parameter : $per28_value;

						if(
							$per1_value == '' && $per2_value == '' && $per3_value == '' &&
							$per4_value == '' && $per5_value == '' && $per6_value == '' &&
							$per7_value == '' && $per8_value == '' && $per9_value == '' &&
							$per10_value == '' &&
							$per11_value == '' && $per12_value == '' && $per13_value == '' &&
							$per14_value == '' && $per15_value == '' && $per16_value == '' &&
							$per17_value == '' && $per18_value == '' && $per19_value == '' &&
							$per20_value == '' &&
							$per21_value == '' && $per22_value == '' && $per23_value == '' &&
							$per24_value == '' && $per25_value == '' && $per26_value == '' &&
							$per27_value == '' && $per28_value == '' &&
							$day_number != 5
						) {
							$teacher_append_status = 0;
						} else {
							$collection = [
								$value_of_per1, $value_of_per2, $value_of_per3,
								$value_of_per4, $value_of_per5, $value_of_per6,
								$value_of_per7, $value_of_per8, $value_of_per9,
								$value_of_per10,
								$value_of_per11, $value_of_per12, $value_of_per13,
								$value_of_per14, $value_of_per15, $value_of_per16,
								$value_of_per17, $value_of_per18, $value_of_per19,
								$value_of_per20,
								$value_of_per21, $value_of_per22, $value_of_per23,
								$value_of_per24, $value_of_per25, $value_of_per26,
								$value_of_per27, $value_of_per28,
							];
							$full_rows_collection[] = $collection;
						}
					}

					if($teacher_append_status == 1) {
						$excel_row = array_merge($excel_row, [$counter, $teacher_name, '']);

						foreach ($full_rows_collection as $key => $collection) {
							$excel_row = array_merge($excel_row, $collection);
						}

						$excel_row = array_merge($excel_row, [$teacher_name]);
						$data[] = $excel_row;
						$counter++;
					}

				}
			}
		}

		user_log('Timetables', 'export');

		\Excel::create('Timetable-Full-Sheet', function($excel) use($data) {

	    // Set the title
	    $excel->setTitle('Timetable Sheet');

	    // Chain the setters
	    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Timetable', function($sheet) use($data) {
				$teacher_count = 80;

				$sheet->setFreeze('D3');
				$sheet->setAllBorders('thin');
				$sheet->setWidth('A', 6);
				$sheet->setWidth('B', 25);
				$sheet->setWidth('C', 5);
				$sheet->setWidth('FP', 25);

				$array_letters = array_slice($this->createColumnsArray('FO'), 3);
				$array_letters = array_chunk($array_letters, 10);
				foreach ($array_letters as $key => $array_letter) {
					foreach ($array_letter as $letter) {
						$sheet->setWidth($letter, 22);
					}
				}

				// // set Heights
				foreach (range(1, $teacher_count) as $i) {
					$sheet->setHeight($i, 20);
				}

				// $sheet->mergeCells('D1:AE1');
				// $sheet->mergeCells('AF1:BG1');
				// $sheet->mergeCells('BH1:CI1');
				// $sheet->mergeCells('CJ1:DK1');
				// $sheet->mergeCells('DL1:EM1');
				// $sheet->mergeCells('EN1:FO1');

				$sheet->cells('A1:A' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('B1:B' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('C1:C' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('FP1:FP' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});

				$sheet->cells('D1:AE' . $teacher_count, function($cells) {
			    $cells->setBackground('#FCFF8A');
				});
				$sheet->cells('AF1:BG' . $teacher_count, function($cells) {
			    $cells->setBackground('#FFC68A');
				});
				$sheet->cells('BH1:CI' . $teacher_count, function($cells) {
			    $cells->setBackground('#8AFFDC');
				});
				$sheet->cells('CJ1:DK' . $teacher_count, function($cells) {
			    $cells->setBackground('#8A9FFF');
				});
				$sheet->cells('DL1:EM' . $teacher_count, function($cells) {
			    $cells->setBackground('#FF8AE8');
				});
				$sheet->cells('EN1:FO' . $teacher_count, function($cells) {
			    $cells->setBackground('#FF8A8F');
				});

				$sheet->cells('A1:FP2', function($cells) {
			    $cells->setFontWeight('bold');
				});
				$sheet->cells('A1:C' . $teacher_count, function($cells) {
			    $cells->setFontWeight('bold');
				});
				$sheet->cells('D1:FO' . $teacher_count, function($cells) {
			    $cells->setAlignment('center');
				});
				$sheet->cells('A1:A' . $teacher_count, function($cells) {
			    $cells->setAlignment('center');
				});
				$sheet->cells('A1:FP' . $teacher_count, function($cells) {
			    $cells->setValignment('center');
				});

				$sheet->fromArray($data, null, 'A1', true, false);
			});
		})->download('xls');
	}

	// for sxd school
	public function exportJuniors(){
		ini_set('memory_limit', '-1');

		$data = [1 => [
			'Num', 'Teachers', 'C.T',
			'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday',
			'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday',
			'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday',
			'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday',
			'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday',
			'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday',
			'Teachers'
		]];
		$data[] = [
			'', '', '',
			'08:20-09:00', '09:00-09:40', '09:40-10:20', '10:20-10:35 (Break)', '10:35-11:15', '11:15-11:55', '11:55-12:35', '12:35-13:05 (Break)', '13:05-13:45', '13:45-14:25',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			''
		];

		$timetable_teacher_ids = ClassSchedule::orderBy('teacherId', 'DESC')
			->groupBy('teacherId')
			->pluck('teacherId', 'id');

		$classes = MClass::pluck('className', 'id');
		$sections = Section::pluck('sectionName', 'id');
		$subjects = Subject::pluck('subjectTitle', 'id');
		$teachers = User::where('role', 'teacher')->pluck('fullName', 'id');

		$counter = 1;
		foreach ($timetable_teacher_ids as $key => $teacher_id) {
			$teacher_rows = ClassSchedule::where('teacherId', $teacher_id)->get();

			if(isset($teachers[$teacher_id])) {
				$teacher_name = $teachers[$teacher_id];

				if(strlen($teacher_name) > 3) {
					$excel_row = [];
					$full_rows_collection = [];

					$days_array = [
						2 => 'Monday',
						3 => 'Tuesday',
						4 => 'Wednesday',
						5 => 'Thursday',
						6 => 'Friday',
						7 => 'Saturday',
					];

					$teacher_append_status = 1;
					foreach ($days_array as $day_number => $day_name) {
						$fill_values = [];

						$per1_value = ''; $per2_value = ''; $per3_value = '';
						$per4_value = ''; $per5_value = ''; $per6_value = '';
						$per7_value = ''; $per8_value = ''; $per9_value = '';
						$per10_value = '';

						foreach ($teacher_rows as $key => $row) {
							if($row->dayOfWeek == $day_number) {
								$class_id = Main::getClassIdBySectionId($row->sectionId);

								// get pattern [class section subject]
								{
									if($class_id > 0) {
										if(isset($classes[$class_id])) {
											$class_name = $classes[$class_id];
										} else {
											$class_name = '-';
										}
									} else {
										$class_name = '-';
									}
									if(isset($sections[$row->sectionId])) {
										$section_name = $sections[$row->sectionId];
									} else {
										$section_name = '-';
									}
									if(isset($subjects[$row->subjectId])) {
										$subject_name = $subjects[$row->subjectId];
									} else {
										$subject_name = '-';
									}
									$value = $class_name .",". $section_name .",". $subject_name;
								}

								if($per1_value == '') {
									if($row->startTime == '0820' && $row->endTime == '0900') {
										$per1_value = $value;
									}
								}
								if($per2_value == '') {
									if($row->startTime == '0900' && $row->endTime == '0940') {
										$per2_value = $value;
									}
								}
								if($per3_value == '') {
									if($row->startTime == '0940' && $row->endTime == '1020') {
										$per3_value = $value;
									}
								}
								if($per4_value == '') {
									if($row->startTime == '1020' && $row->endTime == '1035') {
										$per4_value = $value;
									}
								}
								if($per5_value == '') {
									if($row->startTime == '1035' && $row->endTime == '1115') {
										$per5_value = $value;
									}
								}
								if($per6_value == '') {
									if($row->startTime == '1115' && $row->endTime == '1155') {
										$per6_value = $value;
									}
								}
								if($per7_value == '') {
									if($row->startTime == '1155' && $row->endTime == '1235') {
										$per7_value = $value;
									}
								}
								if($per8_value == '') {
									if($row->startTime == '1235' && $row->endTime == '1305') {
										$per8_value = $value;
									}
								}
								if($per9_value == '') {
									if($row->startTime == '1305' && $row->endTime == '1345') {
										$per9_value = $value;
									}
								}
								if($per10_value == '') {
									if($row->startTime == '1345' && $row->endTime == '1425') {
										$per10_value = $value;
									}
								}
							}
						}

						$value_of_per1 = $per1_value == '' ? $this->temp_empty_timetable_parameter : $per1_value;
						$value_of_per2 = $per2_value == '' ? $this->temp_empty_timetable_parameter : $per2_value;
						$value_of_per3 = $per3_value == '' ? $this->temp_empty_timetable_parameter : $per3_value;
						$value_of_per4 = $per4_value == '' ? $this->temp_empty_timetable_parameter : $per4_value;
						$value_of_per5 = $per5_value == '' ? $this->temp_empty_timetable_parameter : $per5_value;
						$value_of_per6 = $per6_value == '' ? $this->temp_empty_timetable_parameter : $per6_value;
						$value_of_per7 = $per7_value == '' ? $this->temp_empty_timetable_parameter : $per7_value;
						$value_of_per8 = $per8_value == '' ? $this->temp_empty_timetable_parameter : $per8_value;
						$value_of_per9 = $per9_value == '' ? $this->temp_empty_timetable_parameter : $per9_value;
						$value_of_per10 = $per10_value == '' ? $this->temp_empty_timetable_parameter : $per10_value;

						if(
							$per1_value == '' && $per2_value == '' && $per3_value == '' &&
							$per4_value == '' && $per5_value == '' && $per6_value == '' &&
							$per7_value == '' && $per8_value == '' && $per9_value == '' &&
							$per10_value == '' && $day_number != 5
						) {
							$teacher_append_status = 0;
						} else {
							$collection = [
								$value_of_per1,
								$value_of_per2,
								$value_of_per3,
								$value_of_per4,
								$value_of_per5,
								$value_of_per6,
								$value_of_per7,
								$value_of_per8,
								$value_of_per9,
								$value_of_per10,
							];
							$full_rows_collection[] = $collection;
						}
					}

					if($teacher_append_status == 1) {
						$excel_row = array_merge($excel_row, [$counter, $teacher_name, '']);

						foreach ($full_rows_collection as $key => $collection) {
							$excel_row = array_merge($excel_row, $collection);
						}

						$excel_row = array_merge($excel_row, [$teacher_name]);
						$data[] = $excel_row;
						$counter++;
					}

				}
			}
		}

		user_log('Timetables', 'export');

		\Excel::create('Timetable-Juniors-Sheet', function($excel) use($data) {

	    // Set the title
	    $excel->setTitle('Timetable Sheet');

	    // Chain the setters
	    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Timetable', function($sheet) use($data) {
				$teacher_count = 40;

				$sheet->setFreeze('D3');
				$sheet->setAllBorders('thin');
				$sheet->setWidth('A', 6);
				$sheet->setWidth('B', 25);
				$sheet->setWidth('C', 5);
				$sheet->setWidth('BL', 25);

				$array_letters = array_slice($this->createColumnsArray('BK'), 3);
				$array_letters = array_chunk($array_letters, 10);
				foreach ($array_letters as $key => $array_letter) {
					foreach ($array_letter as $letter) {
						$sheet->setWidth($letter, 22);
					}
				}

				// set Heights
				foreach (range(1, $teacher_count) as $i) {
					$sheet->setHeight($i, 20);
				}

				// $sheet->mergeCells('D1:M1');
				// $sheet->mergeCells('N1:W1');
				// $sheet->mergeCells('X1:AG1');
				// $sheet->mergeCells('AH1:AQ1');
				// $sheet->mergeCells('AR1:BA1');
				// $sheet->mergeCells('BB1:BK1');

				$sheet->cells('A1:A' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('B1:B' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('C1:C' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('BL1:BL' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});

				$sheet->cells('D1:M' . $teacher_count, function($cells) {
			    $cells->setBackground('#FCFF8A');
				});
				$sheet->cells('N1:W' . $teacher_count, function($cells) {
			    $cells->setBackground('#FFC68A');
				});
				$sheet->cells('X1:AG' . $teacher_count, function($cells) {
			    $cells->setBackground('#8AFFDC');
				});
				$sheet->cells('AH1:AQ' . $teacher_count, function($cells) {
			    $cells->setBackground('#8A9FFF');
				});
				$sheet->cells('AR1:BA' . $teacher_count, function($cells) {
			    $cells->setBackground('#FF8AE8');
				});
				$sheet->cells('BB1:BK' . $teacher_count, function($cells) {
			    $cells->setBackground('#FF8A8F');
				});

				$sheet->cells('A1:BL2', function($cells) {
			    $cells->setFontWeight('bold');
				});
				$sheet->cells('A1:C' . $teacher_count, function($cells) {
			    $cells->setFontWeight('bold');
				});
				$sheet->cells('D1:BL' . $teacher_count, function($cells) {
			    $cells->setAlignment('center');
				});
				$sheet->cells('A1:A' . $teacher_count, function($cells) {
			    $cells->setAlignment('center');
				});
				$sheet->cells('A1:BL' . $teacher_count, function($cells) {
			    $cells->setValignment('center');
				});

				$sheet->fromArray($data, null, 'A1', true, false);
			});

		})->download('xls');
	}

	// for sxd school
	public function exportSeniors(){
		ini_set('memory_limit', '-1');

		$data = [1 => [
			'Num', 'Teachers', 'C.T',
			'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday', 'Monday',
			'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday', 'Tuesday',
			'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday', 'Wednesday',
			'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday', 'Thursday',
			'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday', 'Friday',
			'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday', 'Saturday',
			'Teachers'
		]];
		$data[] = [
			'', '', '',
			'07:20-08:00', '08:00-08:40', '08:40-09:20', '09:20-09:35 (Break)', '09:35-10:15', '10:15-10:55', '10:55-11:35', '11:35-12:05 (Break)', '12:05-12:45', '12:45-01:25',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
			''
		];

		$timetable_teacher_ids = ClassSchedule::orderBy('teacherId', 'DESC')
			->groupBy('teacherId')
			->pluck('teacherId', 'id');

		$classes = MClass::pluck('className', 'id');
		$sections = Section::pluck('sectionName', 'id');
		$subjects = Subject::pluck('subjectTitle', 'id');
		$teachers = User::where('role', 'teacher')->pluck('fullName', 'id');

		$counter = 1;
		foreach ($timetable_teacher_ids as $key => $teacher_id) {
			$teacher_rows = ClassSchedule::where('teacherId', $teacher_id)->get();

			if(isset($teachers[$teacher_id])) {
				$teacher_name = $teachers[$teacher_id];

				if(strlen($teacher_name) > 3) {
					$excel_row = [];
					$full_rows_collection = [];

					$days_array = [
						2 => 'Monday',
						3 => 'Tuesday',
						4 => 'Wednesday',
						5 => 'Thursday',
						6 => 'Friday',
						7 => 'Saturday',
					];

					$teacher_append_status = 1;
					foreach ($days_array as $day_number => $day_name) {
						$fill_values = [];

						$per1_value = ''; $per2_value = ''; $per3_value = '';
						$per4_value = ''; $per5_value = ''; $per6_value = '';
						$per7_value = ''; $per8_value = ''; $per9_value = '';
						$per10_value = '';

						foreach ($teacher_rows as $key => $row) {
							if($row->dayOfWeek == $day_number) {
								$class_id = Main::getClassIdBySectionId($row->sectionId);

								// get pattern [class section subject]
								{
									if($class_id > 0) {
										if(isset($classes[$class_id])) {
											$class_name = $classes[$class_id];
										} else {
											$class_name = '-';
										}
									} else {
										$class_name = '-';
									}
									if(isset($sections[$row->sectionId])) {
										$section_name = $sections[$row->sectionId];
									} else {
										$section_name = '-';
									}
									if(isset($subjects[$row->subjectId])) {
										$subject_name = $subjects[$row->subjectId];
									} else {
										$subject_name = '-';
									}
									$value = $class_name .",". $section_name .",". $subject_name;
								}

								if($per1_value == '') {
									if($row->startTime == '0720' && $row->endTime == '0800') {
										$per1_value = $value;
									}
								}
								if($per2_value == '') {
									if($row->startTime == '0800' && $row->endTime == '0840') {
										$per2_value = $value;
									}
								}
								if($per3_value == '') {
									if($row->startTime == '0840' && $row->endTime == '0920') {
										$per3_value = $value;
									}
								}
								if($per4_value == '') {
									if($row->startTime == '0920' && $row->endTime == '0935') {
										$per4_value = $value;
									}
								}
								if($per5_value == '') {
									if($row->startTime == '0935' && $row->endTime == '1015') {
										$per5_value = $value;
									}
								}
								if($per6_value == '') {
									if($row->startTime == '1015' && $row->endTime == '1055') {
										$per6_value = $value;
									}
								}
								if($per7_value == '') {
									if($row->startTime == '1055' && $row->endTime == '1135') {
										$per7_value = $value;
									}
								}
								if($per8_value == '') {
									if($row->startTime == '1135' && $row->endTime == '1205') {
										$per8_value = $value;
									}
								}
								if($per9_value == '') {
									if($row->startTime == '1205' && $row->endTime == '1245') {
										$per9_value = $value;
									}
								}
								if($per10_value == '') {
									if($row->startTime == '1245' && $row->endTime == '0125') {
										$per10_value = $value;
									}
								}
							}
						}

						$value_of_per1 = $per1_value == '' ? $this->temp_empty_timetable_parameter : $per1_value;
						$value_of_per2 = $per2_value == '' ? $this->temp_empty_timetable_parameter : $per2_value;
						$value_of_per3 = $per3_value == '' ? $this->temp_empty_timetable_parameter : $per3_value;
						$value_of_per4 = $per4_value == '' ? $this->temp_empty_timetable_parameter : $per4_value;
						$value_of_per5 = $per5_value == '' ? $this->temp_empty_timetable_parameter : $per5_value;
						$value_of_per6 = $per6_value == '' ? $this->temp_empty_timetable_parameter : $per6_value;
						$value_of_per7 = $per7_value == '' ? $this->temp_empty_timetable_parameter : $per7_value;
						$value_of_per8 = $per8_value == '' ? $this->temp_empty_timetable_parameter : $per8_value;
						$value_of_per9 = $per9_value == '' ? $this->temp_empty_timetable_parameter : $per9_value;
						$value_of_per10 = $per10_value == '' ? $this->temp_empty_timetable_parameter : $per10_value;

						if(
							$per1_value == '' && $per2_value == '' && $per3_value == '' &&
							$per4_value == '' && $per5_value == '' && $per6_value == '' &&
							$per7_value == '' && $per8_value == '' && $per9_value == '' &&
							$per10_value == '' && $day_number != 5
						) {
							$teacher_append_status = 0;
						} else {
							$collection = [
								$value_of_per1,
								$value_of_per2,
								$value_of_per3,
								$value_of_per4,
								$value_of_per5,
								$value_of_per6,
								$value_of_per7,
								$value_of_per8,
								$value_of_per9,
								$value_of_per10,
							];
							$full_rows_collection[] = $collection;
						}
					}

					if($teacher_append_status == 1) {
						$excel_row = array_merge($excel_row, [$counter, $teacher_name, '']);

						foreach ($full_rows_collection as $key => $collection) {
							$excel_row = array_merge($excel_row, $collection);
						}

						$excel_row = array_merge($excel_row, [$teacher_name]);
						$data[] = $excel_row;
						$counter++;
					}

				}
			}
		}

		user_log('Timetables', 'export');

		\Excel::create('Timetable-Seniors-Sheet', function($excel) use($data) {

	    // Set the title
	    $excel->setTitle('Timetable Sheet');

	    // Chain the setters
	    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Timetable', function($sheet) use($data) {
				$teacher_count = 40;

				$sheet->setFreeze('D3');
				$sheet->setAllBorders('thin');
				$sheet->setWidth('A', 6);
				$sheet->setWidth('B', 25);
				$sheet->setWidth('C', 5);
				$sheet->setWidth('BL', 25);

				$array_letters = array_slice($this->createColumnsArray('BK'), 3);
				$array_letters = array_chunk($array_letters, 10);
				foreach ($array_letters as $key => $array_letter) {
					foreach ($array_letter as $letter) {
						$sheet->setWidth($letter, 22);
					}
				}

				// set Heights
				foreach (range(1, $teacher_count) as $i) {
					$sheet->setHeight($i, 20);
				}

				// $sheet->mergeCells('D1:M1');
				// $sheet->mergeCells('N1:W1');
				// $sheet->mergeCells('X1:AG1');
				// $sheet->mergeCells('AH1:AQ1');
				// $sheet->mergeCells('AR1:BA1');
				// $sheet->mergeCells('BB1:BK1');

				$sheet->cells('A1:A' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('B1:B' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('C1:C' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});
				$sheet->cells('BL1:BL' . $teacher_count, function($cells) {
			    $cells->setBackground('#60F1E0');
				});

				$sheet->cells('D1:M' . $teacher_count, function($cells) {
			    $cells->setBackground('#FCFF8A');
				});
				$sheet->cells('N1:W' . $teacher_count, function($cells) {
			    $cells->setBackground('#FFC68A');
				});
				$sheet->cells('X1:AG' . $teacher_count, function($cells) {
			    $cells->setBackground('#8AFFDC');
				});
				$sheet->cells('AH1:AQ' . $teacher_count, function($cells) {
			    $cells->setBackground('#8A9FFF');
				});
				$sheet->cells('AR1:BA' . $teacher_count, function($cells) {
			    $cells->setBackground('#FF8AE8');
				});
				$sheet->cells('BB1:BK' . $teacher_count, function($cells) {
			    $cells->setBackground('#FF8A8F');
				});

				$sheet->cells('A1:BL2', function($cells) {
			    $cells->setFontWeight('bold');
				});
				$sheet->cells('A1:C' . $teacher_count, function($cells) {
			    $cells->setFontWeight('bold');
				});
				$sheet->cells('D1:BL' . $teacher_count, function($cells) {
			    $cells->setAlignment('center');
				});
				$sheet->cells('A1:A' . $teacher_count, function($cells) {
			    $cells->setAlignment('center');
				});
				$sheet->cells('A1:BL' . $teacher_count, function($cells) {
			    $cells->setValignment('center');
				});

				$sheet->fromArray($data, null, 'A1', true, false);
			});

		})->download('xls');
	}

	protected function createColumnsArray($end_column, $first_letters = '') {
	  $columns = array();
	  $length = strlen($end_column);
	  $letters = range('A', 'Z');

	  // Iterate over 26 letters.
	  foreach ($letters as $letter) {
	      // Paste the $first_letters before the next.
	      $column = $first_letters . $letter;

	      // Add the column to the final array.
	      $columns[] = $column;

	      // If it was the end column that was added, return the columns.
	      if ($column == $end_column)
	          return $columns;
	  }

	  // Add the column children.
	  foreach ($columns as $column) {
	      // Don't itterate if the $end_column was already set in a previous itteration.
	      // Stop iterating if you've reached the maximum character length.
	      if (!in_array($end_column, $columns) && strlen($column) < $length) {
	          $new_columns = $this->createColumnsArray($end_column, $column);
	          // Merge the new columns which were created with the final columns array.
	          $columns = array_merge($columns, $new_columns);
	      }
	  }

	  return $columns;
	}

	public function import($type){
		if(!$this->panelInit->can( "classSch.addSch" )){
			exit;
		}

		if (\Input::hasFile('excelcsv')) {
			if ( $_FILES['excelcsv']['tmp_name'] ) {
				user_log('Timetable', 'import');

				$temp_filename = $_FILES['excelcsv']['tmp_name'];
				$readExcel = \Excel::load($temp_filename, function($reader) {
					$reader->noHeading();
				})->toArray();

				$periods_collection = [];
				$items = [];
				$empty_values_items = [];
				$temp_days = [];

				foreach ($readExcel as $i => $row) {
					if(count(array_unique($row)) == 1 && array_unique($row)[0] == null) {
						continue;
					}
					if($i > 1) {
						for ($j = 3; $j < count($row) - 1; $j++) {
							$day = $readExcel[0][$j];
							$time = $readExcel[1][$j];
							$teacher_name = $row[1];
							$collection = $row[$j];

							if(strlen($time) > 3) {
								$periods_collection[] = $time;
							}

							$item = [
								'day' => $day,
								'time' => $time,
								'teacher_name' => $teacher_name,
								'collection' => $collection,
								'row_num' => $i + 1,
								'column_num' => $j + 1,
							];

							if($collection != $this->temp_empty_timetable_parameter) {
								$items[] = $item;
								$temp_days[] = $day;
							} else {
								$empty_values_items[] = $item;
							}
						}
					}
				}

				$temp_days = array_unique($temp_days);
				$temp_teacher_fullnames = [];
				$temp_class_names = [];
				$temp_subject_names = [];

				// delete old data
				ClassSchedule::select('id')->delete();

				foreach ($items as $key => $collection) {
					$props = explode(',', $collection['collection']);

					if(count($props) <= 2 && count($props) >= 4) {
						$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
						$message = 'Reason: invalid cell '. $get_cell .' format';
						return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
					}

					if(!in_array($collection['teacher_name'], $temp_teacher_fullnames)) {
						$temp_teacher_fullnames[] = $collection['teacher_name'];
					}
					if(!in_array($props[0], $temp_class_names)) {
						$temp_class_names[] = $props[0];
					}
					if(!in_array(end($props), $temp_subject_names)) {
						$temp_subject_names[] = end($props);
					}
				}

				$main_targets = [];
				$teachers = User::whereIn('fullName', $temp_teacher_fullnames)->pluck('id', 'fullName');
				$classes = MClass::whereIn('className', $temp_class_names)->pluck('id', 'className');
				$sections = Section::get()->toArray();
				$subjects = Subject::whereIn('subjectTitle', $temp_subject_names)->pluck('id', 'subjectTitle');

				$check_exists_teachers_with_same_time = [];

				// Insert or update teachers periods
				foreach ($items as $key => $collection) {
					if(isset(array_change_key_case($teachers->toArray(), CASE_LOWER)[strtolower($collection['teacher_name'])])) {
						$teacher_id = array_change_key_case($teachers->toArray(), CASE_LOWER)[strtolower($collection['teacher_name'])];
					} else {
						$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 3] . $collection['row_num'];
						$message = 'Reason: Teacher (' . $collection['teacher_name'] . ') not found within excel cell ' . $get_cell;
						return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
					}

					if($this->getDayId($collection['day']) > 0) {
						$day = $this->getDayId($collection['day']);
					} else {
						$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
						$message = 'Reason: Day name (' . $collection['day'] . ') not found within excel cell ' . $get_cell;
						return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
					}

					if(strlen($collection['time']) < 5) {
						$current_time = $periods_collection[$collection['time'] - 1];
					} else {
						$current_time = $collection['time'];
					}

					$_time = explode('-', $current_time);
					if(is_array($_time) && count($_time) == 2) {
						$start_time = str_replace(':', '', $_time[0]);
						$end_time = str_replace([':', '(Break)', ' '], ['', '', ''], $_time[1]);
					} else {
						$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . ($collection['row_num'] - 1);
						$message = 'Reason: invalid time format (' . $current_time . ') within excel cell ' . $get_cell;
						return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
					}

					$props = explode(',', $collection['collection']);

					if(count($props) == 3) {
						$class_id = 0;
						$subject_id = 0;
						$class_name = $props[0];
						$subject_name = end($props);

						if(isset($classes[$class_name])) {
							$class_id = $classes[$class_name];
						} else {
							$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
							$message = 'Reason: Class (' . $class_name . ') not found within excel cell ' . $get_cell;
							return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
						}
						if(isset($subjects[$subject_name])) {
							$subject_id = $subjects[$subject_name];
						} else {
							$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
							$message = 'Reason: Subject (' . $subject_name . ') not found within excel cell ' . $get_cell;
							return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
						}

						if($class_id > 0 && $subject_id > 0) {
							$section_item = [];
							$section_name = $props[1];

							foreach ($sections as $key => $section) {
								if($section['classId'] == $class_id && $section['sectionName'] == $section_name) {
									$section_item = $section;
								}
							}

							if(count($section_item) != 0) {
								$section_id = $section_item['id'];

								$exists_repeater = $day .'-'. $start_time .'-'. $end_time .'-'. $section_id;
								// if(in_array($exists_repeater, $check_exists_teachers_with_same_time)) {
								// 	$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
								// 	$message = 'Reason: Section (' . $section_name . ') of class ('. $class_name .') can\'t take 2 subjects in same period within excel cell ' . $get_cell;
								// 	return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
								// }

								 $check_exists2 = ClassSchedule::where([
									'dayOfWeek' => $day,
									'startTime' => $start_time,
									'endTime' => $end_time,
									'sectionId' => $section_id
								]);

								// if($check_exists2->count() > 1) {
								// 	$message = 'Reason: Section (' . $section_name . ') of class ('. $class_name .'), Day '. $collection['day'] .' can\'t take more than 1 subject in same period. Please repair it from timetable panel';
								// 	return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
								// }

								// if($check_exists2->count()) {
								// 	if($check_exists2->first()->teacherId != $teacher_id) {
								// 		$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
								// 		$message = 'Reason: Section (' . $section_name . ') of class ('. $class_name .'), Day '. $collection['day'] .' can\'t take more than 1 subject in same period. within excel cell ' . $get_cell;
								// 		return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
								// 	}
								// }

								$timetable = ClassSchedule::firstOrNew([
									'dayOfWeek' => $day,
									'startTime' => $start_time,
									'endTime' => $end_time,
									'teacherId' => $teacher_id
								]);
								$timetable->sectionId = $section_id;
								$timetable->subjectId = $subject_id;
								$timetable->save();

								$check_exists_teachers_with_same_time[] = $exists_repeater;
							} else {
								$get_cell = $this->createColumnsArray('GG')[$collection['column_num'] - 1] . $collection['row_num'];
								$message = 'Reason: Section (' . $section_name . ') not found within excel cell ' . $get_cell;
								return $this->panelInit->apiOutput(false, 'Incomplete import timetable', $message);
							}
						}
					}
				}

				// Delete teacher periods
				foreach ($empty_values_items as $key => $collection) {
					$teacher_id = array_change_key_case($teachers->toArray(), CASE_LOWER)[strtolower($collection['teacher_name'])];
					$day = $this->getDayId($collection['day']);
					if(strlen($collection['time']) < 5) {
						$current_time = $periods_collection[$collection['time'] - 1];
					} else {
						$current_time = $collection['time'];
					}

					$_time = explode('-', $current_time);
					$start_time = str_replace(':', '', $_time[0]);
					$end_time = str_replace([':', '(Break)', ' '], ['', '', ''], $_time[1]);

					ClassSchedule::where([
						'dayOfWeek' => $day,
						'startTime' => $start_time,
						'endTime' => $end_time,
						'teacherId' => $teacher_id
					])->delete();
				}

				// Insert Break slots to all sections -----------
				$break_slot = '';
				foreach ($periods_collection as $key => $time) {
					$_time_slot = strtolower($time);
					if(strpos($_time_slot, 'break') && $break_slot == '') {
						$break_slot = str_replace(['(break)', ' ', ':'], ['', '', ''], $_time_slot);
						$break_startTime = explode('-', $break_slot)[0];
						$break_endTime = explode('-', $break_slot)[1];
					}
				}
				if($break_slot != '') {
					$break_subject = Subject::where('subjectTitle', 'Break')->first();
					if($break_subject == null) {
						return $this->panelInit->apiOutput(false, 'Incomplete import timetable', 'Break subject not found');
					}
					foreach ($temp_days as $key1 => $day_name) {
						foreach ($sections as $key2 => $section) {
							$day = $this->getDayId($day_name);
							$timetable = new ClassSchedule;
							$timetable->dayOfWeek = $day;
							$timetable->startTime = $break_startTime;
							$timetable->endTime = $break_endTime;
							$timetable->teacherId = User::where('role', 'teacher')->first()->id;
							$timetable->sectionId = $section['id'];
							$timetable->subjectId = $break_subject->id;
							$timetable->save();
						}
					}
				}
				// ----------------------------------------------

				return $this->panelInit->apiOutput(true, 'Import timetable', 'Success import timetable');
			}
		}else{
			return json_encode(array("jsTitle"=>$this->panelInit->language['Import'],"jsStatus"=>"0","jsMessage"=>$this->panelInit->language['specifyFileToImport'] ));
			exit;
		}
		exit;
	}

	protected function getDayId($string) {
		$arr = [
			'Monday' => 2,
			'Tuesday' => 3,
			'Wednesday' => 4,
			'Thursday' => 5,
			'Friday' => 6,
			'Saturday' => 7
		];

		if(isset($arr[$string])) {
			return $arr[$string];
		} else {
			return 0;
		}
	}

	public function addSub($class){

		if(!$this->panelInit->can( "classSch.addSch" )){
			exit;
		}

		$classSchedule = new \class_schedule();
		if($this->panelInit->settingsArray['enableSections'] == true){
			$classSchedule->sectionId = $class;
		}else{
			$classSchedule->classId = $class;
		}
		$classSchedule->subjectId = \Input::get('subjectId');
		$classSchedule->dayOfWeek = \Input::get('dayOfWeek');
		$classSchedule->teacherId = \Input::get('teacherId');

		$startTime = "";
		if(\Input::get('startTimeHour') < 10){
			$startTime .= "0";
		}
		$startTime .= \Input::get('startTimeHour');
		if(\Input::get('startTimeMin') < 10){
			$startTime .= "0";
		}
		$startTime .= \Input::get('startTimeMin');
		$classSchedule->startTime = $startTime;

		$endTime = "";
		if(\Input::get('endTimeHour') < 10){
			$endTime .= "0";
		}
		$endTime .= \Input::get('endTimeHour');
		if(\Input::get('endTimeMin') < 10){
			$endTime .= "0";
		}
		$endTime .= \Input::get('endTimeMin');
		$classSchedule->endTime = $endTime;
		$classSchedule->save();


		$classSchedule->startTime = wordwrap($classSchedule->startTime,2,':',true);
		$classSchedule->endTime = wordwrap($classSchedule->endTime,2,':',true);
		$classSchedule->subjectId = \subject::where('id',\Input::get('subjectId'))->first()->subjectTitle;

		// User log
		if(MClass::find($class)) {
			$user_log_payload = 'Class: ' . MClass::find($class)->className . ', ';
		} else {
			$user_log_payload = '';
		}
		$user_log_payload .= 'Subject: ' . $classSchedule->subjectId;
		user_log('Timetable', 'create', $user_log_payload);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addSch'],$this->panelInit->language['schCreaSucc'],$classSchedule->toArray() );
	}

	public function delete($class,$id){

		if(!$this->panelInit->can( "classSch.delSch" )){
			exit;
		}

		if ( $postDelete = \class_schedule::where('id', $id)->first() ) {
			user_log('Timetable', 'delete');
      $postDelete->delete();
      return $this->panelInit->apiOutput(true,$this->panelInit->language['delSch'],$this->panelInit->language['schDeleted']);
    }else{
      return $this->panelInit->apiOutput(false,$this->panelInit->language['delSch'],$this->panelInit->language['schNotExist']);
    }
	}

	public function fetchSub($id){

		if(!$this->panelInit->can( "classSch.editSch" )){
			exit;
		}

		$sub = \class_schedule::where('id',$id)->first()->toArray();
		$sub['startTime'] = str_split($sub['startTime'],2);
		$sub['startTimeHour'] = intval($sub['startTime'][0]);
		$sub['startTimeMin'] = intval($sub['startTime'][1]);

		$sub['endTime'] = str_split($sub['endTime'],2);
		$sub['endTimeHour'] = intval($sub['endTime'][0]);
		$sub['endTimeMin'] = intval($sub['endTime'][1]);

		return json_encode($sub);
	}

	public function editSub($id){

		if(!$this->panelInit->can( "classSch.editSch" )){
			exit;
		}

		$classSchedule = \class_schedule::find($id);
		$classSchedule->subjectId = \Input::get('subjectId');
		$classSchedule->dayOfWeek = \Input::get('dayOfWeek');
		$classSchedule->teacherId = \Input::get('teacherId');

		$startTime = "";
		if(\Input::get('startTimeHour') < 10){
			$startTime .= "0";
		}
		$startTime .= \Input::get('startTimeHour');
		if(\Input::get('startTimeMin') < 10){
			$startTime .= "0";
		}
		$startTime .= \Input::get('startTimeMin');
		$classSchedule->startTime = $startTime;

		$endTime = "";
		if(\Input::get('endTimeHour') < 10){
			$endTime .= "0";
		}
		$endTime .= \Input::get('endTimeHour');
		if(\Input::get('endTimeMin') < 10){
			$endTime .= "0";
		}
		$endTime .= \Input::get('endTimeMin');
		$classSchedule->endTime = $endTime;
		$classSchedule->save();

		$classSchedule->startTime = wordwrap($classSchedule->startTime,2,':',true);
		$classSchedule->endTime = wordwrap($classSchedule->endTime,2,':',true);
		$classSchedule->subjectId = \subject::where('id',\Input::get('subjectId'))->first()->subjectTitle;

		user_log('Timetable', 'edit', 'Subject: ' . $classSchedule->subjectId);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editSch'],$this->panelInit->language['schModSucc'],$classSchedule->toArray() );
	}

	public function fetchParameters() {
		User::$withoutAppends = true;

		$teachers = User::select('id', 'fullName as name')->where('role', 'teacher')->get();
		$classes = MClass::select('id', 'className as name')->get();
		$sections = Section::select('id', 'classId', 'sectionName as name')->get();
		$subjects = Subject::select('id', 'subjectTitle as name')->get();

		return response()->json([
			'teachers' => $teachers,
			'classes' => $classes,
			'sections' => $sections,
			'subjects' => $subjects,
		]);
	}


	public function teacherPresence($page = 1) {
		$days_array = [
			1 => 'Sunday',
			2 => 'Monday',
			3 => 'Tuesday',
			4 => 'Wednesday',
			5 => 'Thursday',
			6 => 'Friday',
			7 => 'Saturday'
		];

		$main_title = '';

		// get day number from date
		if(!is_null(request()->input('filter_date'))) {
			$date = request()->input('filter_date');
			$current_day = Carbon::createFromFormat('d/m/Y', $date)->format('l');
			$current_day2 = $date;
		} else {
			$current_day = Carbon::now()->format('l');
			$current_day2 = Carbon::now()->format('d/m/Y');
		}
		$days_array = array_flip($days_array);
		$day_number = $days_array[$current_day];
		$main_title = $current_day2 . ' (' . $current_day . ')';

		// Fetch constants -----------
		$teachers = User::where('role', 'teacher')->get()->pluck('teacher_availability_info', 'id')->toArray();
		$subjects = Subject::pluck('subjectTitle', 'id');
		$classes = MClass::select('id', 'className')->get()->toArray();
		$sections = Section::select('id', 'classId', 'sectionName')->get()->toArray();
		$time_slots = [];
		$time_slots_query = ClassSchedule::groupBy('startTime')->orderBy('startTime', 'asc')->get()->toArray();
		foreach ($time_slots_query as $key => $slot) {
			$start_at = implode(':', str_split($slot['startTime'], 2));
			$end_at = implode(':', str_split($slot['endTime'], 2));
			$time_slots[] = $start_at . ' - ' . $end_at;
		}
		// --------------------------

		$data = [];
		$indecator_teacher = [];
		$fill_teachers = [];
		$query = ClassSchedule::where('dayOfWeek', $day_number);

		// filter by time slot, teacher, subject or section --------------------
		if(!is_null(request()->input('filter_timeslot')) && request()->input('filter_timeslot') > 0) {
			$timeslot = request()->input('filter_timeslot');
			$current_value = str_replace(':', '', explode(' - ', $timeslot)[0]);
			$query = $query->where('startTime', $current_value);
			$main_title .= ' - ' . str_replace(' - ', '~', $timeslot);
		}
		if(!is_null(request()->input('filter_class')) && request()->input('filter_class') > 0) {
			$class_id = request()->input('filter_class');
			$section_ids = Section::where('classId', $class_id)->pluck('id');
			$query = $query->whereIn('sectionId', $section_ids);
			$class_key = array_search($class_id, array_column($classes, 'id'));
			$main_title .= ' - ' . $classes[$class_key]['className'];
		}
		if(!is_null(request()->input('filter_section')) && request()->input('filter_section') > 0) {
			$section_id = request()->input('filter_section');
			$query = $query->where('sectionId', $section_id);
			$section_key = array_search($section_id, array_column($sections, 'id'));
			$main_title .= ' - Sec: ' . $sections[$section_key]['sectionName'];
		}
		if(!is_null(request()->input('filter_subject')) && request()->input('filter_subject') > 0) {
			$subject_id = request()->input('filter_subject');
			$query = $query->where('subjectId', $subject_id);
			$main_title .= ' - ' . $subjects[$subject_id];
		}
		// end filter ----------------------------------------------------------

		$presences = $query->get()->toArray();

		foreach ($presences as $key => $item) {
			if(in_array($item['teacherId'], $indecator_teacher)) {
				$temp_key = $fill_teachers[$item['teacherId']];
				if(!in_array($item['sectionId'], $data[$temp_key]['sections'])) {
					$data[$temp_key]['sections'] = array_merge($data[$temp_key]['sections'], [$item['sectionId']]);
				}
				if(!in_array($item['subjectId'], $data[$temp_key]['subjects'])) {
					$data[$temp_key]['subjects'] = array_merge($data[$temp_key]['subjects'], [$item['subjectId']]);
				}
			} else {
				$data[$key] = [
					'dayOfWeek' => $day_number,
					'startTime' => $item['startTime'],
					'endTime' => $item['endTime'],
					'teacherId' => $item['teacherId'],
					'sections' => [$item['sectionId']],
					'subjects' => [$item['subjectId']]
				];
				$indecator_teacher[] = $item['teacherId'];
				$fill_teachers[$item['teacherId']] = $key;
			}
		}

		// optimize data
		foreach ($data as $key => $item) {
			$start_at = implode(':', str_split($item['startTime'], 2));
			$end_at = implode(':', str_split($item['endTime'], 2));
			$data[$key]['time_slot'] = $start_at . ' - ' . $end_at;
			$data[$key]['teacher_info'] = $teachers[$item['teacherId']];

			$subject_names = [];
			foreach ($data[$key]['subjects'] as $subject_id) {
				$subject_names[] = $subjects[$subject_id];
			}
			$data[$key]['subjects'] = implode(', ', $subject_names);

			$class_and_section_names = [];
			foreach ($data[$key]['sections'] as $section_id) {
				$arr_key = array_search($section_id, array_column($sections, 'id'));
				$section_name = $sections[$arr_key]['sectionName'];
				$class_id = $sections[$arr_key]['classId'];
				$class_key = array_search($class_id, array_column($classes, 'id'));
				$class_name = $classes[$class_key]['className'];
				$class_and_section_names[] = $class_name . '/' . $section_name;
			}
			$data[$key]['classes_and_sections'] = implode(', ', $class_and_section_names);
		}

		return response()->json([
			'presences' => $data,
			'main_title' => $main_title,
			'time_slots' => $time_slots,
			'subjects' => $subjects,
			'classes' => $classes,
			'sections' => $sections
		]);
	}

	public function teacherAvailability($page = 1) {
		$data = [];

		$days_array = [
			1 => 'Sunday',
			2 => 'Monday',
			3 => 'Tuesday',
			4 => 'Wednesday',
			5 => 'Thursday',
			6 => 'Friday',
			7 => 'Saturday',
		];

		// get day number from date
			if(!is_null(request()->input('filter_date'))) {
				$date = request()->input('filter_date');
				$current_day = Carbon::createFromFormat('d/m/Y', $date)->format('l');
				$current_day2 = $date;
			} else {
				$current_day = Carbon::now()->format('l');
				$current_day2 = Carbon::now()->format('d/m/Y');
			}
			$days_array = array_flip($days_array);
			$day_number = $days_array[$current_day];
			$main_title = $current_day2 . ' (' . $current_day . ')';
		// ----------------------------

		// Fetch constants -----------
			$teachers = User::where('role', 'teacher')->get()->pluck('teacher_availability_info', 'id')->toArray();
			$all_classes = MClass::get()->toArray();
			$sections = Section::select('id', 'classId', 'sectionName')->get()->toArray();
			$subjects = Subject::pluck('subjectTitle', 'id');
			$pluck_classes = MClass::pluck('className', 'id');
			$time_slots = [];
			$time_slots_query = ClassSchedule::groupBy('startTime')
				->select('startTime', 'endTime')
				->orderBy('startTime', 'asc')->get()->toArray();
			foreach ($time_slots_query as $key => $slot) {
				$start_at = implode(':', str_split($slot['startTime'], 2));
				$end_at = implode(':', str_split($slot['endTime'], 2));
				$time_slots[] = $start_at . ' - ' . $end_at;
			}
		// ---------------------------

		$timetable_teacher_ids = ClassSchedule::orderBy('teacherId', 'DESC')
			->groupBy('teacherId')
			// ->take(5)->skip(5 * ($page - 1))
			->pluck('teacherId', 'id');

		$data = [];

		// init data --------------
			foreach ($timetable_teacher_ids as $classScheduleId => $teacher_id) {
				foreach ($time_slots_query as $key => $slot) {
					$check = ClassSchedule::where([
						'dayOfWeek' => $day_number,
						'startTime' => $slot['startTime'],
						'endTime' => $slot['endTime'],
						'teacherId' => $teacher_id
					])
					->remember(60 * 60)
					->count();

					if($check == 0) {
						$teacher_classes = Main::getClassesIdsByTeacherId($teacher_id);
						$teacher_sections = Main::getSectionIdsByTeacherId($teacher_id);
						$teacher_subjects = Main::getSubjectsIdsByTeacherId($teacher_id);

						$data[] = [
							'dayOfWeek' => $day_number,
							'teacher_id' => $teacher_id,
							'startTime' => $slot['startTime'],
							'endTime' => $slot['endTime'],
							'teacher_classes' => $teacher_classes,
							'teacher_sections' => $teacher_sections,
							'teacher_subjects' => $teacher_subjects,
						];
					}
				}
			}
		// end init ---------------

		// get total items --------------------------------------------------
			// if (!Cache::has('total_items_for_teacher_avai_41204568')) {
			// 	$totalItems = 0;
			// 	$timetable_teacher_ids = ClassSchedule::orderBy('teacherId', 'DESC')
			// 		->groupBy('teacherId')
			// 		->pluck('teacherId', 'id');

			// 	foreach ($timetable_teacher_ids as $classScheduleId => $teacher_id) {
			// 		foreach ($time_slots_query as $key => $slot) {
			// 			$check = ClassSchedule::where([
			// 				'dayOfWeek' => $day_number,
			// 				'startTime' => $slot['startTime'],
			// 				'endTime' => $slot['endTime'],
			// 				'teacherId' => $teacher_id
			// 			])->count();

			// 			if($check == 0) {
			// 				$totalItems++;
			// 			}
			// 		}
			// 	}
			// 	Cache::put('total_items_for_teacher_avai_41204568', $totalItems, 120); // minutes
			// } else {
			// 	$totalItems = Cache::get('total_items_for_teacher_avai_41204568');
			// }
		// end get total items ----------------------------------------------

		// filter -----------------------------------------------------------------
			foreach ($data as $key => $item) {
				// filter by time slot, teacher, subject or section --------------------
				if(!is_null(request()->input('filter_timeslot')) && request()->input('filter_timeslot') > 0) {
					$timeslot = request()->input('filter_timeslot');
					$filter_startTime = str_replace(':', '', explode(' - ', $timeslot)[0]);
					$filter_endTime = str_replace(':', '', explode(' - ', $timeslot)[1]);
					if($item['startTime'] == $filter_startTime && $item['endTime'] == $filter_endTime) {
					} else {
						unset($data[$key]);
					}
				}
				if(!is_null(request()->input('filter_class')) && request()->input('filter_class') > 0) {
					$class_id = request()->input('filter_class');
					if(!in_array($class_id, $item['teacher_classes'])) {
						unset($data[$key]);
					}
				}
				if(!is_null(request()->input('filter_section')) && request()->input('filter_section') != '0') {
					$section_ids = json_decode(request()->input('filter_section'));
					foreach ($section_ids as $section_id) {
						if(!in_array($section_id, $item['teacher_sections'])) {
							unset($data[$key]);
						}
					}
				}
				if(!is_null(request()->input('filter_subject')) && request()->input('filter_subject') != '0') {
					$subject_ids = json_decode(request()->input('filter_subject'));
					foreach ($subject_ids as $subject_id) {
						if(!in_array($subject_id, $item['teacher_subjects'])) {
							unset($data[$key]);
						}
					}
				}
				// end filter ----------------------------------------------------------
			}

			if(!is_null(request()->input('filter_timeslot')) && request()->input('filter_timeslot') > 0) {
				$main_title .= ' - ' . str_replace(' - ', '~', $timeslot);
			}
			if(!is_null(request()->input('filter_class')) && request()->input('filter_class') > 0) {
				$main_title .= ' - ' . $pluck_classes[$class_id];
			}
			if(!is_null(request()->input('filter_subject')) && request()->input('filter_subject') > 0) {
				$main_title .= ' - ' . $subjects[$subject_id];
			}
		// end filter ------------------------------------------------------------

		// optimize data ------------------
			foreach ($data as $key => $item) {
				$start_at = implode(':', str_split($item['startTime'], 2));
				$end_at = implode(':', str_split($item['endTime'], 2));
				$time_slot = $start_at . ' - ' . $end_at;

				$data[$key]['time_slot'] = $time_slot;
				$data[$key]['teacher_info'] = $teachers[$item['teacher_id']];

				$subject_names = [];
				foreach ($item['teacher_subjects'] as $subject_id) {
					if(isset($subjects[$subject_id])) {
						$subject_names[] = $subjects[$subject_id];
					}
				}
				$data[$key]['subjects'] = implode(', ', $subject_names);

				// $class_names = [];
				// foreach ($item['teacher_classes'] as $class_id) {
				// 	$class_names[] = $pluck_classes[$class_id];
				// }
				// $data[$key]['classes'] = implode(', ', $class_names);

				$class_and_section_names = [];
				foreach ($item['teacher_sections'] as $section_id) {
					$arr_key = array_search($section_id, array_column($sections, 'id'));
					$section_name = $sections[$arr_key]['sectionName'];
					$class_id = $sections[$arr_key]['classId'];
					$class_key = array_search($class_id, array_column($all_classes, 'id'));
					$class_name = $all_classes[$class_key]['className'];
					$class_and_section_names[] = $class_name . '/' . $section_name;
				}
				$data[$key]['classes_and_sections'] = implode(', ', $class_and_section_names);

				// filter un-needed items
				unset($data[$key]['teacher_id']);
				unset($data[$key]['startTime']);
				unset($data[$key]['endTime']);
				unset($data[$key]['teacher_classes']);
				unset($data[$key]['teacher_sections']);
				unset($data[$key]['teacher_subjects']);
			}
		// end optimize data --------------

		return response()->json([
			'availabilities' => $data,
			'main_title' => $main_title,
			'time_slots' => $time_slots,
			'classes' => $all_classes,
			'sections' => $sections,
			'subjects' => $subjects,
			// 'totalItems' => $totalItems
		]);
	}

}
