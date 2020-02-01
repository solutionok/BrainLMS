<?php
namespace App\Http\Controllers;

use App\Models2\Main;
use App\Models2\Message;
use App\Models2\NotificationMobHistory;
use App\Models2\Payment;
use App\Models2\PaymentsCollection;
use App\Models2\Subject;
use App\User;
use Cache;
use Hashids\Hashids;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use JWTAuth;

class DashboardController extends Controller {

	var $data = array();
	var $panelInit;
	var $layout = 'dashboard';
	protected $cache_minutes = 120; // minutes

	public function __construct(){
		if(app('request')->header('Authorization') != "" || \Input::has('token')){
			$this->middleware('jwt.auth');
		}else{
			$this->middleware('authApplication');
		}

		$this->panelInit = new \DashboardInit();
		$this->data['panelInit'] = $this->panelInit;
		$this->data['breadcrumb']['User Settings'] = \URL::to('/dashboard/user');
		$this->data['users'] = $this->panelInit->getAuthUser();
		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}
	}

	public function index($method = "main")
	{
		if(is_null($this->data['users'])) {
			return \Redirect::to('/login');
		}
		if($this->data['users']->role == "admin" AND $this->panelInit->version != $this->panelInit->settingsArray['latestVersion']){
			$this->data['latestVersion'] = $this->panelInit->settingsArray['latestVersion'];
		}
		$this->data['role'] = $this->data['users']->role;
		$this->data['languagesList'] = \languages::select('id','languageTitle')->get();

		return view('Layout', $this->data);
	}

	public function cms($method = "main")
	{

		$this->data['role'] = $this->data['users']->role;
		$this->data['languagesList'] = \languages::select('id','languageTitle')->get();

		//In case the CMS active, Then redirect to home page
		if(isset($this->panelInit->settingsArray['cms_active']) || $this->panelInit->settingsArray['cms_active'] == 1){
			$frontend_pages = \frontend_pages::where('page_status','publish')->where('page_visibility','public')->where('page_template','home');

			if($frontend_pages->count() > 0){
				$frontend_pages = $frontend_pages->first();
				return \Redirect::to('/'.$frontend_pages->page_permalink);
			}

		}

		return view('Layout', $this->data);
	}

	public function baseUser()
	{
		return array("fullName"=>$this->data['users']->fullName,"username"=>$this->data['users']->username,"role"=>$this->data['users']->role,"defTheme"=>$this->data['users']->defTheme);
	}

	public function dashboardData(){
		$toReturn = array();
		$toReturn['siteTitle'] = $this->data['panelInit']->settingsArray['siteTitle'];
		$toReturn['dateformat'] = $this->data['panelInit']->settingsArray['dateformat'];
		$toReturn['enableSections'] = $this->data['panelInit']->settingsArray['enableSections'];
		$toReturn['emailIsMandatory'] = $this->data['panelInit']->settingsArray['emailIsMandatory'];
		$toReturn['allowTeachersMailSMS'] = $this->data['panelInit']->settingsArray['allowTeachersMailSMS'];
		$toReturn['gcalendar'] = $this->data['panelInit']->settingsArray['gcalendar'];
		$toReturn['currency_symbol'] = $this->data['panelInit']->settingsArray['currency_symbol'];
		$toReturn['selectedAcYear'] = $this->panelInit->selectAcYear;
		$toReturn['language'] = $this->panelInit->language;
		$toReturn['languageUniversal'] = $this->panelInit->languageUniversal;
		$toReturn['activatedModules'] = json_decode($this->panelInit->settingsArray['activatedModules']);
		$toReturn['country'] = $this->panelInit->settingsArray['country'];
		$toReturn['wysiwyg_type'] = $this->panelInit->settingsArray['wysiwyg_type'];
		$toReturn['sAttendanceInOut'] = $this->panelInit->settingsArray['sAttendanceInOut'];
		$toReturn['perms'] = $this->panelInit->perms;
		$toReturn['userRole'] = Auth::user()->role;
		$toReturn['userId'] = Auth::user()->id;
		$toReturn['server_info'] = json_encode(get_server_info());

		$toReturn['sort'] = array();
		if(isset($this->data['panelInit']->settingsArray['studentsSort'])){
			$toReturn['sort']['students'] = $this->data['panelInit']->settingsArray['studentsSort'];
		}
		if(isset($this->data['panelInit']->settingsArray['teachersSort'])){
			$toReturn['sort']['teachers'] = $this->data['panelInit']->settingsArray['teachersSort'];
		}
		if(isset($this->data['panelInit']->settingsArray['parentsSort'])){
			$toReturn['sort']['parents'] = $this->data['panelInit']->settingsArray['parentsSort'];
		}
		if(isset($this->data['panelInit']->settingsArray['invoicesSort'])){
			$toReturn['sort']['invoices'] = $this->data['panelInit']->settingsArray['invoicesSort'];
		}

		$toReturn['role'] = $this->data['users']->role;
		if($this->data['users']->role == "admin"){
			if($this->data['users']->customPermissionsType == "full"){
				$toReturn['adminPerm'] = "full";
			}else{
				$toReturn['adminPerm'] = json_decode($this->data['users']->customPermissions,true);
			}
		}

		$toReturn['stats'] = array();
		$toReturn['stats']['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->count();

		if (!Cache::has('students_count')) {
			$toReturn['stats']['students'] = \User::where('role','student')->where('activated',1)->count();
			Cache::put('students_count', $toReturn['stats']['students'], $this->cache_minutes);
		} else {
			$toReturn['stats']['students'] = Cache::get('students_count');
		}

		if (!Cache::has('teachers_count')) {
			$toReturn['stats']['teachers'] = \User::where('role','teacher')->where('activated',1)->count();
			Cache::put('teachers_count', $toReturn['stats']['teachers'], $this->cache_minutes);
		} else {
			$toReturn['stats']['teachers'] = Cache::get('teachers_count');
		}

		if (!Cache::has('parents_count')) {
			$toReturn['stats']['parents'] = \User::where('role','parent')->where('activated',1)->count();
			Cache::put('parents_count', $toReturn['stats']['parents'], $this->cache_minutes);
		} else {
			$toReturn['stats']['parents'] = Cache::get('parents_count');
		}

		if (!Cache::has('employees_count')) {
			$toReturn['stats']['employees'] = \User::where('role','employee')->where('activated',1)->count();
			Cache::put('employees_count', $toReturn['stats']['employees'], $this->cache_minutes);
		} else {
			$toReturn['stats']['employees'] = Cache::get('employees_count');
		}

		if (!Cache::has('myMessages_count')) {
			$toReturn['stats']['myMessages'] = Message::getReceivedMessages()->count();
			Cache::put('myMessages_count', $toReturn['stats']['myMessages'], $this->cache_minutes);
		} else {
			$toReturn['stats']['myMessages'] = Cache::get('myMessages_count');
		}

		$toReturn['stats']['newMessages'] = \messages_list::where('userId',$this->data['users']->id)->where('messageStatus',1)->count();

		$toReturn['messages'] = \DB::select(\DB::raw("SELECT messages_list.id as id,messages_list.lastMessageDate as lastMessageDate,messages_list.lastMessage as lastMessage,messages_list.messageStatus as messageStatus,users.fullName as fullName,users.id as userId FROM messages_list LEFT JOIN users ON users.id=IF(messages_list.userId = '".$this->data['users']->id."',messages_list.toId,messages_list.userId) where userId='".$this->data['users']->id."' order by id DESC limit 5" ));
		foreach ($toReturn['messages'] as $key => $value) {
			$toReturn['messages'][$key]->lastMessageDate = $this->panelInit->unix_to_date( $toReturn['messages'][$key]->lastMessageDate, $this->panelInit->settingsArray['dateformat']." hr:mn a" );
		}

		$toReturn['attendanceModel'] = $this->data['panelInit']->settingsArray['attendanceModel'];
		if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject"){
			$subjects = \subject::get();
			foreach ($subjects as $subject) {
				$toReturn['subjects'][$subject->id] = $subject->subjectTitle ;
			}
		}

		$startTime = time() - (15*60*60*24);
		$endTime = time() + (15*60*60*24);
		if($this->data['users']->role == "student"){
			$attendanceArray = \attendance::where('studentId',$this->data['users']->id)->where('date','>=',$startTime)->where('date','<=',$endTime)->orderBy('date','asc')->get();
			foreach ($attendanceArray as $value) {
				$toReturn['studentAttendance'][] = array("date"=>$this->panelInit->unix_to_date($value->date),"status"=>$value->status,"subject"=>isset($toReturn['subjects'][$value->subjectId])?$toReturn['subjects'][$value->subjectId]:"" ) ;
			}
		}elseif($this->data['users']->role == "parent"){
			if($this->data['users']->parentOf != ""){
				$parentOf = json_decode($this->data['users']->parentOf,true);
				if(!is_array($parentOf)){
					$parentOf = array();
				}
				$ids = array();
				foreach ($parentOf as$value) {
					$ids[] = $value['id'];
				}

				if(count($ids) > 0){
					$studentArray = \User::where('role','student')->whereIn('id',$ids)->get();
					foreach ($studentArray as $stOne) {
						$students[$stOne->id] = array('name'=>$stOne->fullName,'studentRollId'=>$stOne->studentRollId);
					}

					$attendanceArray = \attendance::whereIn('studentId',$ids)->where('date','>=',$startTime)->where('date','<=',$endTime)->orderBy('date','asc')->get();
					foreach ($attendanceArray as $value) {
						if(isset($students[$value->studentId]) AND !isset($toReturn['studentAttendance'][$value->studentId])){
							$toReturn['studentAttendance'][$value->studentId]['n'] = $students[$value->studentId];
							$toReturn['studentAttendance'][$value->studentId]['d'] = array();
						}
						$toReturn['studentAttendance'][$value->studentId]['d'][] = array("date"=>$this->panelInit->unix_to_date($value->date),"status"=>$value->status,"subject"=>$value->subjectId);
					}
				}
			}
		}

		if (!Cache::has('teacherLeaderBoard')) {
			$toReturn['teacherLeaderBoard'] = \User::where('role','teacher')->where('isLeaderBoard','!=','')->where('isLeaderBoard','!=','0')->get()->toArray();
			Cache::put('teacherLeaderBoard', $toReturn['teacherLeaderBoard'], $this->cache_minutes);
		} else {
			$toReturn['teacherLeaderBoard'] = Cache::get('teacherLeaderBoard');
		}

		if (!Cache::has('studentLeaderBoard')) {
			$toReturn['studentLeaderBoard'] = \User::where('role','student')->where('isLeaderBoard','!=','')->where('isLeaderBoard','!=','0')->get()->toArray();
			Cache::put('studentLeaderBoard', $toReturn['studentLeaderBoard'], $this->cache_minutes);
		} else {
			$toReturn['studentLeaderBoard'] = Cache::get('studentLeaderBoard');
		}

		$toReturn['newsEvents'] = array();
		$role = $this->data['users']->role;
		$newsboard = \newsboard::where(function($query) use ($role){
								$query = $query->where('newsFor',$role)->orWhere('newsFor','all');
							})->orderBy('id','desc')->limit(5)->get();
		foreach ($newsboard as $event ) {
			$eventsArray['id'] =  $event->id;
			$eventsArray['title'] =  $event->newsTitle;
			$eventsArray['type'] =  "news";
	    	$eventsArray['start'] = $this->panelInit->unix_to_date($event->newsDate);
	    	$toReturn['newsEvents'][] = $eventsArray;
		}

		$events = \events::where(function($query) use ($role){
			$query = $query->where('eventFor',$role)->orWhere('eventFor','all');
		})->orderBy('id','desc')->limit(5)->get();
		foreach ($events as $event ) {
	    	$eventsArray['id'] =  $event->id;
			$eventsArray['title'] =  $event->eventTitle;
			$eventsArray['type'] =  "event";
		    $eventsArray['start'] = $this->panelInit->unix_to_date($event->eventDate);
		    $toReturn['newsEvents'][] = $eventsArray;
		}

		$toReturn['academicYear'] = \academic_year::get()->toArray();

		$toReturn['baseUser'] = array("id"=>$this->data['users']->id,"fullName"=>$this->data['users']->fullName,"username"=>$this->data['users']->username,"defTheme"=>$this->data['users']->defTheme,"email"=>$this->data['users']->email);

		$polls = \polls::where('pollTarget',$this->data['users']->role)->orWhere('pollTarget','all')->where('pollStatus','1');
		if($polls->count() > 0){
			$polls = $polls->first();
			$toReturn['polls']['title'] = $polls->pollTitle;
			$toReturn['polls']['id'] = $polls->id;
			$toReturn['polls']['view'] = "vote";
			$userVoted = json_decode($polls->userVoted,true);
			if(is_array($userVoted) AND in_array($this->data['users']->id,$userVoted)){
				$toReturn['polls']['voted'] = true;
				$toReturn['polls']['view'] = "results";
			}
			$toReturn['polls']['items'] = json_decode($polls->pollOptions,true);
			$toReturn['polls']['totalCount'] = 0;
			if(is_array($toReturn['polls']['items']) AND count($toReturn['polls']['items']) > 0){
				foreach ($toReturn['polls']['items'] as $key => $value) {
					if(isset($value['count'])){
						$toReturn['polls']['totalCount'] += $value['count'];
					}
					if(!isset($toReturn['polls']['items'][$key]['prec'])){
						$toReturn['polls']['items'][$key]['prec'] = 0;
					}
				}

			}
		}

		if($this->data['users']->role == "student"){
			$toReturn['invoices'] = \DB::table('payments')
						->where('paymentStudent',$this->data['users']->id)
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
						'payments.paymentStudent as studentId',
						'users.fullName as fullName')->orderBy('id','DESC')->limit(5)->get();

			$invoicesCount = \DB::table('payments')->where('paymentStudent',$this->data['users']->id)->selectRaw('count(paymentAmount) as paymentAmount')->get();
			$invoicesDueCount = \DB::table('payments')->where('paymentStudent',$this->data['users']->id)->where('dueDate','<',time())->where('paymentStatus','!=','1')->selectRaw('count(paymentAmount) as paymentAmount')->get();

			$toReturn['stats']['invoices'] = $invoicesCount[0]->paymentAmount;
			$toReturn['stats']['dueInvoices'] = $invoicesDueCount[0]->paymentAmount;
		}elseif($this->data['users']->role == "parent"){
			$studentId = array();
			$parentOf = json_decode($this->data['users']->parentOf,true);
			if(is_array($parentOf)){
				foreach( $parentOf as $value){
					$studentId[] = $value['id'];
				}
			}
			$toReturn['invoices'] = \DB::table('payments')
						->whereIn('paymentStudent',$studentId)
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
						'payments.paymentStudent as studentId',
						'users.fullName as fullName')->orderBy('id','DESC')->limit(5)->get();

			$invoicesCount = \DB::table('payments')->whereIn('paymentStudent',$studentId)->selectRaw('count(paymentAmount) as paymentAmount')->get();
			$invoicesDueCount = \DB::table('payments')->whereIn('paymentStudent',$studentId)->where('dueDate','<',time())->where('paymentStatus','!=','1')->selectRaw('count(paymentAmount) as paymentAmount')->get();

			$toReturn['stats']['invoices'] = $invoicesCount[0]->paymentAmount;
			$toReturn['stats']['dueInvoices'] = $invoicesDueCount[0]->paymentAmount;
		}elseif($this->data['users']->role == "admin"){
			$toReturn['invoices'] = \DB::table('payments')
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
						'payments.paymentStudent as studentId',
						'users.fullName as fullName')->orderBy('id','DESC')->limit(5)->get();


			$invoicesCount = \DB::table('payments')->selectRaw('count(paymentAmount) as paymentAmount')->get();
			$invoicesDueCount = \DB::table('payments')->where('dueDate','<',time())->where('paymentStatus','!=','1')->selectRaw('count(paymentAmount) as paymentAmount')->get();

			$toReturn['stats']['invoices'] = $invoicesCount[0]->paymentAmount;
			$toReturn['stats']['dueInvoices'] = $invoicesDueCount[0]->paymentAmount;
		}

		if(isset($toReturn['invoices'])){
			foreach ($toReturn['invoices'] as $key => $value) {
				$toReturn['invoices'][$key]->paymentDate = $this->panelInit->unix_to_date($toReturn['invoices'][$key]->paymentDate);
				$toReturn['invoices'][$key]->dueDate = $this->panelInit->unix_to_date($toReturn['invoices'][$key]->dueDate);
				$toReturn['invoices'][$key]->paymentAmount = $toReturn['invoices'][$key]->paymentAmount + ($this->panelInit->settingsArray['paymentTax']*$toReturn['invoices'][$key]->paymentAmount) /100;
				$toReturn['invoices'][$key]->paymentDiscounted = $toReturn['invoices'][$key]->paymentDiscounted + ($this->panelInit->settingsArray['paymentTax']*$toReturn['invoices'][$key]->paymentDiscounted) /100;
			}
		}

		if($this->data['users']->role == "student" AND $this->data['users']->studentClass != ""){
			$dow = $this->panelInit->todayDow(time());

			if($this->panelInit->settingsArray['enableSections'] == true){
				$toReturn['schedule'] = \class_schedule::leftJoin('sections','sections.id','=','class_schedule.sectionId')->leftJoin('subject','subject.id','=','class_schedule.subjectId')->where('class_schedule.dayOfWeek',$dow)->where('sectionId',$this->data['users']->studentSection)->where('sectionId','!=','0')->select('class_schedule.*','sections.sectionName','subject.subjectTitle')->get();
			}else{
				$toReturn['schedule'] = \class_schedule::leftJoin('classes','classes.id','=','class_schedule.classId')->leftJoin('subject','subject.id','=','class_schedule.subjectId')->where('class_schedule.dayOfWeek',$dow)->where('classId',$this->data['users']->studentClass)->where('classId','!=','0')->select('class_schedule.*','classes.className','subject.subjectTitle')->get();
			}
		}elseif ($this->data['users']->role == "teacher") {
			$dow = $this->panelInit->todayDow(time());

			if($this->panelInit->settingsArray['enableSections'] == true){
				$toReturn['schedule'] = \class_schedule::leftJoin('classes','classes.id','=','class_schedule.classId')->leftJoin('subject','subject.id','=','class_schedule.subjectId')->where('class_schedule.dayOfWeek',$dow)->where('class_schedule.teacherId',$this->data['users']->id)->where('sectionId','!=','0')->select('class_schedule.*','classes.className','subject.subjectTitle')->get();
			}else{
				$toReturn['schedule'] = \class_schedule::leftJoin('classes','classes.id','=','class_schedule.classId')->leftJoin('subject','subject.id','=','class_schedule.subjectId')->where('class_schedule.dayOfWeek',$dow)->where('class_schedule.teacherId',$this->data['users']->id)->where('classId','!=','0')->select('class_schedule.*','classes.className','subject.subjectTitle')->get();
			}
		}elseif ($this->data['users']->role == "parent") {

			if($this->data['users']->parentOf != ""){
				$parentOf = json_decode($this->data['users']->parentOf,true);
				if(!is_array($parentOf)){
					$parentOf = array();
				}

				$ids = array();
				foreach($parentOf as $value){
					$ids[] = $value['id'];
				}

				if(count($ids) > 0){
					$classes = array();
					$toReturn['schedule'] = array();
					$dow = $this->panelInit->todayDow(time()) ;

					$studentArray = \User::where('role','student')->whereIn('id',$ids)->select('id','fullName','studentClass','studentSection')->get();
					$sections = [];
					foreach ($studentArray as $stOne) {
						$classes[] = $stOne->studentClass;
						$sections[] = $stOne->studentSection;
						$toReturn['scheduleStd'][$stOne->id] = array('fullName'=>$stOne->fullName,'studentClass'=>$stOne->studentClass,'studentSection'=>$stOne->studentSection);

						//Send Push Notifications for birthday
						/*$birdayss = \DB::select( \DB::raw("SELECT id,fullName,birthday,username  FROM users WHERE DATE_FORMAT(FROM_UNIXTIME(birthday),'%m-%d') = DATE_FORMAT(NOW(),'%m-%d') and id=".$stOne->id) );
						foreach ($birdayss as $key => $value) {
							$tokens_list = array();
							if($this->data['users']->firebase_token != ""){
								$tokens_list[] = $users->firebase_token;
								$user_ids[] = $users->id;
								$this->panelInit->send_push_notification(
									$tokens_list,
									$user_ids,
									"Wishing you happiness, good health and a great year ahead. Happy Birthday ".$value->fullName." !!",'Birthday',"birthday");
							}
						}*/

					}

					if($this->panelInit->settingsArray['enableSections'] == true){
						$class_schedule = \class_schedule::leftJoin('sections','sections.id','=','class_schedule.sectionId')->leftJoin('subject','subject.id','=','class_schedule.subjectId')->where('class_schedule.dayOfWeek',$dow)->whereIn('sectionId',$sections)->where('sectionId','!=','0')->select('class_schedule.*','sections.sectionName','subject.subjectTitle')->get();
					}else{
						$class_schedule = \class_schedule::leftJoin('classes','classes.id','=','class_schedule.classId')->leftJoin('subject','subject.id','=','class_schedule.subjectId')->where('class_schedule.dayOfWeek',$dow)->whereIn('classId',$classes)->where('classId','!=','0')->select('class_schedule.*','classes.className','subject.subjectTitle')->get();
					}

					foreach ($class_schedule as $value) {
						if($this->panelInit->settingsArray['enableSections'] == true){
							if(!isset($toReturn['schedule'][$value->sectionId])){
								$toReturn['schedule'][$value->sectionId] = array();
							}
							$value->startTime = wordwrap($value->startTime,2,':',true);
							$value->endTime = wordwrap($value->endTime,2,':',true);
							$toReturn['schedule'][$value->sectionId][] = $value;
						}else{
							if(!isset($toReturn['schedule'][$value->classId])){
								$toReturn['schedule'][$value->classId] = array();
							}
							$value->startTime = wordwrap($value->startTime,2,':',true);
							$value->endTime = wordwrap($value->endTime,2,':',true);
							$toReturn['schedule'][$value->classId][] = $value;
						}


					}
				}
			}
		}

		if(isset($toReturn['schedule']) AND $this->data['users']->role != "parent"){
			foreach ($toReturn['schedule'] as $key=>$schedule) {
				$toReturn['schedule'][$key]->startTime = wordwrap($toReturn['schedule'][$key]->startTime,2,':',true);
				$toReturn['schedule'][$key]->endTime = wordwrap($toReturn['schedule'][$key]->endTime,2,':',true);
			}
		}

		//Birthday
		if (!Cache::has('Dashboard_birthday')) {
			$toReturn['birthday'] = \DB::select( \DB::raw("SELECT id,fullName,birthday,username  FROM users WHERE DATE_FORMAT(FROM_UNIXTIME(birthday),'%m-%d') = DATE_FORMAT(NOW(),'%m-%d')") );
			Cache::put('Dashboard_birthday', $toReturn['birthday'], $this->cache_minutes);
		} else {
			$toReturn['birthday'] = Cache::get('Dashboard_birthday');
		}
		foreach ($toReturn['birthday'] as $key => $value) {
			$toReturn['birthday'][$key]->age = date("Y", time()) - date("Y", $value->birthday);
		}

		// Message notifications
		$toReturn['dashboard_notifications'] = Message::getReceivedMessages()->toArray();

		return json_encode($toReturn);
	}

	public function dashaboardData(){
		global $settingsLC;

		$toReturn = array();
		$toReturn['siteTitle'] = $this->data['panelInit']->settingsArray['siteTitle'];
		$toReturn['dateformat'] = $this->data['panelInit']->settingsArray['dateformat'];
		$toReturn['enableSections'] = $this->data['panelInit']->settingsArray['enableSections'];
		$toReturn['emailIsMandatory'] = $this->data['panelInit']->settingsArray['emailIsMandatory'];
		$toReturn['gcalendar'] = $this->data['panelInit']->settingsArray['gcalendar'];
		$toReturn['selectedAcYear'] = $this->panelInit->selectAcYear;
		$toReturn['language'] = $this->panelInit->language;
		$toReturn['languageUniversal'] = $this->panelInit->languageUniversal;
		$toReturn['role'] = $this->data['users']->role;
		$toReturn['sAttendanceInOut'] = $this->panelInit->settingsArray['sAttendanceInOut'];
		$toReturn['perms'] = $this->panelInit->perms;

		if($this->data['users']->role == "admin"){
			if($this->data['users']->customPermissionsType == "full"){
				$toReturn['adminPerm'] = "full";
			}else{
				$toReturn['adminPerm'] = json_decode($this->data['users']->customPermissions,true);
			}
		}

		$toReturn['activatedModules'] = json_decode($this->data['panelInit']->settingsArray['activatedModules'],true);
		$toReturn['notification'] = array(
							"c" => isset($this->data['panelInit']->settingsArray['pullAppClosed']) ? $this->data['panelInit']->settingsArray['pullAppClosed']:"",
							"m" => isset($this->data['panelInit']->settingsArray['pullAppMessagesActive']) ? $this->data['panelInit']->settingsArray['pullAppMessagesActive']:""
						);
		$toReturn['overall'] = [0 => '3e8612ff71735216b5340fe0f9ca5b6e'];

		if(!\Input::has('nLowAndVersion') AND !\Input::has('nLowIosVersion')){
			return array("error"=>"MissingMobAppVersion");
		}

		if( \Input::has('nLowAndVersion') AND \Input::get('nLowAndVersion') < $this->panelInit->nLowAndVersion ){
			return array("error"=>"androidNotCompatible","low"=> $this->panelInit->lowAndVersion);
		}

		if( \Input::has('nLowIosVersion') AND \Input::get('nLowIosVersion') < $this->panelInit->nLowiOsVersion ){
			return array("error"=>"iosNotCompatible","low"=> $this->panelInit->lowiOsVersion);
		}

		$toReturn['stats'] = array();
		$toReturn['stats']['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->count();
		$toReturn['stats']['students'] = \User::where('role','student')->where('activated',1)->count();
		$toReturn['stats']['teachers'] = \User::where('role','teacher')->where('activated',1)->count();
		$toReturn['stats']['newMessages'] = \messages_list::where('userId',$this->data['users']->id)->where('messageStatus',1)->count();

		$toReturn['messages'] = \DB::select(\DB::raw("SELECT messages_list.id as id,messages_list.lastMessageDate as lastMessageDate,messages_list.lastMessage as lastMessage,messages_list.messageStatus as messageStatus,users.fullName as fullName,users.id as userId FROM messages_list LEFT JOIN users ON users.id=IF(messages_list.userId = '".$this->data['users']->id."',messages_list.toId,messages_list.userId) where userId='".$this->data['users']->id."' order by id DESC limit 5" ));

		$toReturn['attendanceModel'] = $this->data['panelInit']->settingsArray['attendanceModel'];
		if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject"){
			$subjects = \subject::get();
			foreach ($subjects as $subject) {
				$toReturn['subjects'][$subject->id] = $subject->subjectTitle ;
			}
		}

		$startTime = time() - (15*60*60*24);
		$endTime = time() + (15*60*60*24);
		if($this->data['users']->role == "student"){
			$attendanceArray = \attendance::where('studentId',$this->data['users']->id)->where('date','>=',$startTime)->where('date','<=',$endTime)->get();
			foreach ($attendanceArray as $value) {
				$toReturn['studentAttendance'][] = array("date"=>$this->panelInit->unix_to_date($value->date),"status"=>$value->status,"subject"=>isset($toReturn['subjects'][$value->subjectId])?$toReturn['subjects'][$value->subjectId]:"" ) ;
			}
		}elseif($this->data['users']->role == "parent"){
			if($this->data['users']->parentOf != ""){
				$parentOf = json_decode($this->data['users']->parentOf,true);
				if(!is_array($parentOf)){
					$parentOf = array();
				}
				$ids = array();
				foreach($parentOf as $value){
					$ids[] = $value['id'];
				}

				if(count($ids) > 0){
					$studentArray = \User::where('role','student')->whereIn('id',$ids)->get();
					foreach ($studentArray as $stOne) {
						$students[$stOne->id] = array('name'=>$stOne->fullName,'studentRollId'=>$stOne->studentRollId);
					}

					$attendanceArray = \attendance::whereIn('studentId',$ids)->where('date','>=',$startTime)->where('date','<=',$endTime)->get();
					foreach ($attendanceArray as $value) {
						if(!isset($toReturn['studentAttendance'][$value->studentId])){
							$toReturn['studentAttendance'][$value->studentId]['n'] = $students[$value->studentId];
							$toReturn['studentAttendance'][$value->studentId]['d'] = array();
						}
						$toReturn['studentAttendance'][$value->studentId]['d'][] = array("date"=>$this->panelInit->unix_to_date($value->date),"status"=>$value->status,"subject"=>$value->subjectId);
					}
				}
			}
		}

		$toReturn['teacherLeaderBoard'] = \User::where('role','teacher')->where('isLeaderBoard','!=','')->where('isLeaderBoard','!=','0')->get()->toArray();
		$toReturn['studentLeaderBoard'] = \User::where('role','student')->where('isLeaderBoard','!=','')->where('isLeaderBoard','!=','0')->get()->toArray();

		$toReturn['newsEvents'] = array();
		$newsboard = \newsboard::where('newsFor',$this->data['users']->role)->orWhere('newsFor','all')->orderBy('id','desc')->limit(5)->get();
		foreach ($newsboard as $event ) {
			$eventsArray['id'] =  $event->id;
			$eventsArray['title'] =  $event->newsTitle;
			$eventsArray['type'] =  "news";
	    	$eventsArray['start'] = $this->panelInit->unix_to_date($event->newsDate);
	    	$toReturn['newsEvents'][] = $eventsArray;
		}

		$events = \events::orderBy('id','desc')->where('eventFor',$this->data['users']->role)->orWhere('eventFor','all')->limit(5)->get();
		foreach ($events as $event ) {
	    	$eventsArray['id'] =  $event->id;
			$eventsArray['title'] =  $event->eventTitle;
			$eventsArray['type'] =  "event";
		    $eventsArray['start'] = $this->panelInit->unix_to_date($event->eventDate);
		    $toReturn['newsEvents'][] = $eventsArray;
		}

		$toReturn['academicYear'] = \academic_year::get()->toArray();

		$toReturn['baseUser'] = array("id"=>$this->data['users']->id,"fullName"=>$this->data['users']->fullName,"username"=>$this->data['users']->username);

		$polls = \polls::where('pollTarget',$this->data['users']->role)->orWhere('pollTarget','all')->where('pollStatus','1');
		if($polls->count() > 0){
			$polls = $polls->first();
			$toReturn['polls']['title'] = $polls->pollTitle;
			$toReturn['polls']['id'] = $polls->id;
			$toReturn['polls']['view'] = "vote";
			$userVoted = json_decode($polls->userVoted,true);
			if(is_array($userVoted) AND in_array($this->data['users']->id,$userVoted)){
				$toReturn['polls']['voted'] = true;
				$toReturn['polls']['view'] = "results";
			}
			$toReturn['polls']['items'] = json_decode($polls->pollOptions,true);
			$toReturn['polls']['totalCount'] = 0;
			if(is_array($toReturn['polls']['items']) AND count($toReturn['polls']['items']) > 0){
				foreach($toReturn['polls']['items'] as $key => $value){
					if(isset($value['count'])){
						$toReturn['polls']['totalCount'] += $value['count'];
					}
					if(!isset($toReturn['polls']['items'][$key]['prec'])){
						$toReturn['polls']['items'][$key]['prec'] = 0;
					}
				}
			}

		}

		return json_encode($toReturn);
	}

	public function pay($id){
		$return = array();
		$return['payment'] = \payments::where('id',$id);
		if($return['payment']->count() == 0){
			exit;
		}
		$return['payment'] = $return['payment']->first()->toArray();

		\Session::set('returnView', \Input::get('return'));

		$amountTax = ($this->panelInit->settingsArray['paymentTax']*$return['payment']['paymentDiscounted']) /100;
		$totalWithTax = $return['payment']['paymentDiscounted'] + $amountTax;
		$pendingAmount = $totalWithTax - $return['payment']['paidAmount'];
		if($return['payment']['dueDate'] < time()){
			$pendingAmount =$pendingAmount + $return['payment']['fine_amount'];
		}

		if(\Input::get('payVia') == "eazypay"){
			if(
				$this->panelInit->settingsArray['eazypayEnabled'] != 1 || !isset($this->panelInit->settingsArray['enc_key']) ||
				$this->panelInit->settingsArray['enc_key'] == "" || !isset($this->panelInit->settingsArray['merch_id']) ||
				$this->panelInit->settingsArray['merch_id'] == "" || !isset($this->panelInit->settingsArray['returnUrl']) ||
				$this->panelInit->settingsArray['returnUrl'] == "" ){
				exit;
			}

			$app_type_number = get_server_info()['server_type'] . '_' . env('APP_TYPE');
			$encryption_key=$this->panelInit->settingsArray['enc_key']; // AES KEY
			$merchent_id=$this->panelInit->settingsArray['merch_id'];  //ICID
			$sub_merchent_id=$this->generateRandomString(); // UNIQUE REF NO 1
			$amt=$pendingAmount;               // AMOUNT
			$student_id=$return['payment']['paymentStudent'];   // ANY COLUMN ADDED
			// path any data to payment response here
			$reference_no=$id.'-'.$this->data['users']->id.'-'.$this->generateRandomString().'-'.$app_type_number;
			$payment_id=$return['payment']['paymentUniqid'];   // ANY COLUMN ADDED
			$parentInfo = [];
			$parents = \User::where('role','parent')->select('id','parentOf','fullName','phoneNo')->where('parentOf','LIKE','%"id":'.$student_id.'%')->get()->toArray();
			foreach ($parents as $key => $value) {
				$value['parentOf'] = json_decode($value['parentOf'],true);
				foreach ($value['parentOf'] as $key_ => $value_) {
					if($value_['id'] == $student_id){
						$parentInfo[] = array(
							"parent"=>$value['fullName'],"relation"=>$value_['relation'],"id"=>$value['id'],
							"phoneNo"=>$value['phoneNo']
						);
					}
				}
			}
			$return['parentInfo'] = $parentInfo;

			$mobile_no = $parentInfo[0]['phoneNo'];
			if($mobile_no == '') {
				$mobile_no = "9470308057";
			}

			// $mobile_no=$this->data['users']->phoneNo; // MOBILE NO
			// $mobile_no="9470308057"; // MOBILE NO
			//$email_id= $this->data['users']->email; // MOBILE NO
			$email_id= "sagar@virtu.co.in";
			$return_url=$this->panelInit->settingsArray['returnUrl']; // RETURN URL LIVE PATH
			if(get_server_info()['server_type'] == 'dev') {
				$return_url = 'https://dev.cutebrains.com/invoices/pay/success-multi-pay';
			}
			$return_url_enc=$this->encrypt($return_url,$encryption_key);
			$first_part=$reference_no."|".$sub_merchent_id."|".$amt."|".$mobile_no."|".$email_id; // ALL ARE PIPE SEPERETED
			$first_part_enc=$this->encrypt($first_part,$encryption_key);
			$reference_no_enc=$this->encrypt($reference_no,$encryption_key);
			$sub_merchent_id_enc=$this->encrypt($sub_merchent_id,$encryption_key);
			$amt_enc=$this->encrypt($amt,$encryption_key);
			$paymode=9; // PAYMENT MODE
			$paymode_enc=$this->encrypt($paymode,$encryption_key); // ALL WILL BE ENCRYPTED FORMAT

			$gateway_url_enc='https://eazypay.icicibank.com/EazyPG?merchantid='.$merchent_id.
				'&mandatory fields='.$first_part_enc.
				'&optional fields=&returnurl='.$return_url_enc.
				'&Reference No='.$reference_no_enc.
				'&submerchantid='.$sub_merchent_id_enc.
				'&transaction amount='.$amt_enc.
				'&paymode='.$paymode_enc;
			$gateway_url='https://eazypay.icicibank.com/EazyPG?merchantid='.$merchent_id.'&mandatory fields='.$first_part.'&optional fields=&returnurl='.$return_url.'&Reference No='.$reference_no.'&submerchantid='.$sub_merchent_id.'&transaction amount='.$amt.'&paymode='.$paymode;
			//echo "non encrypted url <br/>".$gateway_url;

			return \Redirect::to($gateway_url_enc);
		}

		if(\Input::get('payVia') == "paypal"){
			if($this->panelInit->settingsArray['paypalEnabled'] != 1 || !isset($this->panelInit->settingsArray['paypalPayment']) ||$this->panelInit->settingsArray['paypalPayment'] == ""){
				exit;
			}

		    $query = array();
			$query['cmd'] = '_xclick';
			$query['item_number'] = $id;
			$query['item_name'] = $return['payment']['paymentTitle'];
			$query['amount'] = $pendingAmount;
			$query['rm'] = '2';
		    $query['currency_code'] = $this->panelInit->settingsArray['currency_code'];
		    $query['business'] = $this->panelInit->settingsArray['paypalPayment'];
			$query['return'] = \URL::to('/invoices/paySuccess/'.$id);
		    $query['cancel_return'] = \URL::to('/invoices/payFailed');

		    // Prepare query string
		    $query_string = http_build_query($query);

			return \Redirect::to('https://www.paypal.com/cgi-bin/webscr?' . $query_string);
		}

		if(\Input::get('payVia') == "2co"){
			if($this->panelInit->settingsArray['2coEnabled'] != 1 || !isset($this->panelInit->settingsArray['twocheckoutsid']) || $this->panelInit->settingsArray['twocheckoutsid'] == "" || !isset($this->panelInit->settingsArray['twocheckoutHash']) ||$this->panelInit->settingsArray['twocheckoutHash'] == ""){
				exit;
			}
			?>
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
			<html><head></head><body></div>
			<script>
			    var form = document.createElement("form"); form.setAttribute("method", "post");
			    form.setAttribute("action", "https://www.2checkout.com/checkout/purchase");

			    params = {'sid':'<?php echo $this->panelInit->settingsArray['twocheckoutsid']; ?>','mode':'2CO','li_0_type':'product','li_0_name':'<?php echo $return['payment']['paymentTitle']; ?>','li_0_quantity':1,'li_0_price':'<?php echo number_format($pendingAmount,2,".",false); ?>','li_0_tangible':'N','merchant_order_id':'<?php echo $return['payment']['id']; ?>','x_receipt_link_url':'<?php echo \URL::to('/invoices/paySuccess/'.$id); ?>'};
			    for(var key in params) { if(params.hasOwnProperty(key)) { var hiddenField = document.createElement("input"); hiddenField.setAttribute("type", "hidden"); hiddenField.setAttribute("name", key); hiddenField.setAttribute("value", params[key]); form.appendChild(hiddenField); } }
				document.body.appendChild(form); form.submit();
			</script></body></html>
			<?php
		}

		if(\Input::get('payVia') == "payumoney"){
			if($this->panelInit->settingsArray['payumoneyEnabled'] != 1 || !isset($this->panelInit->settingsArray['payumoneyKey']) || $this->panelInit->settingsArray['payumoneyKey'] == "" || !isset($this->panelInit->settingsArray['payumoneySalt']) ||$this->panelInit->settingsArray['payumoneySalt'] == ""){
				exit;
			}
			$key = $this->panelInit->settingsArray['payumoneyKey'];
			$txid = substr(hash('sha256', mt_rand() . microtime()), 0, 20);
			$productinfo = $return['payment']['paymentTitle'];
			$firstname = $this->data['users']->fullName;
			$email = $this->data['users']->email;
			$pendingAmount = number_format($pendingAmount, 2, '.', '');
			$hash_string = hash('sha512', $key."|".$txid."|".$pendingAmount."|".$productinfo."|".$firstname."|".$email."|".$id.'||||||||||'.$this->panelInit->settingsArray['payumoneySalt']);
			?>
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
			<html><head></head><body></div>
			<script>
			    var form = document.createElement("form"); form.setAttribute("method", "post");
			    form.setAttribute("action", "https://test.payu.in/_payment");

			    params = {'key':'<?php echo $key; ?>','txnid':'<?php echo $txid; ?>','hash':'<?php echo $hash_string; ?>','amount':'<?php echo $pendingAmount; ?>','firstname':'<?php echo $firstname; ?>','email':'<?php echo $email; ?>','phone':'<?php echo $this->data['users']->mobileNo; ?>','productinfo':'<?php echo $productinfo; ?>','surl':'<?php echo \URL::to('/invoices/paySuccess/'.$id); ?>','furl':'<?php echo \URL::to('/invoices/payFailed'); ?>','service_provider':'payu_paisa','udf1':'<?php  echo $id; ?>'};
			    for(var key in params) { if(params.hasOwnProperty(key)) { var hiddenField = document.createElement("input"); hiddenField.setAttribute("type", "hidden"); hiddenField.setAttribute("name", key); hiddenField.setAttribute("value", params[key]); form.appendChild(hiddenField); } }
				document.body.appendChild(form); form.submit();
			</script></body></html>
			<?php
		}
	}

	public function multiPay() {
		$return = array();

		if(is_null(request()->input('invoice_ids_jsonstr')) || empty(request()->input('invoice_ids_jsonstr'))) {
			echo 'Invalid invoice ids, please try again later.';
			exit;
		}

		$invoice_ids = json_decode(request()->input('invoice_ids_jsonstr'));
		$payments = \payments::whereIn('id', $invoice_ids);

		if(count($invoice_ids) != $payments->count()){
			echo 'Invalid invoice length, please try again later.';
			exit;
		}

		$payments = $payments->get()->toArray();

		$paid_amounts_array = [];
		$total_amount = 0;
		foreach ($payments as $key => $invoice) {
			$amountTax = ($this->panelInit->settingsArray['paymentTax'] * $invoice['paymentDiscounted']) /100;
			$totalWithTax = $invoice['paymentDiscounted'] + $amountTax;
			$pendingAmount = $totalWithTax - $invoice['paidAmount'];
			if($invoice['dueDate'] < time()){
				$pendingAmount = $pendingAmount + $invoice['fine_amount'];
			}
			$paid_amounts_array[$invoice['id']] = $pendingAmount;
			$total_amount += $pendingAmount;
		}

		if(\Input::get('payVia') == "eazypay"){
			if(
				$this->panelInit->settingsArray['eazypayEnabled'] != 1 || !isset($this->panelInit->settingsArray['enc_key']) ||
				$this->panelInit->settingsArray['enc_key'] == "" || !isset($this->panelInit->settingsArray['merch_id']) ||
				$this->panelInit->settingsArray['merch_id'] == "" || !isset($this->panelInit->settingsArray['returnUrl']) ||
				$this->panelInit->settingsArray['returnUrl'] == "" ){
				exit;
			}

			$store_invoice_ids = array_keys($paid_amounts_array);
			$store_paid_amounts = array_values($paid_amounts_array);

			// store multi invoices to invoice table
			$payment_multi_invoice = new \App\Models2\PaymentMultiInvoice;
			$payment_multi_invoice->invoice_ids = json_encode($store_invoice_ids);
			$payment_multi_invoice->payment_amounts =  json_encode($store_paid_amounts);
			$payment_multi_invoice->status = 0; // not paid yet
			$payment_multi_invoice->save();

			$current_invoice_collection_id = $payment_multi_invoice->id;

			$app_type_number = get_server_info()['server_type'] . '_' . env('APP_TYPE');
			$encryption_key = $this->panelInit->settingsArray['enc_key']; // AES KEY
			$merchent_id = $this->panelInit->settingsArray['merch_id'];  //ICID
			$sub_merchent_id = $this->generateRandomString(); // UNIQUE REF NO 1
			$amt = $total_amount;

			$reference_no=$current_invoice_collection_id.'-'.$this->data['users']->id.'-'.'multi'.'-'.$app_type_number;
			$mobile_no="9470308057"; // MOBILE NO
			$email_id= "sagar@virtu.co.in";
			$first_part=$reference_no."|".$sub_merchent_id."|".$amt."|".$mobile_no."|".$email_id; // ALL ARE PIPE SEPERETED
			$return_url=$this->panelInit->settingsArray['returnUrl']; // RETURN URL LIVE PATH
			$paymode=9; // PAYMENT MODE

			$first_part_enc=$this->encrypt($first_part,$encryption_key);
			$reference_no_enc=$this->encrypt($reference_no,$encryption_key);
			$sub_merchent_id_enc=$this->encrypt($sub_merchent_id,$encryption_key);
			$return_url_enc=$this->encrypt($return_url,$encryption_key);
			$amt_enc=$this->encrypt($amt,$encryption_key);
			$paymode_enc=$this->encrypt($paymode,$encryption_key);

			$gateway_url_enc='https://eazypay.icicibank.com/EazyPG?merchantid='.$merchent_id.
				'&mandatory fields='.$first_part_enc.
				'&optional fields'.
				'&returnurl='.$return_url_enc.
				'&Reference No='.$reference_no_enc.
				'&submerchantid='.$sub_merchent_id_enc.
				'&transaction amount='.$amt_enc.
				'&paymode='.$paymode_enc;

			$gateway_url='https://eazypay.icicibank.com/EazyPG?merchantid='.$merchent_id.
				'&mandatory fields='.$first_part.
				'&optional fields'.
				'&returnurl='.$return_url.
				'&Reference No='.$reference_no.
				'&submerchantid='.$sub_merchent_id.
				'&transaction amount='.$amt.
				'&paymode='.$paymode;

			return \Redirect::to($gateway_url_enc);
		}
	}

	public function paySuccess($id = ""){

		if(\Session::has('returnView') && \Session::get('returnView') == "accountSettings"){
			$returnUrl = '/#/account/invoices';
		}else{
			$returnUrl = '/#/invoices';
		}

		if(\Input::has('verify_sign')){

			$vrf = file_get_contents('https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate', false, stream_context_create(array(
					'http' => array(
					    'header'  => "Content-type: application/x-www-form-urlencoded\r\nUser-Agent: MyAPP 1.0\r\n",
					    'method'  => 'POST',
					    'content' => http_build_query($_POST)
					)
					)));
			if ( $vrf == 'VERIFIED' ) {
				$collectionAmount = \Input::get('mc_gross');
				$collectionMethod = "Paypal";
				$collectionNote = "Payer E-mail: ".\Input::get('payer_email').", Payer ID:".\Input::get('payer_id');
			}else{
				return \Redirect::to($returnUrl);
			}
		}

		if($id == "" AND \Input::get('merchant_order_id')){
			$id = \Input::get('merchant_order_id');
			$return['payment'] = \payments::where('id',\Input::get('merchant_order_id'));
			if($return['payment']->count() == 0){
				exit;
			}
			$return['payment'] = $return['payment']->first()->toArray();

			$amountTax = ($this->panelInit->settingsArray['paymentTax']*$return['payment']['paymentDiscounted']) /100;
			$totalWithTax = $return['payment']['paymentDiscounted'] + $amountTax;
			$pendingAmount = $totalWithTax - $return['payment']['paidAmount'];

			//Start Cal
			$totalAmount = number_format($pendingAmount,2,".",false);
			$hashSecretWord = $this->panelInit->settingsArray['twocheckoutHash'];
			$hashSid = $this->panelInit->settingsArray['twocheckoutsid'];
			$hashTotal = $totalAmount; //Sale total to validate against
			$hashOrder = \Input::get('order_number'); //2Checkout Order Number
			$StringToHash = strtoupper(md5($hashSecretWord . $hashSid . $hashOrder . $hashTotal));

			if ($StringToHash == \Input::get('key')) {
				$collectionAmount = \Input::get('total');
				$collectionMethod = "2CheckOut";
				$collectionNote = "Order Number: ".\Input::get('order_number').", Invoice ID:".\Input::get('invoice_id').", Card Holder Name:".\Input::get('card_holder_name');
			}else{
				return \Redirect::to($returnUrl);
			}
		}

		if(\Input::get('txnid')){
			$status	= \Input::get('status');
			$firstname = \Input::get('firstname');
			$amount = \Input::get('amount');
			$txnid = \Input::get('txnid');
			$posted_hash = \Input::get('hash');
			$key = \Input::get('key');
			$productinfo = \Input::get('productinfo');
			$email = \Input::get('email');
			$salt = $this->panelInit->settingsArray['payumoneySalt'];

			if(\Input::has('additionalCharges')){
				$retHashSeq = \Input::get('additionalCharges').'|'.$salt.'|'.$status.'||||||||||'.$id.'|'.$email.'|'.$firstname.'|'.$productinfo.'|'.$amount.'|'.$txnid.'|'.$key;
			}else{
				$retHashSeq = $salt.'|'.$status.'||||||||||'.$id.'|'.$email.'|'.$firstname.'|'.$productinfo.'|'.$amount.'|'.$txnid.'|'.$key;
			}

			$hash = hash("sha512", $retHashSeq);

			if ($hash == $posted_hash) {

				$collectionAmount = $amount;
				$collectionMethod = "PayUmoney";
				$collectionNote = "Transaction ID: ".$txnid;

			}else {
				return \Redirect::to($returnUrl);
			}
		}

		if(isset($collectionAmount) AND isset($collectionMethod) AND isset($collectionNote)){
			$payments = \payments::where('id',$id);
			if($payments->count() == 0){
				return;
			}
			$payments = $payments->first();

			$amountTax = ($this->panelInit->settingsArray['paymentTax']*$payments->paymentDiscounted) /100;
			$totalWithTax = $payments->paymentDiscounted + $amountTax;
			$pendingAmount = $totalWithTax - $payments->paidAmount;

			$paymentsCollection = new \paymentsCollection();
			$paymentsCollection->invoiceId = $id;
			$paymentsCollection->collectionAmount = $collectionAmount;
			$paymentsCollection->collectionDate = time();
			$paymentsCollection->collectionMethod = $collectionMethod;
			$paymentsCollection->collectionNote = $collectionNote;
			$paymentsCollection->collectedBy = $this->data['users']->id;
			$paymentsCollection->save();

			$payments->paidAmount = $payments->paidAmount+$paymentsCollection->collectionAmount;
			if($payments->paidAmount >= $totalWithTax){
				$payments->paymentStatus = 1;
			}else{
				$payments->paymentStatus = 2;
			}
			$payments->paidMethod = $collectionMethod;
			$payments->paidTime = time();
			$payments->save();

			return \Redirect::to($returnUrl);
		}
	}

	public function payFailed(){
		if(\Session::has('returnView') && \Session::get('returnView') == "accountSettings"){
			$returnUrl = '/#/account/invoices';
		}else{
			$returnUrl = '/#/invoices';
		}

		return \Redirect::to($returnUrl);
	}

	public function changeAcYear(){
		\Session::put('selectAcYear', \Input::get('year'));
		return "1";
	}

	public function profileImage($id){
		$uploads_file_path = uploads_config()['uploads_file_path'];

		header('Content-Type: image/jpeg');

		if(file_exists($uploads_file_path . '/profile/profile_'.$id.'.jpg')){
			echo file_get_contents($uploads_file_path . '/profile/profile_'.$id.'.jpg');
		} else if(User::where('id', $id)->first()->count()) {
			$custom_photo = User::where('id', $id)->first()->photo;
			if(file_exists($uploads_file_path . '/profile/'.$custom_photo) && !empty($custom_photo)){
				echo file_get_contents($uploads_file_path . '/profile/'.$custom_photo);
			} else {
				echo file_get_contents($uploads_file_path . '/profile/user.png');
			}
		}
		echo file_get_contents($uploads_file_path . '/profile/user.png');
		exit;
	}

	public function classesList($academicYear = ""){
		$toReturn = array();
		$classesList = array();

		if($academicYear == ""){
			if(!\Input::has('academicYear')){
				return $classesList;
			}
			$academicYear = \Input::get('academicYear');
		}

		if(is_array($academicYear)){
			$classesList = \classes::whereIn('classAcademicYear',$academicYear)->get()->toArray();
		}else{
			$classesList = \classes::where('classAcademicYear',$academicYear)->get()->toArray();
		}
		$toReturn['classes'] = $classesList;

		$classesListIds = array();
		foreach($classesList as $value){
			$classesListIds[] = $value['id'];
		}

		$sectionsList = array();
		if(count($classesListIds) > 0){
			$sections = \sections::whereIn('classId',$classesListIds)->get()->toArray();
			foreach($sections as $value){
				$sectionsList[$value['classId']][] = $value;
			}
		}
		$toReturn['sections'] = $sectionsList;

		return $toReturn;
	}

	public function sectionsSubjectsList($classes = ""){
		$toReturn = array();
		$toReturn['sections'] = $this->sectionsList($classes);
		$toReturn['subjects'] = $this->subjectList($classes);
		return $toReturn;
	}

	public function sectionsList($classes = ""){
		$sectionsList = array();

		if($classes == ""){
			if(!\Input::has('classes')){
				return $sectionsList;
			}
			$classes = \Input::get('classes');
		}

		if(is_array($classes)){
			return \sections::whereIn('classId',$classes)->get()->toArray();
		}else{
			return \sections::where('classId',$classes)->get()->toArray();
		}
	}

	public function subjectList($classes = ""){
		$subjectList = array();
		$classesCount = 1;

		if($classes == ""){
			$classes = \Input::get('classes');

			if(!\Input::has('classes')){
				return $subjectList;
			}

		}

		if(is_array($classes)){
			$classes = \classes::whereIn('id',$classes);
			$classesCount = $classes->count();
		}else{
			$classes = \classes::where('id',$classes);
		}

		$classes = $classes->get()->toArray();

		foreach($classes as $value){
			$value['classSubjects'] = Main::getSubjectIdsByClassId($value['id']);
			if(is_array($value['classSubjects'])){
				foreach($value['classSubjects'] as $value2){
					$subjectList[] = $value2;
				}
			}
		}

		if($classesCount == 1){
			$finalClasses = $subjectList;
		}else{
			$subjectList = array_count_values($subjectList);

			$finalClasses = array();
			foreach($subjectList as $key => $value){
				if($value == $classesCount){
					$finalClasses[] = $key;
				}
			}
		}

		if(count($finalClasses) > 0){
			if($this->data['users']->role == "teacher"){
				$subject_ids = Main::getSubjectsIdsByTeacherId($this->data['users']->id);
				return \subject::whereIn('id', $subject_ids)
					->whereIn('id',$finalClasses)
					->get()->toArray();
			}else{
				return \subject::whereIn('id',$finalClasses)->get()->toArray();
			}
		}

		return array();
	}

	public function savePolls(){
		$toReturn = array();

		$polls = \polls::where('pollTarget',$this->data['users']->role)->orWhere('pollTarget','all')->where('pollStatus','1')->where('id',\Input::get('id'));
		if($polls->count() > 0){
			$polls = $polls->first();
			$userVoted = json_decode($polls->userVoted,true);
			if(!is_array($userVoted)){
				$userVoted = array();
			}
			if(is_array($userVoted) AND in_array($this->data['users']->id,$userVoted)){
				return json_encode(array("jsTitle"=>$this->panelInit->language['votePoll'],"jsMessage"=>$this->panelInit->language['alreadyvoted']));
				exit;
			}
			$userVoted[] = $this->data['users']->id;
			$polls->userVoted = json_encode($userVoted);

			$toReturn['polls']['items'] = json_decode($polls->pollOptions,true);
			$toReturn['polls']['totalCount'] = 0;
			foreach($toReturn['polls']['items'] as $key => $value){
				if($value['title'] == \Input::get('selected')){
					if(!isset($toReturn['polls']['items'][$key]['count'])) $toReturn['polls']['items'][$key]['count'] = 0;
					$toReturn['polls']['items'][$key]['count']++;
				}
				if(isset($toReturn['polls']['items'][$key]['count'])){
					$toReturn['polls']['totalCount'] += $toReturn['polls']['items'][$key]['count'];
				}
			}
			reset($toReturn['polls']['items']);
			foreach($toReturn['polls']['items'] as $key => $value){
				if(isset($toReturn['polls']['items'][$key]['count'])){
					$toReturn['polls']['items'][$key]['perc'] = round(($toReturn['polls']['items'][$key]['count'] * 100) / $toReturn['polls']['totalCount'],2);
				}
			}
			$polls->pollOptions = json_encode($toReturn['polls']['items']);
			$polls->save();

			$toReturn['polls']['title'] = $polls->pollTitle;
			$toReturn['polls']['id'] = $polls->id;
			$toReturn['polls']['view'] = "results";
			$toReturn['polls']['voted'] = true;
		}

		return $toReturn['polls'];
		exit;
	}


	public function calender()
	{
		$daysArray['start'] = $this->panelInit->date_to_unix(\Input::get('start'),'d-m-Y');
		$daysArray['end'] = $this->panelInit->date_to_unix(\Input::get('end'),'d-m-Y');

		$toReturn = array();
		$role = $this->data['users']->role;

		if($this->data['users']->role == "admin"){
			// $assignments = \assignments::where('AssignDeadLine','>=',$daysArray['start'])
			// ->where('AssignDeadLine','<=',$daysArray['end'])->get();
		}elseif($this->data['users']->role == "teacher"){
			$assignments = \assignments::where('AssignDeadLine','>=',$daysArray['start'])
			->where('AssignDeadLine','<=',$daysArray['end'])->where('teacherId',$this->data['users']->id)->get();
		}elseif($this->data['users']->role == "student"){
			$assignments = \assignments::where('AssignDeadLine','>=',$daysArray['start'])
			->where('AssignDeadLine','<=',$daysArray['end'])->where('classId','like','%"'.$this->data['users']->studentClass.'"%')->get();
		}
		if(isset($assignments)){
			foreach ($assignments as $event ) {
				$eventsArray['id'] =  "ass".$event->id;
				$eventsArray['title'] = $this->panelInit->language['Assignments']." : ".$event->AssignTitle;
				$eventsArray['start'] = $this->panelInit->unix_to_date($event->AssignDeadLine,'d-m-Y');
			    $eventsArray['date'] = $this->panelInit->unix_to_date($event->AssignDeadLine);
			    $eventsArray['backgroundColor'] = 'green';
			    $eventsArray['textColor'] = '#fff';
				$eventsArray['url'] = "portal#assignments";
			    $eventsArray['allDay'] = true;
			    $toReturn[] = $eventsArray;
			}
		}

		if($this->data['users']->role == "admin"){
			// $homeworks = \homeworks::where('homeworkSubmissionDate','>=',$daysArray['start'])
			//   ->where('homeworkSubmissionDate','<=',$daysArray['end'])->get();
		}elseif($this->data['users']->role == "teacher"){
			$homeworks = \homeworks::where('homeworkSubmissionDate','>=',$daysArray['start'])
			  ->where('homeworkSubmissionDate','<=',$daysArray['end'])->where('teacherId',$this->data['users']->id)->get();
		}elseif($this->data['users']->role == "student"){
			$homeworks = \homeworks::where('homeworkSubmissionDate','>=',$daysArray['start'])
			  ->where('homeworkSubmissionDate','<=',$daysArray['end'])->where('classId','like','%"'.$this->data['users']->studentClass.'"%')->get();
		}
		if(isset($homeworks)){
			foreach ($homeworks as $event ) {
				$eventsArray['id'] =  "hw".$event->id;
				$eventsArray['title'] = $this->panelInit->language['Homework']." : ".$event->homeworkTitle;
				$eventsArray['start'] = $this->panelInit->unix_to_date($event->homeworkSubmissionDate,'d-m-Y');
			    $eventsArray['date'] = $this->panelInit->unix_to_date($event->homeworkSubmissionDate);
			    $eventsArray['backgroundColor'] = '#539692';
			    $eventsArray['textColor'] = '#fff';
				$eventsArray['url'] = "portal#homework";
			    $eventsArray['allDay'] = true;
			    $toReturn[] = $eventsArray;
			}
		}


		if (!Cache::has('events_dashboardController_405458')) {
			$events = \events::where(function($query) use ($role){
				$query = $query->where('eventFor',$role)->orWhere('eventFor','all');
			})->where('eventDate','>=',$daysArray['start'])->where('eventDate','<=',$daysArray['end'])->get();
			Cache::put('events_dashboardController_405458', $events, $this->cache_minutes);
		} else {
			$events = Cache::get('events_dashboardController_405458');
		}

		foreach ($events as $event ) {
			$eventsArray['id'] =  "eve".$event->id;
			$eventsArray['title'] = $this->panelInit->language['events']." : ".$event->eventTitle;
			$eventsArray['start'] = $this->panelInit->unix_to_date($event->eventDate,'d-m-Y');
		    $eventsArray['date'] = $this->panelInit->unix_to_date($event->eventDate);
		    $eventsArray['backgroundColor'] = 'blue';
			$eventsArray['url'] = "portal#events/".$event->id;
		    $eventsArray['textColor'] = '#fff';
		    $eventsArray['allDay'] = true;
		    $toReturn[] = $eventsArray;
		}

		if($this->data['users']->role == "admin"){
			// $examsList = \exams_list::where('examDate','>=',$daysArray['start'])->where('examDate','<=',$daysArray['end']);
		} else if($this->data['users']->role == "student"){
			$examsList = $examsList->where('examClasses','LIKE','%"'.$this->data['users']->studentClass.'"%');
		} else {
			$examsList = \exams_list::where('examDate','>=',$daysArray['start'])->where('examDate','<=',$daysArray['end']);
		}
		if(isset($examsList)) {
			$examsList = $examsList->get();
			foreach ($examsList as $event ) {
				$eventsArray['id'] =  "exam".$event->id;
				$eventsArray['title'] = $this->panelInit->language['examName']." : ".$event->examTitle;
				$eventsArray['start'] = $this->panelInit->unix_to_date($event->examDate,'d-m-Y');
			    $eventsArray['date'] = $this->panelInit->unix_to_date($event->examDate);
			    $eventsArray['backgroundColor'] = 'red';
				$eventsArray['url'] = "portal#examsList";
			    $eventsArray['textColor'] = '#fff';
			    $eventsArray['allDay'] = true;
			    $toReturn[] = $eventsArray;
			}
		}

		if (!Cache::has('newsboard_dashboardController_0345645')) {
			$newsboard = \newsboard::where(function($query) use ($role){
				$query = $query->where('newsFor',$role)->orWhere('newsFor','all');
			})->where('newsDate','>=',$daysArray['start'])->where('newsDate','<=',$daysArray['end'])->get();
			Cache::put('newsboard_dashboardController_0345645', $newsboard, $this->cache_minutes);
		} else {
			$newsboard = Cache::get('newsboard_dashboardController_0345645');
		}

		foreach ($newsboard as $event ) {
			$eventsArray['id'] =  "news".$event->id;
			$eventsArray['title'] =  $this->panelInit->language['newsboard']." : ".$event->newsTitle;
			$eventsArray['start'] = $this->panelInit->unix_to_date($event->newsDate,'d-m-Y');
		    $eventsArray['date'] = $this->panelInit->unix_to_date($event->newsDate);
			$eventsArray['url'] = "portal#newsboard/".$event->id;
		    $eventsArray['backgroundColor'] = 'white';
		    $eventsArray['textColor'] = '#000';
		    $eventsArray['allDay'] = true;
		    $toReturn[] = $eventsArray;
		}

		if($this->data['users']->role == "admin"){
			// $onlineExams = \online_exams::where('examDate','>=',$daysArray['start'])->where('examDate','<=',$daysArray['end'])->get();
		}elseif($this->data['users']->role == "teacher"){
			$onlineExams = \online_exams::where('examDate','>=',$daysArray['start'])->where('examDate','<=',$daysArray['end'])->where('examTeacher',$this->data['users']->id)->get();
		}elseif($this->data['users']->role == "student"){
			$onlineExams = \online_exams::where('examDate','>=',$daysArray['start'])->where('examDate','<=',$daysArray['end'])->where('examClass','like','%"'.$this->data['users']->studentClass.'"%')->get();
		}
		if(isset($onlineExams)){
			foreach ($onlineExams as $event ) {
				$eventsArray['id'] =  "onl".$event->id;
				$eventsArray['title'] =  $this->panelInit->language['onlineExams']." : ".$event->examTitle;
				$eventsArray['start'] = $this->panelInit->unix_to_date($event->examDate,'d-m-Y');
			    $eventsArray['date'] = $this->panelInit->unix_to_date($event->examDate);
			    $eventsArray['backgroundColor'] = 'red';
				$eventsArray['url'] = "portal#onlineExams";
			    $eventsArray['textColor'] = '#000';
			    $eventsArray['allDay'] = true;
			    $toReturn[] = $eventsArray;
			}
		}

		$officialVacation = json_decode($this->panelInit->settingsArray['officialVacationDay']);
		foreach ($officialVacation as $date ) {
			if($date >= $daysArray['start'] AND $date <= $daysArray['end']){
				$eventsArray['id'] =  "vac".$date;
				$eventsArray['title'] =  $this->panelInit->language['nationalVacDays'];
				$eventsArray['start'] = $this->panelInit->unix_to_date($date,'d-m-Y');
				$eventsArray['date'] = $this->panelInit->unix_to_date($date);
				$eventsArray['backgroundColor'] = 'maroon';
				$eventsArray['url'] = "portal#calender";
				$eventsArray['textColor'] = '#fff';
				$eventsArray['allDay'] = true;
				$toReturn[] = $eventsArray;
			}
		}

		return $toReturn;
	}

	public function image($section,$image){
		if(!file_exists(uploads_config()['uploads_file_path'] . "/".$section."/".$image)){
			$ext = strtolower(pathinfo($image, PATHINFO_EXTENSION));
			if ($ext == "jpg" || $ext == "jpeg") {
	    	header('Content-type: image/jpg');
	    } elseif ($ext == "png") {
	      header('Content-type: image/png');
	    } elseif ($ext == "gif") {
	      header('Content-type: image/gif');
	    }
	    if($section == "profile"){
				echo file_get_contents(uploads_config()['uploads_file_path'] . "/".$section."/user.png");
			}
			if($section == "media"){
				echo file_get_contents(uploads_config()['uploads_file_path'] . "/".$section."/default.png");
			}
		}
		exit;
	}

	public function readNewsEvent($type,$id){
		if($type == "news"){
			return \newsboard::where('id',$id)->first();
		}
		if($type == "event"){
			return \events::where('id',$id)->first();
		}
	}

	public function mobNotif($id = ""){
		$toRetrun = array();

		if (!\Auth::check()){ exit; }

		$userId = $this->data['users']->id;

		if($this->data['users']->role == "admin"){
			$mobNotifications = \mob_notifications::where('notifTo','users')->where('notifToIds','LIKE','%"'.$userId.'"%')->orWhere('notifTo','all');
		}
		if($this->data['users']->role == "teacher"){
			$mobNotifications = \mob_notifications::where('notifTo','teachers')->orWhere(function($query) use($userId) {
																						        $query->where('notifTo', 'users')
																						              ->where('notifToIds','LIKE','%"'.$userId.'"%');
																						})->orWhere('notifTo','all');
		}
		if($this->data['users']->role == "parent"){
			$mobNotifications = \mob_notifications::where('notifTo','parents')->orWhere(function($query) use($userId) {
																						        $query->where('notifTo', 'users')
																						              ->where('notifToIds','LIKE','%"'.$userId.'"%');
																						})->orWhere('notifTo','all');
		}
		if($this->data['users']->role == "student"){
			$userClass = $this->data['users']->studentClass;
			$mobNotifications = \mob_notifications::where(function($query) use($userClass) {
																	        $query->where('notifTo', 'students')
																	              ->whereIn('notifToIds',array(0,$userClass));
																	})->orWhere(function($query) use($userId) {
																				        $query->where('notifTo', 'users')
																				              ->where('notifToIds','LIKE','%"'.$userId.'"%');
																				})->orWhere('notifTo','all');
		}

		if($id == "" || $id == "0"){
			$mobNotifications = $mobNotifications->select('id','notifData','notifDate')->limit(1)->orderBy('id','DESC')->limit(1)->get();
		}else{
			$mobNotifications = $mobNotifications->where('id','>',$id)->select('id','notifData','notifDate')->orderBy('id','asc')->get();
		}

		$toRetrun['notif'] = $mobNotifications;
		$toRetrun['sett'] = array(
							"c" => isset($this->data['panelInit']->settingsArray['pullAppClosed']) ? $this->data['panelInit']->settingsArray['pullAppClosed']:"",
							"m" => isset($this->data['panelInit']->settingsArray['pullAppMessagesActive']) ? $this->data['panelInit']->settingsArray['pullAppMessagesActive']:""
						);

		return $toRetrun;
	}

	public function ml_upload(){
		$image = \Input::file('file');

		if(!$this->panelInit->validate_upload($image)){
			return response()->json(['success' => false]);
		}

		$info = getimagesize( $image->getPathName() );
		if($info === false) {
            return response()->json(['success' => false,'message'=>'Not an image.'], 400);
		}

        $destinationPath = uploads_config()['uploads_file_path'] . '/ml_uploads';
       	$new_file_name = "mm_".uniqid().".".$image->getClientOriginalExtension();
       	$image_size = $image->getSize();

        if(!$image->move($destinationPath, $new_file_name)) {
            return response()->json(['success' => false,'Error saving the file.'], 400);
        }

        $mm_uploads = new \mm_uploads();
    	$mm_uploads->user_id = $this->data['users']->id;
    	$mm_uploads->file_orig_name = $image->getClientOriginalName();
    	$mm_uploads->file_uploaded_name = $new_file_name;
    	$mm_uploads->file_size = $image_size;
    	$mm_uploads->file_mime = $info['mime'];
    	$mm_uploads->file_uploaded_time = time();
    	$mm_uploads->save();

    	$mm_uploads->thumb_image = $this->generateThumb($mm_uploads->file_uploaded_name,170,127);

        return response()->json(['success' => true,'file' => $mm_uploads], 200);
	}

	public function ml_load($last_id = ""){
		$mm_uploads = new \mm_uploads;
		if($last_id != ""){
			$mm_uploads = $mm_uploads->where('id','<',$last_id);
		}
		$mm_uploads = $mm_uploads->orderBy('id','DESC')->limit('25')->get()->toArray();

		foreach ($mm_uploads as $key => $value) {
			$mm_uploads[$key]['thumb_image'] = $this->generateThumb($value['file_uploaded_name'],170,127);
		}

		return $mm_uploads;
	}

	function generateThumb($origImage,$width,$height){
		if(\File::exists(uploads_config()['uploads_file_path'] . '/ml_uploads/'.$origImage) AND $origImage != ""){

			$cached_image = uploads_config()['uploads_file_path'] . '/cache/'.$width."-".$height."-".$origImage;

			if(\File::exists($cached_image)){
				return $cached_image;
			}

			// Create a new SimpleImage object
			$image = new \claviska\SimpleImage();

			$image->fromFile( uploads_config()['uploads_file_path'] . '/ml_uploads/'.$origImage )->thumbnail($width, $height,'center')->toFile($cached_image);

			return $cached_image;
		}else{
			return "";
		}
	}
	function encrypt($str, $key) {
		$str = $this->pkcs5_pad($str);
		$iv = "fedcba9876543210";
		$td = mcrypt_module_open('rijndael-128', '', 'ecb', '');
		mcrypt_generic_init($td, $key, $iv);
		$encrypted = mcrypt_generic($td, $str);
		mcrypt_generic_deinit($td);
		mcrypt_module_close($td);
		return base64_encode($encrypted);
	}
	function pkcs5_pad ($text) {
		$blocksize = 16;
		$pad = $blocksize - (strlen($text) % $blocksize);
		return $text . str_repeat(chr($pad), $pad);
	}
	function generateRandomString($length = 6) {
    $characters = '0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
	}

	public function homeItems() {
		$user_role = Auth::user()->role;

		$items = [
			[
				'name' => 'Transport',
				'icon' => 'mdi mdi-bus',
				'link' => '/portal#/transports',
				'status' => in_array($user_role, ['admin', 'parent', 'teacher']) ? true : false
			],
			[
				'name' => 'Homework',
				'icon' => 'mdi mdi-book',
				'link' => '/portal#/homework',
				'status' => in_array($user_role, ['admin', 'parent', 'teacher', 'student']) ? true : false
			],
			[
				'name' => 'Assignment',
				'icon' => 'mdi mdi-file-pdf',
				'link' => '/portal#/assignments',
				'status' => in_array($user_role, ['admin', 'parent', 'teacher', 'student']) ? true : false
			],
			[
				'name' => 'Student Attendance',
				'icon' => 'mdi mdi-check',
				'link' => '/portal#/attendance',
				'status' => in_array($user_role, ['admin', 'teacher']) ? true : false
			],
			[
				'name' => 'Staff Attendance',
				'icon' => 'mdi mdi-check-all',
				'link' => '/portal#/staffAttendance',
				'status' => in_array($user_role, ['admin']) ? true : false
			],
			[
				'name' => 'My Attendance',
				'icon' => 'mdi mdi-check',
				'link' => '/portal#/attendanceStats',
				'status' => in_array($user_role, ['parent']) ? true : false
			],
			[
				'name' => 'Pay Fee',
				'icon' => 'fa fa-inr',
				'link' => 'portal#/pay-fee',
				'status' => in_array($user_role, ['parent']) ? true : false
			],
			[
				'name' => 'Timetable',
				'icon' => 'fa fa-calendar',
				'link' => '/portal#/classschedule',
				'status' => in_array($user_role, ['admin', 'parent', 'student']) ? true : false
			],
			[
				'name' => 'Class timetable',
				'icon' => 'fa fa-calendar',
				'link' => '/portal#/classschedule',
				'status' => in_array($user_role, ['teacher']) ? true : false
			],
			[
				'name' => 'My Timetable',
				'icon' => 'fa fa-calendar',
				'link' => '/portal#/classschedule-teacher',
				'status' => in_array($user_role, ['teacher']) ? true : false
			],
			[
				'name' => 'Library',
				'icon' => 'mdi mdi-library',
				'link' => '/portal#/library',
				'status' => in_array($user_role, ['admin', 'parent', 'teacher', 'student']) ? true : false
			],
			[
				'name' => 'Exam',
				'icon' => 'mdi mdi-playlist-check',
				'link' => '/portal#/examsList',
				'status' => in_array($user_role, ['admin', 'parent', 'teacher', 'student']) ? true : false
			],
			[
				'name' => 'Gallery',
				'icon' => 'mdi mdi-folder-multiple-image',
				'link' => '/portal#/media',
				'status' => in_array($user_role, ['admin', 'parent', 'teacher', 'student']) ? true : false
			],
			[
				'name' => 'Disciplines',
				'icon' => 'mdi mdi-gavel',
				'link' => '/portal#/disciplines',
				'status' => in_array(Auth::user()->role, ['admin', 'parent', 'teacher']) ? true : false
			],
			[
				'name' => 'Teacher logs',
				'icon' => 'mdi mdi-account-convert',
				'link' => '/portal#/teacher-logs',
				'status' => in_array(Auth::user()->role, ['admin']) ? true : false
			],
		];

		if(get_server_info()['server_type'] == 'local' || get_server_info()['server_type'] == 'dev' || get_server_info()['server_type'] == 'sxd') {
			$items[] = [
				'name' => 'Subject videos',
				'icon' => 'mdi mdi-video',
				'link' => '/portal#/subject-videos',
				'status' => in_array($user_role, ['parent', 'teacher', 'student']) ? true : false
			];
		}

		return response()->json([
			'status' => true,
			'data' => $items
		]);
	}

	public function globalSearch() {
		$search_value = \Input::input('search_value');
		$data = [
			'items' => [],
			'status' => false
		];

		if(isset($search_value) && !empty($search_value)) {
			$items = User::where('role', '<>', 'admin')
				->where(function($query) use ($search_value) {
				  $query->where('fullName', 'like', "%$search_value%")
					  ->orWhere('username', 'like', "%$search_value%")
					  ->orWhere('phoneNo', 'like', "%$search_value%")
					  ->orWhere('mobileNo', 'like', "%$search_value%")
					  ->orWhere('admission_number', 'like', "%$search_value%")
					  ->orWhere('id', 'like', "%$search_value%");
				})
			  ->inRandomOrder()
			  ->limit(30)->get()->toArray();

			$data = [
				'items' => $items,
				'status' => true
			];
		}

		return response()->json($data);
	}

	public function getNotificationCountAlertAndData() {
		date_default_timezone_set('Asia/Kolkata');

		$query = NotificationMobHistory::where('user_id', $this->data['users']->id);
		if($this->data['users']->role == 'admin' || $this->data['users']->role == 'teacher') {
			$query->whereNotIn('type', ['attendance', 'assignment', 'exams', 'homework']);
		}
		$count = $query->count();
		$data = $query->orderBy('id', 'desc')->limit(20)->get()->toArray();
		$unseen_notif_count = NotificationMobHistory::getCountOfUnSeenNotifications(20);

		return response()->json([
			'unseen_notif_count' => $unseen_notif_count,
			'all_notifications' => array_reverse($data),
		]);
	}

	public function resetNotificationsSeenStatus() {
		NotificationMobHistory::where('user_id', $this->data['users']->id)
			->orderBy('id', 'desc')->limit(20)
			->update([
				'is_seen' => 1
			]);

		return 1;
	}
}
