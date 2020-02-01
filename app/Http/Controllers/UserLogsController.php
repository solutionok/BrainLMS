<?php
namespace App\Http\Controllers;

use App\Models2\User;
use App\Models2\UserLog;

class UserLogsController extends Controller {

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
		$this->data['users'] = $this->panelInit->getAuthUser();
		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}
	}

	public function listAll($page = 1) {
		if(!$this->panelInit->can("Reports.Reports")){
			exit;
		}

		if(env('APP_TYPE') == 'mob') {
			$pagination_number = 10;
		} else if(env('APP_TYPE') == 'web') {
			$pagination_number = 50;
		}

		$query = UserLog::orderBy('date', 'desc');

		if(\Input::has('searchInput')){
			$searchInput = \Input::get('searchInput');
			if(is_array($searchInput)){

				if(isset($searchInput['username']) AND !empty($searchInput['username'])){
					$_user_ids = User::where('username', 'like', '%'. $searchInput['username'] .'%')->pluck('id')->toArray();
					$query = $query->whereIn('user_id', $_user_ids);
				}

				if(isset($searchInput['fromDate']) AND $searchInput['fromDate'] != ""){
					$searchInput['fromDate'] = $this->panelInit->date_to_unix($searchInput['fromDate']);
					$query = $query->where('date','>=',$searchInput['fromDate']);
				}

				if(isset($searchInput['toDate']) AND $searchInput['toDate'] != ""){
					$searchInput['toDate'] = $this->panelInit->date_to_unix($searchInput['toDate']);
					$query = $query->where('date','<=',$searchInput['toDate']);
				}

				if(isset($searchInput['module']) AND !empty($searchInput['module'])){
					if(is_array($searchInput['module'])) {
						$query = $query->whereIn('module_name', $searchInput['module']);
					} else {
						$query = $query->where('module_name', $searchInput['module']);
					}
				}

				if(isset($searchInput['user_role']) AND !empty($searchInput['user_role'])){
					$_user_ids = User::where('role', $searchInput['user_role'])->pluck('id')->toArray();
					$query = $query->whereIn('user_id', $_user_ids);
				}

			}
		}

		$userLogs_count = $query->count();
		$query = $query->take($pagination_number)->skip($pagination_number * ($page - 1));
		$userLogs = $query->get();

		$user_ids = $query->pluck('user_id');
		$assigned_users = User::whereIn('id', $user_ids)->get()->pluck('user_log_info', 'id');

		foreach ($userLogs as $key => $log) {
			$user_info = $assigned_users[$log->user_id];
			$user_info .= '<br>';
			$user_info .= '<b style="font-size: 13px">' . 'IP: ' . $log->user_ip . '</b>';

			$userLogs[$key]['user_info'] = $user_info;
			$userLogs[$key]['current_date'] = date('Y/m/d h:i a', $userLogs[$key]['date']);
			$userLogs[$key]['action'] = str_replace('_', ' ', $userLogs[$key]['action']);
		}

		return response()->json([
			'user_logs' => $userLogs,
			'totalItems' => $userLogs_count
		]);
	}

	function export($type){

		if(!$this->panelInit->can( "Reports.Reports" )){
			exit;
		}

		$toReturn = [];

		user_log('Reports', 'export', 'Export user logs');

		if($type == "excel"){

			$data = array(1 => array ('Log ID','User full name','Role','Module name','Action','Payload','Date'));

			$query = UserLog::select('*')->orderBy('id','DESC');
			$userLogs = $query->get();

			$user_ids = $query->pluck('user_id');
			$assigned_users1 = User::whereIn('id', $user_ids)->get()->pluck('fullName', 'id');
			$assigned_users2 = User::whereIn('id', $user_ids)->get()->pluck('role', 'id');

			foreach ($userLogs as $key => $log) {
				$user_full_name = $assigned_users1[$log->user_id];
				$user_role = $assigned_users2[$log->user_id];

				$data[] = array(
					$log->id,
					$user_full_name,
					$user_role,
					$log->module_name,
					str_replace('_', ' ', $log->action),
					$log->payload,
					date('Y/m/d h:i a', $log->date),
				);
			}

			\Excel::create('User-logs-sheet', function($excel) use($data) {

		    // Set the title
		    $excel->setTitle('User logs sheet');

		    // Chain the setters
		    $excel->setCreator('Cutebrains')->setCompany('Virtu');

				$excel->sheet('userLogs', function($sheet) use($data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($data, null, 'A1', true,false);
				});

			})->download('xls');

		}elseif ($type == "pdf") {
			$return['currency_symbol'] = $this->panelInit->settingsArray['currency_symbol'];

			$header = array ($this->panelInit->language['InvID'],$this->panelInit->language['title'],$this->panelInit->language['student'],$this->panelInit->language['class'],$this->panelInit->language['section'],$this->panelInit->language['Amount'],$this->panelInit->language['discoutedAmount'],$this->panelInit->language['paidAmount'],$this->panelInit->language['Date'],$this->panelInit->language['dueDate'],$this->panelInit->language['Status']);
			$data = array();

			$toReturn['invoices'] = \DB::table('payments')
						->leftJoin('users', 'users.id', '=', 'payments.paymentStudent')
						->select('payments.id as id',
						'payments.paymentTitle as paymentTitle',
						'payments.paymentDescription as paymentDescription',
						'payments.paymentAmount as paymentAmount',
						'payments.paymentDiscount as paymentDiscount',
						'payments.paidAmount as paidAmount',
						'payments.paymentStatus as paymentStatus',
						'payments.paymentDate as paymentDate',
						'payments.dueDate as dueDate',
						'payments.paymentStudent as studentId',
						'users.fullName as fullName',
						'users.studentClass as studentClass',
						'users.studentSection as studentSection');
			$toReturn['totalItems'] = $toReturn['invoices']->count();
			$toReturn['invoices'] = $toReturn['invoices']->orderBy('id','DESC')->limit('100')->get();

			foreach ($toReturn['invoices'] as $key => $value) {
				$value->paymentDate = $this->panelInit->unix_to_date($toReturn['invoices'][$key]->paymentDate);
				$value->dueDate = $this->panelInit->unix_to_date($toReturn['invoices'][$key]->dueDate);
				$value->paymentAmount = $toReturn['invoices'][$key]->paymentAmount + ($this->panelInit->settingsArray['paymentTax']*$toReturn['invoices'][$key]->paymentAmount) /100;
				if($value->paymentStatus == 1){
					$paymentStatus = $this->panelInit->language['paid'];
				}elseif($value->paymentStatus == 2){
					$paymentStatus = $this->panelInit->language['ppaid'];
				}else{
					$paymentStatus = $this->panelInit->language['unpaid'];
				}

				$student_class = "";
				if(isset($classes_list[$value->studentClass])){
					$student_class = $classes_list[$value->studentClass];
				}

				$student_section = "";
				if(isset($sections_list[$value->studentSection])){
					$student_section = $sections_list[$value->studentSection];
				}

				$data[] = array($value->paymentTitle,$value->paymentDescription,$value->fullName,$student_class,$student_section,$return['currency_symbol']." ".$value->paymentAmount,$return['currency_symbol']." ".$value->paymentDiscount,$return['currency_symbol']." ".$value->paidAmount,$value->paymentDate,$value->dueDate,$paymentStatus);
			}

			$doc_details = array(
								"title" => "Payments",
								"author" => $this->data['panelInit']->settingsArray['siteTitle'],
								"topMarginValue" => 10
								);

			if( $this->panelInit->isRTL == "1" ){
				$doc_details['is_rtl'] = true;
			}

			$pdfbuilder = new \PdfBuilder($doc_details);

			$content = "<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\">
		        <thead><tr>";
				foreach ($header as $value) {
					$content .="<th style='width:15%;border: solid 1px #000000; padding:2px;'>".$value."</th>";
				}
			$content .="</tr></thead><tbody>";

			foreach($data as $row)
			{
				$content .= "<tr>";
				foreach($row as $col){
					$content .="<td>".$col."</td>";
				}
				$content .= "</tr>";
			}

	        $content .= "</tbody></table>";

			$pdfbuilder->table($content, array('border' => '0','align'=>'') );
			$pdfbuilder->output('Payments.pdf');

		}
	}

}
