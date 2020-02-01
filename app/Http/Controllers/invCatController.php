<?php
namespace App\Http\Controllers;

class invCatController extends Controller {
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

		if(!$this->panelInit->can( array("inv_cat.list","inv_cat.add_cat","inv_cat.edit_cat","inv_cat.del_cat") )){
			exit;
		}

		$toReturn = array();

		$toReturn["inv_cat"] = \inv_cat::select('id','cat_title','cat_desc')->orderby('id','DESC')->get()->toArray();
		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "inv_cat.add_cat" )){
			exit;
		}

		$inv_cat = new \inv_cat();
		if(\Input::has('id')){
			$inv_cat->id = \Input::get('id');
		}
		$inv_cat->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$inv_cat->cat_desc = \Input::get('cat_desc');
		}
		$inv_cat->save();

		user_log('Invoice categories', 'create', $inv_cat->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_cat'],$this->panelInit->language['call_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "inv_cat.edit_cat" )){
			exit;
		}

		$inv_cat = \inv_cat::select('id','cat_title','cat_desc')->where('id',$id)->first()->toArray();

		return $inv_cat;
	}

	public function edit($id){

		if(!$this->panelInit->can( "inv_cat.edit_cat" )){
			exit;
		}

		$inv_cat = \inv_cat::find($id);
		if(\Input::has('id')){
			$inv_cat->id = \Input::get('id');
		}
		$inv_cat->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$inv_cat->cat_desc = \Input::get('cat_desc');
		}
		$inv_cat->save();

		user_log('Invoice categories', 'edit', $inv_cat->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_cat'],$this->panelInit->language['cat_modified']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "inv_cat.del_cat" )){
			exit;
		}

		if ( $postDelete = \inv_cat::where('id', $id)->first() ){
			user_log('Invoice categories', 'delete', $postDelete->cat_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cat'],$this->panelInit->language['cat_deleted']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cat'],$this->panelInit->language['cat_not_exist']);
  	}
	}


}