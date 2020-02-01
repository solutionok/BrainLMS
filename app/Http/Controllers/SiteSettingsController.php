<?php
namespace App\Http\Controllers;

use Cache;

class SiteSettingsController extends Controller {

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

		if(!$this->panelInit->can( array("adminTasks.globalSettings","adminTasks.activatedModules","adminTasks.paymentsSettings","adminTasks.mailSmsSettings","adminTasks.vacationSettings","adminTasks.mobileSettings","adminTasks.frontendCMS","adminTasks.bioItegration","adminTasks.lookFeel") )){
			exit;
		}
	}

	public function listAll($title)
	{
		if($title == "siteSettings"){
			$settingsArray = array();

			$settingsArray['timezone_list'] = array(array("key"=>"Pacific/Midway","value"=>"(GMT-11:00) Midway Island, Samoa"),
													array("key"=>"America/Adak","value"=>"(GMT-10:00) Hawaii-Aleutian"),
													array("key"=>"Etc/GMT+10","value"=>"(GMT-10:00) Hawaii"),
													array("key"=>"Pacific/Marquesas","value"=>"(GMT-09:30) Marquesas Islands"),
													array("key"=>"Pacific/Gambier","value"=>"(GMT-09:00) Gambier Islands"),
													array("key"=>"America/Anchorage","value"=>"(GMT-09:00) Alaska"),
													array("key"=>"America/Ensenada","value"=>"(GMT-08:00) Tijuana, Baja California"),
													array("key"=>"Etc/GMT+8","value"=>"(GMT-08:00) Pitcairn Islands"),
													array("key"=>"America/Los_Angeles","value"=>"(GMT-08:00) Pacific Time (US & Canada)"),
													array("key"=>"America/Denver","value"=>"(GMT-07:00) Mountain Time (US & Canada)"),
													array("key"=>"America/Chihuahua","value"=>"(GMT-07:00) Chihuahua, La Paz, Mazatlan"),
													array("key"=>"America/Dawson_Creek","value"=>"(GMT-07:00) Arizona"),
													array("key"=>"America/Belize","value"=>"(GMT-06:00) Saskatchewan, Central America"),
													array("key"=>"America/Cancun","value"=>"(GMT-06:00) Guadalajara, Mexico City, Monterrey"),
													array("key"=>"Chile/EasterIsland","value"=>"(GMT-06:00) Easter Island"),
													array("key"=>"America/Chicago","value"=>"(GMT-06:00) Central Time (US & Canada)"),
													array("key"=>"America/New_York","value"=>"(GMT-05:00) Eastern Time (US & Canada)"),
													array("key"=>"America/Havana","value"=>"(GMT-05:00) Cuba"),
													array("key"=>"America/Bogota","value"=>"(GMT-05:00) Bogota, Lima, Quito, Rio Branco"),
													array("key"=>"America/Caracas","value"=>"(GMT-04:30) Caracas"),
													array("key"=>"America/Santiago","value"=>"(GMT-04:00) Santiago"),
													array("key"=>"America/La_Paz","value"=>"(GMT-04:00) La Paz"),
													array("key"=>"Atlantic/Stanley","value"=>"(GMT-04:00) Faukland Islands"),
													array("key"=>"America/Campo_Grande","value"=>"(GMT-04:00) Brazil"),
													array("key"=>"America/Goose_Bay","value"=>"(GMT-04:00) Atlantic Time (Goose Bay)"),
													array("key"=>"America/Glace_Bay","value"=>"(GMT-04:00) Atlantic Time (Canada)"),
													array("key"=>"America/St_Johns","value"=>"(GMT-03:30) Newfoundland"),
													array("key"=>"America/Araguaina","value"=>"(GMT-03:00) UTC-3"),
													array("key"=>"America/Montevideo","value"=>"(GMT-03:00) Montevideo"),
													array("key"=>"America/Miquelon","value"=>"(GMT-03:00) Miquelon, St. Pierre"),
													array("key"=>"America/Godthab","value"=>"(GMT-03:00) Greenland"),
													array("key"=>"America/Argentina/Buenos_Aires","value"=>"(GMT-03:00) Buenos Aires"),
													array("key"=>"America/Sao_Paulo","value"=>"(GMT-03:00) Brasilia"),
													array("key"=>"America/Noronha","value"=>"(GMT-02:00) Mid-Atlantic"),
													array("key"=>"Atlantic/Cape_Verde","value"=>"(GMT-01:00) Cape Verde Is."),
													array("key"=>"Atlantic/Azores","value"=>"(GMT-01:00) Azores"),
													array("key"=>"Europe/Belfast","value"=>"(GMT) Greenwich Mean Time : Belfast"),
													array("key"=>"Europe/Dublin","value"=>"(GMT) Greenwich Mean Time : Dublin"),
													array("key"=>"Europe/Lisbon","value"=>"(GMT) Greenwich Mean Time : Lisbon"),
													array("key"=>"Europe/London","value"=>"(GMT) Greenwich Mean Time : London"),
													array("key"=>"Africa/Abidjan","value"=>"(GMT) Monrovia, Reykjavik"),
													array("key"=>"Europe/Amsterdam","value"=>"(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna"),
													array("key"=>"Europe/Belgrade","value"=>"(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague"),
													array("key"=>"Europe/Brussels","value"=>"(GMT+01:00) Brussels, Copenhagen, Madrid, Paris"),
													array("key"=>"Africa/Algiers","value"=>"(GMT+01:00) West Central Africa"),
													array("key"=>"Africa/Windhoek","value"=>"(GMT+01:00) Windhoek"),
													array("key"=>"Asia/Beirut","value"=>"(GMT+02:00) Beirut"),
													array("key"=>"Africa/Cairo","value"=>"(GMT+02:00) Cairo"),
													array("key"=>"Asia/Gaza","value"=>"(GMT+02:00) Gaza"),
													array("key"=>"Africa/Blantyre","value"=>"(GMT+02:00) Harare, Pretoria"),
													array("key"=>"Asia/Jerusalem","value"=>"(GMT+02:00) Jerusalem"),
													array("key"=>"Europe/Minsk","value"=>"(GMT+02:00) Minsk"),
													array("key"=>"Asia/Damascus","value"=>"(GMT+02:00) Syria"),
													array("key"=>"Europe/Moscow","value"=>"(GMT+03:00) Moscow, St. Petersburg, Volgograd"),
													array("key"=>"Africa/Addis_Ababa","value"=>"(GMT+03:00) Nairobi"),
													array("key"=>"Asia/Tehran","value"=>"(GMT+03:30) Tehran"),
													array("key"=>"Asia/Dubai","value"=>"(GMT+04:00) Abu Dhabi, Muscat"),
													array("key"=>"Asia/Yerevan","value"=>"(GMT+04:00) Yerevan"),
													array("key"=>"Asia/Kabul","value"=>"(GMT+04:30) Kabul"),
													array("key"=>"Asia/Yekaterinburg","value"=>"(GMT+05:00) Ekaterinburg"),
													array("key"=>"Asia/Tashkent","value"=>"(GMT+05:00) Tashkent"),
													array("key"=>"Asia/Kolkata","value"=>"(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi"),
													array("key"=>"Asia/Katmandu","value"=>"(GMT+05:45) Kathmandu"),
													array("key"=>"Asia/Dhaka","value"=>"(GMT+06:00) Astana, Dhaka"),
													array("key"=>"Asia/Novosibirsk","value"=>"(GMT+06:00) Novosibirsk"),
													array("key"=>"Asia/Rangoon","value"=>"(GMT+06:30) Yangon (Rangoon)"),
													array("key"=>"Asia/Bangkok","value"=>"(GMT+07:00) Bangkok, Hanoi, Jakarta"),
													array("key"=>"Asia/Krasnoyarsk","value"=>"(GMT+07:00) Krasnoyarsk"),
													array("key"=>"Asia/Hong_Kong","value"=>"(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi"),
													array("key"=>"Asia/Irkutsk","value"=>"(GMT+08:00) Irkutsk, Ulaan Bataar"),
													array("key"=>"Australia/Perth","value"=>"(GMT+08:00) Perth"),
													array("key"=>"Australia/Eucla","value"=>"(GMT+08:45) Eucla"),
													array("key"=>"Asia/Tokyo","value"=>"(GMT+09:00) Osaka, Sapporo, Tokyo"),
													array("key"=>"Asia/Seoul","value"=>"(GMT+09:00) Seoul"),
													array("key"=>"Asia/Yakutsk","value"=>"(GMT+09:00) Yakutsk"),
													array("key"=>"Australia/Adelaide","value"=>"(GMT+09:30) Adelaide"),
													array("key"=>"Australia/Darwin","value"=>"(GMT+09:30) Darwin"),
													array("key"=>"Australia/Brisbane","value"=>"(GMT+10:00) Brisbane"),
													array("key"=>"Australia/Hobart","value"=>"(GMT+10:00) Hobart"),
													array("key"=>"Asia/Vladivostok","value"=>"(GMT+10:00) Vladivostok"),
													array("key"=>"Australia/Lord_Howe","value"=>"(GMT+10:30) Lord Howe Island"),
													array("key"=>"Etc/GMT-11","value"=>"(GMT+11:00) Solomon Is., New Caledonia"),
													array("key"=>"Asia/Magadan","value"=>"(GMT+11:00) Magadan"),
													array("key"=>"Pacific/Norfolk","value"=>"(GMT+11:30) Norfolk Island"),
													array("key"=>"Asia/Anadyr","value"=>"(GMT+12:00) Anadyr, Kamchatka"),
													array("key"=>"Pacific/Auckland","value"=>"(GMT+12:00) Auckland, Wellington"),
													array("key"=>"Etc/GMT-12","value"=>"(GMT+12:00) Fiji, Kamchatka, Marshall Is."),
													array("key"=>"Pacific/Chatham","value"=>"(GMT+12:45) Chatham Islands"),
													array("key"=>"Pacific/Tongatapu","value"=>"(GMT+13:00) Nuku'alofa"),
													array("key"=>"Pacific/Kiritimati","value"=>"(GMT+14:00) Kiritimati"));

			$languages = \languages::get();
			foreach ($languages as $language) {
				$settingsArray['languages'][$language->id] = $language->languageTitle;
			}

			$settings = \settings::where('fieldName','!=','schoolTerms')->get();
			foreach ($settings as $setting) {
				$settingsArray['settings'][$setting->fieldName] = $setting->fieldValue;
			}
			$settingsArray['settings']['activatedModules'] = json_decode($settingsArray['settings']['activatedModules'],true);
			if(!is_array($settingsArray['settings']['activatedModules'])){
				$settingsArray['settings']['activatedModules'] = array();
			}
			$settingsArray['settings']['officialVacationDay'] = json_decode($settingsArray['settings']['officialVacationDay'],true);
			if(!is_array($settingsArray['settings']['officialVacationDay'])){
				$settingsArray['settings']['officialVacationDay'] = array();
			}else{
				if(count($settingsArray['settings']['officialVacationDay']) > 0){
					foreach($settingsArray['settings']['officialVacationDay'] as $key_ => $date){
						$settingsArray['settings']['officialVacationDay'][$key_] = $this->panelInit->unix_to_date($date);
					}
				}
			}
			$settingsArray['settings']['daysWeekOff'] = json_decode($settingsArray['settings']['daysWeekOff'],true);
			if(!is_array($settingsArray['settings']['daysWeekOff'])){
				$settingsArray['settings']['daysWeekOff'] = array();
			}
			$settingsArray['smsProvider'] = json_decode($this->panelInit->settingsArray['smsProvider']);
			$settingsArray['mailProvider'] = json_decode($this->panelInit->settingsArray['mailProvider']);
			$settingsArray['globalcalendars'] = $this->panelInit->weekdays[$this->panelInit->settingsArray['gcalendar']];
			$settingsArray['biometric_device_status'] = json_decode($this->panelInit->settingsArray['biometric_device_status'],true);

			return $settingsArray;
		}
		if($title == "terms"){
			$settings = \settings::where('fieldName','schoolTerms')->first()->toArray();
			$settings['fieldValue'] = $settings['fieldValue'];
			return $settings;
		}

	}

	public function langs()
	{

		$settingsArray = array();

		$languages = \languages::get();
		foreach ($languages as $language) {
			$settingsArray['languages'][$language->id] = $language->languageTitle;
		}
		return $settingsArray;

	}

	public function save($title){
		Cache::forget('setting_table_pluck');
		if($title == "siteSettings"){

			$settingsData = \Input::All();

			foreach($settingsData as $key => $value){

				if(is_string($value)){
					$value = strip_tags($value, '<br><p><s><a><strong><b><i><em><img><blockquote><code><dd><dl><hr><h1><h2><h3><h4><h5><h6><label><ul><li><ol><blockquote><span><sub><sup><table><tbody><thead><td><tr>');
				}

				$settings = \settings::where('fieldName',$key)->first();
				if($key == "activatedModules"){
					$settings->fieldValue = json_encode($value);
				}elseif ($key == "officialVacationDay") {
					if(count($value) > 0){
						foreach($value as $key_ => $date){
							$value[$key_] = $this->panelInit->date_to_unix($date);
						}
					}
					$settings->fieldValue = json_encode($value);
				}elseif ($key == "daysWeekOff") {
					$settings->fieldValue = json_encode($value);
				}elseif ($key == "smsProvider") {
					$settings->fieldValue = json_encode($value);
				}elseif ($key == "mailProvider") {
					$settings->fieldValue = json_encode($value);
				}elseif ($key == "cms_template") {
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
		if($title == "terms"){
			$settings = \settings::where('fieldName','schoolTerms')->first();
			$settings->fieldValue = \Input::get('fieldValue');
			$settings->save();

			return $this->panelInit->apiOutput(true,$this->panelInit->language['editSettings'],$this->panelInit->language['settSaved']);
		}
	}

	public function test_mail_function(){
		ob_start( );

		global $debug_smtp;
		$debug_smtp = true;
		$MailSmsHandler = new \MailSmsHandler();
		$mail_response = $MailSmsHandler->mail(\Input::get('sendTestTo'),$this->panelInit->settingsArray['siteTitle']." | Test Mail Function",\Input::get('sendMessage'));

		if(is_array($mail_response)){
			$mail_response = json_encode($mail_response);
		}elseif(is_object($mail_response)){
			$mail_response = print_r($mail_response,true);
		}elseif(is_bool($mail_response)){
			$mail_response = print_r($mail_response,true);
		}

		$mail_response = ob_get_clean().$mail_response;

		return array("message"=>$mail_response);
	}

	public function test_sms_function(){
		$MailSmsHandler = new \MailSmsHandler();
		$sms_response = $MailSmsHandler->sms(\Input::get('sendTestTo'),\Input::get('sendMessage'));

		if(is_array($sms_response)){
			$sms_response = json_encode($sms_response);
		}elseif(is_object($sms_response)){
			$sms_response = print_r($sms_response,true);
		}elseif(is_bool($sms_response)){
			$sms_response = print_r($sms_response,true);
		}

		return array("message"=>$sms_response);
	}

}
