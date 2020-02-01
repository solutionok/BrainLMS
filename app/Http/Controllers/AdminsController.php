<?php
namespace App\Http\Controllers;

class AdminsController extends Controller {

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
		if(!$this->panelInit->can( array("Administrators.list","Administrators.addAdministrator","Administrators.editAdministrator","Administrators.delAdministrator") )){
			exit;
		}

		$to_return = array();
		$to_return['admins'] = \User::where('role','admin')->get();
		$to_return['roles'] = \roles::select('id','role_title')->get();

		return $to_return;
	}

	public function delete($id){

		if(!$this->panelInit->can( "Administrators.delAdministrator" )){
			exit;
		}

		if($id == $this->data['users']->id){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['delAdministrator'],"You can't delete yourself !");
		}
		if ( $postDelete = \User::where('role','admin')->where('id',$id)->first() )
    {
    	user_log('Admins', 'delete', $postDelete->fullName);
      $postDelete->delete();
      return $this->panelInit->apiOutput(true,$this->panelInit->language['delAdministrator'],$this->panelInit->language['adminDeletedSucc']);
    } else {
      return $this->panelInit->apiOutput(false,$this->panelInit->language['delAdministrator'],$this->panelInit->language['adminNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Administrators.addAdministrator" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addAdministrator'],$this->panelInit->language['usernameAlreadyUsed']);
		}
		if(\User::where('email',\Input::get('email'))->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['addAdministrator'],$this->panelInit->language['emailAlreadyUsed']);
		}
		$User = new \User();
		$User->username = \Input::get('username');
		$User->email = \Input::get('email');
		$User->fullName = \Input::get('fullName');
		$User->password = \Hash::make(\Input::get('password'));
		$User->customPermissionsType = \Input::get('customPermissionsType');
		$User->customPermissions = json_encode(\Input::get('customPermissions'));
		$User->role = "admin";
		$User->role_perm = \Input::get('role_perm');
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->account_active = "1";
		$User->save();

		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addAdministrator'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);

			$User->photo = "profile_".$User->id.".jpg";
			$User->save();
		}

		user_log('Admins', 'create', $User->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addAdministrator'],$this->panelInit->language['adminUpdated'],$User->toArray());
	}

	function fetch($id){

		if(!$this->panelInit->can( "Administrators.editAdministrator" )){
			exit;
		}

		$user = \User::where('role','admin')->where('id',$id)->first()->toArray();
		$user['customPermissions'] = json_decode($user['customPermissions'],true);
		if(!is_array($user['customPermissions'])){
			$user['customPermissions'] = array();
		}
		$user['comVia'] = json_decode($user['comVia'],true);
		if(!is_array($user['comVia'])){
			$user['comVia'] = array();
		}
		return $user;
	}

	function edit($id){

		if(!$this->panelInit->can( "Administrators.editAdministrator" )){
			exit;
		}

		if(\User::where('username',trim(\Input::get('username')))->where('id','<>',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['editAdministrator'],$this->panelInit->language['usernameAlreadyUsed']);
		}
		if(\User::where('email',\Input::get('email'))->where('id','!=',$id)->count() > 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['editAdministrator'],$this->panelInit->language['emailAlreadyUsed']);
		}
		$User = \User::find($id);
		$User->username = \Input::get('username');
		$User->email = \Input::get('email');
		$User->fullName = \Input::get('fullName');
		if(\Input::get('password') != ""){
			$User->password = \Hash::make(\Input::get('password'));
		}
		if (\Input::hasFile('photo')) {
			$fileInstance = \Input::file('photo');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addAdministrator'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = "profile_".$User->id.".jpg";
			$file = $fileInstance->move(uploads_config()['uploads_file_path'] . '/profile/',$newFileName);

			$User->photo = "profile_".$User->id.".jpg";
		}
		$User->customPermissionsType = \Input::get('customPermissionsType');
		$User->customPermissions = json_encode(\Input::get('customPermissions'));
		if(\Input::has('comVia')){
			$User->comVia = json_encode(\Input::get('comVia'));
		}
		$User->role_perm = \Input::get('role_perm');
		$User->save();

		user_log('Admins', 'edit', $User->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editAdministrator'],$this->panelInit->language['adminUpdated'],$User->toArray());
	}

	function account_status($id){

		if(!$this->panelInit->can( "Administrators.editAdministrator" )){
			exit;
		}

		$user = \User::where('role','admin')->where('id',$id)->first();

		if($id == $this->data['users']->id){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['editAdministrator'],"" );
		}

		if($user->account_active == "1"){
			$user->account_active = "0";
		}else{
			$user->account_active = "1";
		}

		$user->save();

		user_log('Admins', 'update_status', $user->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editAdministrator'],$this->panelInit->language['accStatusChged'], array( 'id' => $user->id,'account_active' => $user->account_active ) );
	}
}
