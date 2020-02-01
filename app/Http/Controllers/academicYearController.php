<?php
namespace App\Http\Controllers;

class academicYearController extends Controller {

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
		if(!$this->panelInit->can( array('academicyears.list','academicyears.addAcademicyear','academicyears.editAcademicYears','academicyears.delAcademicYears') )){
			exit;
		}

		return \academic_year::get()->toArray();
	}

	public function delete($id){

		if(!$this->panelInit->can('academicyears.delAcademicYears')){
			exit;
		}

    if ( $postDelete = \academic_year::where('id', $id)->first() )
    {
        if($postDelete->isDefault == 1){
            return $this->panelInit->apiOutput(false,$this->panelInit->language['delAcademicYears'],$this->panelInit->language['cannotDelDefAcademicYears']);
        }
        user_log('Academic years', 'delete', $postDelete->yearTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delAcademicYears'],$this->panelInit->language['acYearDelSuc']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delAcademicYears'],$this->panelInit->language['acYearNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can('academicyears.addAcademicyear')){
			exit;
		}

    if(\Input::has('isDefault') AND \Input::get('isDefault') == 1){
        \DB::table('academic_year')->update(array('isDefault' => 0));
        $isDefault = 1;
    }else{
        $isDefault = 0;
    }

		$academicYear = new \academic_year();
		$academicYear->yearTitle = \Input::get('yearTitle');
		$academicYear->isDefault = $isDefault;
		$academicYear->save();

		if($isDefault == 1){
			\Session::put('selectAcYear', $academicYear->id);
		}

		user_log('Academic years', 'create', $academicYear->yearTitle);

    return $this->panelInit->apiOutput(true,$this->panelInit->language['addAcademicyear'],$this->panelInit->language['acYearAddSuc'],array("id"=>$academicYear->id,"yearTitle"=>\Input::get('yearTitle'),"isDefault"=>$isDefault));
	}

	function fetch($id){
		if(!$this->panelInit->can('academicyears.editAcademicYears')){
			exit;
		}

		$academicYear = \academic_year::where('id',$id)->first()->toArray();
		return $academicYear;
	}

	function edit($id){

		if(!$this->panelInit->can('academicyears.editAcademicYears')){
			exit;
		}

		$academicYear = \academic_year::find($id);
		$academicYear->yearTitle = \Input::get('yearTitle');
		$academicYear->save();

		user_log('Academic years', 'edit', $academicYear->yearTitle);

    return $this->panelInit->apiOutput(true,$this->panelInit->language['editAcademicYears'],$this->panelInit->language['acYearModSuc'],array("id"=>$academicYear->id,"yearTitle"=>\Input::get('yearTitle'),"isDefault"=>$academicYear->isDefault));
	}

    function active($id){
    	if(!$this->panelInit->can('academicyears.editAcademicYears')){
				exit;
			}

      \DB::table('academic_year')->update(array('isDefault' => 0));

      $academicYear = \academic_year::find($id);
			$academicYear->isDefault = "1";
			$academicYear->save();

			\Session::put('selectAcYear', $academicYear->id);

			user_log('Academic years', 'update_activity', $academicYear->yearTitle);

      return $this->panelInit->apiOutput(true,$this->panelInit->language['editAcademicYears'],$this->panelInit->language['acYearNowDef'],array("id"=>$academicYear->id));
    }

}
