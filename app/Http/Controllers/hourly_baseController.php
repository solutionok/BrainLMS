<?php
namespace App\Http\Controllers;

class hourly_baseController extends Controller {

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

		if(!$this->panelInit->can( array('Payroll.hourSalary') )){
			exit;
		}
	}

	public function listAll()
	{
		return \payroll_hourly_base::get();
	}

	public function delete($id){
		if ( $postDelete = \payroll_hourly_base::where('id', $id)->first() ) {
    		user_log('Payroll hourly base', 'delete', $postDelete->salary_title);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delBase'],$this->panelInit->language['salaryBaseDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delBase'],$this->panelInit->language['salaryBaseNotExist']);
    }
	}

	public function create(){
		$payroll_hourly_base = new \payroll_hourly_base();
		$payroll_hourly_base->salary_title = \Input::get('salary_title');
		$payroll_hourly_base->hourly_cost = \Input::get('hourly_cost');
		$payroll_hourly_base->save();

		user_log('Payroll hourly base', 'create', $payroll_hourly_base->salary_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addSalaryBase'],$this->panelInit->language['slryBsCreated'],$payroll_hourly_base->toArray() );
	}

	function fetch($id){
		return \payroll_hourly_base::where('id',$id)->first();
	}

	function edit($id){
		$payroll_hourly_base = \payroll_hourly_base::find($id);
		$payroll_hourly_base->salary_title = \Input::get('salary_title');
		$payroll_hourly_base->hourly_cost = \Input::get('hourly_cost');
		$payroll_hourly_base->save();

		user_log('Payroll hourly base', 'edit', $payroll_hourly_base->salary_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editSalaryBase'],$this->panelInit->language['slryBsMod'],$payroll_hourly_base->toArray() );
	}
}
