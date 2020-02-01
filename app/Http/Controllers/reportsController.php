<?php
namespace App\Http\Controllers;

use App\Models2\DonationTransaction;
use App\Models2\Main;
use App\Models2\Payment;
use App\Models2\Subject;
use Hashids\Hashids;

class reportsController extends Controller {

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

		if(!$this->panelInit->can( array("Reports.Reports") )){
			exit;
		}
	}

	public function report(){
		if(\Input::get('stats') == 'usersStats' AND $this->data['users']->role == "admin"){
        return $this->usersStats();
    }
    if(\Input::get('stats') == 'stdAttendance' AND $this->data['users']->role == "admin"){
        return $this->stdAttendance(\Input::get('data'));
    }
    if(\Input::get('stats') == 'stfAttendance' AND $this->data['users']->role == "admin"){
        return $this->stfAttendance(\Input::get('data'));
    }
		if(\Input::get('stats') == 'stdVacation' AND $this->data['users']->role == "admin"){
        return $this->stdVacation(\Input::get('data'));
    }
		if(\Input::get('stats') == 'stfVacation' AND $this->data['users']->role == "admin"){
        return $this->stfVacation(\Input::get('data'));
    }
		if(\Input::get('stats') == 'payments' AND ( $this->data['users']->role == "admin" ) ){
        return $this->reports(\Input::get('data'));
    }
    if(\Input::get('stats') == 'expenses' AND ( $this->data['users']->role == "admin" ) ){
        return $this->expenses(\Input::get('data'));
    }
    if(\Input::get('stats') == 'income' AND ( $this->data['users']->role == "admin" ) ){
        return $this->income(\Input::get('data'));
    }
		if(\Input::get('stats') == 'marksheetGenerationPrepare' AND $this->data['users']->role == "admin"){
        return $this->marksheetGenerationPrepare();
    }
    if(\Input::get('stats') == 'biometric_users' AND $this->data['users']->role == "admin"){
        return $this->biometric_users_generate();
    }
    if(\Input::get('stats') == 'payroll' AND $this->data['users']->role == "admin"){
        return $this->payroll_payments(\Input::get('data'));
    }
    if(\Input::get('stats') == 'certPrint' AND $this->data['users']->role == "admin"){
        return $this->certPrint(\Input::get('data'));
    }
	}

  public function usersStats(){
      $toReturn = array();
      $toReturn['admins'] = array();
      $toReturn['admins']['activated'] = \User::where('role','admin')->where('activated','1')->count();
      $toReturn['admins']['inactivated'] = \User::where('role','admin')->where('activated','0')->count();
      $toReturn['admins']['total'] = $toReturn['admins']['activated'] + $toReturn['admins']['inactivated'];

      $toReturn['teachers'] = array();
      $toReturn['teachers']['activated'] = \User::where('role','teacher')->where('activated','1')->count();
      $toReturn['teachers']['inactivated'] = \User::where('role','teacher')->where('activated','0')->count();
      $toReturn['teachers']['total'] = $toReturn['teachers']['activated'] + $toReturn['teachers']['inactivated'];

      $toReturn['students'] = array();
      $toReturn['students']['activated'] = \User::where('role','student')->where('activated','1')->count();
      $toReturn['students']['inactivated'] = \User::where('role','student')->where('activated','0')->count();
      $toReturn['students']['total'] = $toReturn['students']['activated'] + $toReturn['students']['inactivated'];

      $toReturn['parents'] = array();
      $toReturn['parents']['activated'] = \User::where('role','parent')->where('activated','1')->count();
      $toReturn['parents']['inactivated'] = \User::where('role','parent')->where('activated','0')->count();
      $toReturn['parents']['total'] = $toReturn['parents']['activated'] + $toReturn['parents']['inactivated'];

      $toReturn['employee'] = array();
      $toReturn['employee']['activated'] = \User::where('role','employee')->where('activated','1')->count();
      $toReturn['employee']['inactivated'] = \User::where('role','employee')->where('activated','0')->count();
      $toReturn['employee']['total'] = $toReturn['employee']['activated'] + $toReturn['employee']['inactivated'];

      user_log('Reports', 'view_users_stats');

      return $toReturn;
  }

  public function preAttendaceStats(){
      $toReturn = array();
			$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();
			$toReturn['classes'] = array();
			$subjList = array();
			foreach ($classes as $class) {
				$class['classSubjects'] = Main::getSubjectIdsByClassId($class['id']);
				if(is_array($class['classSubjects'])){
					foreach ($class['classSubjects'] as $subject) {
						$subjList[] = $subject;
					}
				}
				$toReturn['classes'][$class->id] = $class->className ;
			}

			$subjList = array_unique($subjList);
			if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject"){
				$toReturn['subjects'] = array();
				if(count($subjList) > 0){
					$subjects = \subject::whereIN('id',$subjList)->get();
					foreach ($subjects as $subject) {
						$toReturn['subjects'][$subject->id] = $subject->subjectTitle ;
					}
				}
			}

			$toReturn['role'] = $this->data['users']->role;
			$toReturn['attendanceModel'] = $this->data['panelInit']->settingsArray['attendanceModel'];

			user_log('Reports', 'pre_attendace_stats');

      return $toReturn;
  }

  public function stdAttendance($data){
			$students = array();
			$studentArray = \User::where('role','student');
			if(isset($data['classId']) AND $data['classId'] != "" ){
				$studentArray = $studentArray->where('studentClass',$data['classId']);
			}
			if(isset($data['sectionId']) AND $data['sectionId'] != "" ){
				$studentArray = $studentArray->where('studentSection',$data['sectionId']);
			}
			if($this->data['panelInit']->settingsArray['studentsSort'] != ""){
				$studentArray = $studentArray->orderByRaw($this->data['panelInit']->settingsArray['studentsSort']);
			}
			$studentArray = $studentArray->get();

			$subjectsArray = \subject::get();
			$subjects = array();
			foreach ($subjectsArray as $subject) {
				$subjects[$subject->id] = $subject->subjectTitle ;
			}

			$sql = "select * from attendance where ";
			$sqlArray = array();
			$toReturn = array();

			if(isset($data['classId']) AND $data['classId'] != "" ){
				$sqlArray[] = "classId='".$data['classId']."'";
			}
			if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject" AND isset($data['subjectId']) AND $data['subjectId'] != ""){
				$sqlArray[] = "subjectId='".$data['subjectId']."'";
			}
			if(isset($data['status']) AND $data['status'] != "All"){
				$sqlArray[] = "status='".$data['status']."'";
			}

			if(isset($data['attendanceDayFrom']) AND $data['attendanceDayFrom'] != "" AND isset($data['attendanceDayTo']) AND $data['attendanceDayTo'] != ""){
				$data['attendanceDayFrom'] = $this->panelInit->date_to_unix($data['attendanceDayFrom']);
				$data['attendanceDayTo'] = $this->panelInit->date_to_unix($data['attendanceDayTo']);
				$sqlArray[] = "date >= '".$data['attendanceDayFrom']."'";
				$sqlArray[] = "date <= '".$data['attendanceDayTo']."'";
			}

			$sql = $sql . implode(" AND ", $sqlArray);
			$sql = $sql . " order by date";
			$attendanceArray = \DB::select( \DB::raw($sql) );
			$attendanceList = array();

			foreach ($attendanceArray as $stAttendance) {
				$attendanceList[$stAttendance->studentId][] = $stAttendance;
			}

			$i = 0;
			foreach ($studentArray as $stOne) {
				if(isset($attendanceList[ $stOne->id ])){

					foreach($attendanceList[ $stOne->id ] as $value){
						$toReturn[$i] = $value;
						$toReturn[$i]->studentName = $stOne->fullName;
						if($value->subjectId != "" and isset($subjects[$value->subjectId])){
							$toReturn[$i]->studentSubject = $subjects[$value->subjectId];
						}
						$toReturn[$i]->date = $this->panelInit->unix_to_date($value->date);
						$toReturn[$i]->studentRollId = $stOne->studentRollId;
						$i ++;
					}
				}
			}

			if(isset($data['exportType']) AND $data['exportType'] == "excel"){
				$data = array(1 => array ('Date','Roll Id', 'Full Name','Subject','Status'));

				foreach ($toReturn as $value) {
					if($value->status == 0){
						$value->status = $this->panelInit->language['Absent'];
					}elseif ($value->status == 1) {
						$value->status = $this->panelInit->language['Present'];
					}elseif ($value->status == 2) {
						$value->status = $this->panelInit->language['Late'];
					}elseif ($value->status == 3) {
						$value->status = $this->panelInit->language['LateExecuse'];
					}elseif ($value->status == 4) {
						$value->status = $this->panelInit->language['earlyDismissal'];
					}
					$data[] = array ($value->date, (isset($value->studentRollId)?$value->studentRollId:""),(isset($value->studentName)?$value->studentName:""),(isset($value->studentSubject)?$value->studentSubject:""),$value->status);
				}

				\Excel::create('Students-Atendance', function($excel) use($data) {

				    // Set the title
				    $excel->setTitle('Students Atendance Report');

				    // Chain the setters
				    $excel->setCreator('Cutebrains')->setCompany('Virtu');

					$excel->sheet('Students Atendance', function($sheet) use($data) {
						$sheet->freezeFirstRow();
						$sheet->fromArray($data, null, 'A1', true,false);
					});

				})->download('xls');
			}

			if(isset($data['exportType']) AND $data['exportType'] == "pdf"){
				$header = array ('Date','Roll Id', 'Full Name','Subject','Status');
				$data = array();
				foreach ($toReturn as $value) {
					if($value->status == 0){
						$value->status = $this->panelInit->language['Absent'];
					}elseif ($value->status == 1) {
						$value->status = $this->panelInit->language['Present'];
					}elseif ($value->status == 2) {
						$value->status = $this->panelInit->language['Late'];
					}elseif ($value->status == 3) {
						$value->status = $this->panelInit->language['LateExecuse'];
					}elseif ($value->status == 4) {
						$value->status = $this->panelInit->language['earlyDismissal'];
					}
					$data[] = array ( $value->date, (isset($value->studentRollId)?$value->studentRollId:""),(isset($value->studentName)?$value->studentName:""),(isset($value->studentSubject)?$value->studentSubject:""),$value->status);
				}

				$doc_details = array(
									"title" => "Attendance",
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
				$pdfbuilder->output('Attendance.pdf');

				exit;
			}

			user_log('Reports', 'view_student_attendance');

			return $toReturn;
  }

  public function stfAttendance($data){
      $sql = "select * from attendance where ";
			$sqlArray = array();
			$toReturn = array();

			$teachers = array();
			$teachersArray = \User::where('role','teacher');

			if($this->data['panelInit']->settingsArray['teachersSort'] != ""){
				$teachersArray = $teachersArray->orderByRaw($this->data['panelInit']->settingsArray['teachersSort']);
			}

			$teachersArray = $teachersArray->get();

			if(isset($data['status']) AND $data['status'] != "All"){
				$sqlArray[] = "status='".$data['status']."'";
			}

			if(isset($data['attendanceDayFrom']) AND $data['attendanceDayFrom'] != "" AND isset($data['attendanceDayTo']) AND $data['attendanceDayTo'] != ""){
				$data['attendanceDayFrom'] = $this->panelInit->date_to_unix($data['attendanceDayFrom']);
				$data['attendanceDayTo'] = $this->panelInit->date_to_unix($data['attendanceDayTo']);
				$sqlArray[] = "date >= (".$data['attendanceDayFrom'].") AND date <= (".$data['attendanceDayTo'].") ";
			}

	        $sqlArray[] = "classId = '0'";

			$sql = $sql . implode(" AND ", $sqlArray);
			$sql = $sql ." order by date asc";
			$attendanceArray = \DB::select( \DB::raw($sql) );
			$attendanceList = array();

			foreach ($attendanceArray as $stAttendance) {
				$attendanceList[$stAttendance->studentId][] = $stAttendance;
			}

			$i = 0;
			foreach ($teachersArray as $stOne) {
				if(isset($attendanceList[$stOne->id])){
					foreach($attendanceList[$stOne->id] as $value){
						$toReturn[$i] = $value;
						$toReturn[$i]->date = $this->panelInit->unix_to_date($value->date);
						$toReturn[$i]->studentName = $stOne->fullName;
						$i ++;
					}
				}
			}

			if(isset($data['exportType']) AND $data['exportType'] == "excel"){
				$data = array(1 => array ('Date', 'Full Name','Status'));
				foreach ($toReturn as $value) {
					if($value->status == 0){
						$value->status = $this->panelInit->language['Absent'];
					}elseif ($value->status == 1) {
						$value->status = $this->panelInit->language['Present'];
					}elseif ($value->status == 2) {
						$value->status = $this->panelInit->language['Late'];
					}elseif ($value->status == 3) {
						$value->status = $this->panelInit->language['LateExecuse'];
					}
					$data[] = array ( $value->date , $value->studentName,$value->status);
				}

				\Excel::create('Staff-Atendance', function($excel) use($data) {

				    // Set the title
				    $excel->setTitle('Staff Atendance Report');

				    // Chain the setters
				    $excel->setCreator('Cutebrains')->setCompany('Virtu');

					$excel->sheet('Staff Atendance', function($sheet) use($data) {
						$sheet->freezeFirstRow();
						$sheet->fromArray($data, null, 'A1', true,false);
					});

				})->download('xls');
			}

			if(isset($data['exportType']) AND $data['exportType'] == "pdf"){
				$header = array ('Date', 'Full Name','Status');
				$data = array();
				foreach ($toReturn as $value) {
					if($value->status == 0){
						$value->status = $this->panelInit->language['Absent'];
					}elseif ($value->status == 1) {
						$value->status = $this->panelInit->language['Present'];
					}elseif ($value->status == 2) {
						$value->status = $this->panelInit->language['Late'];
					}elseif ($value->status == 3) {
						$value->status = $this->panelInit->language['LateExecuse'];
					}
					$data[] = array ( $value->date , $value->studentName,$value->status);
				}

				$doc_details = array(
									"title" => "Attendance",
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
				$pdfbuilder->output('Attendance.pdf');

				exit;
			}

			user_log('Reports', 'view_staff_attendance');

			return $toReturn;
  }

	public function stdVacation($data){
		$data['fromDate'] = $this->panelInit->date_to_unix($data['fromDate']);
		$data['toDate'] = $this->panelInit->date_to_unix($data['toDate']);

		$vacationList = \DB::table('vacation')
					->leftJoin('users', 'users.id', '=', 'vacation.userid')
					->select('vacation.id as id',
					'vacation.userid as userid',
					'vacation.vacDate as vacDate',
					'vacation.acceptedVacation as acceptedVacation',
					'users.fullName as fullName')
					->where('vacation.acYear',$this->panelInit->selectAcYear)
					->where('vacation.role','student')
					->where('vacation.vacDate','>=',$data['fromDate'])
					->where('vacation.vacDate','<=',$data['toDate'])
					->get();

		foreach ($vacationList as $key=>$value) {
			$vacationList[$key]->vacDate = $this->panelInit->unix_to_date($vacationList[$key]->vacDate);
		}

		user_log('Reports', 'view_student_vacation');

		return $vacationList;
	}

	public function stfVacation($data){
		$data['fromDate'] = $this->panelInit->date_to_unix($data['fromDate']);
		$data['toDate'] = $this->panelInit->date_to_unix($data['toDate']);

		$vacationList = \DB::table('vacation')
					->leftJoin('users', 'users.id', '=', 'vacation.userid')
					->select('vacation.id as id',
					'vacation.userid as userid',
					'vacation.vacDate as vacDate',
					'vacation.acceptedVacation as acceptedVacation',
					'users.fullName as fullName')
					->where('vacation.acYear',$this->panelInit->selectAcYear)
					->where('vacation.role','teacher')
					->where('vacation.vacDate','>=',$data['fromDate'])
					->where('vacation.vacDate','<=',$data['toDate'])
					->get();

		foreach ($vacationList as $key=>$value) {
			$vacationList[$key]->vacDate = $this->panelInit->unix_to_date($vacationList[$key]->vacDate);
		}

		user_log('Reports', 'view_stuff_vacation');

		return $vacationList;
	}

	// payments
	public function reports($data){
		$payments = \DB::table('payments')
					->leftJoin('users', 'users.id', '=', 'payments.paymentStudent')
					->select('payments.id as id',
					'payments.paymentTitle as paymentTitle',
					'payments.paymentDescription as paymentDescription',
					'payments.paymentAmount as paymentAmount',
					'payments.paymentDiscounted as paymentDiscounted',
					'payments.paidAmount as paidAmount',
					'payments.paymentStatus as paymentStatus',
					'payments.paymentDate as paymentDate',
					'payments.dueDate as dueDate',
					'payments.paidTime as paidTime',
					'payments.paymentStudent as studentId',
					'users.fullName as fullName');

		if(isset($data['classId']) AND $data['classId'] == true){
			$payment_ids1 = Payment::getPaymentIdsByClassId($data['classId']);
			$payments = $payments->whereIn('payments.id', $payment_ids1);
		}
		if(isset($data['sectionId']) AND $data['sectionId'] == true){
			$payment_ids2 = Payment::getPaymentIdsBySectionId($data['sectionId']);
			$payments = $payments->whereIn('payments.id', $payment_ids2);
		}
		if(isset($data['payment_mode']) AND $data['payment_mode'] != "All"){
			$payments = $payments->where('payments.paidMethod',$data['payment_mode']);
		}
		if(isset($data['payment_status']) AND $data['payment_status'] != "All"){
			$payments = $payments->where('payments.paymentStatus',$data['payment_status']);
			if($data['payment_status'] == '1' || $data['payment_status'] == '2') {
				$data['fromDate'] = $this->panelInit->date_to_unix($data['fromDate']);
				$data['toDate'] = $this->panelInit->date_to_unix($data['toDate']);
				$payments = $payments->where('payments.paidTime','>=',$data['fromDate']);
				$payments = $payments->where('payments.paidTime','<=',$data['toDate']);
			}
		}
		if(isset($data['dueInv']) AND $data['dueInv'] == true){
			$payments = $payments->where('payments.dueDate','<',time())->where('paymentStatus','!=','1');
		}

		$hashids = new Hashids('invoices_report');
		$payment_hashed_ids = $payments->orderBy('payments.id','DESC')->pluck('id');
		$payment_hashed_ids = $hashids->encode($payment_hashed_ids);

		$payments = $payments->orderBy('payments.id','DESC')->get();

		foreach ($payments as $key=>$value) {
			$payments[$key]->paymentDate = $this->panelInit->unix_to_date($payments[$key]->paymentDate);
			$payments[$key]->dueDate = $this->panelInit->unix_to_date($payments[$key]->dueDate);
			$payments[$key]->paidTime = $this->panelInit->unix_to_date($payments[$key]->paidTime);
			$payments[$key]->paymentAmount = $payments[$key]->paymentAmount + ($this->panelInit->settingsArray['paymentTax']*$payments[$key]->paymentAmount) /100;
			$payments[$key]->paymentDiscounted = $payments[$key]->paymentDiscounted + ($this->panelInit->settingsArray['paymentTax']*$payments[$key]->paymentDiscounted) /100;
		}

		user_log('Reports', 'view_payments');

		return response()->json([
			'payments' => $payments,
			'payment_hashed_ids' => $payment_hashed_ids
		]);
	}

	public function expenses($data){

		$data['fromDate'] = $this->panelInit->date_to_unix($data['fromDate']);
		$data['toDate'] = $this->panelInit->date_to_unix($data['toDate']);

		$expenses = \DB::table('expenses')
					->leftJoin('expenses_cat','expenses_cat.id','=','expenses.expenseCategory')
					->where('expenses.expenseDate','>=',$data['fromDate'])
					->where('expenses.expenseDate','<=',$data['toDate'])
					->select('expenses.id as id',
					'expenses.expenseTitle as expenseTitle',
					'expenses.expenseAmount as expenseAmount',
					'expenses.expenseDate as expenseDate',
					'expenses.expenseCategory as expenseCategory',
					'expenses.expenseNotes as expenseNotes',
					'expenses_cat.cat_title as expenses_cat_name');

		$expenses = $expenses->orderBy('id','DESC')->get();

		foreach ($expenses as $key=>$value) {
			$expenses[$key]->expenseDate = $this->panelInit->unix_to_date($expenses[$key]->expenseDate);
		}

		user_log('Reports', 'view_expenses');

		return $expenses;
	}

	public function income($data){

		$data['fromDate'] = $this->panelInit->date_to_unix($data['fromDate']);
		$data['toDate'] = $this->panelInit->date_to_unix($data['toDate']);

		$incomes = \DB::table('income')
					->leftJoin('income_cat','income_cat.id','=','income.incomeCategory')
					->where('income.incomeDate','>=',$data['fromDate'])
					->where('income.incomeDate','<=',$data['toDate'])
					->select('income.id as id',
					'income.incomeTitle as incomeTitle',
					'income.incomeAmount as incomeAmount',
					'income.incomeDate as incomeDate',
					'income.incomeCategory as incomeCategory',
					'income.incomeNotes as incomeNotes',
					'income_cat.cat_title as income_cat_name');

		$incomes = $incomes->orderBy('id','DESC')->get();

		foreach ($incomes as $key=>$income) {
			$incomes[$key]->incomeDate = $this->panelInit->unix_to_date($incomes[$key]->incomeDate);
		}

		user_log('Reports', 'view_incomes');

		return $incomes;
	}

	public function marksheetGenerationPrepare(){
		$toReturn = array();
		$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		$toReturn['exams'] = \exams_list::where('examAcYear',$this->panelInit->selectAcYear)->get()->toArray();

		user_log('Reports', 'marksheet_generation_prepare');

		return $toReturn;
	}

	public function biometric_users_generate(){
		return $users = \User::where('biometric_id','!=','0')->select('id','username','fullName','role','email','biometric_id')->get();
	}

	public function payroll_payments($data){
		$data['fromDate'] = $this->panelInit->date_to_unix($data['fromDate']);
		$data['toDate'] = $this->panelInit->date_to_unix($data['toDate']);

		$payroll_history = \payroll_history::leftJoin('users', 'users.id', '=', 'payroll_history.userid')
					->where('payroll_history.pay_date','>=',$data['fromDate'])
					->where('payroll_history.pay_date','<=',$data['toDate'])
					->select('payroll_history.id as id',
					'payroll_history.salary_type as salary_type',
					'payroll_history.salary_value as salary_value',
					'payroll_history.hour_overtime as hour_overtime',
					'payroll_history.hour_count as hour_count',
					'payroll_history.pay_month as pay_month',
					'payroll_history.pay_year as pay_year',
					'payroll_history.pay_date as pay_date',
					'payroll_history.pay_amount as pay_amount',
					'payroll_history.pay_method as pay_method',
					'payroll_history.pay_comments as pay_comments',
					'users.fullName as fullName',
					'users.username as username',
					'users.email as email');

		$payroll_history = $payroll_history->orderBy('id','DESC')->get();

		foreach ($payroll_history as $key=>$payroll) {
			$payroll_history[$key]->pay_date = $this->panelInit->unix_to_date($payroll_history[$key]->pay_date);
		}

		user_log('Reports', 'view_payroll_payments');

		return $payroll_history;
	}

	public function preCert(){
		$toReturn = array();
		$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->select('id','className')->get()->toArray();
		$toReturn['certs'] = \certificates::select('id','certificate_name')->get()->toArray();
		user_log('Reports', 'view_pre_certificates');
		return $toReturn;
	}

	public function certGetStdList(){
		$User = \User::where('role','student')->where('studentClass',\Input::get('classId'));
		if(\Input::has('sectionId')){
			$User = $User->where('studentSection',\Input::get('sectionId'));
		}
		return $User->select('id','username','fullName','email')->get();
	}

	public function certPrint($data){
		$to_return = array("certificate"=>array(),"users"=>array());

		//Prepare std cat.
		$std_cat = array();
		$student_categories = \student_categories::select('id','cat_title')->get();
		foreach ($student_categories as $key => $value) {
			$std_cat[$value->id] = $value->cat_title;
		}

		//Prepare Classes
		$classes_list = array();
		$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->select('id','className')->get();
		foreach ($classes as $key => $value) {
			$classes_list[$value->id] = $value->className;
		}

		//Prepare Section
		$sections_list = array();
		$sections = \sections::select('id','sectionName')->get();
		foreach ($sections as $key => $value) {
			$sections_list[$value->id] = $value->sectionName;
		}


		$User = \User::where('role','student')->whereIn('id',$data['selected_users'])->get()->toArray();
		foreach ($User as $key => $value) {
			$to_return['users'][$key] = array();
			$to_return['users'][$key]['user_name'] = $value['username'];
			$to_return['users'][$key]['full_name'] = $value['fullName'];
			$to_return['users'][$key]['email'] = $value['email'];
			$to_return['users'][$key]['date_of_birth'] = $this->panelInit->unix_to_date($value['birthday']);
			$to_return['users'][$key]['gender'] = $value['gender'];
			$to_return['users'][$key]['religion'] = $value['religion'];
			$to_return['users'][$key]['phone_number'] = $value['phoneNo'];
			$to_return['users'][$key]['mobile_number'] = $value['mobileNo'];
			$to_return['users'][$key]['address'] = $value['address'];
			$to_return['users'][$key]['admission_number'] = $value['admission_number'];
			$to_return['users'][$key]['admission_date'] = $this->panelInit->unix_to_date($value['admission_date']);
			$to_return['users'][$key]['roll_id'] = $value['studentRollId'];
			if(isset($std_cat[ $value['std_category'] ])){
				$to_return['users'][$key]['student_category'] = $std_cat[ $value['std_category'] ];
			}else{
				$to_return['users'][$key]['student_category'] = "";
			}
			if(isset($classes_list[ $value['studentClass'] ])){
				$to_return['users'][$key]['class_name'] = $classes_list[ $value['studentClass'] ];
			}else{
				$to_return['users'][$key]['class_name'] = "";
			}
			if(isset($classes_list[ $value['studentSection'] ])){
				$to_return['users'][$key]['section_name'] = $sections_list[ $value['studentSection'] ];
			}else{
				$to_return['users'][$key]['section_name'] = "";
			}

			$value['father_info'] = json_decode($value['father_info'],true);
			if(is_array($value['father_info']) AND isset($value['father_info']['name'])){
				$to_return['users'][$key]['father_name'] = $value['father_info']['name'];
			}else{
				$to_return['users'][$key]['father_name'] = "";
			}

			$value['mother_info'] = json_decode($value['mother_info'],true);
			if(is_array($value['father_info']) AND isset($value['mother_info']['name'])){
				$to_return['users'][$key]['mother_name'] = $value['mother_info']['name'];
			}else{
				$to_return['users'][$key]['mother_name'] = "";
			}

		}

		$to_return['certificate'] = \certificates::where('id',$data['certId'])->first();

		$certificatesController = new certificatesController();
		$to_return['margins'] = $certificatesController->certificate_margins;

		return $to_return;
	}
}
