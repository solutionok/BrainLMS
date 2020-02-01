<?php
namespace App\Http\Controllers;

class MailSMSTemplatesController extends Controller {

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
		return \mailsms_templates::get();
	}

	function fetch($id){
		return \mailsms_templates::where('id',$id)->first();
	}

	function edit($id){
		$mailsmsTemplates = \mailsms_templates::find($id);
		$mailsmsTemplates->templateMail = \Input::get('templateMail');
		$mailsmsTemplates->templateSMS = \Input::get('templateSMS');
		$mailsmsTemplates->save();

		user_log('Mail/SMS templates', 'edit', $mailsmsTemplates->templateTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editTemplate'],$this->panelInit->language['templateUpdated'] );
	}

	function add(){
		$mailsmsTemplates = new \mailsms_templates();
		$mailsmsTemplates->templateTitle = \Input::get('templateTitle');
		$mailsmsTemplates->templateMail = \Input::get('templateMail');
		$mailsmsTemplates->templateSMS = \Input::get('templateSMS');
		$mailsmsTemplates->save();

		user_log('Mail/SMS templates', 'create', $mailsmsTemplates->templateTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addTemplate'],$this->panelInit->language['templateAdded'],$mailsmsTemplates);
	}

	public function delete($id){
		if ( $postDelete = \mailsms_templates::where('id', $id)->first() )
		{
			user_log('Mail/SMS templates', 'delete', $postDelete->templateTitle);
			$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['delTemplate'],$this->panelInit->language['templateDeleted']);
		}else{
			return $this->panelInit->apiOutput(false,$this->panelInit->language['delTemplate'],$this->panelInit->language['templateNotExist']);
		}
	}
}
