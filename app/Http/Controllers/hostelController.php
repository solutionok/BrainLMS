<?php
namespace App\Http\Controllers;

class hostelController extends Controller {

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

		if(!$this->panelInit->can( array("Hostel.list","Hostel.AddHostel","Hostel.EditHostel","Hostel.delHostel","Hostel.listSubs") )){
			exit;
		}

		return \hostel::get();
	}

	public function delete($id){

		if(!$this->panelInit->can( "Hostel.delHostel" )){
			exit;
		}

		if ( $postDelete = \hostel::where('id', $id)->first() ) {
    		user_log('Hostels', 'delete', $postDelete->hostelTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delHostel'] ,$this->panelInit->language['hostelDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delHostel'] ,$this->panelInit->language['hostelNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Hostel.AddHostel" )){
			exit;
		}

		$hostel = new \hostel();
        $hostel->hostelTitle = \Input::get('hostelTitle');
		$hostel->hostelType = \Input::get('hostelType');
		if(\Input::has('hostelAddress')){
			$hostel->hostelAddress = \Input::get('hostelAddress');
		}
		if(\Input::has('hostelManager')){
			$hostel->hostelManager = \Input::get('hostelManager');
		}
		if (\Input::hasFile('managerPhoto')) {
			$fileInstance = \Input::file('managerPhoto');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['AddHostel'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/hostel/',$newFileName);

			$hostel->managerPhoto = $newFileName;
		}
		if(\Input::has('managerContact')){
			$hostel->managerContact = \Input::get('managerContact');
		}
		if(\Input::has('hostelNotes')){
			$hostel->hostelNotes = \Input::get('hostelNotes');
		}
		$hostel->save();

		user_log('Hostels', 'create', $hostel->hostelTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['AddHostel'],$this->panelInit->language['HostelCreated'] ,$hostel->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Hostel.EditHostel" )){
			exit;
		}

		return \hostel::where('id',$id)->first();
	}

	function listSubs($id){

		if(!$this->panelInit->can( "Hostel.listSubs" )){
			exit;
		}

		$catListId = array();
		$categoriesList = \hostel_cat::where('catTypeId',$id)->get();
		foreach ($categoriesList as $value) {
			$catListId[] = $value->id;
			$catListNames[$value->id] = $value->catTitle;
		}

		$subscribers = array();

		if(count($catListId) > 0){
			$subscribers = \User::whereIn('hostel',$catListId)->get()->toArray();
		}

		return $subscribers;
	}

	function edit($id){

		if(!$this->panelInit->can( "Hostel.EditHostel" )){
			exit;
		}

		$hostel = \hostel::find($id);
		$hostel->hostelTitle = \Input::get('hostelTitle');
		$hostel->hostelType = \Input::get('hostelType');
		if(\Input::has('hostelAddress')){
			$hostel->hostelAddress = \Input::get('hostelAddress');
		}
		if(\Input::has('hostelManager')){
			$hostel->hostelManager = \Input::get('hostelManager');
		}
		if (\Input::hasFile('managerPhoto')) {
			$fileInstance = \Input::file('managerPhoto');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['EditHostel'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/hostel/',$newFileName);

			$hostel->managerPhoto = $newFileName;
		}
		if(\Input::has('managerContact')){
			$hostel->managerContact = \Input::get('managerContact');
		}
		if(\Input::has('hostelNotes')){
			$hostel->hostelNotes = \Input::get('hostelNotes');
		}
		$hostel->save();

		user_log('Hostels', 'edit', $hostel->hostelTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['EditHostel'],$this->panelInit->language['HostelModified'],$hostel->toArray() );
	}
}
