<?php
namespace App\Http\Controllers;

use App\Jobs\CreatePdfConverterJob;
use App\Models2\MClass;
use App\Models2\Main;

class StudyMaterialController extends Controller {

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

	public function listAll()
	{

		if(!$this->panelInit->can( array("studyMaterial.list","studyMaterial.addMaterial","studyMaterial.editMaterial","studyMaterial.delMaterial","studyMaterial.Download") )){
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

		foreach($toReturn['classes'] as $class){
			$classesArray[$class['id']] = $class['className'];
		}

		$subjects = \subject::get()->toArray();
		$subjectArray = array();
		foreach($subjects as $subject){
			$subjectArray[$subject['id']] = $subject['subjectTitle'];
		}

		$toReturn['materials'] = array();
		$studyMaterial = new \study_material();

		if($this->data['users']->role == "parent"){
			$parent_id = $this->data['users']->id;
			$classes_ids = Main::getClassesIdsByParentId($parent_id);
			foreach ($classes_ids as $key => $class_id) {
				$studyMaterial = $studyMaterial->orWhere('class_id', 'LIKE','%"'. $class_id .'"%');
			}
		} else if($this->data['users']->role == "student"){
			$studyMaterial = $studyMaterial->where('class_id','LIKE','%"'.$this->data['users']->studentClass.'"%');
			if($this->panelInit->settingsArray['enableSections'] == true){
				$studyMaterial = $studyMaterial->where('sectionId','LIKE','%"'.$this->data['users']->studentSection.'"%');
			}
		} else if($this->data['users']->role == "teacher") {
			$teacher_id = $this->data['users']->id;
			$classes_ids = Main::getClassesIdsByTeacherId($teacher_id);
			foreach ($classes_ids as $key => $class_id) {
				$studyMaterial = $studyMaterial->orWhere('class_id', 'LIKE','%"'. $class_id .'"%');
			}
		}

		// if($this->data['users']->role == "teacher"){
		// 	$studyMaterial = $studyMaterial->where('teacher_id',$this->data['users']->id);
		// }

		$studyMaterial = $studyMaterial->orderBy('material_title', 'ASC');

		$studyMaterial = $studyMaterial->get();

		foreach ($studyMaterial as $key => $material) {
			$classId = json_decode($material->class_id);
			if($this->data['users']->role == "student" AND !in_array($this->data['users']->studentClass, $classId)){
				continue;
			}
			$toReturn['materials'][$key]['id'] = $material->id;
			$toReturn['materials'][$key]['subjectId'] = $material->subject_id;
			if(isset($subjectArray[$material->subject_id])){
				$toReturn['materials'][$key]['subject'] = $subjectArray[$material->subject_id];
			}else{
				$toReturn['materials'][$key]['subject'] = "";
			}
			$toReturn['materials'][$key]['material_title'] = $material->material_title;
			$toReturn['materials'][$key]['material_description'] = $material->material_description;
			$toReturn['materials'][$key]['material_file'] = $material->material_file;

			$item_dir = explode('.', $material->material_file)[0];
			$images_dir = uploads_config()['uploads_file_path'] . '/studyMaterial/' . $item_dir;
			if(\File::exists($images_dir) && !empty($item_dir)) {
				$toReturn['materials'][$key]['dir_images_count'] = count(\File::files($images_dir));
				$dir_images_array = array();
				foreach (\File::files($images_dir) as $image_path) {
					$_image_path = str_replace(
						uploads_config()['uploads_file_path'],
						uploads_config()['uploads_provider'],
						$image_path
					);
					$dir_images_array[] = $_image_path;
				}
				$dir_images_array = $this->sort_pdf_image_array($dir_images_array);
				$toReturn['materials'][$key]['dir_images_array'] = $dir_images_array;
			} else {
				$toReturn['materials'][$key]['dir_images_count'] = 0;
			}

			$toReturn['materials'][$key]['classes'] = "";

            if(is_array($classId)){
            	foreach($classId as $value){
    				if(isset($classesArray[$value])) {
    					$toReturn['materials'][$key]['classes'] .= $classesArray[$value].", ";
    				}
    			}
            }
		}

		$toReturn['userRole'] = $this->data['users']->role;
		return $toReturn;
		exit;
	}

	public function delete($id){

		if(!$this->panelInit->can( "studyMaterial.delMaterial" )){
			exit;
		}

		if ( $postDelete = \study_material::where('id', $id)->first() ) {
				$dirname = explode('.', $postDelete->material_file)[0];

				@unlink(uploads_config()['uploads_file_path'] . '/studyMaterial/'.$postDelete->material_file);
				$current_dir_path = uploads_config()['uploads_file_path'] . '/studyMaterial/'.$dirname.'/';
				if(\File::exists($current_dir_path)) {
					// chmod($current_dir_path, 0777);
					\File::deleteDirectory($current_dir_path);
				}

				user_log('Syllabus', 'delete', $postDelete->material_title);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delMaterial'],$this->panelInit->language['materialDel']);
      }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delMaterial'],$this->panelInit->language['materialNotExist']);
      }
	}

