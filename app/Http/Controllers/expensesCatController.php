<?php
namespace App\Http\Controllers;

class expensesCatController extends Controller {

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

		if(!$this->panelInit->can( "Expenses.expCategory" )){
			exit;
		}
	}

	public function listAll()
	{
		return \expenses_cat::get();
	}

	public function delete($id){
		if ( $postDelete = \expenses_cat::where('id', $id)->first() ){
    		user_log('Expense categories', 'delete', $postDelete->cat_title);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delExpenseCat'],$this->panelInit->language['CategoryDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delExpenseCat'],$this->panelInit->language['CategoryNotExist']);
    }
	}

	public function create(){
		$expenses_cat = new \expenses_cat();
		$expenses_cat->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$expenses_cat->cat_desc = \Input::get('cat_desc');
		}
		$expenses_cat->save();

		user_log('Expense categories', 'create', $expenses_cat->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addExpCat'],$this->panelInit->language['CategoryAdded'],$expenses_cat->toArray() );
	}

	function fetch($id){
		return \expenses_cat::where('id',$id)->first();
	}

	function edit($id){
		$expenses_cat = \expenses_cat::find($id);
		$expenses_cat->cat_title = \Input::get('cat_title');
		if(\Input::has('cat_desc')){
			$expenses_cat->cat_desc = \Input::get('cat_desc');
		}
		$expenses_cat->save();

		user_log('Expense categories', 'edit', $expenses_cat->cat_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editExpCat'],$this->panelInit->language['CategoryUpdated'],$expenses_cat->toArray() );
	}
}
