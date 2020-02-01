<?php
namespace App\Http\Controllers;

class users_salaryController extends Controller {

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

		if(!$this->panelInit->can( array('Payroll.userSalary') )){
			exit;
		}
	}

	public function search_user(){
		$retArray = array();
		$retArray['employees'] = array();

		$retArray['hourly_base'] = array();
		$payroll_hourly_base = \payroll_hourly_base::get();
		foreach ($payroll_hourly_base as $key => $value) {
			$retArray['hourly_base'][$value->id] = $value->salary_title;
		}

		$retArray['salary_base'] = array();
		$payroll_hourly_base = \payroll_salary_base::get();
		foreach ($payroll_hourly_base as $key => $value) {
			$retArray['salary_base'][$value->id] = $value->salary_title;
		}

		$user = \Input::get('user');
		$employees = \User::where('role','!=','student')->where('role','!=','parent')->where(function($query) use ($user){
														$query->where('fullName','like','%'.$user.'%')->orWhere('username','like','%'.$user.'%')->orWhere('email','like','%'.$user.'%');
													})->get();
		foreach ($employees as $employee) {
			$salary_type = "";
			$salary_base = "";
			if($employee->salary_type == "monthly"){
				$salary_type = "monthly";
				if(isset($retArray['salary_base'][ $employee->salary_base_id ])){
					$salary_base = $retArray['salary_base'][ $employee->salary_base_id ];
				}
			}
			if($employee->salary_type == "hourly"){
				$salary_type = "hourly";
				if(isset($retArray['hourly_base'][ $employee->salary_base_id ])){
					$salary_base = $retArray['hourly_base'][ $employee->salary_base_id ];
				}
			}
			$retArray['employees'][] = array("id"=>$employee->id,"name"=>$employee->fullName,"email"=>$employee->email,"salary_base_id"=>$employee->salary_base_id,"salary_type"=>$salary_type,"salary_base"=>$salary_base);
		}
		return $retArray;
	}

	function edit($id){
		$user = \User::find(\Input::get('id'));
		$user->salary_type = \Input::get('salary_type');
		$user->salary_base_id = \Input::get('salary_base_id');
		$user->save();

		user_log('Users', 'update_salary', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editUsrSalary'],$this->panelInit->language['usrSalaryModf'] );
	}
}
