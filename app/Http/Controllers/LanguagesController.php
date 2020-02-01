<?php
namespace App\Http\Controllers;

class LanguagesController extends Controller {

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
		if(!$this->panelInit->can( array("Languages.list","Languages.addLanguage","Languages.editLanguage","Languages.delLanguage") )){
			exit;
		}

		return \languages::select('id','languageTitle')->get();
	}

	public function delete($id){

		if(!$this->panelInit->can( "Languages.delLanguage" )){
			exit;
		}

		if ( $postDelete = \languages::where('id', $id)->first() ) {
				user_log('Languages', 'delete', $postDelete->languageTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delLanguage'],$this->panelInit->language['languageDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delLanguage'],$this->panelInit->language['languageNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Languages.addLanguage" )){
			exit;
		}

		$languages = new \languages();
		$languages->languageTitle = \Input::get('languageTitle');
		$languages->languageUniversal = \Input::get('languageUniversal');
		$languages->isRTL = \Input::get('isRTL');
		$languages->languagePhrases = json_encode(\Input::get('languagePhrases'));
		$languages->save();

		user_log('Languages', 'create', $languages->languageTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addLanguage'],$this->panelInit->language['langCreated'],$languages->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Languages.editLanguage" )){
			exit;
		}

		$languages = \languages::where('id',$id)->first()->toArray();
		$languages['languagePhrases'] = json_decode($languages['languagePhrases'],true);
		return $languages;
	}

	function edit($id){

		if(!$this->panelInit->can( "Languages.editLanguage" )){
			exit;
		}

		$languages = \languages::find($id);
		$languages->languageTitle = \Input::get('languageTitle');
		$languages->languageUniversal = \Input::get('languageUniversal');
		$languages->isRTL = \Input::get('isRTL');
		$languages->languagePhrases = json_encode(\Input::get('languagePhrases'));
		$languages->save();

		user_log('Languages', 'edit', $languages->languageTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editLanguage'],$this->panelInit->language['langModified'],$languages->toArray() );
	}
}
