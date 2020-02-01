<?php
namespace App\Http\Controllers;

use App\Models2\Role;

class rolesController extends Controller {
	var $data = array();
	var $panelInit ;
	var $roles_perms = array(

			"academicyears" => array("list","addAcademicyear","editAcademicYears","delAcademicYears"),


			"staticPages" => array("list","addPage","editPage","delPage"),

			"Administrators" => array("list","addAdministrator","editAdministrator","delAdministrator"),
			"employees" => array("list","addEmployee","editEmployee","delEmployee"),

			"AccountSettings" => array("myInvoices","ChgProfileData","chgEmailAddress","chgPassword","Messages"),
			"dbExport" => array("dbExport"),

			"classes" => array("list","addClass","editClass","delClass"),
			"sections" => array("list","addSection","editSection","delSection"),
			"Subjects" => array("list","addSubject","editSubject","delSubject"),
			"adminTasks" => array("globalSettings","activatedModules","paymentsSettings","mailSmsSettings","vacationSettings","mobileSettings","frontendCMS","bioItegration","lookFeel"),
			// "Dormitories" => array("list","addDormitories","editDorm","delDorm"),
			"Expenses" => array("list","addExpense","editExpense","delExpense","expCategory"),
			"Incomes" => array("list","addIncome","editIncome","delIncome","incomeCategory"),
			"Languages" => array("list","addLanguage","editLanguage","delLanguage"),
			"Polls" => array("list","addPoll","editPoll","delPoll"),

			"newsboard" => array("list","View","addNews","editNews","delNews"),
			"events" => array("list","View","addEvent","editEvent","delEvent"),

			"frontendCMSpages" => array("list","addPage","editPage","delPage"),
			"mediaCenter" => array("View","addAlbum","editAlbum","delAlbum","addMedia","editMedia","delMedia"),
			"roles" => array("list","add_role","modify_role","delete_role"),
			"gradeLevels" => array("list","addLevel","editGrade","delGradeLevel"),
			"Promotion" => array("promoteStudents"),
			"mobileNotifications" => array("sendNewNotification"),

			"mailsms" => array("mailSMSSend","mailsmsTemplates"),

			"FeeGroups" => array("list","addFeeGroup","editFeeGroup","delFeeGroup"),
			"FeeTypes" => array("list","addFeeType","editFeeType","delFeeType"),
			"FeeAllocation" => array("list","addFeeAllocation","editFeeAllocation","delFeeAllocation"),
			"FeeDiscount" => array("list","addFeeDiscount","editFeeDiscount","delFeeDiscount","assignUser"),
			"Invoices" => array("list","View","addPayment","editPayment","delPayment","collInvoice","payRevert","dueInvoices","Export"),


			"Assignments" => array("list","AddAssignments","editAssignment","delAssignment","viewAnswers","applyAssAnswer","Download"),
			"studyMaterial" => array("list","addMaterial","editMaterial","delMaterial","Download"),
			"Homework" => array("list","View","addHomework","editHomework","delHomework","Download","Answers"),


			"Payroll" => array("makeUsrPayment","delUsrPayment","userSalary","salaryBase","hourSalary"),
			"classSch" => array("list","addSch","editSch","delSch"),

			"parents" => array("list","AddParent","editParent","delParent","Approve","Import","Export"),
			"teachers" => array("list","addTeacher","EditTeacher","delTeacher","Approve","teacLeaderBoard","Import","Export"),
			"students" => array("list","admission","editStudent","delStudent","listGradStd","Approve","stdLeaderBoard","Import","Export","Attendance","Marksheet","medHistory","std_cat","TrackBus"),
			"studentType" => array("list","add","edit","del"),
			"Marksheet" => array("Marksheet"),
			"examsList" => array("list","View","addExam","editExam","delExam","examDetailsNot","showMarks","controlMarksExam"),
			"onlineExams" => array("list","addExam","editExam","delExam","takeExam","showMarks","QuestionsArch"),
			"dashboard" => array("stats"),


			"wel_office_cat" => array("list","add_cat","edit_cat","del_cat"),
			"visitors" => array("list","View","add_vis","edit_vis","del_vis","Download","Export"),
			"phn_calls" => array("list","View","add_call","edit_call","del_call","Export"),
			"postal" => array("list","add_postal","edit_postal","del_postal","Download","Export"),
			"con_mess" => array("list","View","del_mess","Export"),
			"enquiries" => array("list","View","add_enq","edit_enq","del_enq","Download","Export"),
			"complaints" => array("list","View","add_complaint","edit_complaint","del_complaint","Download","Export"),

			"trans_vehicles" => array("list","add_vehicle","edit_vehicle","del_vehicle"),
			"Transportation" => array("list","addTransport","editTransport","delTrans","members"),

			"Hostel" => array("list","AddHostel","EditHostel","delHostel","listSubs","HostelCat"),

			"depart" => array("list","add_depart","edit_depart","del_depart"),
			"desig" => array("list","add_desig","edit_desig","del_desig"),

			"Attendance" => array("takeAttendance","attReport"),
			"myAttendance" => array("myAttendance"),
			"staffAttendance" => array("takeAttendance","attReport"),
			"Vacation" => array("reqVacation","appVacation","myVacation"),


			"iss_ret" => array("list","issue_item","edit_item","del_item","Download","Export"),
			"items_stock" => array("list","add_item","edit_item","del_item","Download","Export"),
			"inv_cat" => array("list","add_cat","edit_cat","del_cat"),
			"suppliers" => array("list","add_supp","edit_supp","del_supp","Export"),
			"stores" => array("list","add_store","edit_store","del_store"),
			"items_code" => array("list","add_item","edit_item","del_item","Export"),

			"Library" => array("list","addBook","editBook","delLibrary","Download","mngSub", "Export", 'Import'),
			"issue_book" => array("list","add_issue","edit_issue","del_issue","Export","book_return"),
			"Certificates" => array("list","add_cert","edit_cert","del_cert"),

			"Reports" => array("Reports","userLog"),
			"Disciplines" => array("list","Download","add","edit","del","View"),
	);
	var $roles_perms_combined;

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

