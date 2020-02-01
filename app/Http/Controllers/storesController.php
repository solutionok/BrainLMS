<?php
namespace App\Http\Controllers;

class storesController extends Controller {
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

		if(!$this->panelInit->can( array("stores.list","stores.add_store","stores.edit_store","stores.del_store") )){
			exit;
		}

		$toReturn = array();

		$toReturn["stores"] = \stores::select('id','store_title','store_desc')->orderby('id','DESC')->get()->toArray();
		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "stores.add_store" )){
			exit;
		}

		$stores = new \stores();
		if(\Input::has('id')){
			$stores->id = \Input::get('id');
		}
		$stores->store_title = \Input::get('store_title');
		if(\Input::has('store_desc')){
			$stores->store_desc = \Input::get('store_desc');
		}
		$stores->save();
		user_log('Stores', 'create', $stores->store_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_store'],$this->panelInit->language['store_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "stores.edit_store" )){
			exit;
		}

		$stores = \stores::select('id','store_title','store_desc')->where('id',$id)->first()->toArray();

		return $stores;
	}

	public function edit($id){

		if(!$this->panelInit->can( "stores.edit_store" )){
			exit;
		}

		$stores = \stores::find($id);
		if(\Input::has('id')){
			$stores->id = \Input::get('id');
		}
		$stores->store_title = \Input::get('store_title');
		if(\Input::has('store_desc')){
			$stores->store_desc = \Input::get('store_desc');
		}
		$stores->save();
		user_log('Stores', 'edit', $stores->store_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_store'],$this->panelInit->language['store_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "stores.del_store" )){
			exit;
		}

		if ( $postDelete = \stores::where('id', $id)->first() ){
			user_log('Stores', 'delete', $postDelete->store_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_store'],$this->panelInit->language['store_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_store'],$this->panelInit->language['store_not_exist']);
  	}
	}
}