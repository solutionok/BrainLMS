<?php
namespace App\Http\Controllers;

class hostelCatController extends Controller {

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

		if(!$this->panelInit->can( "Hostel.HostelCat" )){
			exit;
		}
	}

	public function listAll()
	{
		$toReturn = array();
		$toReturn['hostel'] = array();
		$hostel = \hostel::get();
		foreach ($hostel as $value) {
			$toReturn['hostel'][$value->id] = $value->hostelTitle ;
		}

		$toReturn['cat'] = \hostel_cat::get()->toArray();
		return $toReturn;
	}

	public function delete($id){
		if ( $postDelete = \hostel_cat::where('id', $id)->first() ) {
    		user_log('Hostel categories', 'delete', $postDelete->catTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delHostelCat'],$this->panelInit->language['hostelCatDeleted']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delHostelCat'],$this->panelInit->language['HostelCatNotExist']);
    }
	}

	public function create(){
		$hostelCat = new \hostel_cat();
    $hostelCat->catTypeId = \Input::get('catTypeId');
		$hostelCat->catTitle = \Input::get('catTitle');
		$hostelCat->catFees = \Input::get('catFees');
		if(\Input::has('catNotes')){
			$hostelCat->catNotes = \Input::get('catNotes');
		}
		$hostelCat->save();

		user_log('Hostel categories', 'create', $hostelCat->catTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addHostelCat'],$this->panelInit->language['HostelCatCreated'],$hostelCat->toArray() );
	}

	function fetch($id){
		return \hostel_cat::where('id',$id)->first();
	}

	function edit($id){
		$hostelCat = \hostel_cat::find($id);
		$hostelCat->catTypeId = \Input::get('catTypeId');
		$hostelCat->catTitle = \Input::get('catTitle');
		$hostelCat->catFees = \Input::get('catFees');
		if(\Input::has('catNotes')){
			$hostelCat->catNotes = \Input::get('catNotes');
		}
		$hostelCat->save();

		user_log('Hostel categories', 'edit', $hostelCat->catTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editHostelCat'],$this->panelInit->language['hostelCatModified'],$hostelCat->toArray() );
	}
}
