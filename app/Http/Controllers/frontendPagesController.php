<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class frontendPagesController extends Controller {

	var $data = array();
	var $panelInit ;
	var $layout = 'dashboard';
	var $base_template;
	var $width = "170";
	var $height = "127";

	public function __construct(){
		$this->panelInit = new \DashboardInit();
		$this->data['panelInit'] = $this->panelInit;
		$this->data['breadcrumb']['Settings'] = \URL::to('/dashboard/languages');
		$this->data['users'] = $this->panelInit->getAuthUser();
	}

	public function index($permalink = "home")
	{
		return \Redirect::to('/portal');

		if(!isset($this->panelInit->settingsArray['cms_active']) || $this->panelInit->settingsArray['cms_active'] != 1){
			return \Redirect::to('/login');
		}

		if($permalink == ""){
			$permalink = "home";
		}
		$route_permalink = $permalink;
		$splitted_permalink = explode("/",$route_permalink);

		$permalink = $this->has_permalink($splitted_permalink[0]);

		if($permalink == false && $splitted_permalink[0] == "home"){
			return \Redirect::to('/login');
		}

		if($permalink == false){
			return \Redirect::to('/');
		}

		if($permalink['page_visibility'] == "logged" && $this->data['users'] == null){
			return \Redirect::to('/login');
		}

		$this->base_template = $this->get_base_template();
		$template_vars = $this->prepare_variables($permalink);
		$navbar_links = $this->get_navbar();

		if($permalink['page_template'] == "news"){
			if(!isset($splitted_permalink[1])){
				$page = 1;
			}else{
				$page = $splitted_permalink[1];
			}
			$template_vars['news_list'] = $this->get_news_list($page);

			$template_vars['page'] = $page;
			if(count($template_vars['news_list']) >= 20){
				$template_vars['prev_page'] = \URL::to('/'.$splitted_permalink[0]."/". ($page+1) );
			}
			if($page != 1){
				$template_vars['next_page'] = \URL::to('/'.$splitted_permalink[0]."/". ($page-1) );
			}
		}

		if($permalink['page_template'] == "events"){
			if(!isset($splitted_permalink[1])){
				$page = 1;
			}else{
				$page = $splitted_permalink[1];
			}
			$template_vars['events_list'] = $this->get_events_list($page);

			$template_vars['page'] = $page;
			if(count($template_vars['events_list']) >= 20){
				$template_vars['prev_page'] = \URL::to('/'.$splitted_permalink[0]."/". ($page+1) );
			}
			if($page != 1){
				$template_vars['next_page'] = \URL::to('/'.$splitted_permalink[0]."/". ($page-1) );
			}
		}

		if($permalink['page_template'] == "teachers"){
			if(!isset($splitted_permalink[1])){
				$page = 1;
			}else{
				$page = $splitted_permalink[1];
			}
			$template_vars['teachers_list'] = $this->get_teachers_list($page);

			$template_vars['page'] = $page;
			if(count($template_vars['teachers_list']) >= 20){
				$template_vars['prev_page'] = \URL::to('/'.$splitted_permalink[0]."/". ($page+1) );
			}
			if($page != 1){
				$template_vars['next_page'] = \URL::to('/'.$splitted_permalink[0]."/". ($page-1) );
			}
		}

		if($permalink['page_template'] == "gallery"){
			if(isset($template_vars['page_slider_images']) && is_array($template_vars['page_slider_images'])){
				foreach ($template_vars['page_slider_images'] as $key => $value) {
					$template_vars['page_slider_images'][$key]['thumb_image'] = $this->generateThumb($value['file_uploaded_name'],340,230);
				}
			}
		}

		if($permalink['page_template'] == "contact"){
			$template_vars['form_errors'] = array();

			if (\Request::isMethod('post')) {

				if( \Input::get('firstname') == "" ||  \Input::get('lastname') == "" ||  \Input::get('email') == "" ||  \Input::get('subject') == "" || \Input::get('message') == ""){
					$template_vars['form_errors'][] = $this->panelInit->language['fillField'];
				}

				if (!filter_var(\Input::get('email'), FILTER_VALIDATE_EMAIL) AND \Input::get('email') != "") {
					$template_vars['form_errors'][] = $this->panelInit->language['validateMail'];
				}

				if(count($template_vars['form_errors']) == 0){
					$template_vars['form_success'] = array($this->panelInit->language['messSent']);

					$sendMessage = "Name : ".\Input::get('firstname') . " " . \Input::get('lastname');
					$sendMessage .= "<br/>E-mail : ".\Input::get('email') ;
					$sendMessage .= "<br/>Subject : ".\Input::get('subject') ;
					$sendMessage .= "<br/>Message : ".\Input::get('message') ;

					$message = new \contact_messages();
					if(\Input::has('subject')){
						$message->mail_subject = \Input::get('subject');
					}
					if(\Input::has('firstname')){
						$message->firstName = \Input::get('firstname');
					}
					if(\Input::has('lastname')){
						$message->lastName = \Input::get('lastname');
					}
					if(\Input::has('email')){
						$message->email = \Input::get('email');
					}
					if(\Input::has('message')){
						$message->message = \Input::get('message');
					}
					$message->message_time = time();
					$message->save();

					$SmsHandler = new \MailSmsHandler();
					$SmsHandler->mail($this->panelInit->settingsArray['systemEmail'],"Inquiry : ".\Input::get('subject'),$sendMessage,\Input::get('firstname') . " " . \Input::get('lastname'));
				}

			}
		}

		$template_inner_content = $this->get_template_content($permalink,$template_vars);

		include($this->base_template."/index.php");
	}

	public function get_news_list($page){

		$news_list = \newsboard::where('fe_active','1')->orderby('id','desc')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
		foreach ($news_list as $key => $value) {
			$news_list[$key]['newsText'] = htmlspecialchars_decode($news_list[$key]['newsText']);
			$news_list[$key]['newsTextTruncated'] = $this->panelInit->truncate($news_list[$key]['newsText'],300);

			$doc = new \DOMDocument();
			$doc->loadHTML(mb_convert_encoding($news_list[$key]['newsText'], 'HTML-ENTITIES', 'UTF-8'));
			$imgs = $doc->getElementsByTagName('img');
			foreach ($imgs as $img) {
				$img->setAttribute('class', 'img-fluid');
				$img->setAttribute('style', 'padding:10px;');
			}
			$news_list[$key]['newsText'] = $doc->saveXml();

			if(!\File::exists(uploads_config()['uploads_file_path'] . "/news/".$value['newsImage']) || $value['newsImage'] == ""){
				$news_list[$key]['newsImage'] = "default.png";
			}
		}

		return $news_list;
	}

	public function get_events_list($page){

		$events = \events::where('fe_active','1')->orderby('id','desc')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
		foreach ($events as $key => $value) {
			$events[$key]['eventDescription'] = htmlspecialchars_decode($events[$key]['eventDescription']);
			$events[$key]['eventDescriptionTruncated'] = $this->panelInit->truncate($events[$key]['eventDescription'],300);

			$doc = new \DOMDocument();
			$doc->loadHTML(mb_convert_encoding($events[$key]['eventDescription'], 'HTML-ENTITIES', 'UTF-8'));
			$imgs = $doc->getElementsByTagName('img');
			foreach ($imgs as $img) {
				$img->setAttribute('class', 'img-fluid');
				$img->setAttribute('style', 'padding:10px;');
			}
			$events[$key]['eventDescription'] = $doc->saveXml();

			if(!\File::exists(uploads_config()['uploads_file_path'] . "/events/".$value['eventImage']) || $value['eventImage'] == ""){
				$events[$key]['eventImage'] = "default.png";
			}
		}

		return $events;
	}

	public function get_teachers_list($page){
		$teachers_list = \User::whereIn('role',array('teacher','employee'))->where('activated',1)->where('account_active',1)->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
		return $teachers_list;
	}

	public function profileImage($id){
		header('Content-Type: image/jpeg');
		if(file_exists(uploads_config()['uploads_file_path'] . '/profile/profile_'.$id.'.jpg')){
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/profile/profile_'.$id.'.jpg');
		}
		echo file_get_contents(uploads_config()['uploads_file_path'] . '/profile/user.png');
		exit;
	}

	public function prepare_variables($permalink){
		$to_return = array();
		$to_return['site_title'] = $this->panelInit->settingsArray['siteTitle'];
		$to_return['theme'] = $this->panelInit->settingsArray['cms_theme'];
		$to_return['page_title'] = $permalink['page_title'];
		$to_return['favicon'] = $this->panelInit->settingsArray['favicon'];
		$to_return['phone_number'] = $this->panelInit->settingsArray['phoneNo'];
		$to_return['mail_address'] = $this->panelInit->settingsArray['systemEmail'];
		$to_return['assets_folder'] = \URL::asset($this->base_template."/assets");
		$to_return['cms_footer_right'] = $this->panelInit->settingsArray['cms_footer_right'];
		$to_return['cms_footer_left'] = $this->panelInit->settingsArray['cms_footer_left'];
		$to_return['address_line_1'] = $this->panelInit->settingsArray['address'];
		$to_return['address_line_2'] = $this->panelInit->settingsArray['address2'];
		$to_return['footer_news_list'] = \newsboard::where('fe_active','1')->orderby('id','desc')->limit('3')->get();
		foreach ($to_return['footer_news_list'] as $key => $value) {
			if(!\File::exists(uploads_config()['uploads_file_path'] . "/news/".$value['newsImage']) || $value['newsImage'] == ""){
				$to_return['footer_news_list'][$key]['newsImage'] = "default.png";
			}
		}

		$to_return['language'] = $this->panelInit->language;
		$to_return['rtl'] = $this->panelInit->isRTL;

		if(isset($this->panelInit->settingsArray['cms_facebook'])){
			$to_return['social_facebook'] = $this->panelInit->settingsArray['cms_facebook'];
		}
		if(isset($this->panelInit->settingsArray['cms_google'])){
			$to_return['social_google'] = $this->panelInit->settingsArray['cms_google'];
		}
		if(isset($this->panelInit->settingsArray['cms_twitter'])){
			$to_return['social_twitter'] = $this->panelInit->settingsArray['cms_twitter'];
		}

		if($permalink['page_feat_image'] != ""){
			$to_return['page_feat_image'] = json_decode($permalink['page_feat_image'],true);
		}

		if($permalink['page_slider_images'] != ""){
			$to_return['page_slider_images'] = json_decode($permalink['page_slider_images'],true);
		}

		return $to_return;
	}

	public function get_template_content($permalink,$template_vars){
		ob_start( );
		include($this->base_template."/templates/".$permalink['page_template'].".php");
		return ob_get_clean( );
	}

	public function get_navbar(){
		$logged_user = $this->data['users'];
		$frontend_pages = \frontend_pages::where('page_status','publish')->where(function($query){
																                 $query->where('page_publish_date', '=', '0');
																                 $query->orWhere(function($query){
																	                 $query->where('page_publish_date', '=', 'specific_date');
																	                 $query->where('page_publish_specific_date','<=',time());
																	             });
																             });

		$frontend_pages = $frontend_pages->where(function($query) use ($logged_user){
									                 $query->where('page_visibility', '=', 'public');
									                 if(isset($logged_user->role)){
										                 $query->orWhere('page_visibility', '=', 'logged');
									                 }
									             });

		$frontend_pages = $frontend_pages->where('page_navbar_visible',1)->select('page_title','page_permalink')->orderBy('page_order','ASC')->get()->toArray();

		return $frontend_pages;

	}

	public function has_permalink($permalink){
		$permalink = \frontend_pages::where('page_permalink',$permalink)->where(function($query){
																                 $query->where('page_publish_date', '=', '0');
																                 $query->orWhere(function($query){
																	                 $query->where('page_publish_date', '=', 'specific_date');
																	                 $query->where('page_publish_specific_date','<=',time());
																	             });
																             });

		if(isset($this->data['users']->role) && $this->data['users']->role == "admin"){
			$this->admin_preview = true;
		}else{
			$permalink = $permalink->where('page_status','publish');
		}

		if($permalink->count() > 0){
			return $permalink->first()->toArray();
		}

		return false;
	}

	public function get_base_template(){
		$filesInFolder = \File::files('assets/frontend/'.$this->panelInit->settingsArray['cms_template']);
		if(count($filesInFolder) > 0){
			return 'assets/frontend/'.$this->panelInit->settingsArray['cms_template'];
		}
		return 'assets/frontend/default';
	}

	function generateThumb($origImage,$width,$height){
		if(\File::exists(uploads_config()['uploads_file_path'] . '/ml_uploads/'.$origImage) AND $origImage != ""){

			$cached_image = uploads_config()['uploads_file_path'] . '/cache/'.$width."-".$height."-".$origImage;

			if(\File::exists($cached_image)){
				return $cached_image;
			}

			// Create a new SimpleImage object
			$image = new \claviska\SimpleImage();

			$image->fromFile( uploads_config()['uploads_file_path'] . '/ml_uploads/'.$origImage )->thumbnail($width, $height,'center')->toFile($cached_image);

			return $cached_image;
		}else{
			return "";
		}
	}
}
