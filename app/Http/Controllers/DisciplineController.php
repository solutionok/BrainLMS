<?php
namespace App\Http\Controllers;

use App\Models2\Discipline;
use App\Models2\User;
use Illuminate\Support\Facades\Auth;

class DisciplineController extends Controller {

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

	public function listAll($page){
		if(!$this->panelInit->can(array("Disciplines.list","Disciplines.Download","Disciplines.add","Disciplines.edit","Disciplines.del","Disciplines.View"))){
			exit;
		}

		$toReturn = array();

		$toReturn['disciplines'] = Discipline::orderBy('created_at', 'DESC');


		if($this->data['users']->role == "admin"){

		} else if($this->data['users']->role == "teacher") {
			$toReturn['disciplines'] = $toReturn['disciplines']
				->orWhere('complained_by', 'LIKE', '%"' . $this->data['users']->id . '"%')
				->orWhere('jury', 'LIKE', '%"' . $this->data['users']->id . '"%')
				->orWhere('responsible_officials', 'LIKE', '%"' . $this->data['users']->id . '"%');
		} else if($this->data['users']->role == "employee") {
			$toReturn['disciplines'] = $toReturn['disciplines']
				->orWhere('complained_by', 'LIKE', '%"' . $this->data['users']->id . '"%')
				->orWhere('responsible_officials', 'LIKE', '%"' . $this->data['users']->id . '"%');
		} else if($this->data['users']->role == "parent") {
			$student_ids = User::getStudentsIdsFromParentId($this->data['users']->id);
			foreach ($student_ids as $key => $student_id) {
				$toReturn['disciplines'] = $toReturn['disciplines']
					->orWhere('complained_against', 'LIKE', '%"' . $student_id . '"%');
			}
		} else if($this->data['users']->role == "principal") {
			$toReturn['disciplines'] = $toReturn['disciplines']
				->orWhere('jury', 'LIKE', '%"' . $this->data['users']->id . '"%');
		}

		$toReturn['disciplines'] = $toReturn['disciplines']->take(all_pagination_number())
			  ->skip(all_pagination_number() * ($page - 1) )
			  ->get();

		foreach ($toReturn['disciplines'] as $key => $discipline) {
			if($discipline->status_id == 1) {
				$toReturn['disciplines'][$key]['status'] = 'Pending';
			} elseif($discipline->status_id == 2) {
				$toReturn['disciplines'][$key]['status'] = 'Solved';
			}
			if(strlen($discipline->description) >= 30) {
				$toReturn['disciplines'][$key]['description_short'] = substr($discipline->description, 0, 60) . '...';
			} else {
				$toReturn['disciplines'][$key]['description_short'] = $discipline->description;
			}
			$toReturn['disciplines'][$key]['date0'] = date('Y/m/d', $discipline->created_at);
			$toReturn['disciplines'][$key]['trial_date_formated0'] = date('Y/m/d', $discipline->trial_date);
			$toReturn['disciplines'][$key]['date'] = date('Y/m/d h:i a', $discipline->created_at);
			$toReturn['disciplines'][$key]['trial_date_formated'] = date('Y/m/d h:i a', $discipline->trial_date);

			$toReturn['disciplines'][$key]['is_supervisor'] = 0;

			$complained_by_array = json_decode($discipline->complained_by);
			$complained_against_array = json_decode($discipline->complained_against);
			$responsible_officials_array = json_decode($discipline->responsible_officials);
			$jury_array = json_decode($discipline->jury);

			if(!is_array($complained_by_array)) $complained_by_array = [];
			if(!is_array($complained_against_array)) $complained_against_array = [];
			if(!is_array($responsible_officials_array)) $responsible_officials_array = [];
			if(!is_array($jury_array)) $jury_array = [];

			if(Auth::user()->role == 'admin') {
				if(in_array(Auth::user()->id, $complained_by_array) || in_array(Auth::user()->id, $jury_array) || in_array(Auth::user()->id, $responsible_officials_array)) {
					$toReturn['disciplines'][$key]['is_supervisor'] = 1;
				}
			} else if(Auth::user()->role == 'teacher') {
				if(in_array(Auth::user()->id, $complained_by_array) || in_array(Auth::user()->id, $jury_array) || in_array(Auth::user()->id, $responsible_officials_array)) {
					$toReturn['disciplines'][$key]['is_supervisor'] = 1;
				}
			} else if(Auth::user()->role == 'employee') {
				if(in_array(Auth::user()->id, $complained_by_array) || in_array(Auth::user()->id, $responsible_officials_array)) {
					$toReturn['disciplines'][$key]['is_supervisor'] = 1;
				}
			} else if(Auth::user()->role == 'principal') {
				if(in_array(Auth::user()->id, $jury_array)) {
					$toReturn['disciplines'][$key]['is_supervisor'] = 1;
				}
			}
		}

		$toReturn['totalItems'] = Discipline::count();

		return $toReturn;
	}