	public function create(){
		if(!$this->panelInit->can( "studyMaterial.addMaterial" )){
			exit;
		}

		$studyMaterial = new \study_material();
		$studyMaterial->class_id = json_encode(\Input::get('class_id'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$studyMaterial->sectionId = json_encode(\Input::get('sectionId'));
		}
		if((integer) \Input::get('subject_id') >= 1){
			$studyMaterial->subject_id = \Input::get('subject_id');
		}

		$studyMaterial->material_title = \Input::get('material_title');
		$studyMaterial->material_description = \Input::get('material_description');
		$studyMaterial->teacher_id = $this->data['users']->id;
		$studyMaterial->save();

		user_log('Syllabus', 'create', $studyMaterial->material_title);

		if (\Input::hasFile('material_file')) {
			$fileInstance = \Input::file('material_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addMaterial'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addMaterial'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileNameWithoutExt = "material_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/studyMaterial/',$newFileName);

			$studyMaterial->material_file = $newFileName;
			$studyMaterial->save();

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/studyMaterial/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/studyMaterial/' . $newFileName
			));
		}

		//Send Push Notifications
		$tokens_list = array();
		$user_ids = array();
		$user_list = \User::where('role','student')->whereIn('studentClass',\Input::get('class_id'));
		if($this->panelInit->settingsArray['enableSections'] == true){
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
			$this->panelInit->send_push_notification($tokens_list,$user_ids,$this->panelInit->language['materialNotif']." : ".\Input::get('material_title'),$this->panelInit->language['studyMaterial'],"material");
		} else {
			$this->panelInit->save_notifications_toDB($tokens_list,$user_ids,$this->panelInit->language['materialNotif']." : ".\Input::get('material_title'),$this->panelInit->language['studyMaterial'],"material");
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addMaterial'],$this->panelInit->language['materialAdded'],$studyMaterial->toArray() );
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	function fetch($id){

		if(!$this->panelInit->can( "studyMaterial.editMaterial" )){
			exit;
		}

		$studyMaterial = \study_material::where('id',$id)->first()->toArray();
		$DashboardController = new DashboardController();
		$studyMaterial['sections'] = $DashboardController->sectionsList(json_decode($studyMaterial['class_id'],true));
		$studyMaterial['subject'] = $DashboardController->subjectList(json_decode($studyMaterial['class_id'],true));
		$studyMaterial['class_id'] = json_decode($studyMaterial['class_id'],true);
		return $studyMaterial;
	}

	public function download($id){
		if(!$this->panelInit->can( "studyMaterial.Download" )){
			exit;
		}

		$toReturn = \study_material::where('id',$id)->first();
		if(file_exists(uploads_config()['uploads_file_path'] . '/studyMaterial/'.$toReturn->material_file)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->material_title). "." .pathinfo($toReturn->material_file, PATHINFO_EXTENSION);
			user_log('Syllabus', 'download', $toReturn->material_title);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/studyMaterial/'.$toReturn->material_file);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	function edit($id){

		if(!$this->panelInit->can( "studyMaterial.editMaterial" )){
			exit;
		}

		$studyMaterial = \study_material::find($id);
		$studyMaterial->class_id = json_encode(\Input::get('class_id'));
		if($this->panelInit->settingsArray['enableSections'] == true){
			$studyMaterial->sectionId = json_encode(\Input::get('sectionId'));
		}
		if( null !== \Input::get('subject_id')){
		$studyMaterial->subject_id = \Input::get('subject_id');
		}
		$studyMaterial->material_title = \Input::get('material_title');
		$studyMaterial->material_description = \Input::get('material_description');
		if (\Input::hasFile('material_file')) {
			$fileInstance = \Input::file('material_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editMaterial'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addMaterial'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$dirname = explode('.', $studyMaterial->material_file)[0];
			@unlink(uploads_config()['uploads_file_path'] . "/studyMaterial/".$studyMaterial->material_file);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/studyMaterial/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

			$newFileNameWithoutExt = "material_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/studyMaterial/',$newFileName);

			$studyMaterial->material_file = $newFileName;

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/studyMaterial/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/studyMaterial/' . $newFileName
			));
		}
		$studyMaterial->save();

		user_log('Syllabus', 'edit', $studyMaterial->material_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editMaterial'],$this->panelInit->language['materialEdited'],$studyMaterial->toArray() );
	}
}
