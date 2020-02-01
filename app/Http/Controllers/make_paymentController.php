<?php
namespace App\Http\Controllers;

class make_paymentController extends Controller {

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

	public function search_user(){

		if(!$this->panelInit->can( array('Payroll.makeUsrPayment') )){
			exit;
		}

		$retArray = array();
		$retArray['employees'] = array();

		$retArray['salary_base'] = array();
		$payroll_hourly_base = \payroll_salary_base::get();
		foreach ($payroll_hourly_base as $key => $value) {
			$retArray['salary_base'][$value->id] = $value->salary_title;
		}

		$retArray['hourly_base'] = array();
		$payroll_hourly_base = \payroll_hourly_base::get();
		foreach ($payroll_hourly_base as $key => $value) {
			$retArray['hourly_base'][$value->id] = $value->salary_title;
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

		$retArray['currency_symbol'] = $this->panelInit->settingsArray['currency_symbol'];
		return $retArray;
	}

	function get_user_details($id,$data_only=false){

		if(!$this->panelInit->can( array('Payroll.makeUsrPayment') )){
			exit;
		}

		$to_return = array();

		//Get User History
		$to_return['history'] = \payroll_history::where('userid',$id)->get()->toArray();
		foreach ($to_return['history'] as $key => $value) {
			$to_return['history'][$key]['pay_date'] = $this->panelInit->unix_to_date($to_return['history'][$key]['pay_date']);
		}

		//Get user information
		$to_return['user'] = \User::where('id',$id)->select('id','username','email','fullName','role','salary_type','salary_base_id')->first()->toArray();
		if($to_return['user']['salary_type'] == "monthly"){
			$to_return['user']['salary_details'] = \payroll_salary_base::where('id',$to_return['user']['salary_base_id']);
			if($to_return['user']['salary_details']->count() > 0){
				$to_return['user']['salary_details'] = $to_return['user']['salary_details']->first()->toArray();
			}
		}
		if($to_return['user']['salary_type'] == "hourly"){
			$to_return['user']['salary_details'] = \payroll_hourly_base::where('id',$to_return['user']['salary_base_id']);
			if($to_return['user']['salary_details']->count() > 0){
				$to_return['user']['salary_details'] = $to_return['user']['salary_details']->first()->toArray();
			}
		}

		if(!isset($to_return['user']['salary_details']) || count($to_return['user']['salary_details']) == 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['makeUsrPayment'],$this->panelInit->language['usrNoSalary']);
		}

		if($data_only == true){
			return $to_return;
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['makeUsrPayment'],$this->panelInit->language['salaryProfExist'],$to_return);
	}

	function make_user_payment_submit($id){

		if(!$this->panelInit->can( array('Payroll.makeUsrPayment') )){
			exit;
		}

		$user = \User::where('id',$id)->select('id','username','email','fullName','role','salary_type','salary_base_id')->first()->toArray();

		$payroll_history = new \payroll_history();
		$payroll_history->userid = $id;
		$payroll_history->pay_by_userid = $this->data['users']->id;
		$payroll_history->salary_type = $user['salary_type'];

		if($user['salary_type'] == "monthly"){

			if(!\Input::has('pay_overtime_count') || \Input::get('pay_overtime_count') == ""){
				$pay_overtime_count = 0;
			}else{
				$pay_overtime_count = \Input::get('pay_overtime_count');
			}

			$salary_details = \payroll_salary_base::where('id',$user['salary_base_id'])->first()->toArray();

			$payroll_history->salary_value = $salary_details['net_salary'] ;
			$payroll_history->hour_overtime = $salary_details['hour_overtime'] ;
			$payroll_history->pay_amount = intval($salary_details['net_salary']) + intval( $salary_details['hour_overtime'] * $pay_overtime_count );
			$payroll_history->hour_count = $pay_overtime_count;

		}else{

			if(!\Input::has('pay_hours') || \Input::get('pay_hours') == ""){
				$pay_hours = 0;
			}else{
				$pay_hours = \Input::get('pay_hours');
			}

			$salary_details = \payroll_hourly_base::where('id',$user['salary_base_id'])->first()->toArray();

			$payroll_history->salary_value = $salary_details['hourly_cost'] ;
			$payroll_history->pay_amount = $salary_details['hourly_cost'] * $pay_hours ;
			$payroll_history->hour_count = $pay_hours;

		}

		$payroll_history->pay_month = \Input::get('pay_month');
		$payroll_history->pay_year = \Input::get('pay_year');
		$payroll_history->pay_date = time();
		$payroll_history->pay_method = \Input::get('pay_method');
		if(\Input::has('pay_comments')){
			$payroll_history->pay_comments = \Input::get('pay_comments');
		}
		$payroll_history->save();

		return $this->panelInit->apiOutput(true,$this->panelInit->language['makeUsrPayment'],$this->panelInit->language['paymentMadeSuccess'], $this->get_user_details($id,true) );
	}

	function make_user_payment_remove($id){

		if(!$this->panelInit->can( array('Payroll.delUsrPayment') )){
			exit;
		}

		if ( $postDelete = \payroll_history::where('id', $id)->first() )
        {
            $postDelete->delete();
            return $this->panelInit->apiOutput(true,$this->panelInit->language['delUsrPayment'],$this->panelInit->language['usrPayDeleted']);
        }else{
            return $this->panelInit->apiOutput(false,$this->panelInit->language['delUsrPayment'],$this->panelInit->language['usrPayNotExist']);
        }
	}
}
