<?php
class MailSmsHandler {

	var $settings ;
	var $title;

	public function mail($to,$title,$message,$fullName="",$settings_array=""){
		global $debug_smtp;

		if($settings_array == ""){
			$panelInit = new \DashboardInit();
			$settings = $panelInit->settingsArray;
		}else{
			$settings = $settings_array;
		}

		$this->title = $settings['siteTitle'];

		$this->settings = json_decode($settings['mailProvider'],true);
		if($this->settings['mailProvider'] == "" || !isset($this->settings['mailProvider'])){
			exit;
		}

		if($this->settings['mailProvider'] == "mail"){
			$header = "From: ".$settings['systemEmail']."\r\n";
			$header.= "MIME-Version: 1.0\r\n";
			$header.= "Content-Type: text/html; charset=utf-8\r\n";
			$header.= "X-Priority: 1\r\n";

			if(config('app.env') == 'production') {
				return mail($to, $title, $message, $header);
			}
		}elseif($this->settings['mailProvider'] == "phpmailer"){
			$mail = new PHPMailer(true);
			if(isset($debug_smtp) && $debug_smtp == true){
				$mail->SMTPDebug  = 2;
			}
			try {
				$mail->From = $settings['systemEmail'];
				$mail->FromName = $settings['siteTitle'];
				$mail->addAddress($to, $fullName);
				$mail->Subject = $title;
				$mail->Body    = $message;
				$mail->CharSet = 'UTF-8';
				$mail->IsHTML(true);
				return $mail->send();
			} catch (phpmailerException $e) {
				return $e->errorMessage();
			} catch (Exception $e) {
				return $e->errorMessage();
			}
		}elseif($this->settings['mailProvider'] == "smtp"){
			$mail             = new PHPMailer(true);
			if(isset($debug_smtp) && $debug_smtp == true){
				$mail->SMTPDebug  = 2;
			}
			try {
				$mail->IsSMTP();
				$mail->SMTPAuth   = true;
				$mail->Host       = $this->settings['smtpHost'];
				$mail->Port       = $this->settings['smtpPort'];
				$mail->Username   = $this->settings['smtpUserName'];
				$mail->Password   = $this->settings['smtpPassWord'];

				if(isset($this->settings['smtpTLS']) && $this->settings['smtpTLS'] != ""){
					if($this->settings['smtpTLS'] == "TLS"){
						$mail->SMTPSecure = 'tls';
					}elseif($this->settings['smtpTLS'] == "SSL"){
						$mail->SMTPSecure = 'ssl';
					}
				}

				$mail->SetFrom($settings['systemEmail'], $settings['siteTitle']);
				$mail->Subject = $title;
				$mail->Body    = $message;
				$mail->CharSet = 'UTF-8';
				$mail->addAddress($to, $fullName);
				$mail->IsHTML(true);
				return $mail->Send();
			} catch (phpmailerException $e) {
				return $e->errorMessage();
			} catch (Exception $e) {
				return $e->errorMessage();
			}
		}elseif($this->settings['mailProvider'] == "ses"){
			$amazonSES = new SimpleEmailService($this->settings['AmazonSESAccessKey'],$this->settings['AmazonSESSecretKey']);
			$m = new SimpleEmailServiceMessage();
			$m->addTo($to);
			$m->setFrom($this->settings['AmazonSESVerifiedSender']);

			$m->setSubject($title);
			$m->setMessageFromString(strip_tags($message),$message);
			return $amazonSES->sendEmail($m);
		}
	}

	public function sms($to,$message,$settings_array=""){
		if($settings_array == ""){
			$panelInit = new \DashboardInit();
			$settings = $panelInit->settingsArray;
		}else{
			$settings = $settings_array;
		}

		$this->title = $settings['siteTitle'];

		$this->settings = json_decode($settings['smsProvider'],true);

		if($this->settings['smsProvider'] == "" || !isset($this->settings['smsProvider'])){
			exit;
		}
		try {
			$to = $this->prepareNumber($to);
			$message = html_entity_decode( trim(str_replace(PHP_EOL,' ',strip_tags($message))) );

			if($this->settings['smsProvider'] == "nexmo"){
				return $this->nexmo($to,$message);
			}elseif($this->settings['smsProvider'] == "twilio"){
				return $this->twilio($to,$message);
			}elseif($this->settings['smsProvider'] == "infobip"){
				return $this->infobip($to,$message);
			}elseif($this->settings['smsProvider'] == "hoiio"){
				return $this->hoiio($to,$message);
			}elseif($this->settings['smsProvider'] == "clickatell"){
				return $this->clickatell($to,$message);
			}elseif($this->settings['smsProvider'] == "intellisms"){
				return $this->intellisms($to,$message);
			}elseif($this->settings['smsProvider'] == "bulksms"){
				return $this->bulksms($to,$message);
			}elseif($this->settings['smsProvider'] == "concepto"){
				return $this->concepto($to,$message);
			}elseif($this->settings['smsProvider'] == "msg91"){
				return $this->msg91($to,$message);
			}elseif($this->settings['smsProvider'] == "custom"){
				return $this->custom($to,$message);
			}

		} catch (Exception $e) {
		    return $e->getMessage();
		}
	}