	public function download($id){

		if(!$this->panelInit->can( "Disciplines.Download" )){
			exit;
		}

		// $toReturn = Discipline::where('id',$id)->first();
		// if(file_exists(uploads_config()['uploads_file_path'] . '/discipline/'.$toReturn->homeworkFile)){
		// 	$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','-',$toReturn->homeworkTitle). "." .pathinfo($toReturn->homeworkFile, PATHINFO_EXTENSION);
		// 	user_log('Homework', 'download', $toReturn->homeworkTitle);
		// 	header("Content-Type: application/force-download");
		// 	header("Content-Disposition: attachment; filename=" . $fileName);
		// 	echo file_get_contents(uploads_config()['uploads_file_path'] . '/discipline/'.$toReturn->homeworkFile);
		// }else{
		// 	echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		// }

		exit;
	}

	public function delete($id){
		if(!$this->panelInit->can( "Disciplines.del" )){
			exit;
		}

		if ( $postDelete = Discipline::where('id', $id)->first() ) {
			$dirname = explode('.', $postDelete->attachment_file)[0];

			@unlink(uploads_config()['uploads_file_path'] . "/disciplines/".$postDelete->homeworkFile);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/disciplines/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

      $postDelete->delete();
      user_log('Discipline', 'delete', $postDelete->title);

      return $this->panelInit->apiOutput(true,'Delete Discipline','Discipline deleted successfully');
    } else {
    	return $this->panelInit->apiOutput(true,'Delete Discipline','Discipline not exist');
    }
	}

