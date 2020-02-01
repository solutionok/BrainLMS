<?php

namespace App\Http\Controllers;

use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\Section;
use App\Models2\Subject;
use App\Models2\User;

class TeachersController extends Controller {

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

	function waitingApproval(){

		if(!$this->panelInit->can( "teachers.Approve" )){
			exit;
		}

		return \User::where('role','teacher')->where('activated','0')->orderBy('id','DESC')->get();
	}

	function approveOne($id){

		if(!$this->panelInit->can( "teachers.Approve" )){
			exit;
		}

		$user = \User::find($id);
		$user->activated = 1;
		$user->save();

		user_log('Teachers', 'approve', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['approveTeacher'],$this->panelInit->language['teacherApproved'],array("user"=>$user->id));
	}

	public function listAll($page = 1)
	{

		if(!$this->panelInit->can( array("teachers.list","teachers.addTeacher","teachers.EditTeacher","teachers.delTeacher","teachers.Approve","teachers.teacLeaderBoard","teachers.Import","teachers.Export") )){
			exit;
		}

		$toReturn = array();
		$toReturn['teachers'] = User::where('role','teacher')->where('activated','1');

		if(\Input::has('searchInput')){
			$searchInput = \Input::get('searchInput');

			if(is_string($searchInput)) {
				$searchInput = (array) json_decode($searchInput);
			}

			if(is_array($searchInput)){

				if(isset($searchInput['text']) AND strlen($searchInput['text']) > 0 ){
					$keyword = $searchInput['text'];
					$toReturn['teachers'] = $toReturn['teachers']->where(function($query) use ($keyword){
						$query->where('fullName','like','%'.$keyword.'%')->orWhere('username','like','%'.$keyword.'%');
					});
				}

				if(isset($searchInput['email']) AND strlen($searchInput['email']) > 0 ){
					$toReturn['teachers'] = $toReturn['teachers']->where('email','like','%'.$searchInput['email'].'%');
				}

				if(isset($searchInput['gender']) AND strlen($searchInput['gender']) > 0 AND $searchInput['gender'] != "" ){
					$toReturn['teachers'] = $toReturn['teachers']->where('gender',$searchInput['gender']);
				}

				if(isset($searchInput['class']) AND $searchInput['class'] != "" ){
					$target_teachers = Main::getTeacherIdsByClassId($searchInput['class'][0]);;
					foreach ($target_teachers as $key => $item) {
						$items1[] = str_replace(['"', '[', ']'], ['', '', ''], $item);
					};
					$toReturn['teachers'] = $toReturn['teachers']->whereIn('id', $items1);
				}

				if(isset($searchInput['subject']) AND $searchInput['subject'] != ""){
					$target_teachers = Main::getTeacherIdsBySubjectId($searchInput['subject'][0]);
					foreach ($target_teachers as $key => $item) {
						$items2[] = str_replace(['"', '[', ']'], ['', '', ''], $item);
					}
					$toReturn['teachers'] = $toReturn['teachers']->whereIn('id', $items2);
				}

			}
		}

		$toReturn['totalItems'] = $toReturn['teachers']->count();

		if(\Input::has('sortBy')){
			$sortBy = array('id + 0 ASC','id + 0 DESC','fullName ASC','fullName DESC','username ASC','username DESC');
			if (in_array(\Input::get('sortBy'), $sortBy)) {

				$User = \settings::where('fieldName','teachersSort')->first();
				$User->fieldValue = \Input::get('sortBy');
				$User->save();

				$this->data['panelInit']->settingsArray['teachersSort'] = \Input::get('sortBy');
			}
		}

		if($this->data['panelInit']->settingsArray['teachersSort'] != ""){
			$toReturn['teachers'] = $toReturn['teachers']->orderByRaw($this->data['panelInit']->settingsArray['teachersSort']);
		}

		$toReturn['teachers'] = $toReturn['teachers']->take(all_pagination_number())->skip(all_pagination_number() * ($page - 1) )->get()->toArray();

		$transport_vehicles = array();
		$transport_vehicles_ =  \transport_vehicles::get()->toArray();
		foreach ($transport_vehicles_ as $key => $value) {
			$transport_vehicles[$value['id']] = $value['plate_number'] . " ( " .$value['driver_name'] ." )";
		}

		$toReturn['transports'] = array();
		$toReturn['transport_vehicles'] = array();
		$transports =  \transportation::get()->toArray();
		foreach ($transports as $key => $value) {
			$value['vehicles_list'] = json_decode($value['vehicles_list'],true);
			$toReturn['transports'][$value['id']] = $value;
			$toReturn['transports'][$value['id']]['vehicles'] = array();
			if(is_array($value['vehicles_list'])){
				foreach ($value['vehicles_list'] as $key_ => $value_) {
					if(isset($transport_vehicles[ $value_ ])){
						$toReturn['transports'][$value['id']]['vehicles'][ $value_ ] = $transport_vehicles[ $value_ ];
					}
				}
			}
		}

		$toReturn['roles'] = \roles::select('id','role_title')->get();

		return $toReturn;
	}

