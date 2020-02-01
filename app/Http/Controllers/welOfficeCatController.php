<?php
namespace App\Http\Controllers;

class welOfficeCatController extends Controller {
	var $data = array();
	var $panelInit;

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

	public function listAll($page = 1){

		if(!$this->panelInit->can( array("wel_office_cat.list","wel_office_cat.add_cat","wel_office_cat.edit_cat","wel_office_cat.del_cat") )){
			exit;
		}

		$toReturn = array();

		$toReturn["wel_office"] = \wel_office::select('id','cat_title','cat_desc','av_for')->orderby('id','DESC')->get()->toArray();

		foreach ($toReturn["wel_office"] as $key => $value) {
			$toReturn["wel_office"][$key]["av_for"] = json_decode($toReturn["wel_office"][$key]["av_for"]);
		}

		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "wel_office_cat.add_cat" )){
			exit;
		}

		$wel_office = new \wel_office();
		if(\Input::has('id')){
			$wel_office->id = \Input::get('id');
		}
		$wel_office->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$wel_office->cat_desc = \Input::get('cat_desc');
		}
		$wel_office->av_for = json_encode(\Input::get('av_for'));
		$wel_office->save();
		user_log('Wel office', 'create', $wel_office->cat_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_cat'],$this->panelInit->language['cat_added']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "wel_office_cat.edit_cat" )){
			exit;
		}

		$wel_office = \wel_office::select('id','cat_title','cat_desc','av_for')->where('id',$id)->first()->toArray();
		$wel_office['av_for'] = json_decode($wel_office['av_for'],true);

		return $wel_office;
	}

	public function edit($id){

		if(!$this->panelInit->can( "wel_office_cat.edit_cat" )){
			exit;
		}

		$wel_office = \wel_office::find($id);
		if(\Input::has('id')){
			$wel_office->id = \Input::get('id');
		}
		$wel_office->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$wel_office->cat_desc = \Input::get('cat_desc');
		}
		$wel_office->av_for = json_encode(\Input::get('av_for'));
		$wel_office->save();
		user_log('Wel office', 'edit', $wel_office->cat_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_cat'],$this->panelInit->language['cat_modified']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "wel_office_cat.del_cat" )){
			exit;
		}

		if ( $postDelete = \wel_office::where('id', $id)->first() ){
			user_log('Wel office', 'delete', $postDelete->cat_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cat'],$this->panelInit->language['cat_deleted']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cat'],$this->panelInit->language['cat_not_exist']);
  	}
	}
}