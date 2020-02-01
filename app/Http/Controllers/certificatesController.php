<?php
namespace App\Http\Controllers;

class certificatesController extends Controller {
	var $data = array();
	var $panelInit ;
	public $certificate_margins = array(
		"content_margin"=> 	array("top"=> "120px","left"=>"140px"),

		"header_left" => 	array("top" => 0, "left" => 0),
		"header_middle" => 	array("top" => "30px"),
		"header_right" => 	array("top" => 0, "right" =>0),

		"main_title" => 	array("top" => "20px","curve" => 400),
		"main_content" => 	array("top" => "30px"),

		"footer_left" => 	array("top" => "50px", "left" => "30px"),
		"footer_middle" => 	array("top" => "50px"),
		"footer_right" => 	array("top" => "50px", "right" => "30px"),
	);

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

	public function listAll($page = 1,$search = ""){

		if(!$this->panelInit->can( array("Certificates.list","Certificates.add_cert","Certificates.edit_cert","Certificates.del_cert","Certificates.Download") )){
			exit;
		}

		$toReturn = array("certificates"=>array());

		$certificates = \certificates::select('id','certificate_name','main_title')->orderby('id','DESC')->get()->toArray();

		foreach ($certificates as $key => $value) {
			$value['main_title'] = strip_tags( htmlspecialchars_decode($value['main_title']) );
			$toReturn['certificates'][] = $value;
		}

		return $toReturn;
	}

	public function create(){

		if(!$this->panelInit->can( "Certificates.add_cert" )){
			exit;
		}

		$certificates = new \certificates();
		$certificates->id = \Input::get('id');
		$certificates->certificate_name = \Input::get('certificate_name');
		if(\Input::has('header_left')){
			$certificates->header_left = \Input::get('header_left');
		}
		if(\Input::has('header_right')){
			$certificates->header_right = \Input::get('header_right');
		}
		if(\Input::has('header_middle')){
			$certificates->header_middle = \Input::get('header_middle');
		}
		$certificates->main_title = \Input::get('main_title');
		$certificates->main_content = \Input::get('main_content');
		if(\Input::has('footer_left')){
			$certificates->footer_left = \Input::get('footer_left');
		}
		if(\Input::has('footer_right')){
			$certificates->footer_right = \Input::get('footer_right');
		}
		if(\Input::has('footer_middle')){
			$certificates->footer_middle = \Input::get('footer_middle');
		}

		if (\Input::hasFile('certificate_image')) {
			$fileInstance = \Input::file('certificate_image');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['add_cert'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/cert/',$newFileName);

			$certificates->certificate_image = $newFileName;
		}

		$certificates->save();
		user_log('Certificates', 'create', $certificates->certificate_name);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_cert'],$this->panelInit->language['cert_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "Certificates.edit_cert" )){
			exit;
		}

		$certificates = \certificates::select('id','certificate_name','header_left','header_right','header_middle','main_title','main_content','footer_left','footer_right','footer_middle','certificate_image')->where('id',$id)->first()->toArray();

		return $certificates;
	}

	public function edit($id){

		if(!$this->panelInit->can( "Certificates.edit_cert" )){
			exit;
		}

		$certificates = \certificates::find($id);
		$certificates->id = \Input::get('id');
		$certificates->certificate_name = \Input::get('certificate_name');
		$certificates->header_left = \Input::get('header_left');
		$certificates->header_right = \Input::get('header_right');
		$certificates->header_middle = \Input::get('header_middle');
		$certificates->main_title = \Input::get('main_title');
		$certificates->main_content = \Input::get('main_content');
		$certificates->footer_left = \Input::get('footer_left');
		$certificates->footer_right = \Input::get('footer_right');
		$certificates->footer_middle = \Input::get('footer_middle');

		if (\Input::hasFile('certificate_image')) {

			$fileInstance = \Input::file('certificate_image');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_cert'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($certificates->certificate_image != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/cert/".$certificates->certificate_image);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/cert/',$newFileName);

			$certificates->certificate_image = $newFileName;
		}

		$certificates->save();
		user_log('Certificates', 'edit', $certificates->certificate_name);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_cert'],$this->panelInit->language['cert_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "Certificates.del_cert" )){
			exit;
		}

		if ( $postDelete = \certificates::where('id', $id)->first() ){
  		if($postDelete->certificate_image != ""){ @unlink(uploads_config()['uploads_file_path'] . '/cert/'.$postDelete->certificate_image); }

  		user_log('Certificates', 'delete', $postDelete->certificate_name);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cert'],$this->panelInit->language['cert_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_cert'],$this->panelInit->language['cert_not_exist']);
  	}
	}

	public function download($id){

		if(!$this->panelInit->can( "Certificates.Download" )){
			exit;
		}

		$toReturn = \certificates::where('id',$id)->select("id","certificate_image","certificate_name")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/cert/".$toReturn->certificate_image)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->certificate_name). "." .pathinfo($toReturn->certificate_image, PATHINFO_EXTENSION);
			user_log('Certificates', 'download', $toReturn->certificate_name);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/cert/".$toReturn->certificate_image);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}
}