	public function listAll(){

		if(!$this->panelInit->can( array("roles.list","roles.add_role","roles.modify_role","roles.delete_role") )){
			exit;
		}

		$toReturn = array();

		$toReturn["roles"] = \roles::select('id','role_title','role_description')->get()->toArray();
		$toReturn["roles_perms"] = $this->roles_perms;

		return $toReturn;
	}

	public function listCustom1(){

		if(!$this->panelInit->can( array("roles.list","roles.add_role","roles.modify_role","roles.delete_role") )){
			exit;
		}

		$toReturn = array();

		$toReturn["roles"] = \roles::whereIn('role_title', ['Principal', 'Teacher', 'Accountant', 'Librarian', 'Receptionist', 'Store Keeper'])
			->select('id','role_title','role_description')
			->get()->toArray();
		$toReturn["roles_perms"] = $this->roles_perms;

		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "roles.add_role" )){
			exit;
		}

		$roles = new \roles();
		if(\Input::has('id')){
			$roles->id = \Input::get('id');
		}
		$roles->role_title = \Input::get('role_title');
		if(\Input::has('role_description')){
			$roles->role_description = \Input::get('role_description');
		}
		if(\Input::has('def_for')){
			$roles->def_for = \Input::get('def_for');
			if(\Input::get('def_for') != "none"){
				\roles::where('def_for',\Input::get('def_for'))->update( array('def_for'=>'') );
			}
		}
		if(\Input::has('role_permissions')){
			$roles->role_permissions = json_encode(\Input::get('role_permissions'));
		}
		$roles->save();
		user_log('Roles', 'create', $roles->role_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_role'],$this->panelInit->language['role_added']);
	}

	public function fetch($id){
		if(!$this->panelInit->can( "roles.modify_role" )){
			exit;
		}

		$roles = \roles::select('id','role_title','role_description','def_for','role_permissions')->where('id',$id)->first()->toArray();
		$roles['role_permissions'] = json_decode($roles['role_permissions'],true);

		return $roles;
	}

	public function fetch_users_by_role_id($role_id) {
		$users = \User::select('id', 'fullName')
		  ->where('role_perm', $role_id)
		  ->get()->toArray();

		return response()->json([
			'users' => $users
		]);
	}

	public function view($id){

		if(!$this->panelInit->can( "roles.modify_role" )){
			exit;
		}

		$roles = \roles::select('id','role_title','role_description','def_for')->where('id',$id)->first()->toArray();

		return $roles;
	}

	public function edit($id){

		if(!$this->panelInit->can( "roles.modify_role" )){
			exit;
		}

		$roles = \roles::find($id);
		if(\Input::has('id')){
			$roles->id = \Input::get('id');
		}
		$roles->role_title = \Input::get('role_title');
		if(\Input::has('role_description')){
			$roles->role_description = \Input::get('role_description');
		}else{
			$roles->role_description = "";
		}
		if(\Input::has('def_for')){
			$roles->def_for = \Input::get('def_for');
			if(\Input::get('def_for') != "none"){
				\roles::where('def_for',\Input::get('def_for'))->where('id','!=',$id)->update( array('def_for'=>'') );
			}
		}

		if(\Input::has('role_permissions')){

			$final_perms = array();
			$role_permissions = \Input::get('role_permissions');
			foreach ($role_permissions as $key => $value) {
				if($this->check_exist_perm( $value )){
					$final_perms[] = $value;
				}
			}

			$roles->role_permissions = json_encode( $final_perms );
		}
		$roles->save();
		user_log('Roles', 'edit', $roles->role_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['modify_role'],$this->panelInit->language['role_modified']);
	}

	public function check_exist_perm($perm_to_check){
		if( !is_array($this->roles_perms_combined) ){
			$this->roles_perms_combined = array();
			foreach ($this->roles_perms as $key => $value) {
				foreach ($value as $keyInner => $valueInner) {
					$this->roles_perms_combined[] = $key.".".$valueInner;
				}
			}
		}

		if (in_array($perm_to_check, $this->roles_perms_combined)) {
			return true;
		}else{
			return false;
		}
	}

	public function delete($id){

		if(!$this->panelInit->can( "roles.delete_role" )){
			exit;
		}

		if ( $postDelete = \roles::where('id', $id)->first() ){
			user_log('Roles', 'delete', $postDelete->role_title);
    	$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['delete_role'],$this->panelInit->language['role_deleted']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['delete_role'],$this->panelInit->language['role_notexist']);
  	}
	}

}