	public function nexmo($to,$message){
		if($this->settings['nexmoApiKey'] == "" || $this->settings['nexmoApiSecret'] == "" || $this->settings['nexmoFromId'] == "") return;

		$basic  = new \Nexmo\Client\Credentials\Basic($this->settings['nexmoApiKey'], $this->settings['nexmoApiSecret']);
		$client = new \Nexmo\Client($basic);

		$to = $this->prepareNumberFormat($to,"c");

		$message = $client->message()->send([
		    'to' => $to,
		    'from' => $this->settings['nexmoFromId'],
		    'text' => $message
		]);

		return $message;
	}

	public function twilio($to,$message){
		if($this->settings['twilioSID'] == "" || $this->settings['twilioToken'] == "" || $this->settings['twilioFN'] == "") return;
		$client = new Services_Twilio($this->settings['twilioSID'], $this->settings['twilioToken']);
	//	$to = $this->prepareNumberFormat($to,"c");
		return $message = $client->account->messages->create(array("From" => $this->settings['twilioFN'],"To" => $to,"Body" => $message));
	}

	public function infobip($to,$message){
		if($this->settings['infobipUN'] == "" || $this->settings['infobipPW'] == "" || $this->settings['infobipFROM'] == "") return;
		$to = $this->prepareNumberFormat($to,"c");

		$client = new infobip\api\client\SendSingleTextualSms(new infobip\api\configuration\BasicAuthConfiguration($this->settings['infobipUN'], $this->settings['infobipPW']));
		$requestBody = new infobip\api\model\sms\mt\send\textual\SMSTextualRequest();
		$requestBody->setFrom($this->settings['infobipFROM']);
		$requestBody->setTo($to);
		$requestBody->setText($message);
		return $response = $client->execute($requestBody);
	}

	public function hoiio($to,$message){
		if($this->settings['hoiioAppId'] == "" || $this->settings['hoiioAccessToken'] == "") return;
		$client = new HoiioService($this->settings['hoiioAppId'], $this->settings['hoiioAccessToken']);
		return $data = $client->sms(str_replace(' ', '', $to),$message);
	}

	public function clickatell($to,$message){
		if($this->settings['clickatellApiKey'] == "") return;

		$to = $this->prepareNumberFormat($to,"c");
		return $server_output = file_get_contents( "https://platform.clickatell.com/messages/http/send?apiKey=".$this->settings['clickatellApiKey']."&to=".$to."&content=".urlencode($message) );
	}

	public function intellisms($to,$message){
		if($this->settings['intellismsUserName'] == "" || $this->settings['intellismsPassword'] == "" || $this->settings['intellismsSenderNumber'] == "") return;
		$objIntelliSMS = new IntelliSMS();
		$objIntelliSMS->Username = $this->settings['intellismsUserName'];
		$objIntelliSMS->Password = $this->settings['intellismsPassword'];
		$to = $this->prepareNumberFormat($to,"c");
		return $sess = $objIntelliSMS->SendMessage ( $to,$message, $this->settings['intellismsSenderNumber'] );
	}

	public function bulksms($to,$message){
		if($this->settings['bulksmsUserName'] == "" || $this->settings['bulksmsPassword'] == "" ) return;
		$to = $this->prepareNumberFormat($to,"all");
		$url = 'http://bulksms.vsms.net/eapi/submission/send_sms/2/2.0';
		$data = 'username='.$this->settings['bulksmsUserName'].'&password='.$this->settings['bulksmsPassword'].'&message='.urlencode($message).'&msisdn='.urlencode( $to );

		return $sess = $this->bulksms_post_request($url, $data);
	}

	public function concepto($to,$message){
		if($this->settings['conceptoUserName'] == "" || $this->settings['conceptoSenderId'] == "") return;
		$to = $this->prepareNumberFormat($to,"00");
		return $sess = file_get_contents("http://godspeed.liveair.in/httpapi/httpapi?token=".$this->settings['conceptoUserName']."&sender=".$this->settings['conceptoSenderId']."&number=".$to."&route=2&type=1&sms=".urlencode($message));
	}

