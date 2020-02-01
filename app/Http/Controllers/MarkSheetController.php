<?php

namespace App\Http\Controllers;

use App\Models2\User;
use Illuminate\Support\Facades\Auth;

class MarkSheetController extends Controller {

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

	public function collection($user_id) {
		$role = User::where('id', $user_id)->first()->role;

		if($role == 'teacher') {
			$studentIds = User::getStudentIdsOfTeacherByTeacherId($user_id);
		} else if ($role == 'parent') {
			$studentIds = User::getStudentsIdsFromParentId($user_id);
		}

		$marks_collection = [];
		$marks = [];

		foreach ($studentIds as $key => $id) {
			// get student class
			$student_academic_years = \student_academic_years::where('studentId',$id)
			  ->where('academicYearId', $this->panelInit->selectAcYear)
			  ->first();

			$studentClass = $student_academic_years->classId;

			$examIds = array();
			$examsList = \exams_list::where('examAcYear',$this->panelInit->selectAcYear)
			  ->where('examClasses','LIKE','%'.$studentClass.'%')
			  ->get();

			foreach ($examsList as $exam) {
				$marks[$exam->id] = array(
					"title"=>$exam->examTitle,
					"examId"=>$exam->id,
					"studentId"=>$id,
					"examMarksheetColumns"=>json_decode($exam->examMarksheetColumns,true)
				);
				$examIds[] = $exam->id;
			}

			$examMarks = \exam_marks::where('studentId',$id)->whereIn('examId',$examIds)->get();
			$subject = \subject::get();
			$gradeLevels = \grade_levels::get();

			$subjectArray = array();
			foreach ($subject as $sub) {
				$subjectArray[$sub->id] = array('subjectTitle'=>$sub->subjectTitle,'passGrade'=>$sub->passGrade,'finalGrade'=>$sub->finalGrade);
			}

			$gradeLevelsArray = array();
			foreach ($gradeLevels as $grade) {
				$gradeLevelsArray[$grade->gradeName] = array('from'=>$grade->gradeFrom,"to"=>$grade->gradeTo,"points"=>$grade->gradePoints);
			}

			foreach ($examMarks as $mark) {
				if(!isset($marks[$mark->examId]['counter'])){
					$marks[$mark->examId]['counter'] = 0;
					$marks[$mark->examId]['points'] = 0;
					$marks[$mark->examId]['totalMarks'] = 0;
				}
				if(!isset($subjectArray[$mark->subjectId])){
					continue;
				}
				$marks[$mark->examId]['data'][$mark->id]['subjectName'] = $subjectArray[$mark->subjectId]['subjectTitle'];
				$marks[$mark->examId]['data'][$mark->id]['subjectId'] = $mark->subjectId;
				$marks[$mark->examId]['data'][$mark->id]['examMark'] = json_decode($mark->examMark,true);
				$marks[$mark->examId]['data'][$mark->id]['markComments'] = $mark->markComments;
				$marks[$mark->examId]['data'][$mark->id]['totalMarks'] = $mark->totalMarks;
				$marks[$mark->examId]['data'][$mark->id]['passGrade'] = $subjectArray[$mark->subjectId]['passGrade'];
				$marks[$mark->examId]['data'][$mark->id]['finalGrade'] = $subjectArray[$mark->subjectId]['finalGrade'];
				if($marks[$mark->examId]['data'][$mark->id]['passGrade'] != ""){
					if(intval($marks[$mark->examId]['data'][$mark->id]['totalMarks']) >= intval($marks[$mark->examId]['data'][$mark->id]['passGrade'])){
						$marks[$mark->examId]['data'][$mark->id]['examState'] = "Pass";
					}else{
						$marks[$mark->examId]['data'][$mark->id]['examState'] = "Fail";
					}
				}

				reset($gradeLevelsArray);
				foreach($gradeLevelsArray as $key => $value){
					if($mark->totalMarks >= $value['from'] AND $mark->totalMarks <= $value['to']){
						if(is_numeric($value['points'])){
							$marks[$mark->examId]['points'] += $value['points'];
							$marks[$mark->examId]['counter'] ++;
						}
						$marks[$mark->examId]['data'][$mark->id]['points'] = $value['points'];
						$marks[$mark->examId]['data'][$mark->id]['grade'] = $key;
						if(is_numeric($mark->totalMarks)){
							$marks[$mark->examId]['totalMarks'] += $mark->totalMarks;
						}
						break;
					}
				}
			}

			foreach($marks as $key => $value){
				if(isset($value['points']) AND $value['counter'] AND $value['counter'] > 0){
					$marks[$key]['pointsAvg'] = round($value['points'] / $value['counter'],2);
				}else{
					$marks[$key]['pointsAvg'] = 0;
				}
			}

			$marks_collection[] = $marks;
		}

		user_log('Marksheet', 'view');

		return response()->json([
			'marks' => $marks,
		]);
	}
}
