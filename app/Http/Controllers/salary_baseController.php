<?php
namespace App\Http\Controllers;

class salary_baseController extends Controller {

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

		if(!$this->panelInit->can( array('Payroll.salaryBase') )){
			exit;
		}
	}

	public function listAll()
	{
		return \payroll_salary_base::get();
	}

	public function delete($id){
		if ( $postDelete = \payroll_salary_base::where('id', $id)->first() ) {
    		user_log('Payroll salary base', 'delete', $postDelete->salary_title);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delBase'],$this->panelInit->language['salaryBaseDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delBase'],$this->panelInit->language['salaryBaseNotExist']);
    }
	}

	public function create(){
		$payroll_salary_base = new \payroll_salary_base();
		$payroll_salary_base->salary_title = \Input::get('salary_title');
		$payroll_salary_base->salary_basic = \Input::get('salary_basic');
		$payroll_salary_base->hour_overtime = \Input::get('hour_overtime');
		if(is_array(\Input::get('salary_allowence'))){
			$payroll_salary_base->salary_allowence = json_encode(\Input::get('salary_allowence'));
		}
		if(is_array(\Input::get('salary_deduction'))){
			$payroll_salary_base->salary_deduction = json_encode(\Input::get('salary_deduction'));
		}

		//Calculations
		$gross_salary = $payroll_salary_base->salary_basic;
		if(is_array(\Input::get('salary_allowence'))){
			$salary_allowence = \Input::get('salary_allowence');
			foreach ($salary_allowence as $key => $value) {
				$gross_salary += $value['amount'];
			}
		}
		$net_salary = $gross_salary;
		if(is_array(\Input::get('salary_deduction'))){
			$salary_deduction = \Input::get('salary_deduction');
			foreach ($salary_deduction as $key => $value) {
				$net_salary -= $value['amount'];
			}
		}

		$payroll_salary_base->net_salary = $net_salary;
		$payroll_salary_base->gross_salary = $gross_salary;
		$payroll_salary_base->save();

		user_log('Payroll salary base', 'create', $payroll_salary_base->salary_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addSalaryBase'],$this->panelInit->language['slryBsCreated'],$payroll_salary_base->toArray() );
	}

	function fetch($id){
		$payroll_salary_base = \payroll_salary_base::where('id',$id)->first()->toArray();
		$payroll_salary_base['salary_allowence'] = json_decode($payroll_salary_base['salary_allowence'],true);
		$payroll_salary_base['salary_deduction'] = json_decode($payroll_salary_base['salary_deduction'],true);

		return $payroll_salary_base;
	}

	function edit($id){
		$payroll_salary_base = \payroll_salary_base::find($id);
		$payroll_salary_base->salary_title = \Input::get('salary_title');
		$payroll_salary_base->salary_basic = \Input::get('salary_basic');
		$payroll_salary_base->hour_overtime = \Input::get('hour_overtime');
		if(is_array(\Input::get('salary_allowence'))){
			$payroll_salary_base->salary_allowence = json_encode(\Input::get('salary_allowence'));
		}
		if(is_array(\Input::get('salary_deduction'))){
			$payroll_salary_base->salary_deduction = json_encode(\Input::get('salary_deduction'));
		}

		//Calculations
		$gross_salary = $payroll_salary_base->salary_basic;
		if(is_array(\Input::get('salary_allowence'))){
			$salary_allowence = \Input::get('salary_allowence');
			foreach ($salary_allowence as $key => $value) {
				$gross_salary += $value['amount'];
			}
		}
		$net_salary = $gross_salary;
		if(is_array(\Input::get('salary_deduction'))){
			$salary_deduction = \Input::get('salary_deduction');
			foreach ($salary_deduction as $key => $value) {
				$net_salary -= $value['amount'];
			}
		}

		$payroll_salary_base->net_salary = $net_salary;
		$payroll_salary_base->gross_salary = $gross_salary;
		$payroll_salary_base->save();

		user_log('Payroll salary base', 'edit', $payroll_salary_base->salary_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editSalaryBase'],$this->panelInit->language['slryBsMod'],$payroll_salary_base->toArray() );
	}
}
