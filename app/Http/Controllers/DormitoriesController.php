<?php
namespace App\Http\Controllers;

class DormitoriesController extends Controller {

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

		if(!$this->panelInit->can( array("Dormitories.list","Dormitories.addDormitories","Dormitories.editDorm","Dormitories.delDorm") )){
			exit;
		}

		return \dormitories::get();
	}

	public function delete($id){
		if(!$this->panelInit->can( "Dormitories.delDorm" )){
			exit;
		}

		if ( $postDelete = \dormitories::where('id', $id)->first() ) {
			user_log('Dormitories', 'delete', $postDelete->dormitory);
      $postDelete->delete();
      return $this->panelInit->apiOutput(true,$this->panelInit->language['delDorm'],$this->panelInit->language['dormDeleted']);
    }else{
      return $this->panelInit->apiOutput(false,$this->panelInit->language['delDorm'],$this->panelInit->language['dormNotExist']);
    }
	}

	public function create(){
		if(!$this->panelInit->can( "Dormitories.addDormitories" )){
			exit;
		}

		$dormitories = new \dormitories();
		$dormitories->dormitory = \Input::get('dormitory');
		$dormitories->dormDesc = \Input::get('dormDesc');
		$dormitories->save();

		user_log('Dormitories', 'create', $dormitories->dormitory);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addDormitories'],$this->panelInit->language['dormCreated'],$dormitories->toArray() );
	}

	function fetch($id){
		if(!$this->panelInit->can( "Dormitories.editDorm" )){
			exit;
		}

		return \dormitories::where('id',$id)->first();
	}

	function edit($id){
		if(!$this->panelInit->can( "Dormitories.editDorm" )){
			exit;
		}

		$dormitories = \dormitories::find($id);
		$dormitories->dormitory = \Input::get('dormitory');
		$dormitories->dormDesc = \Input::get('dormDesc');
		$dormitories->save();

		user_log('Dormitories', 'edit', $dormitories->dormitory);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editDorm'],$this->panelInit->language['dormUpdated'],$dormitories->toArray() );
	}
}
