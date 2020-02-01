<?php
namespace App\Http\Controllers;

use App\Models2\Main;
use Illuminate\Support\Facades\Auth;

class OnlineExamsController extends Controller {

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

	public function listAll()
	{

		if(!$this->panelInit->can( array("onlineExams.list","onlineExams.addExam","onlineExams.editExam","onlineExams.delExam","onlineExams.takeExam","onlineExams.showMarks","onlineExams.QuestionsArch") )){
			exit;
		}

		$toReturn = array();
		$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		$classesArray = array();
		foreach($toReturn['classes'] as $class){
			$classesArray[$class['id']] = array(
				"classTitle"=>$class['className'],
				"subjects"=>Main::getSubjectIdsByClassId($class['id'])
			);
		}

		if($this->data['users']->role == "teacher"){
			$subject_ids = Main::getSubjectsIdsByTeacherId($this->data['users']->id);
			$subjects = \subject::whereIn('id', $subject_ids)->get()->toArray();
		}else{
			$subjects = \subject::get()->toArray();
		}
		$subjectArray = array();
		foreach($subjects as $subject){
			$subjectArray[$subject['id']] = $subject['subjectTitle'];
		}

		$toReturn['onlineExams'] = array();
		$onlineExams = new \online_exams();

		if($this->data['users']->role == "teacher"){
			$onlineExams = $onlineExams->where('examTeacher',$this->data['users']->id);
		}

		if($this->data['users']->role == "student"){
			$onlineExams = $onlineExams->where('examClass','LIKE','%"'.$this->data['users']->studentClass.'"%');
			if($this->panelInit->settingsArray['enableSections'] == true){
				$onlineExams = $onlineExams->where('sectionId','LIKE','%"'.$this->data['users']->studentSection.'"%');
			}
			$onlineExams = $onlineExams->where('examDate','<=',time())->where('ExamEndDate','>=',time());
		}

		$onlineExams = $onlineExams->where('exAcYear',$this->panelInit->selectAcYear);
		$onlineExams = $onlineExams->get();
		foreach ($onlineExams as $key => $onlineExam) {
			$classId = json_decode($onlineExam->examClass);
			if($this->data['users']->role == "student" AND !in_array($this->data['users']->studentClass, $classId)){
				continue;
			}
			$toReturn['onlineExams'][$key]['id'] = $onlineExam->id;
			$toReturn['onlineExams'][$key]['examTitle'] = $onlineExam->examTitle;
			$toReturn['onlineExams'][$key]['examDescription'] = $onlineExam->examDescription;
			if(isset($subjectArray[$onlineExam->examSubject])){
				$toReturn['onlineExams'][$key]['examSubject'] = $subjectArray[$onlineExam->examSubject];
			}
			$toReturn['onlineExams'][$key]['ExamEndDate'] = $onlineExam->ExamEndDate;
			$toReturn['onlineExams'][$key]['ExamShowGrade'] = $onlineExam->ExamShowGrade;
			$toReturn['onlineExams'][$key]['examDate'] = $this->panelInit->unix_to_date($onlineExam->examDate);
			$toReturn['onlineExams'][$key]['ExamEndDate'] = $this->panelInit->unix_to_date($onlineExam->ExamEndDate);
			$toReturn['onlineExams'][$key]['classes'] = "";

			foreach($classId as $value){
				if(isset($classesArray[$value])){
					$toReturn['onlineExams'][$key]['classes'] .= $classesArray[$value]['classTitle'].", ";
				}
			}
		}
		$toReturn['subject_list'] = array();
		$subject_list = \subject::select('id','subjectTitle')->get();
		foreach ($subject_list as $key => $value) {
			$toReturn['subject_list'][$value->id] = $value->subjectTitle;
		}

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "onlineExams.delExam" )){
			exit;
		}

		if ( $postDelete = \online_exams::where('id', $id)->first() ) {
  		user_log('Online exams', 'delete', $postDelete->examTitle);
      $postDelete->delete();
      return $this->panelInit->apiOutput(true,$this->panelInit->language['delExam'],$this->panelInit->language['exDeleted']);
    }else{
      return $this->panelInit->apiOutput(false,$this->panelInit->language['delExam'],$this->panelInit->language['exNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "onlineExams.addExam" )){
			exit;
		}

		$examQuestionH = array();
		if(\Input::has('examQuestion')){
			$examQuestion = \Input::get('examQuestion');
			foreach ($examQuestion as $key => $value) {
				$examQuestionH[] = $value['id'];
			}
			$examQuestionH = array_unique($examQuestionH);
		}

		$onlineExams = new \online_exams();
		$onlineExams->examTitle = \Input::get('examTitle');
		$onlineExams->examDescription = \Input::get('examDescription');
		$onlineExams->examClass = json_encode(\Input::get('examClass'));
		if(\Input::has('sectionId')){
			$onlineExams->sectionId = json_encode(\Input::get('sectionId'));
		}
		$onlineExams->examTeacher = $this->data['users']->id;
		$onlineExams->examSubject = \Input::get('examSubject');
		$onlineExams->examDate = $this->panelInit->date_to_unix(\Input::get('examDate'));
		$onlineExams->exAcYear = $this->panelInit->selectAcYear;
		$onlineExams->ExamEndDate = $this->panelInit->date_to_unix(\Input::get('ExamEndDate'));
		if(\Input::has('ExamShowGrade')){
			$onlineExams->ExamShowGrade = \Input::get('ExamShowGrade');
		}
		if(\Input::has('random_questions')){
			$onlineExams->random_questions = \Input::get('random_questions');
		}
		$onlineExams->examTimeMinutes = \Input::get('examTimeMinutes');
		$onlineExams->examDegreeSuccess = \Input::get('examDegreeSuccess');
		$onlineExams->examQuestion = json_encode($examQuestionH);
		$onlineExams->save();

		user_log('Online exams', 'create', $onlineExams->examTitle);

		$onlineExams->examDate = \Input::get('examDate');
		$onlineExams->ExamEndDate = \Input::get('ExamEndDate');

		//Send Push Notifications
		$tokens_list = array();
		$user_ids = array();
		$user_list = \User::where('role','student')->whereIn('studentClass',\Input::get('examClass'));
		if(\Input::has('sectionId')){
			$user_list = $user_list->whereIn('studentSection',\Input::get('sectionId'));
		}
		$user_list = $user_list->select('id', 'firebase_token')->get();

		foreach ($user_list as $value) {
			if($value['firebase_token'] != ""){
				if(is_array(json_decode($value['firebase_token']))) {
					foreach (json_decode($value['firebase_token']) as $token) {
						$tokens_list[] = $token;
					}
				} else if ($this->isJson($value['firebase_token'])) {
					foreach (json_decode($value['firebase_token']) as $token) {
						$tokens_list[] = $token;
					}
				} else {
					$tokens_list[] = $value['firebase_token'];
				}
			}
			$user_ids[] = $value['id'];
		}

		if(count($tokens_list) > 0){
			$this->panelInit->send_push_notification(
				$tokens_list,
				$user_ids,
				\Input::get('examTitle'),$this->panelInit->language['newOnlineExamAdded'],
				"online_exams",
				$onlineExams->id
			);
		} else {
			$this->panelInit->save_notifications_toDB(
				$tokens_list,
				$user_ids,
				\Input::get('examTitle'),$this->panelInit->language['newOnlineExamAdded'],
				"online_exams",
				$onlineExams->id
			);
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addExam'],$this->panelInit->language['examCreated'],$onlineExams->toArray() );
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	function fetch($id){

		if(!$this->panelInit->can( "onlineExams.editExam" )){
			exit;
		}

		$istook = \online_exams_grades::where('examId',$id)->where('studentId',$this->data['users']->id)->count();

		$onlineExams = \online_exams::where('id',$id)->first()->toArray();
		$onlineExams['examClass'] = json_decode($onlineExams['examClass']);
		$onlineExams['sectionId'] = json_decode($onlineExams['sectionId']);


		$examQuestionArray = json_decode($onlineExams['examQuestion'],true);
		$examQuestionArrayDb = \online_exams_questions::whereIn('id',$examQuestionArray)->get();

		$examQuestion = array();
		foreach ($examQuestionArrayDb as $value) {
			$examQuestion[] = array("id"=>$value->id,"question_text"=>$value->question_text,"question_type"=>$value->question_type);
		}
		$onlineExams['examQuestion'] = $examQuestion;

		if(time() > $onlineExams['ExamEndDate'] || time() < $onlineExams['examDate']){
			$onlineExams['finished'] = true;
		}
		if($istook > 0){
			$onlineExams['taken'] = true;
		}
		$onlineExams['examDate'] = $this->panelInit->unix_to_date($onlineExams['examDate']);
		$onlineExams['ExamEndDate'] = $this->panelInit->unix_to_date($onlineExams['ExamEndDate']);

		$DashboardController = new DashboardController();
		$onlineExams['subject'] = $DashboardController->subjectList($onlineExams['examClass']);
		$onlineExams['sections'] = $DashboardController->sectionsList($onlineExams['examClass']);

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'online_exams', $id);

		return $onlineExams;
	}

	function marks($id){

		if(!$this->panelInit->can( "onlineExams.showMarks" )){
			exit;
		}

		$return = array();

		$exam = \online_exams::where('id',$id)->first();
		$return['examDegreeSuccess'] = $exam->examDegreeSuccess;

		$return['grade'] = \DB::table('online_exams_grades')
					->where('examId',$id)
					->leftJoin('users', 'users.id', '=', 'online_exams_grades.studentId')
					->select('online_exams_grades.id as id',
					'online_exams_grades.examGrade as examGrade',
					'online_exams_grades.examDate as examDate',
					'online_exams_grades.examQuestionsAnswers as examQuestionsAnswers',
					'users.fullName as fullName',
					'users.id as studentId')
					->get();

		foreach ($return['grade'] as $key => $value) {
			$return['grade'][$key]->examQuestionsAnswers = json_decode($return['grade'][$key]->examQuestionsAnswers,true);
			$return['grade'][$key]->examDate = $this->panelInit->unix_to_date($return['grade'][$key]->examDate);
		}

		return json_encode($return);
	}

	function edit($id){

		if(!$this->panelInit->can( "onlineExams.editExam" )){
			exit;
		}

		$examQuestionH = array();
		if(\Input::has('examQuestion')){
			$examQuestion = \Input::get('examQuestion');
			foreach ($examQuestion as $key => $value) {
				$examQuestionH[] = $value['id'];
			}
			$examQuestionH = array_unique($examQuestionH);
		}

		$onlineExams = \online_exams::find($id);
		$onlineExams->examTitle = \Input::get('examTitle');
		$onlineExams->examDescription = \Input::get('examDescription');
		$onlineExams->examClass = json_encode(\Input::get('examClass'));
		if(\Input::has('sectionId')){
			$onlineExams->sectionId = json_encode(\Input::get('sectionId'));
		}
		$onlineExams->examTeacher = $this->data['users']->id;
		$onlineExams->examSubject = \Input::get('examSubject');
		$onlineExams->examDate = $this->panelInit->date_to_unix(\Input::get('examDate'));
		$onlineExams->ExamEndDate = $this->panelInit->date_to_unix(\Input::get('ExamEndDate'));
		if(\Input::has('ExamShowGrade')){
			$onlineExams->ExamShowGrade = \Input::get('ExamShowGrade');
		}
		if(\Input::has('random_questions')){
			$onlineExams->random_questions = \Input::get('random_questions');
		}
		$onlineExams->examTimeMinutes = \Input::get('examTimeMinutes');
		$onlineExams->examDegreeSuccess = \Input::get('examDegreeSuccess');
		$onlineExams->examQuestion = json_encode($examQuestionH);
		$onlineExams->save();

		user_log('Online exams', 'edit', $onlineExams->examTitle);

		$onlineExams->examDate = \Input::get('examDate');
		$onlineExams->ExamEndDate = \Input::get('ExamEndDate');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editExam'],$this->panelInit->language['examModified'],$onlineExams->toArray() );
	}

	function take($id){

		if(!$this->panelInit->can( "onlineExams.takeExam" )){
			exit;
		}

		$istook = \online_exams_grades::where('examId',$id)->where('studentId',$this->data['users']->id);
		$istookFinish = $istook->first();
		$istook = $istook->count();

		if($istook > 0 AND $istookFinish['examQuestionsAnswers'] != null){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['takeExam'],$this->panelInit->language['exAlreadyTook']);
		}

		if($istook == 0){
			$onlineExamsGrades = new \online_exams_grades();
			$onlineExamsGrades->examId = $id;
			$onlineExamsGrades->studentId = $this->data['users']->id;
			$onlineExamsGrades->examDate = time() ;
			$onlineExamsGrades->save();
		}

		$onlineExams = \online_exams::where('id',$id)->first()->toArray();

		if($onlineExams['examTimeMinutes'] != 0 AND $istook > 0){
			if( (time() - $istookFinish['examDate']) > $onlineExams['examTimeMinutes']*60){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['takeExam'],$this->panelInit->language['examTimedOut']);
			}
		}

		if($onlineExams['ExamEndDate'] < time()){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['takeExam'],$this->panelInit->language['examTimedOut']);
		}

		$onlineExams['examClass'] = json_decode($onlineExams['examClass']);
		$onlineExams['examQuestion'] = json_decode($onlineExams['examQuestion'],true);

		$examQuestions = \online_exams_questions::whereIn('id',$onlineExams['examQuestion'])->select('id','question_text','question_type','question_answers','question_mark','question_image');
		if($onlineExams['random_questions'] == "1"){
			$examQuestions = $examQuestions->orderByRaw("RAND()");
		}
		$examQuestions = $examQuestions->get()->toArray();
		foreach ($examQuestions as $key => $value) {
			$examQuestions[$key]['question_answers'] = json_decode($examQuestions[$key]['question_answers'],true);
			if(isset($examQuestions[$key]['question_answers']['tans'])){
				unset($examQuestions[$key]['question_answers']['tans']);
			}
		}
		$onlineExams['examQuestions'] = $examQuestions;

		if(time() > $onlineExams['ExamEndDate'] || time() < $onlineExams['examDate']){
			$onlineExams['finished'] = true;
		}

		if($onlineExams['examTimeMinutes'] == 0){
			$onlineExams['timeLeft'] = 0;
		}else{
			if($istook == 0){
				$onlineExams['timeLeft'] = $onlineExams['examTimeMinutes'] * 60;
			}
			if($istook > 0){
				$onlineExams['timeLeft'] = $onlineExams['examTimeMinutes']*60 - (time() - $istookFinish['examDate']);
			}
		}

		$onlineExams['examDate'] = $this->panelInit->timestampToIntl($onlineExams['examDate']);
		$onlineExams['ExamEndDate'] =$this->panelInit->timestampToIntl($onlineExams['ExamEndDate']);

		return $onlineExams;
	}

	function took($id){

		if(!$this->panelInit->can( "onlineExams.takeExam" )){
			exit;
		}

		$istook = \online_exams_grades::where('examId',$id)->where('studentId',$this->data['users']->id);
		if($istook->count() == 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['takeExam'],"An error occured");
		}
		$istook = $istook->first();

		if($istook['examQuestionsAnswers'] != null){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['takeExam'],$this->panelInit->language['exAlreadyTook']);
		}

		$onlineExams = \online_exams::where('id',$id)->first()->toArray();

		if($onlineExams['examTimeMinutes'] != 0){
			if( (time() - $istook['examDate']) > $onlineExams['examTimeMinutes']*60){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['takeExam'],$this->panelInit->language['examTimedOut']);
			}
		}

		$onlineExams['examQuestion'] = json_decode($onlineExams['examQuestion'],true);

		$score = 0;
		$answers = \Input::get('answers');
		$examQuestions = \online_exams_questions::whereIn('id',$onlineExams['examQuestion'])->select('id','question_text','question_type','question_answers','question_mark','question_image')->get()->toArray();

		$examQuestionsAnswers = array();
		foreach ($examQuestions as $key => $value) {
			$value['question_answers'] = json_decode($value['question_answers'],true);
			reset($answers);
			foreach ($answers as $keyAnswer => $valueAnswer) {

				if(!isset($examQuestionsAnswers[ $value['id'] ])){
					$examQuestionsAnswers[ $value['id'] ] = array();
				}
				$examQuestionsAnswers[ $value['id'] ]['question_text'] = strip_tags(htmlspecialchars_decode($value['question_text'],ENT_QUOTES));
				$examQuestionsAnswers[ $value['id'] ]['question_type'] = $value['question_type'];

				if($value['id'] == $valueAnswer['id'] && isset($valueAnswer['question_answers']['answer'])){
					if(isset($value['question_type']) AND $value['question_type'] == "radio"){
						$examQuestionsAnswers[ $value['id'] ]['userAnswer'] = $valueAnswer['question_answers']['answer'];
						$answers[$keyAnswer]['state'] = 0;
						if($valueAnswer['question_answers']['answer'] == $value['question_answers']['tans']){
							$answers[$keyAnswer]['state'] = 1;
							if(isset($value['question_mark'])){
								$score += $value['question_mark'];
							}else{
								$score++;
							}
						}
						$examQuestionsAnswers[ $value['id'] ]['state'] = $answers[$keyAnswer]['state'];
						continue;
					}
					if(isset($value['question_type']) AND $value['question_type'] == "check"){
						$examQuestionsAnswers[ $value['id'] ]['userAnswer'] = implode(",",$valueAnswer['question_answers']['answer']);
						$answers[$keyAnswer]['state'] = 0;
						$pass = true;
						if(count($valueAnswer['question_answers']['answer']) != count($value['question_answers']['tans'])){
							$pass = false;
						}
						foreach ($value['question_answers']['tans'] as $keyCheck => $valueCheck) {
							if (!in_array($valueCheck, $valueAnswer['question_answers']['answer'])) {
								$pass = false;
							}
						}
						if($pass == true){
							$answers[$keyAnswer]['state'] = 1;
							if(isset($value['question_mark'])){
								$score += $value['question_mark'];
							}else{
								$score++;
							}
						}
						$examQuestionsAnswers[ $value['id'] ]['state'] = $answers[$keyAnswer]['state'];
						unset($pass);
						continue;
					}
					if(isset($value['question_type']) AND $value['question_type'] == "text"){
						$examQuestionsAnswers[ $value['id'] ]['userAnswer'] = $valueAnswer['question_answers']['answer'];
						$answers[$keyAnswer]['state'] = 0;
						if (in_array($valueAnswer['question_answers']['answer'], $value['question_answers']['answers'])) {
							$answers[$keyAnswer]['state'] = 1;
							if(isset($value['question_mark'])){
								$score += $value['question_mark'];
							}else{
								$score++;
							}
						}
						$examQuestionsAnswers[ $value['id'] ]['state'] = $answers[$keyAnswer]['state'];
						continue;
					}
				}
			}
		}

		$istook->examQuestionsAnswers = json_encode($examQuestionsAnswers) ;
		$istook->examGrade = $score ;
		$istook->save();

		if($onlineExams['ExamShowGrade'] == 1){
			if($onlineExams['examDegreeSuccess'] != "0"){
				if(intval($onlineExams['examDegreeSuccess']) <= $score){
					$score .= " - Succeeded";
				}else{
					$score .= " - Failed";
				}
			}
			$toReturn['grade'] = $score;
		}
		$toReturn['finish'] = true;
		return json_encode($toReturn);
	}

	function export($id,$type){

		if(!$this->panelInit->can( "onlineExams.showMarks" )){
			exit;
		}

		user_log('Online exams', 'export');

		if($type == "excel"){
			$classArray = array();
			$classes = \classes::get();
			foreach ($classes as $class) {
				$classArray[$class->id] = $class->className;
			}

			$data = array(1 => array ('Student Roll','Full Name','Date took','Exam Grade'));
			$grades = \DB::table('online_exams_grades')
					->where('examId',$id)
					->leftJoin('users', 'users.id', '=', 'online_exams_grades.studentId')
					->select('online_exams_grades.id as id',
					'online_exams_grades.examGrade as examGrade',
					'online_exams_grades.examDate as examDate',
					'users.fullName as fullName',
					'users.id as studentId',
					'users.studentRollId as studentRollId')
					->get();
			foreach ($grades as $value) {
				$data[] = array ($value->studentRollId,$value->fullName,$this->panelInit->unix_to_date($value->examDate) , $value->examGrade );
			}

			\Excel::create('Exam-Grade-Sheet', function($excel) use($data) {

			    // Set the title
			    $excel->setTitle('Exam grades Sheet');

			    // Chain the setters
			    $excel->setCreator('Cutebrains')->setCompany('Virtu');

				$excel->sheet('Exam-Grade', function($sheet) use($data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($data, null, 'A1', true,false);
				});

			})->download('xls');

		}elseif ($type == "pdf") {
			$classArray = array();
			$classes = \classes::get();
			foreach ($classes as $class) {
				$classArray[$class->id] = $class->className;
			}

			$header = array ($this->panelInit->language['rollid'],$this->panelInit->language['FullName'],$this->panelInit->language['Date'],$this->panelInit->language['Grade']);
			$data = array();
			$grades = \DB::table('online_exams_grades')
					->where('examId',$id)
					->leftJoin('users', 'users.id', '=', 'online_exams_grades.studentId')
					->select('online_exams_grades.id as id',
					'online_exams_grades.examGrade as examGrade',
					'online_exams_grades.examDate as examDate',
					'users.fullName as fullName',
					'users.id as studentId',
					'users.studentRollId as studentRollId')
					->get();
			foreach ($grades as $value) {
				$data[] = array ($value->studentRollId,$value->fullName,$this->panelInit->unix_to_date($value->examDate), $value->examGrade );
			}

			$doc_details = array(
								"title" => "OnlineExam ",
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
			$pdfbuilder->output('OnlineExam.pdf');

		}
		exit;
	}

	function questions(){

		if(!$this->panelInit->can( "onlineExams.QuestionsArch" )){
			exit;
		}

		$userId = $this->data['users']->id;

		$online_exams_questions = new \online_exams_questions();
			if($this->data['users']->role != "admin"){
				$online_exams_questions = $online_exams_questions->where(function($query) use ($userId){
											$query->where('employee_id', $userId)->orWhere('is_shared','1');
										});
			}
		$online_exams_questions = $online_exams_questions->get();

		foreach ($online_exams_questions as $key => $value) {
			$online_exams_questions[$key]['question_text'] = strip_tags(htmlspecialchars_decode($online_exams_questions[$key]['question_text'],ENT_QUOTES));
		}

		return $online_exams_questions;
	}

	function createQuestions(){

		if(!$this->panelInit->can( "onlineExams.QuestionsArch" )){
			exit;
		}

		$answersList = array();
		if(\Input::get('question_type') == "radio"){
			$answersList['answers'] = \Input::get('radioAnswers');
			$answersList['tans'] = \Input::get('radioTrueAnswer');
		}elseif(\Input::get('question_type') == "check"){
			$answersList['answers'] = \Input::get('checkAnswers');
			$answersList['tans'] = \Input::get('checkTrueAnswer');
		}elseif (\Input::get('question_type') == "text") {
			$answersList['answers'] = \Input::get('textAnswers');
		}

		$online_exams_questions = new \online_exams_questions();
		$online_exams_questions->question_text = \Input::get('question_text');
		$online_exams_questions->question_type = \Input::get('question_type');
		$online_exams_questions->question_answers = json_encode($answersList);
		$online_exams_questions->question_mark = \Input::get('question_mark');

		if (\Input::hasFile('question_image')) {
			$fileInstance = \Input::file('question_image');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addQuestion'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/onlineExams/',$newFileName);

			$online_exams_questions->question_image = $newFileName;
		}

		$online_exams_questions->question_subject = \Input::get('question_subject');
		$online_exams_questions->employee_id = $this->data['users']->id;
		$online_exams_questions->is_shared = \Input::get('is_shared');
		$online_exams_questions->save();

		user_log('Online exams', 'create_question', $online_exams_questions->question_text);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addQuestion'],$this->panelInit->language['quesAdded'],$online_exams_questions->toArray() );
	}

	function fetchQuestions($id){

		if(!$this->panelInit->can( "onlineExams.QuestionsArch" )){
			exit;
		}

		$online_exams_questions = \online_exams_questions::where('id',$id)->first()->toArray();
		$online_exams_questions['question_answers'] = json_decode($online_exams_questions['question_answers'],true);

		if($online_exams_questions['question_type'] == "radio"){
			$online_exams_questions['answersList'] = $online_exams_questions['question_answers']['answers'];
			$online_exams_questions['radioTrueAnswer'] = $online_exams_questions['question_answers']['tans'];
		}elseif($online_exams_questions['question_type'] == "check"){
			$online_exams_questions['answersList'] = $online_exams_questions['question_answers']['answers'];
			$online_exams_questions['checkTrueAnswer'] = $online_exams_questions['question_answers']['tans'];
		}elseif ($online_exams_questions['question_type'] == "text") {
			$online_exams_questions['answersList'] = $online_exams_questions['question_answers']['answers'];
		}

		return $online_exams_questions;
	}

	function editQuestions($id){

		if(!$this->panelInit->can( "onlineExams.QuestionsArch" )){
			exit;
		}

		$answersList = array();
		if(\Input::get('question_type') == "radio"){
			$answersList['answers'] = \Input::get('radioAnswers');
			$answersList['tans'] = \Input::get('radioTrueAnswer');
		}elseif(\Input::get('question_type') == "check"){
			$answersList['answers'] = \Input::get('checkAnswers');
			$answersList['tans'] = \Input::get('checkTrueAnswer');
		}elseif (\Input::get('question_type') == "text") {
			$answersList['answers'] = \Input::get('textAnswers');
		}

		$online_exams_questions = \online_exams_questions::find($id);
		$online_exams_questions->question_text = \Input::get('question_text');
		$online_exams_questions->question_type = \Input::get('question_type');
		$online_exams_questions->question_answers = json_encode($answersList);
		$online_exams_questions->question_mark = \Input::get('question_mark');

		if (\Input::hasFile('question_image')) {
			$fileInstance = \Input::file('question_image');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editQuestion'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/onlineExams/',$newFileName);

			$online_exams_questions->question_image = $newFileName;
		}

		$online_exams_questions->question_subject = \Input::get('question_subject');
		$online_exams_questions->employee_id = $this->data['users']->id;
		$online_exams_questions->is_shared = \Input::get('is_shared');
		$online_exams_questions->save();

		user_log('Online exams', 'edit_question', $online_exams_questions->question_text);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editQuestion'],$this->panelInit->language['quesModif'],$online_exams_questions->toArray() );
	}

	function deleteQuestions($id){

		if(!$this->panelInit->can( "onlineExams.QuestionsArch" )){
			exit;
		}

		if ( $postDelete = \online_exams_questions::where('id', $id)->first() ) {
			if($postDelete->question_image != ""){ @unlink(uploads_config()['uploads_file_path'] . '/onlineExams/'.$postDelete->question_image); }
          user_log('Online exams', 'delete_question', $postDelete->question_text);
          $postDelete->delete();
          return $this->panelInit->apiOutput(true,$this->panelInit->language['delQues'],$this->panelInit->language['quesDeleted']);
      }else{
          return $this->panelInit->apiOutput(false,$this->panelInit->language['delQues'],$this->panelInit->language['quesNotExist']);
      }
	}

	function searchQuestion($keyword){

		if(!$this->panelInit->can( array("onlineExams.addExam","onlineExams.editExam") )){
			exit;
		}

		$userId = $this->data['users']->id;
		$questions = \online_exams_questions::where(function($query) use ($userId){
													$query->where('employee_id', $userId)->orWhere('is_shared','1');
												})->where(function($query2) use ($keyword){
													$query2->where('question_text','LIKE','%'.$keyword.'%')->orWhere('question_answers','LIKE','%'.$keyword.'%');
												})->select('id','question_text','question_type')->get();

		return $questions;
	}
}
