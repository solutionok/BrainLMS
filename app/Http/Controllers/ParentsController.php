<?php
namespace App\Http\Controllers;

class ParentsController extends Controller {

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

		if(!$this->panelInit->can( "parents.Approve" )){
			exit;
		}

		return \User::where('role','parent')->where('activated','0')->orderBy('id','DESC')->get();
	}

	function approveOne($id){

		if(!$this->panelInit->can( "parents.Approve" )){
			exit;
		}

		$user = \User::find($id);
		$user->activated = 1;
		$user->save();

		user_log('Parents', 'approve', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['approveTeacher'],$this->panelInit->language['teacherApproved'],array("user"=>$user->id));
	}

	function listAllData($page = 1){

		if(!$this->panelInit->can( array("parents.list","parents.AddParent","parents.editParent","parents.delParent","parents.Approve","parents.Import","parents.Export") )){
			exit;
		}

		$toReturn = array();
		$toReturn['parents'] = \User::where('role','parent')->where('activated','1');

		if(\Input::has('searchInput')){
			$searchInput = \Input::get('searchInput');
			if(is_array($searchInput)){

				if(isset($searchInput['text']) AND strlen($searchInput['text']) > 0 ){
					$keyword = $searchInput['text'];
					$toReturn['parents'] = $toReturn['parents']->where(function($query) use ($keyword){
																	$query->where('fullName','like','%'.$keyword.'%')->orWhere('username','like','%'.$keyword.'%');
																});
				}

				if(isset($searchInput['email']) AND strlen($searchInput['email']) > 0 ){
					$toReturn['parents'] = $toReturn['parents']->where('email','like','%'.$searchInput['email'].'%');
				}

				if(isset($searchInput['gender']) AND strlen($searchInput['gender']) > 0 AND $searchInput['gender'] != "" ){
					$toReturn['parents'] = $toReturn['parents']->where('gender',$searchInput['gender']);
				}

			}
		}

		$toReturn['totalItems'] = $toReturn['parents']->count();

		if(\Input::has('sortBy')){
			$sortBy = array('id + 0 ASC','id + 0 DESC','fullName ASC','fullName DESC','username ASC','username DESC');
			if (in_array(\Input::get('sortBy'), $sortBy)) {

				$User = \settings::where('fieldName','parentsSort')->first();
				$User->fieldValue = \Input::get('sortBy');
				$User->save();

				$this->data['panelInit']->settingsArray['parentsSort'] = \Input::get('sortBy');
			}
		}

		if($this->data['panelInit']->settingsArray['parentsSort'] != ""){
			$toReturn['parents'] = $toReturn['parents']->orderByRaw($this->data['panelInit']->settingsArray['parentsSort']);
		}

		$toReturn['parents'] = $toReturn['parents']->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
		$toReturn['roles'] = \roles::select('id','role_title')->get();

		return $toReturn;
	}

	public function listAll($page = 1)
	{

		if(!$this->panelInit->can( array("parents.list","parents.AddParent","parents.editParent","parents.delParent","parents.Approve","parents.Import","parents.Export") )){
			exit;
		}

		return $this->listAllData($page);
	}

	public function export(){

		if(!$this->panelInit->can( "parents.Export" )){
			exit;
		}

		$data = array(1 => array ( 'Full Name','User Name','E-mail','Gender','Address','Phone No','Mobile No','birthday','Profession','password','ParentOf'));
		$student = \User::where('role','parent')->get();
		foreach ($student as $value) {
			$parentOf = json_decode($value->parentOf,true);
			if(count($parentOf) > 0){
				$ids = array();
				foreach($parentOf as $value_){
					$ids[] = $value_['id'];
				}
				$users = \User::whereIn('id',$ids)->select('username')->get();
				$ids = array();
				foreach ($users as $value_) {
					$ids[] = $value_->username;
				}
				$value->parentOf = implode(",",$ids);
			}else{
				$value->parentOf = "";
			}
			$birthday = "";
			if($value->birthday != 0){
				$birthday = $this->panelInit->unix_to_date($value->birthday);
			}
			$data[] = array ($value->fullName,$value->username,$value->email,$value->gender,$value->address,$value->phoneNo,$value->mobileNo,$birthday,$value->parentProfession,"",$value->parentOf);
		}

		user_log('Parents', 'export');

		\Excel::create('Parents-Sheet', function($excel) use($data) {

	    // Set the title
	    $excel->setTitle('Parents Sheet');

	    // Chain the setters
	    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Parents', function($sheet) use($data) {
				$sheet->freezeFirstRow();
				$sheet->fromArray($data, null, 'A1', true,false);
			});
		})->download('xls');
	}

	public function exportpdf(){

		if(!$this->panelInit->can( "parents.Export" )){
			exit;
		}

		$header = array ($this->panelInit->language['FullName'],$this->panelInit->language['username'],$this->panelInit->language['email'],$this->panelInit->language['Gender'],$this->panelInit->language['Address'],$this->panelInit->language['phoneNo'],$this->panelInit->language['mobileNo']);
		$data = array();
		$student = \User::where('role','parent')->get();
		foreach ($student as $value) {
			$data[] = array ($value->fullName,$value->username ,$value->email,$value->gender,$value->address,$value->phoneNo,$value->mobileNo);
		}

		$doc_details = array(
							"title" => "Parents List",
							"author" => $this->data['panelInit']->settingsArray['siteTitle'],
							"topMarginValue" => 10
							);

		if( $this->panelInit->isRTL == "1" ){
			$doc_details['is_rtl'] = true;
		}

		user_log('Parents', 'export');

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
		$pdfbuilder->output('Parents.pdf');

	}

	protected function has_dupes($array) {
    return count($array) !== count(array_unique($array));
	}

	public function import($type){

		if(!$this->panelInit->can( "parents.Import" )){
			exit;
		}

		if (\Input::hasFile('excelcsv')) {
			if ( $_FILES['excelcsv']['tmp_name'] )
			{
				user_log('Parents', 'import');

				$readExcel = \Excel::load($_FILES['excelcsv']['tmp_name'], function($reader) { })->get();

				$dataImport = array("ready"=>array(),"revise"=>array());
				$list_of_usernames = [];

				foreach ($readExcel as $row) {
					$dataImportStatus = true;
					$importItem = array();

					if(isset($row['full_name']) AND $row['full_name'] != null){
						$importItem['fullName'] = $row['full_name'];
					}
					if(isset($row['user_name']) AND $row['user_name'] != null){
						$importItem['username'] = $row['user_name'];
						$list_of_usernames[] = $row['user_name'];
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
					if(isset($row['parentrelation']) AND $row['parentrelation'] != null){
						$importItem['parentrelation'] = $row['parentrelation'];
					}
					if(isset($row['mobile_no']) AND $row['mobile_no'] != null){
						$importItem['mobileNo'] = $row['mobile_no'];
					}
					if(isset($row['birthday']) AND $row['birthday'] != null){
						if($row['birthday'] == ""){
							$importItem['birthday'] = "";
						}elseif(is_object($row['birthday'])){
							$importItem['birthday'] =$row['birthday']->timestamp;
						}elseif(is_string($row['birthday'])){
							$importItem['birthday'] = $this->panelInit->date_to_unix($row['birthday']);
						}
					}
					if(isset($row['profession']) AND $row['profession'] != null){
						$importItem['parentProfession'] = $row['profession'];
					}
					if(isset($row['password']) AND $row['password'] != null){
						$importItem['password'] = $row['password'];
					}
					if(isset($row['parentof']) AND $row['parentof'] != null){
						$importItem['parentOf'] = $row['parentof'];
					}

					// check for empty email
					if(isset($row['e_mail']) AND $row['e_mail'] != null){
						if($importItem['email'] == ''){
							$importItem['error'][] = "email";
							$dataImportStatus = false;
						}
					}

					// check username repeating
					$checkUser = \User::where('username', $importItem['username']);
					if($checkUser->count() > 0){
						$checkUser = $checkUser->first();
						if($checkUser->username == $importItem['username']){
							$importItem['error'][] = "username";
						}
						$dataImportStatus = false;
					} else if ($this->has_dupes($list_of_usernames)){
						$importItem['error'][] = "username";
						$dataImportStatus = false;
					}

					if($dataImportStatus) {
						$dataImport['ready'][] = $importItem;
					} else {
						$dataImport['revise'][] = $importItem;
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

		if(!$this->panelInit->can( "parents.Import" )){
			exit;
		}
		$student_bbb_id = "0";
		$classArray = array();
		$classes = \classes::get();

		foreach ($classes as $class) {
			$classArray[$class->id] = $class->className;
		}

		if(\Input::has('importReview')){
			$importReview = \Input::get('importReview');
			$importReview = array_merge($importReview['ready'], $importReview['revise']);

			$dataImport = array("ready"=>array(),"revise"=>array());
			foreach($importReview as $row){
				$dataImportStatus = true;
				unset($row['error']);

				if(isset($row['email']) AND $row['email'] != null){
					if($row['email'] == ''){
						$row['error'][] = "email";
						$dataImportStatus = false;
					}
				}

				$checkUser = \User::where('username',$row['username']);
				if($checkUser->count() > 0){
					$checkUser = $checkUser->first();
					if($checkUser->username == $row['username']){
						$row['error'][] = "username";
					}
					$dataImportStatus = false;
				}

				if($dataImportStatus){
					$dataImport['ready'][] = $row;
				} else {
					$dataImport['revise'][] = $row;
				}
			}

			if(count($dataImport['revise']) > 0){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['Import'],$this->panelInit->language['reviseImportData'],$dataImport);
			}else{

				//Get the default role
				$def_role = \roles::where('def_for','parent')->select('id');
				if($def_role->count() == 0){
					return $this->panelInit->apiOutput(false,'Import','No default role assigned for teachers, Please contact administartor');
				}
				$def_role = $def_role->first();

				foreach($dataImport['ready'] as $value){
					$relation = "N/A";
					$fullNameST = "";
					$professionST = "";
					$phonenumST = "";
					$User = new \User();
					if(isset($value['email'])){
						$User->email = $value['email'];
					}
					if(isset($value['username'])){
						$User->username = $value['username'];
					}
					if(isset($value['fullName'])){

						$User->fullName = $value['fullName'];
						$fullNameST = $value['fullName'];
					}
					if(isset($value['password'])){
						$User->password = \Hash::make($value['password']);
					}
					$User->role = "parent";
					if(isset($value['gender'])){
						$User->gender = $value['gender'];
					}
					if(isset($value['address'])){
						$User->address = $value['address'];
					}
					if(isset($value['phoneNo'])){
						$User->phoneNo = $value['phoneNo'];
						$phonenumST = $value['phoneNo'];
					}
					if(isset($value['parentrelation'])){
						$relation = $value['parentrelation'];
					}
					if(isset($value['mobileNo'])){
						$User->mobileNo = $value['mobileNo'];
					}
					if(isset($value['birthday'])){
						$User->birthday = $value['birthday'];
					}

					if(isset($value['parentProfession'])){
						$User->parentProfession = $value['parentProfession'];
						$professionST = $value['parentProfession'];
					}
					if(isset($value['parentOf']) AND $value['parentOf'] != ""){
						$value['parentOf'] = explode(",",$value['parentOf']);
						if(count($value['parentOf']) > 0){
							$studetsL = \User::whereIn('admission_number',$value['parentOf'])->select('id','fullName')->get();


							$pinfo = '{"name":"'.$fullNameST.'","mobile":"'.$phonenumST.'","job":"'.$professionST.'","notes":""}' ;
							$studentsArray = array();
							foreach ($studetsL as $student) {
								$current_std_mf_info = \User::find($student->id);
								if($relation == 'father'){
									$current_std_mf_info->father_info = $pinfo;
								}else if($relation == 'mother'){
									$current_std_mf_info->mother_info = $pinfo;
								}
								$current_std_mf_info->save();
								$studentsArray[] = array("student"=>$student->fullName,"relation"=>$relation,"id"=>(int)$student->id);
								$student_bbb_id = $student->id ;
							}
							$value['parentOf'] = json_encode($studentsArray);
						}
						$User->parentOf = $value['parentOf'];
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

		if(!$this->panelInit->can( "parents.delParent" )){
			exit;
		}

		if ( $postDelete = \User::where('role','parent')->where('id', $id)->first() ) {
    		user_log('Parents', 'delete', $postDelete->fullName);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delParent'],$this->panelInit->language['parentDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delParent'],$this->panelInit->language['parentNotExist']);
    }
	}

	function account_status($id){

		if(!$this->panelInit->can( "parents.editParent" )){
			exit;
		}

		$user = \User::where('role','parent')->where('id',$id)->first();

		if($user->account_active == "1"){
			$user->account_active = "0";
		}else{
			$user->account_active = "1";
		}

		$user->save();

		user_log('Parents', 'update_status', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editParent'],$this->panelInit->language['accStatusChged'], array( 'id' => $user->id,'account_active' => $user->account_active ) );
	}

	public function searchStudents($student){
		$students = \User::where('role','student')->where(function($query) use ($student){
														$query->where('fullName','like','%'.$student.'%')->orWhere('username','like','%'.$student.'%')->orWhere('email','like','%'.$student.'%');
													})->get();
		$retArray = array();
		foreach ($students as $student) {
			$retArray[$student->id] = array("id"=>$student->id,"name"=>$student->fullName,"email"=>$student->email);
		}
		return json_encode($retArray);
	}

	public function create(){

		if(!$this->panelInit->can( "parents.AddParent" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->count() > 0){
			return $this->panelInit->apiOutput(
				false,
				$this->panelInit->language['AddParent'],
				$this->panelInit->language['usernameUsed']
			);
		}

		//Get the default role
		$def_role = \roles::where('def_for','parent')->select('id');
		if($def_role->count() == 0){
			return $this->panelInit->apiOutput(false,'Import','No default role assigned for teachers, Please contact administartor');
		}
		$def_role = $def_role->first();

		$User = new \User();
		$User->username = \Input::get('username');
		if(\Input::get('birthday') != ""){
			$User->email = \Input::get('email');
		}
		$User->fullName = \Input::get('fullName');
		$User->password = \Hash::make(\Input::get('password'));
		$User->role = "parent";
		$User->gender = \Input::get('gender');
		$User->address = \Input::get('address');
		$User->phoneNo = \Input::get('phoneNo');
		$User->mobileNo = \Input::get('mobileNo');
		if(\Input::get('birthday') != ""){
			$User->birthday = $this->panelInit->date_to_unix(\Input::get('birthday'));
		}
		$User->parentProfession = \Input::get('parentProfession');
		$User->parentOf = \Input::get('linkedStudentsSer');
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->account_active = "1";
		$User->role_perm = $def_role->id;
		$User->save();

		user_log('Parents', 'create', $User->fullName);

		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['AddParent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['AddParent'],$this->panelInit->language['AddParent'],$User->toArray());
	}

	function fetch($id){

		if(!$this->panelInit->can( "parents.editParent" )){
			exit;
		}

		$data = \User::where('role','parent')->where('id',$id)->first()->toArray();
		$data['birthday'] = $this->panelInit->unix_to_date($data['birthday']);
		$data['parentOf'] = json_decode($data['parentOf']);

		$data['comVia'] = json_decode($data['comVia'],true);
		if(!is_array($data['comVia'])){
			$data['comVia'] = array();
		}

		return json_encode($data);
	}

	function edit($id){

		if(!$this->panelInit->can( "parents.editParent" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->where('id','<>',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['AddParent'],$this->panelInit->language['usernameUsed']);
		}
		$User = \User::find($id);
		$User->username = \Input::get('username');
		if(\Input::get('email') != ""){
		$User->email = \Input::get('email');
		}
		$User->fullName = \Input::get('fullName');
		if(\Input::get('password') != ""){
			$User->password = \Hash::make(\Input::get('password'));
		}
		$User->gender = \Input::get('gender');
		$User->address = \Input::get('address');
		$User->phoneNo = \Input::get('phoneNo');
		$User->mobileNo = \Input::get('mobileNo');
		if(\Input::get('birthday') != ""){
			$User->birthday = $this->panelInit->date_to_unix(\Input::get('birthday'));
		}
		$User->parentProfession = \Input::get('parentProfession');
		$User->parentOf = \Input::get('linkedStudentsSer');
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->save();

		user_log('Parents', 'edit', $User->fullName);

		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editParent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editParent'],$this->panelInit->language['parentModified'],$User->toArray());
	}

	function profile($id){
		$data = \User::where('role','parent')->where('id',$id)->first()->toArray();
		$data['birthday'] = $this->panelInit->unix_to_date($data['birthday']);
		$data['parentOf'] = json_decode($data['parentOf'],true);

		$return = array();
		$return['title'] = $data['fullName']." ".$this->panelInit->language['Profile'];

		$return['content'] = "<div class='text-center'>";

		$return['content'] .= "<img alt='".$data['fullName']."' class='user-image img-circle' style='width:70px; height:70px;' src='index.php/dashboard/profileImage/".$data['id']."'>";

		$return['content'] .= "</div>";

		$return['content'] .= "<h4>".$this->panelInit->language['parentInfo']."</h4>";

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
						  <tr>
                              <td>".$this->panelInit->language['students']."</td>
                              <td>";
							  if(is_array($data['parentOf'])){
							  	  foreach($data['parentOf'] as $value){
									   $return['content'] .= $value['student']."<br/>";
								  }
							  }

		$return['content'] .= "</td>
                          </tr>

                          </tbody></table>";

		return $return;
	}

	public function fetchByClassId($class_id) {
		$students = \User::where('role','student')
		  ->where('studentClass', $class_id)
		  ->select('id')
		  ->get()->toArray();

		$parents = [];
	  foreach ($students as $key => $value) {
			$parent = \User::where('role', 'parent')
			  ->where('parentOf','like','%"'.$value['id'].'"%')
			  ->orWhere('parentOf','like','%:'.$value['id'].'}%');
			if($parent->count())
				$parents[] = $parent->first()->toArray();
	  }

		return json_encode([
			"jsData" => $parents,
			"jsStatus" => "1",
			"jsCount" => count($parents)
		]);
	}

	public function fetchAll(){
		$data = \User::where('role','parent')->get()->toArray();

		return json_encode([
			"jsData" => $data,
			"jsStatus" => "1",
			"jsCount" => count($data)
		]);
	}
}
