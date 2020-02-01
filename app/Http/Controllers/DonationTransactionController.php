<?php
namespace App\Http\Controllers;

use App\Models2\DonationTransaction;
use Illuminate\Support\Facades\Auth;

class DonationTransactionController extends Controller {

	public function donation_transactions() {
		date_default_timezone_set('Asia/Kolkata');

		if(Auth::user()->role == 'admin') {
			$donation_transactions = DonationTransaction::orderBy('id','DESC')
				->get();
		} else {
			$donation_transactions = DonationTransaction::orderBy('id','DESC')
				->where('user_id', Auth::user()->id)
				->get();
		}

		foreach ($donation_transactions as $key => $value) {
			$donation_transactions[$key]->created_at = date('Y/m/d h:i a', $donation_transactions[$key]->created_at);
			// $donation_transactions[$key]->status = DonationTransaction::getStatus($donation_transactions[$key]->status);
		}

		user_log('Reports', 'view_donation_transactions');

		return response()->json([
			'donation_transactions' => $donation_transactions
		]);
	}

	public function saveSuccessDonation() {
		if(is_null(request()->input('token')) || empty(request()->input('token'))) {
			return response()->json([
				'message' => 'Invalid token',
				'status' => false
			]);
		}
		if(request()->input('token') != '612721E4D8CFD6491D5525923A9CD') {
			return response()->json([
				'message' => 'Invalid token',
				'status' => false
			]);
		}

		$user_id = request()->input('user_id');
		$transaction_id = request()->input('transaction_id');
		$donation_amount = request()->input('donation_amount');
		$status = request()->input('status');
		$token_id = request()->input('token_id');

		if(
			(!is_null($user_id) && !empty($user_id)) &&
			(!is_null($transaction_id) && !empty($transaction_id)) &&
			(!is_null($donation_amount) && !empty($donation_amount)) &&
			(!is_null($status) && !empty($status)) &&
			(!is_null($token_id) && !empty($token_id))
		) {
			// save row to database
			$donationTransaction = new DonationTransaction;
			$donationTransaction->user_id = $user_id;
			$donationTransaction->transaction_id = $transaction_id;
			$donationTransaction->token_id = $token_id;
			$donationTransaction->donation_amount = $donation_amount;
			$donationTransaction->status = $status;
			$donationTransaction->created_at = time();
			$donationTransaction->save();

			return response()->json([
				'message' => 'Donation saved to DB successfully',
				'status' => true
			]);
		}

		return response()->json([
			'message' => 'Invalid inputs',
			'status' => false
		]);
	}

	function logmessages($msg) {
			error_log("\n".(new \DateTime())->format("d:m:y h:i:s")." ".$msg,3,"/var/www/html/payments_log/fi.log");
	}

	function pkcs5_pad ($text, $blocksize) {
	    $pad = $blocksize - (strlen($text) % $blocksize);
	    return $text . str_repeat(chr($pad), $pad);
	}

	function pkcs5_unpad($text) {
	    $pad = ord($text{strlen($text)-1});
	    if ($pad > strlen($text)) return false;
	    if (strspn($text, chr($pad), strlen($text) - $pad) != $pad) return false;
	    return substr($text, 0, -1 * $pad);
	}

	function invokeTxnStatus($encryption_key,$encryption_iv,$sign_key,$merchant_id,$merchant_sub_id,$txn_status_url,$totalamt,$feetype,$tokenid) {
			$paymentObject = new \stdClass;
			$paymentObject->merchantid = $merchant_id;
			$paymentObject->merchantsubid = $merchant_sub_id;
			$paymentObject->feetype = $feetype;
			$paymentObject->totalamt = $totalamt;
			$paymentObject->action = 'TXNSTATUS';
			$paymentObject->tokenid = $tokenid;
			$data_string = json_encode($paymentObject);
			$data_string = $this->pkcs5_pad($data_string,16);

			$this->logmessages("txnstatus input data string before encryption : ".$data_string);

			$paymentData = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $encryption_key,$data_string, MCRYPT_MODE_CBC, $encryption_iv));
			$paymentTxnStatusObj = new \stdClass;
			$paymentTxnStatusObj->merchantid = $merchant_id;
			$paymentTxnStatusObj->merchantsubid = $merchant_sub_id;
			$paymentTxnStatusObj->action = 'TXNSTATUS';
			$paymentTxnStatusObj->data = $paymentData;
			$hmac = strtoupper(hash_hmac('sha256', $paymentData, $sign_key));
			$paymentTxnStatusObj->hmac = $hmac;

			$paymentTxnStatusString = json_encode($paymentTxnStatusObj);
      $this->logmessages(" Invoking txn status service with json : ".$paymentTxnStatusString);
			$ch = curl_init($txn_status_url);
			curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
			curl_setopt($ch, CURLOPT_POSTFIELDS, $paymentTxnStatusString);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array(
					'Content-Type: application/json',
					'Content-Length: ' . strlen($paymentTxnStatusString))
			);
			curl_setopt($ch,CURLOPT_FAILONERROR,true);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
			curl_setopt($ch, CURLOPT_TIMEOUT, 60); //timeout in seconds
			curl_setopt ($ch, CURLOPT_SSLVERSION, 6); //TLS 1.2
			$result = curl_exec($ch);
      if(curl_error($ch))
			{
   			$curl_errno= curl_errno($ch);
				$this->logmessages(" curl error : ".curl_error($ch)." errorno :".$curl_errno);
			}
			else
			{
				$this->logmessages(" response from txn status service : ".$result);
				$decodedVal = json_decode($result);
				$retData = $decodedVal->data;
				$res = $this->pkcs5_unpad(mcrypt_decrypt(MCRYPT_RIJNDAEL_128,$encryption_key,base64_decode($retData), MCRYPT_MODE_CBC, $encryption_iv));

				$this->logmessages(" txn status service response after decryption: ".$res);

				$decodedData = json_decode($res);
				return $decodedData;
			}
	}

	public function getStatus($donation_id) {
		$merchant_id='APIMER';
		$merchant_sub_id='XAVDOR';
		$sign_key='IFCMRpCY1VsVLk3Nw543XXmvcfvjwr1a';
		$encryption_key = hash('sha256','6F31B7539914EA67AEE359D4EBA490B2',true);
		$encryption_iv = 'SrrSRVWZCkVPLWuS';
		$txn_status_url = 'https://testapp.iobnet.org/iobpay/iobpayRESTService/apitxnstatusservice/gettxnstatus/';
		$token_generation_url = 'https://testapp.iobnet.org/iobpay/iobpayRESTService/apitokenservice/generatenewtoken/';
		$merchantreplyurl = "https://payments.cutebrains.com/sxddonations/responsehandler.php";
		$feetype = "ALL FEES";

		if(DonationTransaction::where('id', $donation_id)->count()) {
			$donationTransaction = DonationTransaction::find($donation_id);
			$totalamt = $donationTransaction['donation_amount'];
			$tokenid = $donationTransaction['token_id'];

			$data = $this->invokeTxnStatus($encryption_key,$encryption_iv,$sign_key,$merchant_id,$merchant_sub_id,$txn_status_url,$totalamt,$feetype,$tokenid);

			$donationTransaction->status = $data->txnstatus;
			$donationTransaction->save();

			return response()->json([
				'status' => $data->txnstatus
			]);
		} else {
			return 'Error, Invalid Process ID';
		}
	}
}
