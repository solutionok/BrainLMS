<?php
namespace App\Http\Controllers;

use App\Models2\ClassSchedule;
use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\Subject;
use App\Models2\SubjectVideo;
use App\Models2\User;

class SubjectsController extends Controller {

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

	public function listAll() {
		if(!$this->panelInit->can( array("Subjects.list","Subjects.addSubject","Subjects.editSubject","Subjects.delSubject") )){
			exit;
		}

		$toReturn = array();
		$query = \DB::table('subject');

		$query->where('subjectTitle', '!=', 'Break');

		// get current subjects
		if($this->data['users']->role == "parent"){
			$students_ids = User::getStudentsIdsFromParentId($this->data['users']->id);
			$classes_ids = Main::getClassesIdsOfStudentsIds($students_ids);
			$subjects_ids = Main::getSubjectsIdsByClassesIds($classes_ids);
			$query = $query->whereIn('subject.id', $subjects_ids);
		} else if ($this->data['users']->role == "teacher") {
			$classes_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
			$subjects_ids = Main::getSubjectsIdsByClassesIds($classes_ids);
			$query = $query->whereIn('subject.id', $subjects_ids);
		}

		$toReturn['subjects'] = $query->get();

		// get current teachers
		if($this->data['users']->role == "parent"){
			$teachers_ids = ClassSchedule::whereIn('subjectId', $subjects_ids)->pluck('teacherId');
			$teachers = \User::whereIn('id', $teachers_ids)->select('id','fullName')->get()->toArray();
			$toReturn['class_schedule'] = ClassSchedule::whereIn('subjectId', $subjects_ids)
				->select('subjectId', 'teacherId')
				->groupBy('teacherId')
			  ->get()->toArray();
		} else {
			$teachers = \User::where('role','teacher')->select('id','fullName')->get()->toArray();
		}

		foreach ($teachers as $value) {
			$toReturn['teachers'][$value['id']] = $value;
		}

		foreach ($toReturn['subjects'] as $key => $subject) {
			$toReturn['subjects'][$key]->teacherId = Main::getTeacherIdsBySubjectId($subject->id);
		}

		return $toReturn;
	}

	public function delete($id){
		if(!$this->panelInit->can( "Subjects.delSubject" )){
			exit;
		}

		if ( $postDelete = \subject::where('id', $id)->first() ) {
    		user_log('Subjects', 'delete', $postDelete->subjectTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delSubject'],$this->panelInit->language['subjectDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delSubject'],$this->panelInit->language['subjectNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Subjects.addSubject" )){
			exit;
		}

		$subject = new \subject();
		$subject->subjectTitle = \Input::get('subjectTitle');
		if(\Input::get('teacherId')) {
			$subject->teacherId = json_encode(\Input::get('teacherId'));
		}
		$subject->passGrade = \Input::get('passGrade');
		$subject->finalGrade = \Input::get('finalGrade');
		$subject->save();

		user_log('Subjects', 'create', $subject->subjectTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addSubject'],$this->panelInit->language['subjectCreated'],$subject->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Subjects.editSubject" )){
			exit;
		}

		$subject = \subject::where('id',$id)->first()->toArray();
		$subject['teacherId'] = Main::getTeacherIdsBySubjectId($id);
		return $subject;
	}

	function edit($id){

		if(!$this->panelInit->can( "Subjects.editSubject" )){
			exit;
		}

		$subject = \subject::find($id);
		$subject->subjectTitle = \Input::get('subjectTitle');
		if(\Input::get('teacherId')) {
			$subject->teacherId = json_encode(\Input::get('teacherId'));
		}
		$subject->passGrade = \Input::get('passGrade');
		$subject->finalGrade = \Input::get('finalGrade');
		$subject->save();

		user_log('Subjects', 'edit', $subject->subjectTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editSubject'],$this->panelInit->language['subjectEdited'],$subject->toArray() );
	}

	public function listSubjectVideoSubjects() {
		$video_subject_ids = SubjectVideo::groupBy('subject_id')->pluck('subject_id')->toArray();
		$db_subjects = Subject::get()->toArray();
		$init_list_subjects = [];

		// get subject ids by parent or teacher ids
		$subject_ids = [];
		if($this->data['users']->role == "teacher") {
			$subject_ids = ClassSchedule::where('teacherId', $this->data['users']->id)->pluck('subjectId')->toArray();
		} else if($this->data['users']->role == "parent") {
			$students_ids = User::getStudentsIdsFromParentId($this->data['users']->id);
			$student_section_ids = User::whereIn('id', $students_ids)->pluck('studentSection')->toArray();
			$subject_ids = ClassSchedule::whereIn('sectionId', $student_section_ids)->distinct()->pluck('subjectId')->toArray();
		}
		$user_subject_ids = array_unique($subject_ids);

		foreach ($video_subject_ids as $id) {
			if(in_array($id, $user_subject_ids)) {
				$subject_key = array_search($id, array_column($db_subjects, 'id'));
				if(!is_null($subject_key)) {
					$init_list_subjects[] = $db_subjects[$subject_key];
				}
			}
		}

		return response()->json([
			'init_list_subjects' => $init_list_subjects
		]);
	}

	public function listSubjectVideos() {
		$is_english = request()->input('is_english');
		$subject_id = request()->input('subject_id');

		// get current class id from parent or teacher ids
		if($this->data['users']->role == "teacher") {
			$class_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
		} else if($this->data['users']->role == "parent") {
			$class_ids = Main::getClassesIdsByParentId($this->data['users']->id);
		}

		$data = SubjectVideo::where([
			'subject_id' => $subject_id,
			'is_english' => $is_english,
		]);

		// for testing purposes on local machine
		if(get_server_info()['server_type'] != 'local') {
			$data = $data->whereIn('class_id', $class_ids);
		}

		$data = $data->get();

		$sub_category1 = [];
		$sub_category2 = [];
		$video_titles = [];
		foreach ($data as $item) {
			if(!in_array($item['sub_category1'], $sub_category1)) {
				$sub_category1[] = $item['sub_category1'];
			}
			if(array_search($item['sub_category2'], array_column($sub_category2, 'item')) == '') {
				$sub_category2[] = [
					'sub_category1' => $item['sub_category1'],
					'item' => $item['sub_category2']
				];
			}
			if(array_search($item['title'], array_column($video_titles, 'item')) == '') {
				$video_titles[] = [
					'sub_category2' => $item['sub_category2'],
					'item' => $item['title'],
					'video_link' => $item['link']
				];
			}
		}

		sort($sub_category1);
		sort($sub_category2);
		sort($video_titles);

		return response()->json([
			'sub_category1' => $sub_category1,
			'sub_category2' => $sub_category2,
			'video_titles' => $video_titles
		]);
	}

}
