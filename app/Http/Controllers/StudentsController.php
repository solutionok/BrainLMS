<?php
namespace App\Http\Controllers;

use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\Section;
use App\Models2\StudentType;
use App\Models2\User;
use Illuminate\Support\Facades\Auth;

class StudentsController extends Controller {

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

		if(!$this->panelInit->can( "students.Approve" )){
			exit;
		}

		if($this->data['users']->role == "teacher"){
			$class_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
			$classes = \classes::wherein('id', $class_ids)->get()->toArray();

			$classesList = array();
			foreach($classes as $value){
				$classesList[] = $value['id'];
			}

			if(count($classesList) > 0){
				$students = \User::where('role','student')->whereIn('studentClass',$classesList)->where('activated','0')->orderByRaw("studentRollId + 0 ASC")->get()->toArray();
			}else{
				$students = array();
			}
		}else{
			$students = \User::where('role','student')->where('activated','0')->orderByRaw("studentRollId + 0 ASC")->get()->toArray();
		}

		$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		$classArray = array();
		$classesIds = array();

		foreach($classes as $value){
			$classesIds[] = $value['id'];
			$classArray[$value['id']] = $value['className'];
		}

		$sectionArray = array();
		if(count($classesIds) > 0){
			$sections = \sections::whereIn('classId',$classesIds)->get()->toArray();
			foreach($sections as $value){
				$sectionArray[$value['id']] = $value['sectionName'];
			}
		}

		$toReturn = array();
		foreach($students as $student){
			$toReturn[] = array('id'=>$student['id'],"studentRollId"=>$student['studentRollId'],"fullName"=>$student['fullName'],"username"=>$student['username'],"email"=>$student['email'],"isLeaderBoard"=>$student['isLeaderBoard'],"studentClass"=>isset($classArray[$student['studentClass']]) ? $classArray[$student['studentClass']] : "","studentSection"=>isset($sectionArray[$student['studentSection']]) ? $sectionArray[$student['studentSection']] : "");
		}

