<?php
namespace App\Http\Controllers;

class incomesCatController extends Controller {

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

		if(!$this->panelInit->can( "Incomes.incomeCategory" )){
			exit;
		}
	}

	public function listAll()
	{
		return \income_cat::get();
	}

	public function delete($id){
		if ( $postDelete = \income_cat::where('id', $id)->first() ) {
    		user_log('Incomes categories', 'delete', $postDelete->cat_title);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delIncCat'],$this->panelInit->language['incCatDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delIncCat'],$this->panelInit->language['incCatNotexist']);
    }
	}

	public function create(){
		$income_cat = new \income_cat();
		$income_cat->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$income_cat->cat_desc = \Input::get('cat_desc');
		}
		$income_cat->save();

		user_log('Incomes categories', 'create', $income_cat->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addIncCat'],$this->panelInit->language['CategoryAdded'],$income_cat->toArray() );
	}

	function fetch($id){
		return \income_cat::where('id',$id)->first();
	}

	function edit($id){
		$income_cat = \income_cat::find($id);
		$income_cat->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$income_cat->cat_desc = \Input::get('cat_desc');
		}
		$income_cat->save();

		user_log('Incomes categories', 'edit', $income_cat->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editIncCat'],$this->panelInit->language['CategoryUpdated'],$income_cat->toArray() );
	}
}
