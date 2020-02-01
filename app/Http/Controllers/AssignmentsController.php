<?php
namespace App\Http\Controllers;

use App\Jobs\CreatePdfConverterJob;
use App\Models2\MClass;
use App\Models2\Main;
use Illuminate\Support\Facades\Auth;

class AssignmentsController extends Controller {

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

		if(!$this->panelInit->can( array("Assignments.list","Assignments.AddAssignments","Assignments.editAssignment","Assignments.delAssignment","Assignments.viewAnswers","Assignments.applyAssAnswer","Assignments.Download") )){
			exit;
		}

		$toReturn = array();

		if($this->data['users']->role == "teacher"){
			$class_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
			$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)
				->whereIn('id', $class_ids)
				->get()->toArray();
		}else{
			$toReturn['classes'] = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		}

		$classesArray = array();
		foreach ($toReturn['classes'] as $class) {
			$classesArray[$class['id']] = $class['className'];
		}

		$toReturn['assignments'] = array();
		if(count($classesArray) > 0){
			$assignments = new \assignments();

			if($this->data['users']->role == "teacher"){
				$assignments = $assignments->where('teacherId',$this->data['users']->id)->where(function($query) use ($classesArray){
									foreach($classesArray as $key => $value){
										$query = $query->orWhere('classId','LIKE','%"'.$key.'"%');
									}
						        })->orderByRaw('AssignDeadLine + 0 Desc')->get();
			}elseif($this->data['users']->role == "student"){
				$assignments = $assignments->where('classId','LIKE','%"'.$this->data['users']->studentClass.'"%');
				if($this->panelInit->settingsArray['enableSections'] == true){
					$assignments = $assignments->where('sectionId','LIKE','%"'.$this->data['users']->studentSection.'"%');
				}
				$assignments = $assignments->get();
			}elseif ($this->data['users']->role == "parent") {
				$parentOf = json_decode($this->data['users']->parentOf,true);
				if(!is_array($parentOf)){
					$parentOf = array();
				}
				$ids = array();
				foreach ($parentOf as $value) {
					$ids[] = $value['id'];
				}

				if(count($ids) == 0){
					unset($assignments);
				}

				if(count($ids) > 0){
					$classArray = array();
					$sectionArray = array();
					$studentArray = \User::where('role','student')->whereIn('id',$ids)->select('id','fullName','studentClass','studentSection')->get();
					foreach ($studentArray as $stOne) {
						$students[$stOne->id] = array('id'=>$stOne->id,'fullName'=>$stOne->fullName,'studentClass'=>$stOne->studentClass,'studentSection'=>$stOne->studentSection);
						$classArray[] = $stOne->studentClass;
						if($this->panelInit->settingsArray['enableSections'] == true){
							$sectionArray[] = $stOne->studentSection;
						}
					}

					if(count($classArray) > 0){
						$assignments = $assignments->where(function($query) use ($classArray){
											foreach($classArray as $value){
												$query = $query->orWhere('classId','LIKE','%"'.$value.'"%');
											}
								        });
					}

					if(count($sectionArray) > 0){
						$assignments = $assignments->where(function($query) use ($sectionArray){
											foreach($sectionArray as $value){
												$query = $query->orWhere('sectionId','LIKE','%"'.$value.'"%');
											}
								        });
					}
					$assignments = $assignments->get();

					$assignmentsIds = array();
					foreach ($assignments as $assignment) {
						$assignmentsIds[] = $assignment->id;
						$toReturn['assignmentsAnswers'][$assignment->id] = array();

						$classId = json_decode($assignment->classId,true);
						$sectionId = json_decode($assignment->sectionId,true);

						reset($students);
						foreach($students as $student){
							if(is_array($classId) AND in_array($student['studentClass'],$classId) ){
								if(is_array($sectionId) AND in_array($student['studentSection'],$sectionId)){
									$toReturn['assignmentsAnswers'][$assignment->id][$student['id']] = $student;
								}
							}
						}
					}

					if(count($assignmentsIds) > 0){
						$assignmentsAnswers = \DB::table('assignments_answers')
												->leftJoin('users', 'users.id', '=', 'assignments_answers.userId')
												->select('assignments_answers.id as id',
												'assignments_answers.userId as userId',
												'assignments_answers.assignmentId as assignmentId',
												'assignments_answers.userNotes as userNotes',
												'assignments_answers.userTime as userTime',
												'assignments_answers.fileName as AssignFile',
												'users.fullName as fullName')
												->whereIn('assignments_answers.userId',$ids)
												->whereIn('assignments_answers.assignmentId',$assignmentsIds)
												->get();

						foreach ($assignmentsAnswers as $answer) {
							$toReturn['assignmentsAnswers'][$answer->assignmentId][$answer->userId] = $answer;
							$toReturn['assignmentsAnswers'][$answer->assignmentId][$answer->userId]->userTime = $this->panelInit->unix_to_date($answer->userTime);
						}
					}
				}
			}else{
				$assignments = $assignments->where(function($query) use ($classesArray){
									foreach($classesArray as $key => $value){
										$query = $query->orWhere('classId','LIKE','%"'.$key.'"%');
									}
						        })->orderByRaw('AssignDeadLine + 0 Desc')->get();
			}

			$toReturn['userRole'] = $this->data['users']->role;

			if(!isset($assignments)){
				return $toReturn;
			}

			foreach ($assignments as $key => $assignment) {
				$classId = json_decode($assignment->classId);
				if($this->data['users']->role == "student" AND !in_array($this->data['users']->studentClass, $classId)){
					continue;
				}
				$toReturn['assignments'][$key]['id'] = $assignment->id;
				$toReturn['assignments'][$key]['subjectId'] = $assignment->subjectId;
				$toReturn['assignments'][$key]['AssignTitle'] = $assignment->AssignTitle;
				$toReturn['assignments'][$key]['AssignDescription'] = $assignment->AssignDescription;
				$toReturn['assignments'][$key]['AssignFile'] = $assignment->AssignFile;

				$item_dir = explode('.', $assignment->AssignFile)[0];
				$images_dir = uploads_config()['uploads_file_path'] . '/assignments/' . $item_dir;
				if(\File::exists($images_dir) && !empty($item_dir)) {
					$toReturn['assignments'][$key]['dir_images_count'] = count(\File::files($images_dir));
					$dir_images_array = [];
					foreach (\File::files($images_dir) as $image_path) {
						$_image_path = str_replace(
							uploads_config()['uploads_file_path'],
							uploads_config()['uploads_provider'],
							$image_path
						);
						$dir_images_array[] = $_image_path;
					}
					$dir_images_array = $this->sort_pdf_image_array($dir_images_array);
					$toReturn['assignments'][$key]['dir_images_array'] = $dir_images_array;
				} else {
					$toReturn['assignments'][$key]['dir_images_count'] = 0;
					$toReturn['assignments'][$key]['dir_images_array'] = [];
				}

				$toReturn['assignments'][$key]['AssignDeadLine'] = $this->panelInit->unix_to_date($assignment->AssignDeadLine);
				$toReturn['assignments'][$key]['classes'] = "";

				foreach($classId as $value){
					if(isset($classesArray[$value])) {
						$toReturn['assignments'][$key]['classes'] .= $classesArray[$value].", ";
					}
				}
			}
		}

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'assignment', null);

		return $toReturn;
	}

	public function download($id){
		if(!$this->panelInit->can( array("Assignments.Download") )){
			exit;
		}

		$toReturn = \assignments::where('id',$id)->first();
		if(file_exists(uploads_config()['uploads_file_path'] . '/assignments/'.$toReturn->AssignFile)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','-',$toReturn->AssignTitle). "." .pathinfo($toReturn->AssignFile, PATHINFO_EXTENSION);
			user_log('Assignments', 'download', $toReturn->AssignTitle);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/assignments/'.$toReturn->AssignFile);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function delete($id){

		if(!$this->panelInit->can( "Assignments.delAssignment" )){
			exit;
		}

		if ( $postDelete = \assignments::where('id', $id)->first() ) {
			$dirname = explode('.', $postDelete->AssignFile)[0];

			@unlink(uploads_config()['uploads_file_path'] . "/assignments/".$postDelete->AssignFile);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/assignments/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

			user_log('Assignments', 'delete', $postDelete->AssignTitle);
      $postDelete->delete();
      return $this->panelInit->apiOutput(true,$this->panelInit->language['delAssignment'],$this->panelInit->language['assignemntDel']);
    }else{
      return $this->panelInit->apiOutput(false,$this->panelInit->language['delAssignment'],$this->panelInit->language['assignemntNotExist']);
    }
	}

	public function create(){
		if(!$this->panelInit->can( "Assignments.AddAssignments" )){
			exit;
		}

		$assignments = new \assignments();
		$assignments->classId = json_encode(\Input::get('classId'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$assignments->sectionId = json_encode(\Input::get('sectionId'));
		}
		$assignments->subjectId = \Input::get('subjectId');
		$assignments->teacherId = \Input::get('teacherId');
		$assignments->AssignTitle = \Input::get('AssignTitle');
		$assignments->AssignDescription = \Input::get('AssignDescription');
		$assignments->AssignDeadLine = $this->panelInit->date_to_unix(\Input::get('AssignDeadLine'));
		$assignments->teacherId = $this->data['users']->id;
		$assignments->save();
		if (\Input::hasFile('AssignFile')) {
			$fileInstance = \Input::file('AssignFile');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['AddAssignments'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['AddAssignments'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileNameWithoutExt = "assignments_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/assignments/',$newFileName);

			$assignments->AssignFile = $newFileName;
			$assignments->save();

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/assignments/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/assignments/' . $newFileName
			));
		}

		user_log('Assignments', 'create', $assignments->AssignTitle);

		//Send Push Notifications
		$tokens_list = array();
		$user_ids = array();
		$user_list = \User::where('role','student')->whereIn('studentClass',\Input::get('classId'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$user_list = $user_list->whereIn('studentSection',\Input::get('sectionId'));
		}
		$user_list = $user_list->select('id', 'firebase_token')->get();
		$student_id = array();
		foreach($user_list as $ite){
		$student_id[]="%\"id\":".$ite->id."}%" ;
		}
		$user_list_parents = array();
		foreach($student_id as $itp){
			$res = \User::where('role','parent')
			  ->where('parentOf','like',$itp)
			  ->select('id', 'firebase_token')->first();
			if($res){
				$user_list_parents[] = $res;
			}
		}

		foreach ($user_list_parents as $value) {
			if($value['firebase_token'] != ""){
				if(is_array(json_decode($value['firebase_token']))) {
					foreach (json_decode($value['firebase_token']) as $token) {
						$tokens_list[] = $token;
						\Log::debug("Assignemnt Token: " . $token);
					}
				} else if ($this->isJson($value['firebase_token'])) {
					foreach (json_decode($value['firebase_token']) as $token) {
						$tokens_list[] = $token;
						\Log::debug("Assignemnt Token: " . $token);
					}
				} else {
					$tokens_list[] = $value['firebase_token'];
					\Log::debug("Assignemnt Token: " . $value['firebase_token']);
				}
			}
			$user_ids[] = $value['id'];
		}

		if(count($tokens_list) > 0){
			$this->panelInit->send_push_notification(
				$tokens_list,
				$user_ids,
				\Input::get('AssignTitle'),
				$this->panelInit->language['newAssigmentAdded'],"assignment",
				$assignments->id);
		} else {
			$this->panelInit->save_notifications_toDB(
				$tokens_list,
				$user_ids,
				\Input::get('AssignTitle'),
				$this->panelInit->language['newAssigmentAdded'],"assignment",
				$assignments->id);
		}

		$assignments->AssignDeadLine = \Input::get('AssignDeadLine');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['AddAssignments'],$this->panelInit->language['assignmentCreated'],$assignments->toArray());
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	function fetch($id){

		if(!$this->panelInit->can( array("Assignments.editAssignment","Assignments.viewAnswers","Assignments.applyAssAnswer") )){
			exit;
		}

		$toReturn = \assignments::where('id',$id)->first();
		$DashboardController = new DashboardController();
		$toReturn['sections'] = $DashboardController->sectionsList(json_decode($toReturn->classId,true));
		$toReturn['subject'] = $DashboardController->subjectList(json_decode($toReturn->classId,true));
		$toReturn->classId = json_decode($toReturn->classId,true);
		$toReturn->AssignDeadLine = $this->panelInit->unix_to_date($toReturn->AssignDeadLine);

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'assignment', $id);

		return $toReturn;
	}

	function edit($id){

		if(!$this->panelInit->can( array("Assignments.editAssignment","Assignments.viewAnswers","Assignments.applyAssAnswer") )){
			exit;
		}

		$assignments = \assignments::find($id);
		$assignments->classId = json_encode(\Input::get('classId'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$assignments->sectionId = json_encode(\Input::get('sectionId'));
		}
		$assignments->subjectId = \Input::get('subjectId');
		$assignments->AssignTitle = \Input::get('AssignTitle');
		$assignments->AssignDescription = \Input::get('AssignDescription');
		$assignments->AssignDeadLine = $this->panelInit->date_to_unix(\Input::get('AssignDeadLine'));
		if (\Input::hasFile('AssignFile')) {
			$fileInstance = \Input::file('AssignFile');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editAssignment'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editAssignment'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$dirname = explode('.', $assignments->AssignFile)[0];
			@unlink(uploads_config()['uploads_file_path'] . "/assignments/".$assignments->AssignFile);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/assignments/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

			$newFileNameWithoutExt = "assignments_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/assignments/',$newFileName);

			$assignments->AssignFile = $newFileName;

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/assignments/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/assignments/' . $newFileName
			));
		}
		$assignments->save();

		user_log('Assignments', 'edit', $assignments->AssignTitle);

		$assignments->AssignDeadLine = \Input::get('AssignDeadLine');

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editAssignment'],$this->panelInit->language['assignmentModified'],$assignments->toArray());
	}

	function checkUpload(){

		if(!$this->panelInit->can( array("Assignments.editAssignment","Assignments.viewAnswers","Assignments.applyAssAnswer") )){
			exit;
		}

		$toReturn = \assignments::where('id',\Input::get('assignmentId'))->first();

		if($toReturn->AssignDeadLine < time()){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['applyAssAnswer'],$this->panelInit->language['assDeadTime']);
		}

		$assignmentsAnswers = \assignments_answers::where('assignmentId',\Input::get('assignmentId'))->where('userId',$this->data['users']->id)->count();
		if($assignmentsAnswers > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['applyAssAnswer'],$this->panelInit->language['assAlreadySub']);
		}
		return array("canApply"=>"true");
	}

	function upload($id){
		if(!$this->panelInit->can( array("Assignments.viewAnswers","Assignments.applyAssAnswer") )){
			exit;
		}

		$assignmentsAnswers = new \assignments_answers();
		$assignmentsAnswers->assignmentId = $id;
		$assignmentsAnswers->userId = $this->data['users']->id;
		$assignmentsAnswers->userNotes = \Input::get('userNotes');
		$assignmentsAnswers->userTime = time();
		if (!\Input::hasFile('fileName')) {
			return $this->panelInit->apiOutput(false,$this->panelInit->language['applyAssAnswer'],$this->panelInit->language['assNoFilesUploaded']);
		}elseif (\Input::hasFile('fileName')) {
			$fileInstance = \Input::file('fileName');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['applyAssAnswer'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "assignments_".uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/assignmentsAnswers/',$newFileName);

			$assignmentsAnswers->fileName = $newFileName;
			$assignmentsAnswers->save();

			user_log('Assignment answers', 'upload', $newFileName);
		}
		$assignmentsAnswers->save();


		return $this->panelInit->apiOutput(true,$this->panelInit->language['applyAssAnswer'],$this->panelInit->language['assUploadedSucc']);
	}

	function listAnswers($id){

		if(!$this->panelInit->can( "Assignments.viewAnswers" )){
			exit;
		}

		$assignmentsAnswers = \DB::table('assignments_answers')
								->leftJoin('users', 'users.id', '=', 'assignments_answers.userId')
								->leftJoin('classes', 'classes.id', '=', 'users.studentClass')
								->select('assignments_answers.id as id',
								'assignments_answers.userId as userId',
								'assignments_answers.userNotes as userNotes',
								'assignments_answers.userTime as userTime',
								'assignments_answers.fileName as AssignFile',
								'users.fullName as fullName',
								'classes.className as className')
								->where('assignmentId',$id)
								->get();

		foreach ($assignmentsAnswers as $key => $assignment) {
			$assignmentsAnswers[$key]->userTime = $this->panelInit->unix_to_date($assignmentsAnswers[$key]->userTime , $this->panelInit->settingsArray['dateformat']." hr:mn a");
		}


		return $assignmentsAnswers;
	}

	public function downloadAnswer($id){

		if(!$this->panelInit->can( "Assignments.viewAnswers" )){
			exit;
		}

		$toReturn = \assignments_answers::where('id',$id)->first();
		$user = \User::where('id',$toReturn->userId)->first();
		if(file_exists(uploads_config()['uploads_file_path'] . '/assignmentsAnswers/'.$toReturn->fileName)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','-',$user->fullName). "." .pathinfo($toReturn->fileName, PATHINFO_EXTENSION);
			user_log('Assignment answers', 'download', $toReturn->fileName);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/assignmentsAnswers/'.$toReturn->fileName);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

}
