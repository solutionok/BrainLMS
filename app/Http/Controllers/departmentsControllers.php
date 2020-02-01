<?php
namespace App\Http\Controllers;

class departmentsControllers extends Controller {
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
	}

	public function listAll($page = 1,$search = ""){

		if(!$this->panelInit->can( array("depart.list","depart.add_depart","depart.edit_depart","depart.del_depart") )){
			exit;
		}

		$toReturn = array();

		$toReturn["departments"] = \departments::select('id','depart_title','depart_desc')->orderby('id','DESC')->get()->toArray();
		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "depart.add_depart" )){
			exit;
		}

		$departments = new \departments();
		$departments->depart_title = \Input::get('depart_title');
		if(\Input::has('depart_desc')){
			$departments->depart_desc = \Input::get('depart_desc');
		}
		$departments->save();

		user_log('Departments', 'create', $departments->depart_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_depart'],$this->panelInit->language['depart_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "depart.edit_depart" )){
			exit;
		}

		$departments = \departments::select('id','depart_title','depart_desc')->where('id',$id)->first()->toArray();

		return $departments;
	}

	public function edit($id){

		if(!$this->panelInit->can( "depart.edit_depart" )){
			exit;
		}

		$departments = \departments::find($id);
		$departments->depart_title = \Input::get('depart_title');
		if(\Input::has('depart_desc')){
			$departments->depart_desc = \Input::get('depart_desc');
		}
		$departments->save();

		user_log('Departments', 'edit', $departments->depart_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_depart'],$this->panelInit->language['depart_edit']);
	}

	public function delete($id){
		if(!$this->panelInit->can( "depart.del_depart" )){
			exit;
		}

		if ( $postDelete = \departments::where('id', $id)->first() ){
			user_log('Departments', 'delete', $postDelete->depart_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_depart'],$this->panelInit->language['depart_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_depart'],$this->panelInit->language['depart_not_exist']);
  	}
	}

	public function fetchAll()
	{
		$data = \departments::select('id','depart_title')->get()->toArray();

		return json_encode([
			"jsData" => $data,
			"jsStatus" => "1"
		]);
	}
}