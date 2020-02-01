<?php
namespace App\Http\Controllers;

class frontendController extends Controller {

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

		if(!$this->panelInit->can( array("frontendCMSpages.list","frontendCMSpages.addPage","frontendCMSpages.editPage","frontendCMSpages.delPage") )){
			exit;
		}

		$toReturn = array();
		$toReturn['frontend_baseurl'] = $this->getBaseUrl()."/";
		$toReturn['pages'] = \frontend_pages::orderBy('page_order','ASC')->get();

		//get tamplates
		$path = 'assets/frontend/'.$this->panelInit->settingsArray['cms_template'].'/templates';
		$toReturn['templates'] = array();
		$filesInFolder = \File::files($path);
		foreach ($filesInFolder as $key => $value) {
			if (strpos($value,".php") !== false) {
				$value = str_replace($path, "", $value);
				$value = str_replace("/", "", $value);
				$value = str_replace(".php", "", $value);
				$toReturn['templates'][] = $value;
			}
		}

		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "frontendCMSpages.delPage" )){
			exit;
		}

		if ( $postDelete = \frontend_pages::where('id',$id)->first() ) {
    		user_log('frontend pages CMS', 'delete', $postDelete->page_title);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delPage'],$this->panelInit->language['pageDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delPage'],$this->panelInit->language['delNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "frontendCMSpages.addPage" )){
			exit;
		}

		$page_title = strip_tags(\Input::get('page_title'), '<br><p><s><a><strong><b><i><em><img><blockquote><code><dd><dl><hr><h1><h2><h3><h4><h5><h6><label><ul><li><ol><blockquote><span><sub><sup><table><tbody><thead><td><tr>');
		$page_content = strip_tags(\Input::get('page_content'), '<br><p><s><a><strong><b><i><em><img><blockquote><code><dd><dl><hr><h1><h2><h3><h4><h5><h6><label><ul><li><ol><blockquote><span><sub><sup><table><tbody><thead><td><tr>');

		$frontend_pages = new \frontend_pages();
		$frontend_pages->page_title = $page_title;
		$frontend_pages->page_permalink = \Input::get('page_permalink');
		$frontend_pages->page_content = $page_content;
		if(\Input::has('page_status')){
			$frontend_pages->page_status = \Input::get('page_status');
		}
		$frontend_pages->page_visibility = \Input::get('page_visibility');
		$frontend_pages->page_navbar_visible = \Input::get('page_navbar_visible');
		if(\Input::has('page_password')){
			$frontend_pages->page_password = \Input::get('page_password');
		}
		$frontend_pages->page_publish_date = \Input::get('page_publish_date');
		if(\Input::get('page_publish_specific_date')){
			$frontend_pages->page_publish_specific_date = $this->panelInit->date_to_unix( \Input::get('page_publish_specific_date') );
		}
		$frontend_pages->page_template = \Input::get('page_template');
		if(\Input::has('page_feat_image')){
			$frontend_pages->page_feat_image = json_encode(\Input::get('page_feat_image'));
		}else{
			$frontend_pages->page_feat_image = "";
		}
		if(\Input::has('page_slider_images')){
			$frontend_pages->page_slider_images = json_encode(\Input::get('page_slider_images'));
		}else{
			$frontend_pages->page_slider_images = "";
		}
		$frontend_pages->page_order = \Input::get('page_order');
		$frontend_pages->save();

		user_log('frontend pages CMS', 'create', $frontend_pages->page_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addPage'],$this->panelInit->language['pageCreated'],$frontend_pages->toArray());
	}

	function fetch($id){

		if(!$this->panelInit->can( "frontendCMSpages.editPage" )){
			exit;
		}

		$frontend_page = \frontend_pages::where('id',$id)->first()->toArray();
		if($frontend_page['page_publish_specific_date'] > 0){
			$frontend_page['page_publish_specific_date'] = $this->panelInit->unix_to_date( $frontend_page['page_publish_specific_date'] );
		}else{
			$frontend_page['page_publish_specific_date'] = "";
		}
		if($frontend_page['page_feat_image'] != ""){
			$frontend_page['page_feat_image'] = json_decode($frontend_page['page_feat_image'],true);
		}
		if($frontend_page['page_slider_images'] != ""){
			$frontend_page['page_slider_images'] = json_decode($frontend_page['page_slider_images'],true);
		}

		return $frontend_page;
	}

	function edit($id){

		if(!$this->panelInit->can( "frontendCMSpages.editPage" )){
			exit;
		}

		$page_title = strip_tags(\Input::get('page_title'), '<br><p><s><a><strong><b><i><em><img><blockquote><code><dd><dl><hr><h1><h2><h3><h4><h5><h6><label><ul><li><ol><blockquote><span><sub><sup><table><tbody><thead><td><tr>');
		$page_content = strip_tags(\Input::get('page_content'), '<br><p><s><a><strong><b><i><em><img><blockquote><code><dd><dl><hr><h1><h2><h3><h4><h5><h6><label><ul><li><ol><blockquote><span><sub><sup><table><tbody><thead><td><tr>');

		$frontend_pages = \frontend_pages::find($id);
		$frontend_pages->page_title = $page_title;
		$frontend_pages->page_permalink = \Input::get('page_permalink');
		$frontend_pages->page_content = $page_content;
		if(\Input::has('page_status')){
			$frontend_pages->page_status = \Input::get('page_status');
		}
		$frontend_pages->page_visibility = \Input::get('page_visibility');
		$frontend_pages->page_navbar_visible = \Input::get('page_navbar_visible');
		if(\Input::has('page_password')){
			$frontend_pages->page_password = \Input::get('page_password');
		}
		$frontend_pages->page_publish_date = \Input::get('page_publish_date');
		if(\Input::get('page_publish_specific_date')){
			$frontend_pages->page_publish_specific_date = $this->panelInit->date_to_unix( \Input::get('page_publish_specific_date') );
		}
		$frontend_pages->page_template = \Input::get('page_template');
		if(\Input::has('page_feat_image')){
			$frontend_pages->page_feat_image = json_encode(\Input::get('page_feat_image'));
		}else{
			$frontend_pages->page_feat_image = "";
		}
		if(\Input::has('page_slider_images')){
			$frontend_pages->page_slider_images = json_encode(\Input::get('page_slider_images'));
		}else{
			$frontend_pages->page_slider_images = "";
		}
		$frontend_pages->page_order = \Input::get('page_order');
		$frontend_pages->save();

		user_log('frontend pages CMS', 'edit', $frontend_pages->page_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editPage'],$this->panelInit->language['pageModified'],$frontend_pages->toArray());
	}

	function get_settings(){

		if(!$this->panelInit->can( array("adminTasks.frontendCMS") )){
			exit;
		}

		$settingsArray = array();
		$settings = \settings::whereIn('fieldName',array('cms_active','cms_theme','cms_template','cms_facebook','cms_google','cms_twitter','cms_footer_left','cms_footer_right'))->get();
		foreach ($settings as $setting) {
			$settingsArray[$setting->fieldName] = $setting->fieldValue;
		}

		return $settingsArray;
	}

	function set_settings(){

		if(!$this->panelInit->can( array("adminTasks.frontendCMS") )){
			exit;
		}

		$settingsData = \Input::All();

		foreach($settingsData as $key => $value){

			if(is_string($value)){
				$value = strip_tags($value, '<br><p><s><a><strong><b><i><em><img><blockquote><code><dd><dl><hr><h1><h2><h3><h4><h5><h6><label><ul><li><ol><blockquote><span><sub><sup><table><tbody><thead><td><tr>');
			}

			$settings = \settings::where('fieldName',$key)->first();
			if ($key == "cms_template") {
				$filesInFolder = \File::files('assets/frontend/'.$value.'/templates');
				if(count($filesInFolder) > 0){
					$settings->fieldValue = $value;
				}
			}else{
				$settings->fieldValue = $value;
			}
			$settings->save();

		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editSettings'],$this->panelInit->language['settSaved']);
	}

	function gen_permalink(){

		if(!$this->panelInit->can( "frontendCMSpages.editPage" )){
			exit;
		}

		$page_title = $this->toAscii( \Input::get('page_title') );
		if( $this->checkRoute($page_title) && \frontend_pages::where('page_permalink',$page_title)->count() > 0 )
		{
			return $this->panelInit->apiOutput(false,$this->panelInit->language['permalink'],$this->panelInit->language['permalinkCantUsed']);
		}
		return $this->panelInit->apiOutput(true,$this->panelInit->language['permalink'],$this->panelInit->language['permalinkValid'],array('page_permalink'=>$page_title));
	}

	function check_permalink($id){

		if(!$this->panelInit->can( "frontendCMSpages.editPage" )){
			exit;
		}

		$page_title = $this->toAscii( \Input::get('new_permalink') );

		$frontend_pages_check = \frontend_pages::where('page_permalink',$page_title);
		if($id != 0){
			$frontend_pages_check = $frontend_pages_check->where('id','!=',$id);
		}

		if( $this->checkRoute($page_title) || $frontend_pages_check->count() > 0 )
		{
			return $this->panelInit->apiOutput(false,$this->panelInit->language['permalink'],$this->panelInit->language['permalinkCantUsed']);
		}
		return $this->panelInit->apiOutput(true,$this->panelInit->language['permalink'],$this->panelInit->language['permalinkValid'],array('page_permalink'=>$page_title));
	}

	function toAscii($str, $replace=array(), $delimiter='-') {
		if( !empty($replace) ) {
			$str = str_replace((array)$replace, ' ', $str);
		}

		$clean = iconv('UTF-8', 'ASCII//TRANSLIT', $str);
		$clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
		$clean = strtolower(trim($clean, '-'));
		$clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);

		return $clean;
	}

	function checkRoute($route) {
	    $routes = \Route::getRoutes()->getRoutes();
	    foreach($routes as $r){
	        if($r->getUri() == $route){
	            return true;
	        }
	    }

	    return false;
	}

	function getBaseUrl(){
		$base_url = \URL::to('/');
		if (strpos($base_url, '/index.php') == true) {
			$mod_base_url = str_replace("/index.php", "", $base_url);
			$this->urlExists($mod_base_url);

			if($this->urlExists($mod_base_url)){
				$base_url = $mod_base_url;
			}
		}
		return $base_url;
	}

	function urlExists($url = NULL)
	{
	    if ($url == NULL) return false;
	    $ch = curl_init($url);
	    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
	    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    $data = curl_exec($ch);
	    $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	    curl_close($ch);
	    if ($httpcode >= 200 && $httpcode < 400) {
	        return true;
	    } else {
	        return false;
	    }
	}

}