	public function create(){
		if(!$this->panelInit->can( "Disciplines.add" )){
			exit;
		}

		// validations
		if(is_null(\Input::get('complained_by')) || empty(\Input::get('complained_by'))){
			return $this->panelInit->apiOutput(false, 'Add Discipline', "`Complained by` field can\'t be empty.");
		}
		if(is_null(\Input::get('complained_against')) || empty(\Input::get('complained_against'))){
			return $this->panelInit->apiOutput(false, 'Add Discipline', "`Complained against` field can\'t be empty.");
		}
		if(is_null(\Input::get('jury')) || empty(\Input::get('jury'))){
			return $this->panelInit->apiOutput(false, 'Add Discipline', "`Jury` field can\'t be empty.");
		}
		if(is_null(\Input::get('responsible_officials')) || empty(\Input::get('responsible_officials'))){
			return $this->panelInit->apiOutput(false, 'Add Discipline', "`Responsible officials` field can\'t be empty.");
		}

		$discipline = new Discipline;
		$discipline->title = \Input::get('title');
		$discipline->description = \Input::get('description');
		$discipline->complained_by = json_encode(\Input::get('complained_by'));
		$discipline->complained_against = json_encode(\Input::get('complained_against'));
		$discipline->jury = json_encode(\Input::get('jury'));
		$discipline->responsible_officials = json_encode(\Input::get('responsible_officials'));
		$discipline->trial_date = $this->panelInit->date_to_unix(\Input::get('trial_date'));
		$discipline->status_id = \Input::get('status_id');
		$discipline->created_at = time();
		$discipline->updated_at = time();
		$discipline->attachment_file = '';

		if (\Input::hasFile('attachment_file')) {
			$fileInstance = \Input::file('attachment_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false, 'Add Discipline', "Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false, 'Add Discipline', "Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileNameWithoutExt = "discipline_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/disciplines/',$newFileName);

			$discipline->attachment_file = $newFileName;
			$discipline->save();

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/disciplines/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/disciplines/' . $newFileName
			));
		} else {
			$discipline->save();
		}

		user_log('Discipline', 'create', $discipline->title);

		$this->sendNotificationToSupervisorAndParents($discipline);

		return $this->panelInit->apiOutput(true,
			'Add Discipline',
			'Discipline created successfully',
			$discipline->toArray()
		);
	}

	protected function sendNotificationToSupervisorAndParents($discipline) {
		$supervisor__ids = [];
		$complained_by_student__ids = [];
		$complained_against_student__ids = [];
		$complained_by_array = \Input::get('complained_by');
		$complained_against_array = \Input::get('complained_against');
		$jury_array = \Input::get('jury');
		$responsible_officials_array = \Input::get('responsible_officials');


		foreach ($complained_by_array as $key => $user_id) {
			$c_userRole = User::find($user_id)->role;
			if($c_userRole == 'admin' || $c_userRole == 'teacher' || $c_userRole == 'employee' || $c_userRole == 'principal') {
				$supervisor__ids[] = $user_id;
			} else if ($c_userRole == 'student') {
				$complained_by_student__ids[] = $user_id;
			}
		}
		foreach ($complained_against_array as $key => $user_id) {
			$c_userRole = User::find($user_id)->role;
			if($c_userRole == 'admin' || $c_userRole == 'teacher' || $c_userRole == 'employee' || $c_userRole == 'principal') {
				$supervisor__ids[] = $user_id;
			} else if ($c_userRole == 'student') {
				$complained_against_student__ids[] = $user_id;
			}
		}
		foreach ($jury_array as $key => $user_id) {
			$c_userRole = User::find($user_id)->role;
			if($c_userRole == 'admin' || $c_userRole == 'teacher' || $c_userRole == 'employee' || $c_userRole == 'principal') {
				$supervisor__ids[] = $user_id;
			}
		}
		foreach ($responsible_officials_array as $key => $user_id) {
			$c_userRole = User::find($user_id)->role;
			if($c_userRole == 'admin' || $c_userRole == 'teacher' || $c_userRole == 'employee' || $c_userRole == 'principal') {
				$supervisor__ids[] = $user_id;
			}
		}

		if(count($supervisor__ids)) {
			$supervisor__rows = User::whereIn('id', $supervisor__ids)->select('id', 'firebase_token')->get();
			$tokens_list_supervisors = [];

			foreach ($supervisor__rows as $value) {
				if($value['firebase_token'] != ""){
					if(is_array(json_decode($value['firebase_token']))) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list_supervisors[] = $token;
						}
					} else if ($this->isJson($value['firebase_token'])) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list_supervisors[] = $token;
						}
					} else {
						$tokens_list_supervisors[] = $value['firebase_token'];
					}
				}
			}

			if(count($tokens_list_supervisors) > 0){
				$this->panelInit->send_push_notification(
					$tokens_list_supervisors,
					$supervisor__ids,
					\Input::get('title'),
					'New Disciplinary Action Assigned To You',
					"discipline",
					$discipline->id
				);
			} else {
				$this->panelInit->save_notifications_toDB(
					$tokens_list_supervisors,
					$supervisor__ids,
					\Input::get('title'),
					'New Disciplinary Action Assigned To You',
					"discipline",
					$discipline->id
				);
			}
		}

		if(count($complained_by_student__ids)) {
			$tokens_list_students = [];
			$parent_ids = [];

			$student_id = array();
			foreach($complained_by_student__ids as $id){
				$student_id[]="%\"id\":".$id."}%" ;
			}

			$student_list_parents = array();
			foreach($student_id as $itp){
				$res = User::where('role','parent')
				  ->where('parentOf','like',$itp)
				  ->select('id', 'firebase_token')->first();
				if($res){
					$student_list_parents[] = $res;
				}
			}

			foreach ($student_list_parents as $value) {
				if($value['firebase_token'] != ""){
					if(is_array(json_decode($value['firebase_token']))) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list_students[] = $token;
						}
					} else if ($this->isJson($value['firebase_token'])) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list_students[] = $token;
						}
					} else {
						$tokens_list_students[] = $value['firebase_token'];
					}
				}
				$parent_ids[] = $value['id'];
			}

			if(count($tokens_list_students) > 0){
				$this->panelInit->send_push_notification(
					$tokens_list_students,
					$parent_ids,
					\Input::get('title'),
					"There is a complaint raised by your child",
					"discipline",
					$discipline->id
				);
			} else {
				$this->panelInit->save_notifications_toDB(
					$tokens_list_students,
					$parent_ids,
					\Input::get('title'),
					"There is a complaint raised by your child",
					"discipline",
					$discipline->id
				);
			}
		}

		if(count($complained_against_student__ids)) {
			$tokens_list_students = [];
			$parent_ids = [];

			$student_id = array();
			foreach($complained_against_student__ids as $id){
				$student_id[]="%\"id\":".$id."}%" ;
			}

			$student_list_parents = array();
			foreach($student_id as $itp){
				$res = User::where('role','parent')
				  ->where('parentOf','like',$itp)
				  ->select('id', 'firebase_token')->first();
				if($res){
					$student_list_parents[] = $res;
				}
			}

			foreach ($student_list_parents as $value) {
				if($value['firebase_token'] != ""){
					if(is_array(json_decode($value['firebase_token']))) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list_students[] = $token;
						}
					} else if ($this->isJson($value['firebase_token'])) {
						foreach (json_decode($value['firebase_token']) as $token) {
							$tokens_list_students[] = $token;
						}
					} else {
						$tokens_list_students[] = $value['firebase_token'];
					}
				}
				$parent_ids[] = $value['id'];
			}

			if(count($tokens_list_students) > 0){
				$this->panelInit->send_push_notification(
					$tokens_list_students,
					$parent_ids,
					\Input::get('title'),
					"There is a complaint against your child",
					"discipline",
					$discipline->id
				);
			} else {
				$this->panelInit->save_notifications_toDB(
					$tokens_list_students,
					$parent_ids,
					\Input::get('title'),
					"There is a complaint against your child",
					"discipline",
					$discipline->id
				);
			}
		}
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	public function edit($id){

		if(!$this->panelInit->can( "Disciplines.edit" )){
			exit;
		}

		$discipline = Discipline::find($id);
		$discipline->title = \Input::get('title');
		$discipline->description = \Input::get('description');
		$discipline->trial_date = $this->panelInit->date_to_unix(\Input::get('trial_date'));
		$discipline->status_id = \Input::get('status_id');
		$discipline->updated_at = time();
		$discipline->attachment_file = '';

		if (\Input::hasFile('attachment_file')) {
			$fileInstance = \Input::file('attachment_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false, 'Edit Discipline', "Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false, 'Edit Discipline', "Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$dirname = explode('.', $discipline->attachment_file)[0];
			@unlink(uploads_config()['uploads_file_path'] . "/disciplines/".$discipline->attachment_file);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/disciplines/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

			$newFileNameWithoutExt = "discipline_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/disciplines/',$newFileName);

			$discipline->attachment_file = $newFileName;
			$discipline->save();

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/disciplines/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/disciplines/' . $newFileName
			));
		} else {
			$discipline->save();
		}

		user_log('Discipline', 'edit', $discipline->title);

		return $this->panelInit->apiOutput(true,
			'Update Discipline',
			'Discipline updated successfully',
			$discipline->toArray()
		);
	}

	public function fetch($id){
		if(!$this->panelInit->can( "Disciplines.edit" )){
			exit;
		}

		$discipline = Discipline::find($id);
		$discipline->trial_date = $this->panelInit->unix_to_date($discipline->trial_date);

		updateSeenNotificationMobHistory(\Auth::guard('web')->user()->id, 'discipline', $id);

		return $discipline;
	}

	public function fetch_view($id){

		if(!$this->panelInit->can( "Disciplines.View" )){
			exit;
		}

		$discipline = Discipline::find($id);

		$complained_by_data = User::whereIn('id', json_decode($discipline->complained_by))
			->select('id', 'fullName', 'role', 'username', 'studentRollId')
			->get()->toArray();
		$complained_against_data = User::whereIn('id', json_decode($discipline->complained_against))
			->select('id', 'fullName', 'role', 'username', 'studentRollId')
			->get()->toArray();
		$jury_data = User::whereIn('id', json_decode($discipline->jury))
			->select('id', 'fullName', 'role', 'username', 'studentRollId')
			->get()->toArray();
		$responsible_officials_data = User::whereIn('id', json_decode($discipline->responsible_officials))
			->select('id', 'fullName', 'role', 'username', 'studentRollId')
			->get()->toArray();

		$discipline->trial_date_formated = date('Y/m/d h:i a', $discipline->trial_date);

		if($discipline->status_id == '1') {
			$discipline->status = 'Pending';
		} else if($discipline->status_id == '2') {
			$discipline->status = 'Sovled';
		}

		$discipline->date = date('Y/m/d h:i a', $discipline->created_at);

		updateSeenNotificationMobHistory(\Auth::guard('web')->user()->id, 'discipline', $id);

		return response()->json([
			'discipline' => $discipline,
			'complained_by_data' => $complained_by_data,
			'complained_against_data' => $complained_against_data,
			'jury_data' => $jury_data,
			'responsible_officials_data' => $responsible_officials_data,
		]);
	}

	public function fetchComplainedByByWord($word) {
		$users = \User::whereIn('role', ['admin', 'teacher', 'employee', 'student'])
			->where(function($query) use ($word){
				$query->orWhere('username', 'LIKE', '%' . $word . '%')
				->orWhere('fullName', 'LIKE', '%' . $word . '%')
				->orWhere('studentRollId', 'LIKE', '%' . $word . '%')
				->orWhere('id', 'LIKE', '%' . $word . '%')
				->orWhere('admission_number', 'LIKE', '%' . $word . '%');
			})
		  ->get()->toArray();

		foreach ($users as $key => $user) {
			if($user['role'] == 'admin') {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - AdmID: ' . $user['id'];
			} else if($user['role'] == 'employee' || $user['role'] == 'teacher') {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - EmpID: ' . $user['id'];
			} else {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - RollID: ' . $user['studentRollId'];
			}
		}

		return json_encode([
			"jsData" => $users,
			"jsStatus" => "1",
			"jsCount" => count($users)
		]);
	}

	public function fetchJuryByWord($word) {
		$users = \User::whereIn('role', ['admin', 'principal', 'teacher'])
			->where(function($query) use ($word){
				$query->orWhere('username', 'LIKE', '%' . $word . '%')
				->orWhere('fullName', 'LIKE', '%' . $word . '%')
				->orWhere('id', 'LIKE', '%' . $word . '%')
				->orWhere('admission_number', 'LIKE', '%' . $word . '%');
			})
		  ->get()->toArray();

		foreach ($users as $key => $user) {
			if($user['role'] == 'admin') {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - AdmID: ' . $user['id'];
			} else if($user['role'] == 'teacher') {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - TechID: ' . $user['id'];
			} else if($user['role'] == 'principal') {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - ID: ' . $user['id'];
			}
		}

		return json_encode([
			"jsData" => $users,
			"jsStatus" => "1",
			"jsCount" => count($users)
		]);
	}

	public function fetchResponsibleOfficialsByWord($word) {
		$users = \User::whereIn('role', ['admin', 'teacher', 'employee'])
			->where(function($query) use ($word){
				$query->orWhere('username', 'LIKE', '%' . $word . '%')
				->orWhere('fullName', 'LIKE', '%' . $word . '%')
				->orWhere('id', 'LIKE', '%' . $word . '%')
				->orWhere('admission_number', 'LIKE', '%' . $word . '%');
			})
		  ->get()->toArray();

		foreach ($users as $key => $user) {
			if($user['role'] == 'admin') {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - AdmID: ' . $user['id'];
			} else {
				$users[$key]['display_discipline'] = $user['fullName'] . ' - EmpID: ' . $user['id'];
			}
		}

		return json_encode([
			"jsData" => $users,
			"jsStatus" => "1",
			"jsCount" => count($users)
		]);
	}

	public function savePostComment() {
		$discipline_id = request()->input('discipline_id');
		$comment = request()->input('comment');

		$discipline = Discipline::find($discipline_id);
		$old_comments_array = json_decode($discipline->comments); // array
		if(is_null($old_comments_array)) $old_comments_array = [];

		$item = [
			time() => [
				'id' => $this->data['users']->id,
				'fullName' => $this->data['users']->fullName,
				'comment' => $comment,
				'timestamp' => time()
			]
		];

		$new_comments_array = array_merge($item, $old_comments_array);
		$discipline->comments = json_encode($new_comments_array);
		$discipline->save();

		 return $this->panelInit->apiOutput(true,'Discipline comment','Comment is posted successfully');
	}
}
