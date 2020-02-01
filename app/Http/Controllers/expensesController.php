<?php
namespace App\Http\Controllers;

class expensesController extends Controller {

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

	public function listAll($page = 1)
	{

		if(!$this->panelInit->can( array("Expenses.list","Expenses.addExpense","Expenses.editExpense","Expenses.delExpense") )){
			exit;
		}

		$toReturn = array();

		$toReturn['expenses'] = new \expenses();

		$toReturn['totalItems'] = $toReturn['expenses']->count();
		$toReturn['expenses'] = $toReturn['expenses']->orderBy('id','DESC')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		$toReturn['totalExpenses'] = 0;
		foreach($toReturn['expenses'] as $key => $value){
			$toReturn['expenses'][$key]['expenseDate'] = $this->panelInit->unix_to_date($toReturn['expenses'][$key]['expenseDate']);
			$toReturn['totalExpenses'] += $value['expenseAmount'];
		}

		$expenses_cat = \expenses_cat::select('id','cat_title')->get()->toArray();
		foreach($expenses_cat as $key => $value){
			$toReturn['expenses_cat'][$value['id']] = $value['cat_title'];
		}

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "Expenses.delExpense" )){
			exit;
		}

		if ( $postDelete = \expenses::where('id', $id)->first() ) {
    		user_log('Expenses', 'delete', $postDelete->expenseTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delExpense'],$this->panelInit->language['expenseDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delExpense'],$this->panelInit->language['expenseNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Expenses.addExpense" )){
			exit;
		}

		$expenses = new \expenses();
		$expenses->expenseDate = $this->panelInit->date_to_unix(\Input::get('expenseDate'));
		$expenses->expenseTitle = \Input::get('expenseTitle');
		$expenses->expenseAmount = \Input::get('expenseAmount');
		$expenses->expenseCategory = \Input::get('expenseCategory');
		if(\Input::has('expenseNotes')){
			$expenses->expenseNotes = \Input::get('expenseNotes');
		}
		$expenses->save();

		user_log('Expenses', 'create', $expenses->expenseTitle);

		if (\Input::hasFile('expenseImage')) {
			$fileInstance = \Input::file('expenseImage');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addExpense'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/expenses/',$newFileName);

			$expenses->expenseImage = $newFileName;
			$expenses->save();
		}

		$expenses->expenseDate = \Input::get('expenseDate');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addExpense'],$this->panelInit->language['expenseAdded'],$expenses->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Expenses.editExpense" )){
			exit;
		}

		$expenses = \expenses::where('id',$id)->first();
		$expenses->expenseDate = $this->panelInit->unix_to_date($expenses->expenseDate);

		return $expenses;
	}

	public function download($id){
		$toReturn = \expenses::where('id',$id)->first();
		if(file_exists(uploads_config()['uploads_file_path'] . '/expenses/'.$toReturn->expenseImage)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','-',$toReturn->expenseTitle). "." .pathinfo($toReturn->expenseImage, PATHINFO_EXTENSION);
			user_log('Expenses', 'download', $toReturn->expenseTitle);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/expenses/'.$toReturn->expenseImage);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	function edit($id){

		if(!$this->panelInit->can( "Expenses.editExpense" )){
			exit;
		}

		$expenses = \expenses::find($id);
		$expenses->expenseDate = $this->panelInit->date_to_unix(\Input::get('expenseDate'));
		$expenses->expenseTitle = \Input::get('expenseTitle');
		$expenses->expenseAmount = \Input::get('expenseAmount');
		$expenses->expenseCategory = \Input::get('expenseCategory');
		if(\Input::has('expenseNotes')){
			$expenses->expenseNotes = \Input::get('expenseNotes');
		}

		if (\Input::hasFile('expenseImage')) {
			$fileInstance = \Input::file('expenseImage');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editExpense'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/expenses/',$newFileName);

			$expenses->expenseImage = $newFileName;
			$expenses->save();
		}

		$expenses->save();

		user_log('Expenses', 'edit', $expenses->expenseTitle);

		$expenses->expenseDate = \Input::get('expenseDate');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editExpense'],$this->panelInit->language['expenseUpdated'],$expenses->toArray() );
	}
}
