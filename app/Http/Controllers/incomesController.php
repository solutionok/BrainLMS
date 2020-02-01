<?php
namespace App\Http\Controllers;

class incomesController extends Controller {

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

		if(!$this->panelInit->can( array("Incomes.list","Incomes.addIncome","Incomes.editIncome","Incomes.delIncome") )){
			exit;
		}

		$toReturn = array();

		$toReturn['incomes'] = new \income();

		$toReturn['totalItems'] = $toReturn['incomes']->count();
		$toReturn['incomes'] = $toReturn['incomes']->orderBy('id','DESC')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		$toReturn['totalIncome'] = 0;
		foreach($toReturn['incomes'] as $key => $value){
			$toReturn['incomes'][$key]['incomeDate'] = $this->panelInit->unix_to_date($toReturn['incomes'][$key]['incomeDate']);
			$toReturn['totalIncome'] += $value['incomeAmount'];
		}

		$income_cat = \income_cat::select('id','cat_title')->get()->toArray();
		foreach($income_cat as $key => $value){
			$toReturn['income_cat'][$value['id']] = $value['cat_title'];
		}

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "Incomes.delIncome" )){
			exit;
		}

		if ( $postDelete = \income::where('id', $id)->first() ){
    		user_log('Incomes', 'delete', $postDelete->incomeTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delIncome'],$this->panelInit->language['incDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delIncome'],$this->panelInit->language['incNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Incomes.addIncome" )){
			exit;
		}

		$income = new \income();
		$income->incomeDate = $this->panelInit->date_to_unix(\Input::get('incomeDate'));
		$income->incomeTitle = \Input::get('incomeTitle');
		$income->incomeAmount = \Input::get('incomeAmount');
		$income->incomeCategory = \Input::get('incomeCategory');
		if(\Input::has('incomeNotes')){
			$income->incomeNotes = \Input::get('incomeNotes');
		}
		$income->save();

		user_log('Incomes', 'create', $income->incomeTitle);

		if (\Input::hasFile('incomeImage')) {
			$fileInstance = \Input::file('incomeImage');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addIncome'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/income/',$newFileName);

			$income->incomeImage = $newFileName;
			$income->save();
		}

		$income->incomeDate = \Input::get('incomeDate');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addIncome'],$this->panelInit->language['incAdded'],$income->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Incomes.editIncome" )){
			exit;
		}

		$income = \income::where('id',$id)->first();
		$income->incomeDate = $this->panelInit->unix_to_date($income->incomeDate);

		return $income;
	}

	public function download($id){
		$toReturn = \income::where('id',$id)->first();
		if(file_exists(uploads_config()['uploads_file_path'] . '/income/'.$toReturn->incomeImage)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','-',$toReturn->incomeTitle). "." .pathinfo($toReturn->incomeImage, PATHINFO_EXTENSION);
			user_log('Incomes', 'download', $toReturn->incomeTitle);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/income/'.$toReturn->incomeImage);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	function edit($id){

		if(!$this->panelInit->can( "Incomes.editIncome" )){
			exit;
		}

		$income = \income::find($id);
		$income->incomeDate = $this->panelInit->date_to_unix(\Input::get('incomeDate'));
		$income->incomeTitle = \Input::get('incomeTitle');
		$income->incomeAmount = \Input::get('incomeAmount');
		$income->incomeCategory = \Input::get('incomeCategory');
		if(\Input::has('incomeNotes')){
			$income->incomeNotes = \Input::get('incomeNotes');
		}

		if (\Input::hasFile('incomeImage')) {
			$fileInstance = \Input::file('incomeImage');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editIncome'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/income/',$newFileName);

			$income->incomeImage = $newFileName;
			$income->save();
		}

		$income->save();

		user_log('Incomes', 'edit', $income->incomeTitle);

		$income->incomeDate = \Input::get('incomeDate');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editIncome'],$this->panelInit->language['incModified'],$income->toArray() );
	}
}
