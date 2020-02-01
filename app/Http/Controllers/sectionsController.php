<?php
namespace App\Http\Controllers;

use App\Models2\Section;

class sectionsController extends Controller {

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
		if(!$this->panelInit->can( array("sections.list","sections.addSection","sections.editSection","sections.delSection") )){
			exit;
		}

		$toReturn = array();

		$classesIn = array();
		$classes = \classes::orderBy('className', 'desc')
			->where('classAcademicYear',$this->panelInit->selectAcYear)
			->get();
		foreach ($classes as $value) {
			$toReturn['classes'][$value->id] = $value->className;
			$classesIn[] = $value->id;
		}

		$toReturn['sections'] = array();
		if(count($classesIn) > 0){
			$sections = \DB::table('sections')
						->orderBy('id', 'asc')
						->select('sections.id as id',
						'sections.sectionName as sectionName',
						'sections.classId as classId',
						'sections.classTeacherId as classTeacherId')
						->whereIn('sections.classId',$classesIn)
						->get();

			foreach ($sections as $key => $section) {
				$sections[$key]->classTeacherId = json_decode($sections[$key]->classTeacherId,true);
				if(isset($toReturn['classes'][$section->classId])){
					$toReturn['sections'][$toReturn['classes'][$section->classId]][] = $section;
				}
			}
		}

		$toReturn['teachers'] = array();
		$teachers = \User::where('role','teacher')->select('id', 'fullName')->get();
		foreach ($teachers as $value) {
			$toReturn['teachers'][$value->id] = $value->fullName;
		}

		$toReturn['classTeachers'] = $teachers;

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "sections.delSection" )){
			exit;
		}

		if ( $postDelete = \sections::where('id', $id)->first() ){
    		user_log('Sections', 'delete', $postDelete->sectionName);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delSection'],$this->panelInit->language['sectionDeleted'] );
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delSection'],$this->panelInit->language['sectionNotExist'] );
    }
	}

	public function create(){

		if(!$this->panelInit->can( "sections.addSection" )){
			exit;
		}

		$sections = new \sections();
		$sections->sectionName = \Input::get('sectionName');
		$sections->classId = \Input::get('classId');
		$sections->classTeacherId = json_encode(\Input::get('classTeacherId'));
		$sections->save();

		user_log('Sections', 'create', $sections->sectionName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addSection'],$this->panelInit->language['sectionAdded']);
	}

	function fetch($id){

		if(!$this->panelInit->can( "sections.editSection" )){
			exit;
		}

		$sections = \sections::where('id',$id)->first()->toArray();
		$sections['classTeacherId'] = json_decode($sections['classTeacherId'],true);
		return $sections;
	}

	function edit($id){

		if(!$this->panelInit->can( "sections.editSection" )){
			exit;
		}

		$sections = \sections::find($id);
		$sections->sectionName = \Input::get('sectionName');
		$sections->classId = \Input::get('classId');
		$sections->classTeacherId = json_encode(\Input::get('classTeacherId'));
		$sections->save();

		user_log('Sections', 'edit', $sections->sectionName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editSection'],$this->panelInit->language['sectionUpdated']);
	}

	public function get_sections_with_class_id($class_id) {
		$sections = Section::where('classId', $class_id)->get()->toArray();

		return response()->json([
			'sections' => $sections
		]);
	}
}
