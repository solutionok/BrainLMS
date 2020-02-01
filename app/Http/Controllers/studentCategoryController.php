<?php
namespace App\Http\Controllers;

class studentCategoryController extends Controller {
	var $data = array();
	var $panelInit ;

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

		if(!$this->panelInit->can( array("students.std_cat") )){
			exit;
		}

	}

	public function listAll($page = 1,$search = ""){

		$toReturn = array();

		$toReturn["student_categories"] = \student_categories::select('id','cat_title','cat_desc')->orderby('id','DESC')->get()->toArray();
		return $toReturn;
	}

	public function create(){

		$student_categories = new \student_categories();
		if(\Input::has('id')){
			$student_categories->id = \Input::get('id');
		}
		$student_categories->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$student_categories->cat_desc = \Input::get('cat_desc');
		}
		$student_categories->save();

		user_log('Student categories', 'create', $student_categories->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_cat'],$this->panelInit->language['cat_added']);
	}

	public function fetch($id){

		$student_categories = \student_categories::select('id','cat_title','cat_desc')->where('id',$id)->first()->toArray();

		return $student_categories;
	}

	public function edit($id){

		$student_categories = \student_categories::find($id);
		if(\Input::has('id')){
			$student_categories->id = \Input::get('id');
		}
		$student_categories->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$student_categories->cat_desc = \Input::get('cat_desc');
		}
		$student_categories->save();
		user_log('Student categories', 'edit', $student_categories->cat_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_cat'],$this->panelInit->language['cat_modified']);
	}

	public function delete($id){

		if ( $postDelete = \student_categories::where('id', $id)->first() ){
			user_log('Student categories', 'delete', $postDelete->cat_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cat'],$this->panelInit->language['cat_deleted']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cat'],$this->panelInit->language['cat_not_exist']);
  	}
	}


}