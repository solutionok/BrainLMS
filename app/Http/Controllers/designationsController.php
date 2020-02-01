<?php
namespace App\Http\Controllers;

class designationsController extends Controller {
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

		if(!$this->panelInit->can( array("desig.list","desig.add_desig","desig.edit_desig","desig.del_desig") )){
			exit;
		}

		$toReturn = array();

		$toReturn["designations"] = \designations::select('id','desig_title','desig_desc')->orderby('id','DESC')->get()->toArray();
		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "desig.add_desig" )){
			exit;
		}

		$designations = new \designations();
		$designations->id = \Input::get('id');
		$designations->desig_title = \Input::get('desig_title');
		if(\Input::has('desig_desc')){
			$designations->desig_desc = \Input::get('desig_desc');
		}
		$designations->save();

		user_log('Designations', 'create', $designations->desig_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_desig'],$this->panelInit->language['desig_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "desig.edit_desig" )){
			exit;
		}

		$designations = \designations::select('id','desig_title','desig_desc')->where('id',$id)->first()->toArray();

		return $designations;
	}

	public function edit($id){

		if(!$this->panelInit->can( "desig.edit_desig" )){
			exit;
		}

		$designations = \designations::find($id);
		$designations->id = \Input::get('id');
		$designations->desig_title = \Input::get('desig_title');
		if(\Input::has('desig_desc')){
			$designations->desig_desc = \Input::get('desig_desc');
		}
		$designations->save();

		user_log('Designations', 'edit', $designations->desig_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_desig'],$this->panelInit->language['desig_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "desig.del_desig" )){
			exit;
		}

		if ( $postDelete = \designations::where('id', $id)->first() ){
			user_log('Designations', 'delete', $postDelete->desig_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_desig'],$this->panelInit->language['desig_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_desig'],$this->panelInit->language['desig_not_exist']);
  	}
	}
}