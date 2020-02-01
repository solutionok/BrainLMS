<?php
namespace App\Http\Controllers;

class StaticPagesController extends Controller {

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
		if(!$this->panelInit->can( array("staticPages.list","staticPages.delPage","staticPages.editPage","staticPages.addPage") )){
			exit;
		}

		return \static_pages::get();
	}

	public function listUser()
	{
		if(!$this->panelInit->can( "staticPages.editPage" )){
			exit;
		}

		return \static_pages::where('pageActive','1')->get();
	}

	public function delete($id){
		if(!$this->panelInit->can( "staticPages.delPage" )){
			exit;
		}

		if ( $postDelete = \static_pages::where('id', $id)->first() ) {
    		user_log('Static pages', 'delete', $postDelete->pageTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delPage'],$this->panelInit->language['pageDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delPage'],$this->panelInit->language['delNotExist']);
    }
	}

	public function create(){
		if(!$this->panelInit->can( "staticPages.addPage" )){
			exit;
		}

		$staticPages = new \static_pages();
		$staticPages->pageTitle = \Input::get('pageTitle');
		$staticPages->pageContent = \Input::get('pageContent');
		$staticPages->pageActive = \Input::get('pageActive');
		$staticPages->save();

		user_log('Static pages', 'create', $staticPages->pageTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addPage'],$this->panelInit->language['pageCreated'],$staticPages->toArray() );
	}

	function fetch($id){
		return \static_pages::where('id',$id)->first();
	}

	function edit($id){
		if(!$this->panelInit->can( "staticPages.editPage" )){
			exit;
		}

		$staticPages = \static_pages::find($id);
		$staticPages->pageTitle = \Input::get('pageTitle');
		$staticPages->pageContent = \Input::get('pageContent');
		$staticPages->pageActive = \Input::get('pageActive');
		$staticPages->save();

		user_log('Static pages', 'edit', $staticPages->pageTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editPage'],$this->panelInit->language['pageModified'],$staticPages->toArray() );
	}

	function active($id){
		if(!$this->panelInit->can( "staticPages.editPage" )){
			exit;
		}

		$staticPagesData = \static_pages::find($id)->first();

		$staticPages = \static_pages::find($id);
		if($staticPages->pageActive == 1){
			$staticPages->pageActive = 0;
		}else{
			$staticPages->pageActive = 1;
		}
		$staticPages->save();

		user_log('Static pages', 'update_status', $staticPages->pageTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['activeInactivePage'],$this->panelInit->language['pageChanged'],array("id"=>$staticPages->id) );
	}
}