	public function msg91($to,$message){
		if($this->settings['msg91Authkey'] == "" || $this->settings['msg91SenderId'] == "") return;
		$to = $this->prepareNumberFormat($to,"c");

		/*
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL,"https://control.msg91.com/api/postsms.php");
		curl_setopt($ch, CURLOPT_POST, 1);

		$message = '<MESSAGE>
    <AUTHKEY>'.$this->settings['msg91Authkey'].'</AUTHKEY>
    <SENDER>'.$this->settings['msg91SenderId'].'</SENDER>
    <ROUTE>4</ROUTE>
    <SMS TEXT="'.urlencode($message).'" >
        <ADDRESS TO="'.$to.'"></ADDRESS>
    </SMS>
</MESSAGE>';

		curl_setopt($ch, CURLOPT_POSTFIELDS,$message);


		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

		$server_output = curl_exec ($ch);
		if(Config::get('app.debug') == true){
			Log::info($server_output);
		}

		curl_close ($ch);
		*/


		return $sess = file_get_contents("http://api.msg91.com/api/sendhttp.php?authkey=".$this->settings['msg91Authkey']."&mobiles=".$to."&message=".urlencode($message)."&sender=".$this->settings['msg91SenderId']."&route=4&unicode=1");
	}

	public function custom($to,$message){
		if(!isset($this->settings['customHTTPURL']) || !isset($this->settings['customHTTPParams']) || !isset($this->settings['customHTTPType']) || !isset($this->settings['customHTTPToFormat']) ) return;
		if($this->settings['customHTTPURL'] == "" || $this->settings['customHTTPParams'] == "" || $this->settings['customHTTPType'] == "" || $this->settings['customHTTPToFormat'] == "") return;

		if($this->settings['customHTTPToFormat'] == "00"){
			$to = $this->prepareNumberFormat($to,"00");
		}elseif($this->settings['customHTTPToFormat'] == "+"){
			$to = $to;
		}else{
			$to = $this->prepareNumberFormat($to,"c");
		}

		$this->settings['customHTTPParams'] = str_replace("{to}",trim($to),$this->settings['customHTTPParams']);
		$message = rawurlencode($message);
		$this->settings['customHTTPParams'] = str_replace("{message}",htmlspecialchars_decode(trim($message),ENT_QUOTES),$this->settings['customHTTPParams']);

		$this->settings['customHTTPURL'] = str_replace("{to}",trim($to),$this->settings['customHTTPURL']);
		$this->settings['customHTTPURL'] = str_replace("{message}",htmlspecialchars_decode(trim($message),ENT_QUOTES),$this->settings['customHTTPURL']);

		if($this->settings['customHTTPType'] == "get"){
			$smsrequest = $this->settings['customHTTPURL']."?".$this->settings['customHTTPParams'];

			return $server_output = file_get_contents($smsrequest);

		}else{

			$ch = curl_init();

			curl_setopt($ch, CURLOPT_URL,$this->settings['customHTTPURL']);
			if($this->settings['customHTTPType'] == "post"){
				curl_setopt($ch, CURLOPT_POST, 1);
			}
			curl_setopt($ch, CURLOPT_POSTFIELDS,$this->settings['customHTTPParams']);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

			$server_output = curl_exec ($ch);
			curl_close ($ch);

			return $server_output;
		}
	}

	public function bulksms_post_request($url, $data, $optional_headers = 'Content-type:application/x-www-form-urlencoded') {
		$params = array('http'      => array(
			'method'       => 'POST',
			'content'      => $data,
			));
		if ($optional_headers !== null) {
			$params['http']['header'] = $optional_headers;
		}

		$ctx = stream_context_create($params);


		$response = @file_get_contents($url, false, $ctx);
		if ($response === false) {
			print "Problem reading data from $url, No status returned\n";
		}

		return $response;
	}

	public function prepareNumber($to){
		$to = str_replace(" ","",$to);
		$to = str_replace("-","",$to);
		return $to;
	}

	public function prepareNumberFormat($to,$plusStyle="00"){
		if($plusStyle == "00"){
			return str_replace("+","00",$to);
		}elseif($plusStyle == "c"){
			return str_replace("+","",$to);
		}elseif($plusStyle == "all"){
			$to = str_replace("00","",$to);
			return str_replace("+","",$to);
		}
	}

}
?>