	public function export(){

		if(!$this->panelInit->can( "teachers.Export" )){
			exit;
		}

		$data = array(1 => array ( 'Full Name','User Name','E-mail','Gender','Address','Phone No','Mobile No','birthday','password'));
		$student = \User::where('role','teacher')->get();
		foreach ($student as $value) {
			$birthday = "";
			if($value->birthday != 0){
				$birthday = $this->panelInit->unix_to_date($value->birthday);
			}
			$data[] = array ($value->fullName,$value->username,$value->email,$value->gender,$value->address,$value->phoneNo,$value->mobileNo,$birthday,"");
		}

		user_log('Teachers', 'export');

		\Excel::create('Teachers-Sheet', function($excel) use($data) {

		    // Set the title
		    $excel->setTitle('Teachers Sheet');

		    // Chain the setters
		    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Teachers', function($sheet) use($data) {
				$sheet->freezeFirstRow();
				$sheet->fromArray($data, null, 'A1', true,false);
			});

		})->download('xls');
	}

	public function exportpdf(){

		if(!$this->panelInit->can( "teachers.Export" )){
			exit;
		}

		$header = array ($this->panelInit->language['FullName'],$this->panelInit->language['username'],$this->panelInit->language['email'],$this->panelInit->language['Gender'],$this->panelInit->language['Address'],$this->panelInit->language['phoneNo'],$this->panelInit->language['mobileNo']);
		$data = array();
		$student = \User::where('role','teacher')->get();
		foreach ($student as $value) {
			$data[] = array ($value->fullName,$value->username ,$value->email,$value->gender,$value->address,$value->phoneNo,$value->mobileNo );
		}

		$doc_details = array(
							"title" => "Teachers List",
							"author" => $this->data['panelInit']->settingsArray['siteTitle'],
							"topMarginValue" => 10
							);

		if( $this->panelInit->isRTL == "1" ){
			$doc_details['is_rtl'] = true;
		}

		user_log('Teachers', 'export');

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
		$pdfbuilder->output('Teachers.pdf');
	}

	public function import($type){

		if(!$this->panelInit->can( "teachers.Import" )){
			exit;
		}

		if (\Input::hasFile('excelcsv')) {
			if ( $_FILES['excelcsv']['tmp_name'] )
			{
				user_log('Teachers', 'import');

				$readExcel = \Excel::load($_FILES['excelcsv']['tmp_name'], function($reader) { })->get();

				$dataImport = array("ready"=>array(),"revise"=>array());
				foreach ($readExcel as $row)
				{
					$importItem = array();
					if(isset($row['full_name']) AND $row['full_name'] != null){
						$importItem['fullName'] = $row['full_name'];
					}
					if(isset($row['user_name']) AND $row['user_name'] != null){
						$importItem['username'] = $row['user_name'];
					}else{
						continue;
					}
					if(isset($row['e_mail']) AND $row['e_mail'] != null){
						$importItem['email'] = $row['e_mail'];
					}
					if(isset($row['gender']) AND $row['gender'] != null){
						$importItem['gender'] = $row['gender'];
					}
					if(isset($row['address']) AND $row['address'] != null){
						$importItem['address'] = $row['address'];
					}
					if(isset($row['phone_no']) AND $row['phone_no'] != null){
						$importItem['phoneNo'] = $row['phone_no'];
					}
					if(isset($row['mobile_no']) AND $row['mobile_no'] != null){
						$importItem['mobileNo'] = $row['mobile_no'];
					}
					if(isset($row['birthday']) AND $row['birthday'] != null){
						if($row['birthday'] == ""){
							$importItem['birthday'] = "";
						}elseif(is_object($row['birthday'])){
							$importItem['birthday'] = $row['birthday']->timestamp;
						}elseif(is_string($row['birthday'])){
							$importItem['birthday'] = $this->panelInit->date_to_unix($row['birthday']);
						}
					}
					if(isset($row['password']) AND $row['password'] != null){
						$importItem['password'] = $row['password'];
					}

					$checkUser = \User::where('username',$importItem['username']);
					if($checkUser->count() > 0){
						$checkUser = $checkUser->first();
						if($checkUser->username == $importItem['username']){
							$importItem['error'][] = "username";
						}
						/*if($checkUser->email == $importItem['email']){
							$importItem['error'][] = "email";
						}*/
						$dataImport['revise'][] = $importItem;
					}else{
						$dataImport['ready'][] = $importItem;
					}
				}
				return $dataImport;
			}

		}else{
			return json_encode(array("jsTitle"=>$this->panelInit->language['Import'],"jsStatus"=>"0","jsMessage"=>$this->panelInit->language['specifyFileToImport'] ));
			exit;
		}
		exit;
	}

	public function reviewImport(){

		if(!$this->panelInit->can( "teachers.Import" )){
			exit;
		}

		if(\Input::has('importReview')){
			$importReview = \Input::get('importReview');
			$importReview = array_merge($importReview['ready'], $importReview['revise']);

			$dataImport = array("ready"=>array(),"revise"=>array());
			foreach($importReview as $row){
				unset($row['error']);
				$checkUser = \User::where('username',$row['username']);
				if($checkUser->count() > 0){
					$checkUser = $checkUser->first();
					if($checkUser->username == $row['username']){
						$row['error'][] = "username";
					}
					/*if($checkUser->email == $row['email']){
						$row['error'][] = "email";
					}*/
					$dataImport['revise'][] = $row;
				}else{
					$dataImport['ready'][] = $row;
				}
			}

			if(count($dataImport['revise']) > 0){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['Import'],$this->panelInit->language['reviseImportData'],$dataImport);
			}else{

				//Get the default role
				$def_role = \roles::where('def_for','teacher')->select('id');
				if($def_role->count() == 0){
					return $this->panelInit->apiOutput(false,'Import','No default role assigned for teachers, Please contact administartor');
				}
				$def_role = $def_role->first();

				foreach($dataImport['ready'] as $value){
					$User = new \User();
					if(isset($value['email'])){
						$User->email = $value['email'];
					}
					if(isset($value['username'])){
						$User->username = $value['username'];
					}
					if(isset($value['fullName'])){
						$User->fullName = $value['fullName'];
					}
					if(isset($value['password']) AND $value['password'] != ""){
						$User->password = \Hash::make($value['password']);
					}
					$User->role = "teacher";
					if(isset($value['gender'])){
						$User->gender = $value['gender'];
					}
					if(isset($value['address'])){
						$User->address = $value['address'];
					}
					if(isset($value['phoneNo'])){
						$User->phoneNo = $value['phoneNo'];
					}
					if(isset($value['mobileNo'])){
						$User->mobileNo = $value['mobileNo'];
					}
					if(isset($value['birthday'])){
						$User->birthday = $value['birthday'];
					}
					$User->comVia = '["mail","sms","phone"]';
					$User->role_perm = $def_role->id;
					$User->account_active = "1";
					$User->save();
				}
				return $this->panelInit->apiOutput(true,$this->panelInit->language['Import'],$this->panelInit->language['dataImported']);
			}
		}else{
			return $this->panelInit->apiOutput(true,$this->panelInit->language['Import'],$this->panelInit->language['noDataImport']);
			exit;
		}
		exit;
	}

	public function delete($id){

		if(!$this->panelInit->can( "teachers.delTeacher" )){
			exit;
		}

		if ( $postDelete = \User::where('role','teacher')->where('id', $id)->first() ) {
    		user_log('Teachers', 'delete', $postDelete->fullName);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delTeacher'],$this->panelInit->language['teacherDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delTeacher'],$this->panelInit->language['teacherNotExist']);
    }
	}

	function account_status($id){

		if(!$this->panelInit->can( "teachers.EditTeacher" )){
			exit;
		}

		$user = \User::where('role','teacher')->where('id',$id)->first();

		if($user->account_active == "1"){
			$user->account_active = "0";
		}else{
			$user->account_active = "1";
		}

		$user->save();

		user_log('Teachers', 'update_status', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['EditTeacher'],$this->panelInit->language['accStatusChged'], array( 'id' => $user->id,'account_active' => $user->account_active ) );
	}

	function leaderboard($id){

		if(!$this->panelInit->can( "teachers.teacLeaderBoard" )){
			exit;
		}

		$user = \User::where('id',$id)->first();
		$user->isLeaderBoard = \Input::get('isLeaderBoard');
		$user->save();

		//Send Push Notifications
		$tokens_list = array();
		$user_ids = array();
		if(is_array(json_decode($user->firebase_token))) {
			foreach (json_decode($user->firebase_token) as $token) {
				$tokens_list[] = $token;
			}
		} else if ($this->isJson($user->firebase_token)) {
			foreach (json_decode($user->firebase_token) as $token) {
				$tokens_list[] = $token;
			}
		} else {
			$tokens_list[] = $user->firebase_token;
		}
		$user_ids[] = $user->id;

		if($user->firebase_token != ""){
			$this->panelInit->send_push_notification($tokens_list,$user_ids,$this->panelInit->language['notifyIsLedaerBoard']);
		} else {
			$this->panelInit->save_notifications_toDB($tokens_list,$user_ids,$this->panelInit->language['notifyIsLedaerBoard']);
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['teacLeaderBoard'],$this->panelInit->language['teacIsLeader']);
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	function leaderboardRemove($id){

		if(!$this->panelInit->can( "teachers.teacLeaderBoard" )){
			exit;
		}

		if ( $postDelete = \User::where('role','teacher')->where('id', $id)->where('isLeaderBoard','!=','')->first() )
        {
            \User::where('role','teacher')->where('id', $id)->update(array('isLeaderBoard' => ''));
            return $this->panelInit->apiOutput(true,$this->panelInit->language['teacLeaderBoard'],$this->panelInit->language['teacLeaderDel']);
        }else{
            return $this->panelInit->apiOutput(false,$this->panelInit->language['teacLeaderBoard'],$this->panelInit->language['teachNotLeader']);
        }
	}

	public function create(){

		if(!$this->panelInit->can( "teachers.addTeacher" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addTeacher'],$this->panelInit->language['usernameUsed']);
		}
		if(\User::where('email',\Input::get('email'))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addTeacher'],$this->panelInit->language['mailUsed']);
		}

		//Get the default role
		$def_role = \roles::where('def_for','teacher')->select('id');
		if($def_role->count() == 0){
			return $this->panelInit->apiOutput(false,'Import','No default role assigned for teachers, Please contact administartor');
		}
		$def_role = $def_role->first();

		$User = new \User();
		$User->username = \Input::get('username');
		$User->email = \Input::get('email');
		$User->fullName = \Input::get('fullName');
		$User->password = \Hash::make(\Input::get('password'));
		$User->role = "teacher";
		$User->gender = \Input::get('gender');
		$User->address = \Input::get('address');
		$User->phoneNo = \Input::get('phoneNo');
		$User->mobileNo = \Input::get('mobileNo');
		$User->transport = \Input::get('transport');
		$User->transport_vehicle = \Input::get('transport_vehicle');
		$User->user_position = \Input::get('user_position');
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->isLeaderBoard = "";
		if(\Input::get('birthday') != ""){
			$User->birthday = $this->panelInit->date_to_unix(\Input::get('birthday'));
		}
		if(\Input::has('biometric_id')){
			$User->biometric_id = \Input::get('biometric_id');
		}else{
			$User->biometric_id = "";
		}
		$User->account_active = "1";
		$User->role_perm = $def_role->id;
		$User->save();

		user_log('Teachers', 'create', $User->fullName);

		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addTeacher'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);

			$User->photo = "profile_".$User->id.".jpg";
			$User->save();
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addTeacher'],$this->panelInit->language['teacherCreated'],$User->toArray());
	}

	function fetch($id){

		if(!$this->panelInit->can( "teachers.EditTeacher" )){
			exit;
		}

		$data = \User::where('role','teacher')->where('id',$id)->first()->toArray();
		$data['birthday'] = $this->panelInit->unix_to_date($data['birthday']);

		$data['comVia'] = json_decode($data['comVia'],true);
		if(!is_array($data['comVia'])){
			$data['comVia'] = array();
		}

		return $data;
	}

	function edit($id){

		if(!$this->panelInit->can( "teachers.EditTeacher" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->where('id','<>',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['EditTeacher'],$this->panelInit->language['usernameUsed']);
		}
		if(\User::where('email',\Input::get('email'))->where('id','!=',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['EditTeacher'],$this->panelInit->language['mailUsed']);
		}
		$User = \User::find($id);
		$User->username = \Input::get('username');
		$User->email = \Input::get('email');
		$User->fullName = \Input::get('fullName');
		if(\Input::get('password') != ""){
			$User->password = \Hash::make(\Input::get('password'));
		}
		$User->gender = \Input::get('gender');
		$User->address = \Input::get('address');
		$User->phoneNo = \Input::get('phoneNo');
		$User->mobileNo = \Input::get('mobileNo');
		$User->transport = \Input::get('transport');
		$User->transport_vehicle = \Input::get('transport_vehicle');
		$User->user_position = \Input::get('user_position');
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		if(\Input::get('birthday') != ""){
			$User->birthday = $this->panelInit->date_to_unix(\Input::get('birthday'));
		}
		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['EditTeacher'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);

			$User->photo = "profile_".$User->id.".jpg";
		}
		if(\Input::has('biometric_id')){
			$User->biometric_id = \Input::get('biometric_id');
		}else{
			$User->biometric_id = "";
		}
		$User->save();

		user_log('Teachers', 'edit', $User->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['EditTeacher'],$this->panelInit->language['teacherUpdated'],$User->toArray());
	}

	function profile($id){
		$data = \User::where('role','teacher')->where('id',$id)->first()->toArray();
		$data['birthday'] = $this->panelInit->unix_to_date($data['birthday']);

		$return = array();
		$return['title'] = $data['fullName']." ".$this->panelInit->language['Profile'];

		$return['content'] = "<div class='text-center'>";

		$return['content'] .= "<img alt='".$data['fullName']."' class='user-image img-circle' style='width:70px; height:70px;' src='index.php/dashboard/profileImage/".$data['id']."'>";

		$return['content'] .= "</div>";

		$return['content'] .= "<h4>".$this->panelInit->language['teacherInfo']."</h4>";

		$return['content'] .= "<table class='table table-bordered'><tbody>
                          <tr>
                              <td>".$this->panelInit->language['FullName']."</td>
                              <td>".$data['fullName']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['username']."</td>
                              <td>".$data['username']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['email']."</td>
                              <td>".$data['email']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['Birthday']."</td>
                              <td>".$data['birthday']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['Gender']."</td>
                              <td>".$data['gender']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['Address']."</td>
                              <td>".$data['address']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['phoneNo']."</td>
                              <td>".$data['phoneNo']."</td>
                          </tr>
                          <tr>
                              <td>".$this->panelInit->language['mobileNo']."</td>
                              <td>".$data['mobileNo']."</td>
                          </tr>

                          </tbody></table>";

		return $return;
	}

	// Helper functions about teacher --------------------------------------

	public function fetch_teachers_by_class_id($class_id)
	{
		$teacherIds = Main::getTeacherIdsByClassId($class_id);
		$teachers = \User::where('role','teacher')
		  ->whereIn('id', $teacherIds)
		  ->select('id', 'fullName')
		  ->get()->toArray();

		return json_encode([
			"teachers" => $teachers,
			"jsStatus" => "1",
		]);
	}

	public function fetch_by_class_and_section()
	{
		$inputs = request()->all();

		if(!is_null($inputs['class_id']) && !empty($inputs['class_id']) && !is_null($inputs['section_id']) && !empty($inputs['section_id'])) {
			$class_id = $inputs['class_id'];
			$section_id = $inputs['section_id'];

			$teacherIds_classes = Main::getTeacherIdsByClassId($class_id);
			$teacherIds_sections = Main::getTeacherIdsBySectionId($section_id);

			$teachers = \User::where('role','teacher')
			  ->whereIn('id', $teacherIds_classes)
			  ->whereIn('id', $teacherIds_sections)
			  ->select('id', 'fullName')
			  ->get()->toArray();

			return json_encode([
				"teachers" => $teachers,
				"jsStatus" => "1",
			]);
		} else {
			return json_encode([
				"jsStatus" => "0",
			]);
		}
	}

	public function fetch_by_class_and_subject()
	{
		$inputs = request()->all();

		if(!is_null($inputs['class_id']) && !empty($inputs['class_id']) && !is_null($inputs['subject_id']) && !empty($inputs['subject_id'])) {
			$class_id = $inputs['class_id'];
			$subject_id = $inputs['subject_id'];

			$teacherIds_classes = Main::getTeacherIdsByClassId($class_id);
			$teacherIds_subjects = Main::getTeacherIdsBySubjectId($subject_id);

			$teachers = \User::where('role','teacher')
			  ->whereIn('id', $teacherIds_classes)
			  ->whereIn('id', $teacherIds_subjects)
			  ->select('id', 'fullName')
			  ->get()->toArray();

			return json_encode([
				"teachers" => $teachers,
				"jsStatus" => "1",
			]);
		} else {
			return json_encode([
				"jsStatus" => "0",
			]);
		}
	}
}