		return $toReturn;
	}

	function gradStdList(){

		if(!$this->panelInit->can( "students.listGradStd" )){
			exit;
		}

		$students = \User::where('role','student')->where('studentClass','-1')->orderByRaw("studentRollId + 0 ASC")->get()->toArray();

		$toReturn = array();
		foreach($students as $student){
			$toReturn[] = array('id'=>$student['id'],"studentRollId"=>$student['studentRollId'],"fullName"=>$student['fullName'],"username"=>$student['username'],"email"=>$student['email'],"isLeaderBoard"=>$student['isLeaderBoard']);
		}

		return $toReturn;
	}

	function approveOne($id){

		if(!$this->panelInit->can( "students.Approve" )){
			exit;
		}

		$user = \User::find($id);
		$user->activated = 1;
		$user->save();

		user_log('Students', 'approve', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['approveStudent'],$this->panelInit->language['stdApproved'],array("user"=>$user->id));
	}

	public function listAll($page = 1)
	{

		if(!$this->panelInit->can( array("students.list","students.editStudent","students.delStudent","students.listGradStd","students.Approve","students.stdLeaderBoard","students.Import","students.Export","students.Attendance","students.Marksheet","students.medHistory") )){
			exit;
		}

		$toReturn = array();
		if($this->data['users']->role == "parent" ){
			$studentId = array();
			$parentOf = json_decode($this->data['users']->parentOf,true);
			if(is_array($parentOf)){
				foreach($parentOf as $key => $value){
					$studentId[] = $value['id'];
				}
			}
			if(count($studentId) > 0){
				$students = \User::where('role','student')->where('activated','1')->whereIn('id', $studentId);
			}
		}elseif($this->data['users']->role == "teacher" ){
			$class_ids = Main::getClassesIdsByTeacherId($this->data['users']->id);
			$classes_ids = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)
			  ->whereIn('id', $class_ids)
			  ->pluck('id');
			$sections_ids = Mainw::getSectionsIdsByClassTeacherId($this->data['users']->id);

			if(count($classes_ids) > 0){
				$students = \User::where('role','student')
				  ->whereIn('studentClass',$classes_ids)
				  // ->whereIn('studentSection',$sections_ids)
				  ->where('activated','1');
			}
		}else{
			$students = \User::where('role','student')->where('studentClass','!=','-1')->where('activated','1');
		}

		$students = $students->orderBy('fullName', 'ASC');

		if(\Input::has('searchInput') AND isset($students)){
			$searchInput = \Input::get('searchInput');

			if(is_string($searchInput)) {
				$searchInput = (array) json_decode($searchInput);
			}

			if(is_array($searchInput)){

				if(isset($searchInput['text']) AND strlen($searchInput['text']) > 0 ){
					$keyword = $searchInput['text'];
					$students = $students->where(function($query) use ($keyword){
						$query->where('fullName','like','%'.$keyword.'%')->orWhere('username','like','%'.$keyword.'%')->orWhere('studentRollId','like','%'.$keyword.'%');
					});
				}

				if(isset($searchInput['email']) AND strlen($searchInput['email']) > 0 ){
					$students = $students->where('email','like','%'.$searchInput['email'].'%');
				}

				if(isset($searchInput['gender']) AND strlen($searchInput['gender']) > 0 AND $searchInput['gender'] != "" ){
					$students = $students->where('gender',$searchInput['gender']);
				}

				if(isset($searchInput['gender']) AND strlen($searchInput['gender']) > 0 AND $searchInput['gender'] != "" ){
					$students = $students->where('gender',$searchInput['gender']);
				}

				if(isset($searchInput['class']) AND $searchInput['class'] != "" ){
					$students = $students->whereIn('studentClass',$searchInput['class']);
				}

				if(isset($searchInput['section']) AND $searchInput['section'] != ""){
					$students = $students->whereIn('studentSection',$searchInput['section']);
				}

				if(isset($searchInput['student_categories']) AND $searchInput['student_categories'] != "" ){
					$students = $students->whereIn('std_category',$searchInput['student_categories']);
				}
				if(isset($searchInput['student_type']) AND $searchInput['student_type'] != "" ){
					$students = $students->whereIn('studentType',$searchInput['student_type']);
				}
			}
		}

		if(isset($students)){
			$toReturn['totalItems'] = $students->count();
			if(\Input::has('sortBy')){
				$sortBy = array(
					'studentRollId + 0 ASC','studentRollId + 0 DESC',
					'fullName ASC','fullName DESC',
					'username ASC','username DESC',
					'admission_number ASC','admission_number DESC',
				);
				if (in_array(\Input::get('sortBy'), $sortBy)) {

					$User = \settings::where('fieldName','studentsSort')->first();
					$User->fieldValue = \Input::get('sortBy');
					$User->save();

					$this->data['panelInit']->settingsArray['studentsSort'] = \Input::get('sortBy');
				}
			}

			if($this->data['panelInit']->settingsArray['studentsSort'] != ""){
				$students = $students->orderByRaw($this->data['panelInit']->settingsArray['studentsSort']);
			}
			$students = $students->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
		}else{
			$students = array();
		}

		$toReturn['classes'] = $classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		$classArray = array();
		$classesIds = array();
		foreach($classes as $value){
			$classesIds[] = $value['id'];
			$classArray[$value['id']] = $value['className'];
		}

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

		$sectionArray = array();
		if(count($classesIds) > 0){
			$toReturn['sections'] = $sections = \sections::whereIn('classId',$classesIds)->get()->toArray();
			foreach($sections as $value){
				$sectionArray[$value['id']] = $value['sectionName'];
			}
		}

		$toReturn['hostel'] = array();
		$hostel = \hostel::get()->toArray();
		$hostelCat = \hostel_cat::get()->toArray();
		$hostelMail = array();

		foreach ($hostel as $value) {
			$hostelMail[$value['id']] = $value['hostelTitle'];
		}

		foreach ($hostelCat as $value) {
			if(isset($hostelMail[$value['catTypeId']])){
				$toReturn['hostel'][$value['id']] =  $hostelMail[$value['catTypeId']] . " - " . $value['catTitle'];
			}
		}

		$toReturn['userRole'] = $this->data['users']->role;

		$toReturn['students'] = array();
		foreach($students as $student){
			$toReturn['students'][] = array(
				'id'=>$student['id'],
				"studentRollId"=>$student['studentRollId'],
				"mobileNo"=>$student['mobileNo'],
				"phoneNo"=>$student['phoneNo'],
				"studentRollId"=>$student['studentRollId'],
				"account_active"=>$student['account_active'],
				"admission_number"=>$student['admission_number'],
				"fullName"=>$student['fullName'],"username"=>$student['username'],"email"=>$student['email'],"isLeaderBoard"=>$student['isLeaderBoard'],"studentClass"=>isset($classArray[$student['studentClass']]) ? $classArray[$student['studentClass']] : "","studentSection"=>isset($sectionArray[$student['studentSection']]) ? $sectionArray[$student['studentSection']] : "");
		}

		$toReturn['roles'] = \roles::select('id','role_title')->get();
		$toReturn['student_categories'] = \student_categories::select('id','cat_title')->get();
		$toReturn['student_types'] = StudentType::select('id','title')->get();

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'marksheet', null);

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "students.delStudent" )){
			exit;
		}

		if ( $postDelete = \User::where('role','student')->where('id', $id)->first() ){
    		user_log('Students', 'delete', $postDelete->fullName);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delStudent'],$this->panelInit->language['stdDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delStudent'],$this->panelInit->language['stdNotExist']);
    }
	}

	function account_status($id){

		if(!$this->panelInit->can( "students.editStudent" )){
			exit;
		}

		$user = \User::where('role','student')->where('id',$id)->first();

		if($user->account_active == "1"){
			$user->account_active = "0";
		}else{
			$user->account_active = "1";
		}

		$user->save();

		user_log('Students', 'update_status', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editStudent'],$this->panelInit->language['accStatusChged'], array( 'id' => $user->id,'account_active' => $user->account_active ) );
	}

	public function acYearRemove($student,$id){

		if(!$this->panelInit->can( "students.editStudent" )){
			exit;
		}

		if ( $postDelete = \student_academic_years::where('studentId',$student)->where('academicYearId', $id)->first() )
        {
            $postDelete->delete();
            return $this->panelInit->apiOutput(true,$this->panelInit->language['delAcademicYears'],$this->panelInit->language['acYearDelSuc']);
        }else{
            return $this->panelInit->apiOutput(false,$this->panelInit->language['delAcademicYears'],$this->panelInit->language['acYearNotExist']);
        }
	}

	public function export(){

		if(!$this->panelInit->can( "students.Export" )){
			exit;
		}

		$classArray = array();
		$classes = \classes::get();
		foreach ($classes as $class) {
			$classArray[$class->id] = $class->className;
		}

		$sectionsArray = array();
		$sections = \sections::get();
		foreach ($sections as $section) {
			$sectionsArray[$section->id] = $section->sectionName;
		}

		$data = array(1 => array (
			'Roll',
			'Full Name',
			'User Name',
			'E-mail',
			'Gender',
			'Address',
			'Phone No',
			'Mobile No',
			'birthday',
			'Class',
			'Section',
			'password'
		));
		$student = \User::where('role','student')->orderByRaw("studentRollId + 0 ASC")->get();
		foreach ($student as $value) {
			$birthday = "";
			if($value->birthday != 0){
				$birthday = $this->panelInit->unix_to_date($value->birthday);
			}
			$data[] = array (
				$value->studentRollId,
				$value->fullName,
				$value->username,
				$value->email,
				$value->gender,
				$value->address,
				$value->phoneNo,
				$value->mobileNo,$birthday,isset($classArray[$value->studentClass]) ? $classArray[$value->studentClass] : "",isset($sectionsArray[$value->studentSection]) ? $sectionsArray[$value->studentSection] : "","");
		}

		user_log('Students', 'export');

		\Excel::create('Students-Sheet', function($excel) use($data) {

	    // Set the title
	    $excel->setTitle('Students Sheet');

	    // Chain the setters
	    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Students', function($sheet) use($data) {
				$sheet->freezeFirstRow();
				$sheet->fromArray($data, null, 'A1', true,false);
			});

		})->download('xls');
	}

	public function exportpdf(){

		if(!$this->panelInit->can( "students.Export" )){
			exit;
		}

		$classArray = array();
		$classes = \classes::get();
		foreach ($classes as $class) {
			$classArray[$class->id] = $class->className;
		}

		$header = array ($this->panelInit->language['FullName'],$this->panelInit->language['username'],$this->panelInit->language['email'],$this->panelInit->language['Gender'],$this->panelInit->language['Address'],$this->panelInit->language['mobileNo'],$this->panelInit->language['class']);
		$data = array();
		$student = \User::where('role','student')->orderByRaw("studentRollId + 0 ASC")->get();
		foreach ($student as $value) {
			$data[] = array ($value->fullName,$value->username . "(".$value->studentRollId.")",$value->email,$value->gender,$value->address,$value->mobileNo, isset($classArray[$value->studentClass]) ? $classArray[$value->studentClass] : "" );
		}

		$doc_details = array(
							"title" => "Students List",
							"author" => $this->data['panelInit']->settingsArray['siteTitle'],
							"topMarginValue" => 10
							);

		if( $this->panelInit->isRTL == "1" ){
			$doc_details['is_rtl'] = true;
		}

		user_log('Students', 'export');

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
		$pdfbuilder->output('Students.pdf');
	}

	public function import($type){

		if(!$this->panelInit->can( "students.Import" )){
			exit;
		}

		if (\Input::hasFile('excelcsv')) {

			$classArray = array();
			$classArray_id = array();
			$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();
			foreach ($classes as $class) {
				$classArray[$class->className] = $class->id;
				$classArray_id[$class->id] = $class->className;
			}

			$sectionsArray = array();
			$sections = \sections::get();
			foreach ($sections as $section) {
				if(isset( $classArray_id[$section->classId] )){
					$sectionsArray[$section->classId][$section->id] = $section->sectionName;
				}
			}

			if ( $_FILES['excelcsv']['tmp_name'] )
			{
				user_log('Students', 'import');
				$readExcel = \Excel::load($_FILES['excelcsv']['tmp_name'], function($reader) { })->get();

				$dataImport = array("ready"=>array(),"revise"=>array());
				foreach ($readExcel as $row)
				{
					$importItem = array();
					if(isset($row['roll']) AND $row['roll'] != null){
						$importItem['studentRollId'] = $row['roll'];
					}
          if(isset($row['admission_num']) AND $row['admission_num'] != null){
						$importItem['admissionNum'] = $row['admission_num'];
					}
					if(isset($row['transport']) AND $row['transport'] != null){
						$importItem['transport'] = $row['transport'];
					}
					if(isset($row['transport_vehicle']) AND $row['transport_vehicle'] != null){
						$importItem['transportVehicle'] = $row['transport_vehicle'];
					}
					if(isset($row['full_name']) AND $row['full_name'] != null){
						$importItem['fullName'] = $row['full_name'];
					}
					if(isset($row['user_name']) AND $row['user_name'] != null){
						$importItem['username'] = $row['user_name'];
					}else{
						continue;
					}
					/*if(isset($row['e_mail']) AND $row['e_mail'] != null){
						$importItem['email'] = $row['e_mail'];
					}else{
						continue;
					}*/
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
							$importItem['birthday'] =$row['birthday']->timestamp;
						}elseif(is_string($row['birthday'])){
							$importItem['birthday'] = $this->panelInit->date_to_unix($row['birthday']);
						}
					}
					if(isset($row['class']) AND $row['class'] != null){
						$importItem['class'] = $row['class'];
						$importItem['studentClass'] = (isset($classArray[$row['class']]))?$classArray[$row['class']]:'';

						if($importItem['studentClass'] == ""){
							$importItem['error'][] = "class";
						}

					}else{
						$importItem['error'][] = "class";
					}

					if($this->panelInit->settingsArray['enableSections'] == true AND isset($row['section']) AND $row['section'] != null){
						$importItem['section'] = $row['section'];
						if($importItem['studentClass'] != ''){
							$sectionDb = \sections::where('classId',$importItem['studentClass'])->where('sectionName',$row['section'])->select('id');
							if($sectionDb->count() > 0){
								$sectionDb = $sectionDb->first();
								$importItem['studentSection'] = $sectionDb->id;
							}else{
								$importItem['studentSection'] = '';
							}
						}else{
							$importItem['studentSection'] = '';
						}
					}
					if($this->panelInit->settingsArray['enableSections'] == true AND ( !isset($importItem['studentSection']) || $importItem['studentSection'] == "" ) ){
						$importItem['error'][] = "section";
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

					}

					if(isset($importItem['error']) && count($importItem['error']) > 0){
						$dataImport['revise'][] = $importItem;
					}else{
						$dataImport['ready'][] = $importItem;
					}
				}

				$toReturn = array();
				$toReturn['dataImport'] = $dataImport;
				$toReturn['sections'] = $sectionsArray;

				return $toReturn;
			}
		}else{
			return json_encode(array("jsTitle"=>$this->panelInit->language['Import'],"jsStatus"=>"0","jsMessage"=>$this->panelInit->language['specifyFileToImport'] ));
			exit;
		}
		exit;
	}

	public function reviewImport(){

		if(!$this->panelInit->can( "students.Import" )){
			exit;
		}

		$classArray = array();
		$classArray_id = array();
		$classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get();
		foreach ($classes as $class) {
			$classArray[$class->className] = $class->id;
			$classArray_id[$class->id] = $class->className;
		}

		$sectionsArray = array();
		$sections = \sections::get();
		foreach ($sections as $section) {
			if(isset( $classArray_id[$section->classId] )){
				$sectionsArray[$section->classId][$section->id] = $section->sectionName;
			}
		}

		if(\Input::has('importReview')){
			$importReview = \Input::get('importReview');
			if(!isset($importReview['ready'])){
				$importReview['ready'] = array();
			}
			if(!isset($importReview['revise'])){
				$importReview['revise'] = array();
			}
			$importReview = array_merge($importReview['ready'], $importReview['revise']);

			$dataImport = array("ready"=>array(),"revise"=>array());
			foreach($importReview as $row){
				unset($row['error']);
				/*if(isset($this->panelInit->settingsArray['emailIsMandatory']) AND $this->panelInit->settingsArray['emailIsMandatory'] == 1){
					$checkUser = \User::where('username',$row['username'])->orWhere('email',$row['email']);

                }else{*/
					$checkUser = \User::where('username',$row['username']);
					/*if(isset($row['email']) AND $row['email'] != ""){
						$checkUser = $checkUser->orWhere('email',$row['email']);
					}
				}*/
				if($checkUser->count() > 0){
					$checkUser = $checkUser->first();
					if($checkUser->username == $row['username']){
						$row['error'][] = "username";
					}
					/*if($checkUser->email == $row['email']){
						$row['error'][] = "email";
					}*/
				}

				if($row['studentClass'] == "" OR !isset($classArray_id[$row['studentClass']])){
					$row['error'][] = "class";
				}

				if($this->panelInit->settingsArray['enableSections'] == true AND ( !isset($row['studentSection']) || $row['studentSection'] == "" || !isset($sectionsArray[$row['studentClass']][$row['studentSection']]) ) ){
					$row['error'][] = "section";
				}

				if(isset($row['error']) AND count($row['error']) > 0){
					$dataImport['revise'][] = $row;
				}else{
					$dataImport['ready'][] = $row;
				}
			}

			if(count($dataImport['revise']) > 0){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['Import'],$this->panelInit->language['reviseImportData'],$dataImport);
			}else{

				//Get the default role
				$def_role = \roles::where('def_for','student')->select('id');
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
					if(isset($value['transportVehicle'])){
						$User->transport_vehicle = $value['transportVehicle'];
					}
					if(isset($value['transport'])){
						$User->transport = $value['transport'];
					}
					if(isset($value['fullName'])){
						$User->fullName = $value['fullName'];
					}
					if(isset($value['password']) AND $value['password'] != ""){
						$User->password = \Hash::make($value['password']);
					}
					$User->role = "student";
					if(isset($value['studentRollId'])){
						$User->studentRollId = $value['studentRollId'];
					}
                    if(isset($value['admissionNum'])){
						$User->admission_number = $value['admissionNum'];
					}
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
					$User->studentAcademicYear = $this->panelInit->selectAcYear;
					if(isset($value['studentClass'])){
						$User->studentClass = $value['studentClass'];
					}
					if(isset($value['studentSection'])){
						$User->studentSection = $value['studentSection'];
					}
					$User->comVia = '["mail","sms","phone"]';
					$User->account_active = "1";
					$User->role_perm = $def_role->id;
					$User->save();


					if(isset($value['transport'])){
						$transportation = \transportation::find($value['transport']);
						for( $i= 1 ; $i <= 12 ; $i++ ){
						$start = $this->panelInit->settingsArray['invoice_sc_'.$i];
						$due = $this->panelInit->settingsArray['invoice_sc_due_'.$i];
						$xx = $this->panelInit->settingsArray['months_'.$i];
						$fine_tra = $this->panelInit->settingsArray['fine_tra'];
							if (!empty($start) && !empty($due) && !empty($xx) && strlen($start) > 6 && strlen($due) > 6 && $xx > 0 ) {
							$payments = new \payments();
							$payments->paymentTitle = "Transport Fee";
							$payments->paymentDescription   = $transportation->transportTitle." fee of ".$xx." months";
							$payments->paymentStudent = $User->id;
							$paymentRows = array();
							$payments->paymentRows = json_encode($paymentRows);
							$payments->paymentAmount = $transportation->transportFare * $xx;
							$payments->paymentDiscounted = $transportation->transportFare * $xx;
							$payments->paymentDate = $this->panelInit->date_to_unix($start);
							$payments->dueDate = $this->panelInit->date_to_unix($due);
							$payments->paymentUniqid = uniqid();
							$payments->paymentStatus = "0";
							$payments->fine_amount = $fine_tra;
							$payments->save();
							}

						}

					}
					$studentAcademicYears = new \student_academic_years();
					$studentAcademicYears->studentId = $User->id;
					$studentAcademicYears->academicYearId = $this->panelInit->selectAcYear;
					$studentAcademicYears->classId = $value['studentClass'];
					if($this->panelInit->settingsArray['enableSections'] == true){
						$studentAcademicYears->sectionId = $value['studentSection'];
					}
					$studentAcademicYears->save();

				}
				return $this->panelInit->apiOutput(true,$this->panelInit->language['Import'],$this->panelInit->language['dataImported']);
			}
		}else{
			return $this->panelInit->apiOutput(true,$this->panelInit->language['Import'],$this->panelInit->language['noDataImport']);
			exit;
		}
		exit;
	}

	public function preAdmission(){
		$toReturn = array();

		$toReturn['classes'] = $classes = \classes::where('classAcademicYear',$this->panelInit->selectAcYear)->get()->toArray();
		$classArray = array();
		$classesIds = array();
		foreach($classes as $value){
			$classesIds[] = $value['id'];
			$classArray[$value['id']] = $value['className'];
		}

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
			if(is_array($value['vehicles_list'] )){
				foreach ($value['vehicles_list'] as $key_ => $value_) {
					if(isset($transport_vehicles[ $value_ ])){
						$toReturn['transports'][$value['id']]['vehicles'][ $value_ ] = $transport_vehicles[ $value_ ];
					}
				}
			}
		}

		$sectionArray = array();
		if(count($classesIds) > 0){
			$toReturn['sections'] = $sections = \sections::whereIn('classId',$classesIds)->get()->toArray();
			foreach($sections as $value){
				$sectionArray[$value['id']] = $value['sectionName'];
			}
		}

		$toReturn['hostel'] = array();
		$hostel = \hostel::get()->toArray();
		$hostelCat = \hostel_cat::get()->toArray();
		$hostelMail = array();

		foreach ($hostel as $value) {
			$hostelMail[$value['id']] = $value['hostelTitle'];
		}

		foreach ($hostelCat as $value) {
			if(isset($hostelMail[$value['catTypeId']])){
				$toReturn['hostel'][$value['id']] =  $hostelMail[$value['catTypeId']] . " - " . $value['catTitle'];
			}
		}

		user_log('Students', 'pre_admission');

		$toReturn['roles'] = \roles::select('id','role_title')->get();
		$toReturn['student_categories'] = \student_categories::select('id','cat_title')->get();
		$toReturn['student_types'] = StudentType::select('id','title')->get();

		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "students.admission" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],$this->panelInit->language['usernameUsed']);
		}
		/*if(isset($this->panelInit->settingsArray['emailIsMandatory']) AND $this->panelInit->settingsArray['emailIsMandatory'] == 1){
			if(\User::where('email',\Input::get('email'))->count() > 0){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],$this->panelInit->language['mailUsed']);
			}
		}*/
		/*if(\Input::has('studentRollId') AND \User::where('studentRollId',trim(\Input::get('studentRollId')))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],"Student roll id already used before.");
		}*/
		if(\Input::has('admission_number') AND \User::where('admission_number',trim(\Input::get('admission_number')))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],"Student Admission number already used before.");
		}

		//Get the default role
		$def_role = \roles::where('def_for','student')->select('id');
		if($def_role->count() == 0){
			return $this->panelInit->apiOutput(false,'Import','No default role assigned for teachers, Please contact administartor');
		}
		$def_role = $def_role->first();

		$User = new \User();
		if(\Input::has('email')){
			$User->email = \Input::get('email');
		}
		$User->username = \Input::get('username');
		$User->fullName = \Input::get('fullName');
		$User->password = \Hash::make(\Input::get('password'));
		$User->role = "student";
		$User->studentRollId = \Input::get('studentRollId');
		$User->gender = \Input::get('gender');
		$User->address = \Input::get('address');
		$User->phoneNo = \Input::get('phoneNo');
		$User->mobileNo = \Input::get('mobileNo');
		$User->studentAcademicYear = $this->panelInit->selectAcYear;
		$User->studentClass = \Input::get('studentClass');
		if($this->panelInit->settingsArray['enableSections'] == true){
			$User->studentSection = \Input::get('studentSection');
		}
		if(\Input::has('transport')){
		    $User->transport = \Input::get('transport');
		}
		if(\Input::has('transport_vehicle')){
		    $User->transport_vehicle = \Input::get('transport_vehicle');
		}
		if(\Input::has('hostel')){
			$User->hostel = \Input::get('hostel');
		}
		if(\Input::get('birthday') != ""){
			$User->birthday = $this->panelInit->date_to_unix(\Input::get('birthday'));
		}
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->isLeaderBoard = "";
		if(\Input::has('biometric_id')){
			$User->biometric_id = \Input::get('biometric_id');
		}else{
			$User->biometric_id = "";
		}
		$User->account_active = "1";
		$User->role_perm = $def_role->id;

		$User->medical = json_encode(\Input::get('med_data'));

		if(\Input::has('admission_number')){
			$User->admission_number = \Input::get('admission_number');
		}
		if(\Input::has('admission_date')){
			$User->admission_date = $this->panelInit->date_to_unix(\Input::get('admission_date'));
		}
		if(\Input::has('std_category')){
			$User->std_category = \Input::get('std_category');
		}
		if(\Input::has('std_type')){
			$User->studentType = \Input::get('std_type');
		}

		if(\Input::has('religion')){
			$User->religion = \Input::get('religion');
		}

		if(\Input::has('father')){
			$User->father_info = json_encode( \Input::get('father') );
		}
		if(\Input::has('mother')){
			$User->mother_info = json_encode( \Input::get('mother') );
		}

		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);

			$User->photo = "profile_".$User->id.".jpg";
		}

		$User->save();

		user_log('Students', 'create', $User->fullName);

		if(\Input::has('linkParentSer')){
			$linkParentSer = json_decode( \Input::get('linkParentSer'),true );
			foreach ($linkParentSer as $key => $value) {

				$parent = \User::where('id',$value['id']);
				if($parent->count() > 0){
					$parent = $parent->select('id','parentOf')->first()->toArray();
					$parent['parentOf'] = json_decode($parent['parentOf'],true);
					if(!is_array($parent['parentOf'])){
						$parent['parentOf'] = array();
					}
					$parent['parentOf'][] = array("student"=>$User->fullName,"relation"=>$value['relation'],"id"=>$User->id);
					 \User::where('id',$value['id'])->update( array('parentOf'=>json_encode($parent['parentOf'])) );
				}

			}
		}

		if(\Input::hasFile('docs_files')){
			$docs_files = \Input::file('docs_files');
			$docs_title = \Input::get('docs_title');
			$docs_notes = \Input::get('docs_notes');
			foreach ($docs_files as $key => $value) {

				if(!$this->panelInit->validate_upload($value)){
					continue;
				}

				$newFileName = $User->id."_".uniqid().".".$value->getClientOriginalExtension();
				$file = $value->move(uploads_config()['uploads_file_path'] . '/student_docs/',$newFileName);

				$student_docs = new \student_docs();
				$student_docs->user_id = $User->id;
				if($docs_title[$key] != ""){
					$student_docs->file_title = $docs_title[$key];
				}
				$student_docs->file_name = $newFileName;
				if($docs_notes[$key] != ""){
					$student_docs->file_notes = $docs_notes[$key];
				}
				$student_docs->save();

			}
		}

		//auto invoicing
		if(\Input::has('transport') and \Input::get('transport') != "" and \Input::has('generate_invoice') and \Input::get('generate_invoice') == "1" ){
			$transportation = \transportation::find(\Input::get('transport'));
			if(\Input::has('transport')){
				for( $i= 1 ; $i <= 12 ; $i++ ){
				$start = $this->panelInit->settingsArray['invoice_sc_'.$i];
				$due = $this->panelInit->settingsArray['invoice_sc_due_'.$i];
				$xx = $this->panelInit->settingsArray['months_'.$i];
				$fine_tra = $this->panelInit->settingsArray['fine_tra'];
				if (!empty($start) && !empty($due) && !empty($xx) && strlen($start) > 6 && strlen($due) > 6 && $xx > 0 ) {
				$payments = new \payments();
				$payments->paymentTitle = "Transport Fee";
				$payments->paymentDescription   = $transportation->transportTitle." fee of ".$xx." months";
				$payments->paymentStudent = $User->id;
				$paymentRows = array();
				$payments->paymentRows = json_encode($paymentRows);
				$payments->paymentAmount = $transportation->transportFare * $xx;
				$payments->paymentDiscounted = $transportation->transportFare * $xx;
				$payments->paymentDate = $this->panelInit->date_to_unix($start);
				$payments->dueDate = $this->panelInit->date_to_unix($due);
				$payments->paymentUniqid = uniqid();
				$payments->paymentStatus = "0";
				$payments->fine_amount = $fine_tra;
				$payments->save();
				}

				}
			}
		}

		//**********************

		$studentAcademicYears = new \student_academic_years();
		$studentAcademicYears->studentId = $User->id;
		$studentAcademicYears->academicYearId = $this->panelInit->selectAcYear;
		$studentAcademicYears->classId = \Input::get('studentClass');
		if($this->panelInit->settingsArray['enableSections'] == true){
			$studentAcademicYears->sectionId = \Input::get('studentSection');
		}
		$studentAcademicYears->save();

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addStudent'],$this->panelInit->language['studentCreatedSuccess']);
	}

	function fetch($id){

		if(!$this->panelInit->can( "students.editStudent" )){
			exit;
		}

		$data = \User::where('role','student')->where('id',$id)->first()->toArray();
		$data['birthday'] = $this->panelInit->unix_to_date($data['birthday']);
		if($data['admission_date'] != 0){
			$data['admission_date'] = $this->panelInit->unix_to_date($data['admission_date']);
		}else{
			$data['admission_date'] = "";
		}

		$data['father'] = json_decode($data['father_info'],true);
		if(!is_array($data['father'])){
			$data['father'] = array();
		}
		$data['mother'] = json_decode($data['mother_info'],true);
		if(!is_array($data['mother'])){
			$data['mother'] = array();
		}

		$data['med_data'] = json_decode($data['medical'],true);
		if(!is_array($data['med_data'])){
			$data['med_data'] = array();
		}

		$data['comVia'] = json_decode($data['comVia'],true);
		if(!is_array($data['comVia'])){
			$data['comVia'] = array();
		}

		$data['academicYear'] = array();
		$academicYear = \academic_year::get();
		foreach ($academicYear as $value) {
			$data['academicYear'][$value->id] = $value->yearTitle;
		}

		$data['docs'] = \student_docs::where('user_id',$id)->get();

		$data['parentInfo'] = array();
		$parents = \User::where('role','parent')->select('id','parentOf','fullName')->where('parentOf','LIKE','%"id":'.$id.'%')->get()->toArray();
		foreach ($parents as $key => $value) {
			$value['parentOf'] = json_decode($value['parentOf'],true);
			foreach ($value['parentOf'] as $key_ => $value_) {
				if($value_['id'] == $id){
					$data['parentInfo'][] = array("parent"=>$value['fullName'],"relation"=>$value_['relation'],"id"=>$value['id']);
				}
			}
		}
		$data['parentInfoSer'] = json_encode($data['parentInfo']);

		$DashboardController = new DashboardController();
		$data['studentAcademicYears'] = array();
		$academicYear = \student_academic_years::where('studentId',$id)->orderBy('id','ASC')->get();
		foreach ($academicYear as $value) {
			$data['studentAcademicYears'][] = array("id"=>$value->academicYearId,"default"=>$value->classId,"defSection"=>$value->sectionId,"classes"=>\classes::where('classAcademicYear',$value->academicYearId)->get()->toArray(),"classSections"=>$DashboardController->classesList($value->academicYearId) );
		}

		if(isset($data['studentType'])) {
			$data['std_type'] = $data['studentType'];
		} else {
			$data['std_type'] = null;
		}

		return $data;
	}

	function rem_std_docs(){
		if ( $postDelete = \student_docs::where('id',\Input::get('id'))->first() )
        {
        	@unlink(uploads_config()['uploads_file_path'] . '/student_docs/'.$postDelete->file_name);
            $postDelete->delete();
            return $this->panelInit->apiOutput(true,$this->panelInit->language['delFile'],$this->panelInit->language['fileDeleted']);
        }else{
            return $this->panelInit->apiOutput(false,$this->panelInit->language['delFile'],$this->panelInit->language['fileNotExist']);
        }
	}

	function leaderboard($id){

		if(!$this->panelInit->can( "students.stdLeaderBoard" )){
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
		}else {
			$tokens_list[] = $user->firebase_token;
		}
		$user_ids[] = $user->id;

		if($user->firebase_token != ""){
			$this->panelInit->send_push_notification($tokens_list,$user_ids,$this->panelInit->language['notifyIsLedaerBoard']);
		} else {
			$this->panelInit->save_notifications_toDB($tokens_list,$user_ids,$this->panelInit->language['notifyIsLedaerBoard']);
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['stdLeaderBoard'],$this->panelInit->language['stdNowLeaderBoard']);
	}

	protected function isJson($string) {
    $decoded = json_decode($string); // decode our JSON string
	    if ( !is_object($decoded) && !is_array($decoded) ) {
	        return false;
	    }
	    return (json_last_error() == JSON_ERROR_NONE);
	}

	function leaderboardRemove($id){

		if(!$this->panelInit->can( "students.stdLeaderBoard" )){
			exit;
		}

		if ( $postDelete = \User::where('role','student')->where('id', $id)->where('isLeaderBoard','!=','')->first() )
        {
            \User::where('role','student')->where('id', $id)->update(array('isLeaderBoard' => ''));
            return $this->panelInit->apiOutput(true,$this->panelInit->language['stdLeaderBoard'],$this->panelInit->language['stdLeaderRem']);
        }else{
            return $this->panelInit->apiOutput(false,$this->panelInit->language['stdLeaderBoard'],$this->panelInit->language['stdNotLeader']);
        }
	}

	function edit($id){

		if(!$this->panelInit->can( "students.editStudent" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->where('id','!=',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['editStudent'],$this->panelInit->language['usernameUsed']);
		}
		/*if(isset($this->panelInit->settingsArray['emailIsMandatory']) AND $this->panelInit->settingsArray['emailIsMandatory'] == 1){
			if(\User::where('email',\Input::get('email'))->where('id','!=',$id)->count() > 0){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editStudent'],$this->panelInit->language['mailUsed']);
			}
		}
		if(\Input::has('studentRollId') AND \User::where('studentRollId',trim(\Input::get('studentRollId')))->where('id','!=',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],"Student roll id already used before.");
		}*/
		if(\Input::has('admission_number') AND \User::where('admission_number',trim(\Input::get('admission_number')))->where('id','!=',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addStudent'],"Student Admission number already used before.");
		}

		$User = \User::find($id);
		if(\Input::has('email')){
			$User->email = \Input::get('email');
		}
		$User->username = \Input::get('username');
		$User->fullName = \Input::get('fullName');
		if(\Input::has('password')){
			$User->password = \Hash::make(\Input::get('password'));
		}
		$User->role = "student";
		$User->studentRollId = \Input::get('studentRollId');
		$User->gender = \Input::get('gender');
		$User->address = \Input::get('address');
		$User->phoneNo = \Input::get('phoneNo');
		$User->mobileNo = \Input::get('mobileNo');
		$User->studentAcademicYear = $this->panelInit->selectAcYear;
		if(\Input::has('transport') and \Input::get('transport') != "" and \Input::has('generate_invoice') and \Input::get('generate_invoice') == "1" ){
		    $User->transport = \Input::get('transport');
			//auto invoicing
			$transportation = \transportation::find(\Input::get('transport'));
			if(\Input::get('transport')){
				for( $i= 1 ; $i <= 12 ; $i++ ){
				$start = $this->panelInit->settingsArray['invoice_sc_'.$i];
				$due = $this->panelInit->settingsArray['invoice_sc_due_'.$i];
				$xx = $this->panelInit->settingsArray['months_'.$i];
				$fine_tra = $this->panelInit->settingsArray['fine_tra'];
				if (!empty($start) && !empty($due) && !empty($xx) && strlen($start) > 6 && strlen($due) > 6 && $xx > 0 ) {
				$payments = new \payments();
				$payments->paymentTitle = "Transport Fee";
				$payments->paymentDescription   = $transportation->transportTitle." fee of ".$xx." months";
				$payments->paymentStudent = $User->id;
				$paymentRows = array();
				$payments->paymentRows = json_encode($paymentRows);
				$payments->paymentAmount = $transportation->transportFare * $xx;
				$payments->paymentDiscounted = $transportation->transportFare * $xx;
				$payments->paymentDate = $this->panelInit->date_to_unix($start);
				$payments->dueDate = $this->panelInit->date_to_unix($due);
				$payments->paymentUniqid = uniqid();
				$payments->paymentStatus = "0";
				$payments->fine_amount = $fine_tra;
				$payments->save();
				}

				}

			}
		}
		if(\Input::has('transport_vehicle')){
		    $User->transport_vehicle = \Input::get('transport_vehicle');
		}
		if(\Input::has('hostel')){
			$User->hostel = \Input::get('hostel');
		}
		if(\Input::get('birthday') != ""){
			$User->birthday = $this->panelInit->date_to_unix(\Input::get('birthday'));
		}
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->isLeaderBoard = "";
		if(\Input::has('biometric_id')){
			$User->biometric_id = \Input::get('biometric_id');
		}else{
			$User->biometric_id = "";
		}
		$User->account_active = "1";

		$User->medical = json_encode(\Input::get('med_data'));

		if(\Input::has('admission_number')){
			$User->admission_number = \Input::get('admission_number');
		}
		if(\Input::has('admission_date')){
			$User->admission_date = $this->panelInit->date_to_unix(\Input::get('admission_date'));
		}
		if(\Input::has('std_category')){
			$User->std_category = \Input::get('std_category');
		}
		if(\Input::has('std_type')){
			$User->studentType = \Input::get('std_type');
		}

		if(\Input::has('religion')){
			$User->religion = \Input::get('religion');
		}

		if(\Input::has('father')){
			$User->father_info = json_encode( \Input::get('father') );
		}
		if(\Input::has('mother')){
			$User->mother_info = json_encode( \Input::get('mother') );
		}

		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editStudent'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);

			$User->photo = "profile_".$User->id.".jpg";
		}

		$User->save();

		user_log('Students', 'edit', $User->fullName);

		if(\Input::has('linkParentSer')){
			$linkParentSer = json_decode( \Input::get('linkParentSer'),true );
			foreach ($linkParentSer as $key => $value) {

				$parent = \User::where('id',$value['id']);
				if($parent->count() > 0){
					$parent = $parent->select('id','parentOf')->first()->toArray();
					if (strpos($parent['parentOf'], 'id":'.$id) == false) {
						$parent['parentOf'] = json_decode($parent['parentOf'],true);
						if(!is_array($parent['parentOf'])){
							$parent['parentOf'] = array();
						}
						$parent['parentOf'][] = array("student"=>$User->fullName,"relation"=>$value['relation'],"id"=>$User->id);
						\User::where('id',$value['id'])->update( array('parentOf'=>json_encode($parent['parentOf'])) );
					}
				}

			}
		}

		if(\Input::has('docs_id')){
			$docs_files = \Input::file('docs_files');
			$docs_title = \Input::get('docs_title');
			$docs_notes = \Input::get('docs_notes');
			$docs_id = \Input::get('docs_id');
			foreach ($docs_id as $key => $value) {

				if(!$this->panelInit->validate_upload($docs_files[$key])){
					continue;
				}

				if($value == 0){
					if(!is_object($docs_files[$key])){
						continue;
					}
					$newFileName = $User->id."_".uniqid().".".$docs_files[$key]->getClientOriginalExtension();
					$file = $docs_files[$key]->move(uploads_config()['uploads_file_path'] . '/student_docs/',$newFileName);

					$student_docs = new \student_docs();
					$student_docs->file_name = $newFileName;
				}else{
					$student_docs = \student_docs::find($value);
				}

				$student_docs->user_id = $User->id;
				if($docs_title[$key] != ""){
					$student_docs->file_title = $docs_title[$key];
				}
				if($docs_notes[$key] != ""){
					$student_docs->file_notes = $docs_notes[$key];
				}
				$student_docs->save();

			}
		}

		if(\Input::has('academicYear')){
			$studentAcademicYears = \Input::get('academicYear');
			if(\Input::has('userSection')){
				$studentSection = \Input::get('userSection');
			}
			$academicYear = \student_academic_years::where('studentId',$id)->get();
			foreach ($academicYear as $value) {
				if(isset($studentAcademicYears[$value->academicYearId])){
					$studentAcademicYearsUpdate = \student_academic_years::where('studentId',$User->id)->where('academicYearId',$value->academicYearId)->first();
					$studentAcademicYearsUpdate->classId = $studentAcademicYears[$value->academicYearId];
					if($this->panelInit->settingsArray['enableSections'] == true && \Input::has('userSection')){
						$studentAcademicYearsUpdate->sectionId = $studentSection[$value->academicYearId];
					}
					$studentAcademicYearsUpdate->save();

					\attendance::where('classId',$value->classId)->where('studentId',$User->id)->update(array('classId' => $studentAcademicYears[$value->academicYearId]));
					\exam_marks::where('classId',$value->classId)->where('studentId',$User->id)->update(array('classId' => $studentAcademicYears[$value->academicYearId]));
				}
				if($value->academicYearId == $User->studentAcademicYear){
					$User->studentClass = $studentAcademicYears[$value->academicYearId];
					if($this->panelInit->settingsArray['enableSections'] == true && \Input::has('userSection')){
						$User->studentSection = $studentSection[$value->academicYearId];
					}
					$User->save();
				}
			}
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editStudent'],$this->panelInit->language['studentModified']);
	}

	function medical($id){

		if(!$this->panelInit->can( "students.medHistory" )){
			exit;
		}

		$medicalInfo = array('height'=>'','weight'=>'','rh'=>'','inspol'=>'','vacc'=>'','premed'=>'','prfcli'=>'','disab'=>'','contact'=>'','aller'=>'','medica'=>'','immu'=>'','diet'=>'','frac'=>'','surg'=>'','rema'=>'',);

		$user = \User::where('id',$id)->select('medical')->first()->toArray();
		$user['medical'] = json_decode($user['medical'],true);

		if(is_array($user['medical'])){
			foreach($user['medical'] as $key => $value){
				$medicalInfo[$key] = $value;
			}
		}

		return $medicalInfo;
	}

	function saveMedical(){

		if(!$this->panelInit->can( "students.medHistory" )){
			exit;
		}

		$User = \User::find(\Input::get('userId'));
		$User->medical = json_encode(\Input::get('data'));
		$User->save();

		return $this->panelInit->apiOutput(true,"Save medical info","Medical history updated");
	}

	function marksheet($id){

		//get the requested student.
		if($id == 0){
			$id = \Auth::user()->id;
		}else{
			$userDetails = \User::where('id',$id)->select('studentClass')->first();
		}


		//get student class
		$student_academic_years = \student_academic_years::where('studentId',$id)
		  ->where('academicYearId', $this->panelInit->selectAcYear);

		if($student_academic_years->count() == 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['Marksheet'],$this->panelInit->language['studentHaveNoMarks']);
			exit;
		}

		$student_academic_years = $student_academic_years->first();
		$studentClass = $student_academic_years->classId;

		$marks = array();
		$examIds = array();
		$examsList = \exams_list::where('examAcYear',$this->panelInit->selectAcYear)->where('examClasses','LIKE','%'.$studentClass.'%')->get();
		foreach ($examsList as $exam) {
			$marks[$exam->id] = array("title"=>$exam->examTitle,"examId"=>$exam->id,"studentId"=>$id,"examMarksheetColumns"=>json_decode($exam->examMarksheetColumns,true));
			$examIds[] = $exam->id;
		}

		if(count($examIds) == 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['Marksheet'],$this->panelInit->language['studentHaveNoMarks']);
			exit;
		}

		$examMarks = \exam_marks::where('studentId',$id)->whereIn('examId',$examIds)->get();
		if(count($examMarks) == 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['Marksheet'],$this->panelInit->language['studentHaveNoMarks']);
			exit;
		}
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

		updateSeenNotificationMobHistory(Auth::guard('web')->user()->id, 'marksheet', $id);
		user_log('Students', 'view_marksheet', $student_academic_years->fullName);

		reset($marks);
		foreach ($marks as $key => $value) {
			if(!isset($value['data'])){
				unset($marks[$key]);
			}
		}

		return $marks;
		exit;
	}

	function marksheetPDF($studentId,$exam){

		if(\Auth::user()->role == "student"){
			$studentId = \Auth::user()->id;
		}
		$student = \User::where('id',$studentId)->first();
		$examsList = \exams_list::where('id',$exam)->first()->toArray();
		$examsList['examMarksheetColumns'] = json_decode($examsList['examMarksheetColumns'],true);
		$studentMarks = $this->marksheet($studentId);

		if(!isset($studentMarks[$exam]['data'])){
			echo $this->panelInit->language['noMarksheetAv'];
			exit;
		}

		$doc_details = array(
							"title" => $this->panelInit->language['Marksheet'] . " : " . $student->fullName ,
							"author" => $this->data['panelInit']->settingsArray['siteTitle'],
							"topMarginValue" => 10,
							);

		if( $this->panelInit->isRTL == "1" ){
			$doc_details['is_rtl'] = true;
		}

		$pdfbuilder = new \PdfBuilder($doc_details);

		//	$pdfbuilder->space(10);

		if(file_exists(uploads_config()['uploads_file_path'] . '/profile/profile_'.$studentId.'.jpg')){
			$userAssetImage = uploads_config()['uploads_file_path'] . '/profile/profile_'.$studentId.'.jpg';
		}else{
			$userAssetImage = uploads_config()['uploads_file_path'] . '/profile/user.png';
		}

		$class_name = \classes::where('id',$student->studentClass)->select('className')->first();

		if($this->panelInit->settingsArray['enableSections'] == true){
			$section_name = \sections::where('id',$student->studentSection)->select('sectionName')->first();
		}

		$content = "
		<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\">
			<tr>
				<td width=\"15%\"><img src=\"".\URL::asset('assets/images/logo-light.png')."\"></td>
				<td width=\"70%\" style=\"vertical-align: middle\" ><br/><br/><br/>".$this->data['panelInit']->settingsArray['siteTitle']."<br/>". 'MarkSheet' . " : " .$student->fullName ."</td>
				<td width=\"15%\" style=\"vertical-align: right;horizontal-aligh:right;\" ><img width=\"75px\" height=\"75px\" src=\"".\URL::asset($userAssetImage)."\"></td>
			</tr>
		</table>

		<br/><br/>

		<table cellspacing=\"5\" cellpadding=\"4\" border=\"0\">
		        <tr>
		            <td style='width: 50%;text-align: left;'>

						<table cellspacing=\"5\" cellpadding=\"4\" border=\"0\">
					        <tr>
					            <td style=\"width:30%; \">School Name</td>
					            <td style=\"width:70%; \">".$this->data['panelInit']->settingsArray['siteTitle']."</td>
					        </tr>
					        <tr>
					            <td style=\"width:30%; \">".$this->panelInit->language['Address']." </td>
					            <td style=\"width:70%\">".$this->data['panelInit']->settingsArray['address']."<br>".$this->data['panelInit']->settingsArray['address2']."
					            </td>
					        </tr>
					        <tr>
					            <td style=\"width:30%;\">".$this->panelInit->language['email']." </td>
					            <td style=\"width:70%\">".$this->data['panelInit']->settingsArray['systemEmail']."</td>
					        </tr>
					        <tr>
					            <td style=\"width:30%;\">".$this->panelInit->language['phoneNo']." </td>
					            <td style=\"width:70%\">".$this->data['panelInit']->settingsArray['phoneNo']."</td>
					        </tr>
					    </table>

		            </td>
		            <td style='width: 50%; color: #444444;text-align: left;'>


						<table cellspacing=\"5\" cellpadding=\"4\" border=\"0\">
							<tr>
								<td style=\"width:30%;\">".$this->panelInit->language['student']." </td>
								<td style=\"width:70%\">".$student->fullName."</td>
							</tr>
							<tr>
								<td style=\"width:30%;\">".$this->panelInit->language['Address']." </td>
								<td style=\"width:70%\">".$student->address."</td>
							</tr>
							<tr>
								<td style=\"width:30%;\">".$this->panelInit->language['email']." </td>
								<td style=\"width:70%\">".$student->email."</td>
							</tr>
							<tr>
								<td style=\"width:30%;\">".$this->panelInit->language['phoneNo']." </td>
								<td style=\"width:70%\">".$student->phoneNo." - ".$student->mobileNo."</td>
							</tr>
							<tr>
								<td style=\"width:30%;\">Roll No </td>
								<td style=\"width:70%\">".$student->studentRollId."</td>
							</tr>
							<tr>
								<td style=\"width:30%;\">";
								$content .= $this->panelInit->language['class'];

								if($this->panelInit->settingsArray['enableSections'] == true){
									$content .= " / Section";
								}

								$content .=" </td>
								<td style=\"width:70%\">".$class_name->className;

								if($this->panelInit->settingsArray['enableSections'] == true){
									$content .= " / ".$section_name->sectionName;
								}

								$content .= "</td>
							</tr>
						</table>


					</td>
		        </tr>
		    </table>

			<br/><br/><br/>
			<table cellspacing='0' style='padding: 1px; width: 100%; font-size: 11pt; '>
	            <tr>
	                <th style='width: 100%; text-align: center; '> <b>".$examsList['examTitle']."</b> </th>
	            </tr>
			</table>
			<br/><br/>

            <table cellspacing=\"0\" cellpadding=\"4\" border=\"1\">
                <tbody><tr>
                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['Subject']."</th>
					";
					if(isset($examsList['examMarksheetColumns'] ) AND is_array($examsList['examMarksheetColumns'] )){
						foreach ($examsList['examMarksheetColumns'] as $value) {
							$content .="<th style='width:15%;border: solid 1px #000000; padding:2px;'>".$value['title']."</th>";
						}
					}

					$content .="<th style='width:7%;border: solid 1px #000000; padding:2px;'>Marks</th>
                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>Grade Level</th>
                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['passGrade']."</th>
                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['finalGrade']."</th>
                    <th style='width:10%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['Status']."</th>
                    <th style='width:12%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['Comments']."</th>
                </tr>";

				foreach ($studentMarks[$exam]['data'] as $value) {
	                $content .= "<tr>
	                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['subjectName']."</td>";

						if(isset($examsList['examMarksheetColumns']) AND is_array($examsList['examMarksheetColumns'])){
							foreach ($examsList['examMarksheetColumns'] as $value_) {
								$content .="<td style='width:15%;border: solid 1px #000000; padding:2px;'>";
								if(isset($value['examMark'][$value_['id']])){
									$content .= $value['examMark'][$value_['id']];
								}
								$content .="</td>";
							}
						}

	                    $content .= "<td style='border: solid 1px #000000;padding:2px;'>".@$value['totalMarks']."</td>
	                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['grade']." ( ".@$value['points']." )</td>
	                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['passGrade']."</td>
	                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['finalGrade']."</td>
	                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['examState']."</td>
	                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['markComments']."</td>
	                </tr>";
				}
            $content .= "</tbody></table>

			<br/><br/>
			<table cellspacing='0' style='padding: 1px; width: 100%; font-size: 10pt; '>
	            <tr>
	                <th style='width: 100%; text-align: center; '> ".$this->panelInit->language['examMarks']." : ".$studentMarks[$exam]['totalMarks']." - ".'Average Point'." : ".$studentMarks[$exam]['pointsAvg']." </th>
	            </tr>
			</table>
			<br/><br/>";



		$pdfbuilder->table($content, array('border' => '0','align'=>'') );
		$pdfbuilder->output('Markshhet - '.$student->fullName.'.pdf');

		exit;
	}

	function marksheetBulkPDF(){
		$class_section = '';
		$users = \User::where('studentClass', \Input::get('classId'))->orderByRaw("studentRollId + 0 ASC");

		$class_section .= 'Class: ' . MClass::where('id', \Input::get('classId'))->first()->className;

		if(!is_null(\Input::get('sectionId')) && \Input::get('sectionId') > 0) {
			$users = $users->where('studentSection', \Input::get('sectionId'));
			$class_section .= '/ Section: ' . Section::where('id', \Input::get('sectionId'))->first()->sectionName;
		}

		$users = $users->get();
		$examsList = \exams_list::where('id',\Input::get('examId'))->first()->toArray();
		$examsList['examMarksheetColumns'] = json_decode($examsList['examMarksheetColumns'],true);

		$doc_details = array(
			"title" => $this->panelInit->language['Marksheet'] ,
			"author" => $this->data['panelInit']->settingsArray['siteTitle'],
			"topMarginValue" => 10
		);

		if( $this->panelInit->isRTL == "1" ){
			$doc_details['is_rtl'] = true;
		}

		$pdfbuilder = new \PdfBuilder($doc_details);

		$content = "";
		foreach ($users as $student) {
			$studentMarks = $this->marksheet($student->id);

			$logo_path = uploads_config()['uploads_provider'] . '/logo_light.png';

			$content = "
			<br/><br/>
			<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\">
				<tr>
					<td width=\"100px\" style='display: block'><img style=\"height: 50px\" src=\"".$logo_path."\"></td>
					<td style=\"vertical-align: middle\" >".$this->data['panelInit']->settingsArray['siteTitle']."<br/>".$this->panelInit->language['Marksheet'] . " : " . $student->fullName ."</td>
				</tr>
			</table>

			<br/><br/>

			<table cellspacing=\"5\" cellpadding=\"4\" border=\"0\">
			        <tr>
			            <td style='width: 50%;text-align: left;'>

							<table cellspacing=\"5\" cellpadding=\"4\" border=\"0\">
						        <tr>
						            <td style=\"width:30%; \">".$this->panelInit->language['siteTitle']."</td>
						            <td style=\"width:70%; \">".$this->data['panelInit']->settingsArray['siteTitle']."</td>
						        </tr>
						        <tr>
						            <td style=\"width:30%; \">".$this->panelInit->language['Address']." :</td>
						            <td style=\"width:70%\">".$this->data['panelInit']->settingsArray['address']."<br>".$this->data['panelInit']->settingsArray['address2']."
						            </td>
						        </tr>
						        <tr>
						            <td style=\"width:30%;\">".$this->panelInit->language['email']." :</td>
						            <td style=\"width:70%\">".$this->data['panelInit']->settingsArray['systemEmail']."</td>
						        </tr>
						        <tr>
						            <td style=\"width:30%;\">".$this->panelInit->language['phoneNo']." :</td>
						            <td style=\"width:70%\">".$this->data['panelInit']->settingsArray['phoneNo']."</td>
						        </tr>
						    </table>

			            </td>
			            <td style='width: 50%; color: #444444;text-align: left;'>


							<table cellspacing=\"5\" cellpadding=\"4\" border=\"0\">
								<tr>
									<td style=\"width:30%;\">".$this->panelInit->language['student']." :</td>
									<td style=\"width:70%\">".$student->fullName."</td>
								</tr>
								<tr>
									<td style=\"width:30%;\">".$this->panelInit->language['Address']." :</td>
									<td style=\"width:70%\">".$student->address."</td>
								</tr>
								<tr>
									<td style=\"width:30%;\">".$this->panelInit->language['email']." :</td>
									<td style=\"width:70%\">".$student->email."</td>
								</tr>
								<tr>
									<td style=\"width:30%;\">".$this->panelInit->language['phoneNo']." :</td>
									<td style=\"width:70%\">".$student->phoneNo." - ".$student->mobileNo."</td>
								</tr>
								<tr>
									<td style=\"width:30%;\">".$this->panelInit->language['rollid']." </td>
									<td style=\"width:70%\">".$student->studentRollId."</td>
								</tr>
							</table>


						</td>
			        </tr>
			    </table>

				<br/><br/><br/>
				<table cellspacing='0' style='padding: 1px; width: 100%; font-size: 11pt; '>
		            <tr>
		                <th style='width: 100%; text-align: center; '> <b>".$examsList['examTitle']."</b> </th>
		            </tr>
		            <tr>
		                <th style='width: 100%; text-align: center; '> " . $class_section . " </th>
		            </tr>
				</table>
				<br/><br/>";

				if(isset($studentMarks[\Input::get('examId')]['data'] )){

	            	$content .="<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\">
	                <tbody><tr>
	                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['Subject']."</th>
						";
						if(isset($examsList['examMarksheetColumns']) AND is_array($examsList['examMarksheetColumns']) ){
							foreach ($examsList['examMarksheetColumns'] as $value) {
								$content .="<th style='width:15%;border: solid 1px #000000; padding:2px;'>".$value['title']."</th>";
							}
						}
						$content .="<th style='width:7%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['mark']."</th>
                    	<th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['gradeLevels']."</th>
	                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['passGrade']."</th>
	                    <th style='width:15%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['finalGrade']."</th>
	                    <th style='width:10%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['Status']."</th>
	                    <th style='width:12%;border: solid 1px #000000; padding:2px;'>".$this->panelInit->language['Comments']."</th>
	                </tr>";

					foreach ($studentMarks[\Input::get('examId')]['data'] as $value) {
		                $content .= "<tr>
		                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['subjectName']."</td>";

							if(isset($examsList['examMarksheetColumns']) AND is_array($examsList['examMarksheetColumns'])){
								foreach ($examsList['examMarksheetColumns'] as $value_) {
									$content .="<th style='width:15%;border: solid 1px #000000; padding:2px;'>";
									if(isset($value['examMark'][$value_['id']])){
										$content .= $value['examMark'][$value_['id']];
									}
									$content .="</th>";
								}
							}

		                    $content .= "<td style='border: solid 1px #000000;padding:2px;'>".@$value['totalMarks']."</td>
		                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['grade']." ( ".@$value['points']." )</td>
		                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['passGrade']."</td>
		                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['finalGrade']."</td>
		                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['examState']."</td>
		                    <td style='border: solid 1px #000000;padding:2px;'>".@$value['markComments']."</td>
		                </tr>";
					}
	            $content .= "</tbody></table>

				<br/><br/>
				<table cellspacing='0' style='padding: 1px; width: 100%; font-size: 10pt; '>
		            <tr>
		                <th style='width: 100%; text-align: center; '> ".$this->panelInit->language['examMarks']." : ".$studentMarks[\Input::get('examId')]['totalMarks']." - ".$this->panelInit->language['AveragePoints']." : ".$studentMarks[\Input::get('examId')]['pointsAvg']." </th>
		            </tr>
				</table>
				<br/><br/>";
			}

			$pdfbuilder->table($content, array('border' => '0','align'=>'') );
			$pdfbuilder->addPage();
		}

		$pdfbuilder->output('Markshhet.pdf');

		exit;
	}

	function attendance($id){

		if(!$this->panelInit->can( "students.Attendance" )){
			exit;
		}

		$toReturn = array();
		$toReturn['attendanceModel'] = $this->data['panelInit']->settingsArray['attendanceModel'];
		$toReturn['attendance'] = \attendance::where('studentId',$id)->orderBy('date')->get()->toArray();

		foreach($toReturn['attendance'] as $key => $value){
			$toReturn['attendance'][$key]['date'] = $this->panelInit->unix_to_date($toReturn['attendance'][$key]['date']);
		}

		if($this->data['panelInit']->settingsArray['attendanceModel'] == "subject"){
			$subjects = \subject::get();
			$toReturn['subjects'] = array();
			foreach ($subjects as $subject) {
				$toReturn['subjects'][$subject->id] = $subject->subjectTitle ;
			}
		}
		return $toReturn;
	}

	function profile($id){
		$data = \User::where('role','student')->where('id',$id);

		if($data->count() > 0){
			$data = $data->first()->toArray();
			$data['birthday'] = $this->panelInit->unix_to_date($data['birthday']);

			if($data['studentClass'] != "" AND $data['studentClass'] != "0"){
				$class = \classes::where('id',$data['studentClass'])->first();
			}

			if($data['studentSection'] != "" AND $data['studentSection'] != "0"){
				$section = \sections::where('id',$data['studentSection'])->first();
			}

			$parents = \User::where('parentOf','like','%"'.$id.'"%')->orWhere('parentOf','like','%:'.$id.'}%')->get();

			$return = array();
			$return['title'] = $data['fullName']." ".$this->panelInit->language['Profile'];

			$return['content'] = "<div class='text-center'>";

			$return['content'] .= "<img alt='".$data['fullName']."' class='user-image img-circle' style='width:70px; height:70px;' src='index.php/dashboard/profileImage/".$data['id']."'>";

			$return['content'] .= "</div>";

			$return['content'] .= "<h4>".$this->panelInit->language['studentInfo']."</h4>";

			$return['content'] .= "<table class='table table-bordered'><tbody>
	                          <tr>
	                              <td>".$this->panelInit->language['FullName']."</td>
	                              <td>".$data['fullName']."</td>
	                          </tr>
	                          <tr>
	                              <td>".$this->panelInit->language['rollid']."</td>
	                              <td>".$data['studentRollId']."</td>
	                          </tr>";
	                          if(isset($class)){
		                          $return['content'] .= "<tr>
		                              <td>".$this->panelInit->language['class']."</td>
		                              <td>".$class->className."</td>
		                          </tr>";
		                        }
								if(isset($section)){
	  	                          $return['content'] .= "<tr>
	  	                              <td>Section</td>
	  	                              <td>".$section->sectionName."</td>
	  	                          </tr>";
	  	                        }
	                          $return['content'] .= "<tr>
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
	                              <td>".$this->panelInit->language['parent']."</td>
	                              <td>";
								  foreach ($parents as $value) {
									  $return['content'] .= $value->fullName . "<br/>";
								  }
			$return['content'] .= "</td>
	                          </tr>

	                          </tbody></table>";
		}else{
			$return['title'] = "Student deleted ";
            $return['content'] = "<div class='text-center'> Student with this id has been deleted </div>";
		}

		return $return;
	}

	public function search_parent($parent){
		$students = \User::where('role','parent')->where(function($query) use ($parent){
														$query->where('fullName','like','%'.$parent.'%')->orWhere('username','like','%'.$parent.'%')->orWhere('email','like','%'.$parent.'%');
													})->get();
		$retArray = array();
		foreach ($students as $parent) {
			$retArray[$parent->id] = array("id"=>$parent->id,"name"=>$parent->fullName,"email"=>$parent->email);
		}
		return json_encode($retArray);
	}

	public function fetchByClassId($class_id) {
		$students = \User::where('role','student')
		  ->where('studentClass', $class_id)
		  ->select('id', 'role', 'fullName', 'studentClass', 'studentRollId')
		  ->orderByRaw("studentRollId + 0 ASC")
		  ->get()->toArray();

		return json_encode([
			"jsData" => $students,
			"jsStatus" => "1",
			"jsCount" => count($students)
		]);
	}

	public function fetchByClassIds() {
		$class_ids = json_decode(\Input::get('class_ids'));

		$students = \User::where('role','student')
		  ->whereIn('studentClass', $class_ids)
		  ->select('id', 'role', 'fullName', 'studentClass', 'studentRollId')
		  ->orderByRaw("studentRollId + 0 ASC")
		  ->get()->toArray();

		return json_encode([
			"jsData" => $students,
			"jsStatus" => "1",
			"jsCount" => count($students)
		]);
	}

	public function fetchByClassIdAndSectionId() {
		$inputs = request()->all();

		if(!is_null($inputs['class_id']) && !empty($inputs['class_id']) && !is_null($inputs['section_id']) && !empty($inputs['section_id'])) {
			$students = \User::where('role','student')
			  ->where('studentClass', $inputs['class_id'])
			  ->where('studentSection', $inputs['section_id'])
			  ->select('id', 'fullName', 'studentClass', 'studentRollId')
			  ->orderByRaw("studentRollId + 0 ASC")
			  ->get()->toArray();

			return json_encode([
				"jsData" => $students,
				"jsStatus" => "1",
				"jsCount" => count($students)
			]);
		} else {
			return json_encode([
				"jsStatus" => "0",
			]);
		}
	}

	public function fetchAll(){
		$data = \User::where('role','student')->get()->toArray();

		return json_encode([
			"jsData" => $data,
			"jsStatus" => "1",
			"jsCount" => count($data)
		]);
	}

	public function getInfoBusTrack($student_id) {
		$data = User::getBusTrackInfo($student_id);

		return response()->json([
			'data' => $data
		]);
	}
}
