<?php

namespace App\Models2;

// use App\Libraries\Firebase;
use App\Models2\Event;
use App\Models2\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NotificationMobHistory extends Model
{
		public $timestamps = false;
    protected $table = 'notifications_mob_history';

    /* -------------------------------------------------------------- */

    public static function getNotificationsRedirectLinks() {
    	return [
    		'attendance' => 'portal#/attendanceStats',
    		'homework' => 'portal#/homework?homework_id={homework_id}',
    		'discipline' => 'portal#/disciplines?discipline_id={discipline_id}',
    		'events' => 'portal#/events/{event_id}',
    		'exams' => 'portal#/examsList?exam_id={exam_id}',
    		'exam_marks' => 'portal#/examsList?exam_id={exam_id}',
    		'online_exams' => 'portal#/onlineExams/{online_exam_id}',
    		'assignment' => 'portal#/assignments',
    		'marksheet' => 'portal?view=students#/',
    		'invoice' => 'portal#/pay-fee',
    		'messages' => 'portal#/messages',
    		'notification' => 'portal#/mobileNotif',
    		'newsboard' => 'portal#/newsboard/{newsboard_id}',
    		'material' => 'portal#/material',
    		'classschedule' => 'portal#/classschedule',
    	];
    }

		public static function getNotfiRedirectLink($type) {
			$return_link = 'portal#';

			foreach (self::getNotificationsRedirectLinks() as $key => $value) {
				if($key == $type) {
					$return_link = $value;
				}
			}

			return $return_link;
		}

		public static function getCountOfUnSeenNotifications($limit) {
			$results = self::where('user_id', Auth::guard('web')->user()->id)
				->orderBy('id', 'desc')
			  ->limit($limit)
			  ->pluck('is_seen', 'date');

			$counter = 0;
			foreach ($results as $date => $is_seen) {
				$_date = Carbon::createFromFormat('Y-m-d H:i:s', $date);
				$differ_time = round((time() - $_date->timestamp) / (60 * 60));

				if($differ_time <= 36) {
					if(!$is_seen) {
						$counter += 1;
					}
				}
			}

			return $counter;
		}

		/* -------------------------------------------------------------- */

		public $appends = ['redirect_link', 'check_payload_item', 'date_diff'];

		public function getRedirectLinkAttribute() {
			$link = self::getNotfiRedirectLink($this->attributes['type']);

			$link = str_replace(
				[
					'{event_id}',
					'{student_id}',
					'{exam_id}',
					'{online_exam_id}',
					'{homework_id}',
					'{assignment_id}',
					'{invoice_id}',
					'{newsboard_id}',
					'{message_id}',
					'{discipline_id}',
				],
				[
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
					$this->attributes['payload_id'],
				],
				$link
			);

			return $link;
		}

		public function getCheckPayloadItemAttribute() {
			if($this->attributes['type'] == 'events') {
				if(Event::where('id', $this->attributes['payload_id'])->count() <= 0) {
					return false;
				}
			}

			return true;
		}

		public function getDateDiffAttribute() {
			return Carbon::createFromFormat('Y-m-d H:i:s', $this->attributes['date'])->diffForHumans();
		}

		public function getDateFormatAttribute() {
			return Carbon::createFromTimestamp((integer) $this->attributes['date'])->toDateTimeString();
		}

		/* -------------------------------------------------------------- */

		public function saveNotificationsToDBModel($target_tokens, $user_ids, $message, $title="", $payload_location = "", $payload_id = "") {
			User::$withoutAppends = true;
			$idsarray = [];

			if(is_array($target_tokens)){
				$idsarray = User::whereIn('firebase_token',$target_tokens)->get()->toArray();
			}else{
				$idsarray = User::where('firebase_token',$target_tokens)->get()->toArray();
			}

			if(is_array($user_ids)){
				$idsarray = User::whereIn('id',$user_ids)->get()->toArray();
			}else{
				$idsarray = User::where('id',$user_ids)->get()->toArray();
			}

			if(count($idsarray)) {

				foreach ($idsarray as $vaa) {
					DB::table('notifications_mob_history')->insert(
						 array(
								'name'   =>   $title,
								'value'   =>   $message,
								'user_id'   =>   $vaa['id'],
								'date'   =>   date('Y-m-d H:i:s'),
								'type'   =>   $payload_location,
								'payload_id'   =>   $payload_id,
						 )
					);
				}
			}

			return true;
		}

		public function sendPushNotification($target_tokens, $user_ids, $message, $title="", $payload_location = "", $payload_id = "", $settingsArray) {
			if(count($target_tokens)) {
				$target_tokens = array_unique($target_tokens);

				for ($i = 0; $i < count($target_tokens); $i+=1000) {
					$Firebase = new \Firebase();

					if(isset($settingsArray['firebase_apikey']) AND $settingsArray['firebase_apikey'] != ""){
						$Firebase->api_key($settingsArray['firebase_apikey']);
					}else{
						return;
					}

					if($title != ""){
						$Firebase->title = $title ;
					}else{
						$Firebase->title = $settingsArray['siteTitle'] ;
					}
					$Firebase->body = strip_tags($message);

					$payload_data = array();
					if($payload_location != ""){
						$payload_data['where'] = $payload_location;
					}
					if($payload_id != ""){
						$payload_data['id'] = $payload_id;
					}
					$payload_data['sound'] = 'default';
					if(count($payload_data) > 0){
						$Firebase->data = $payload_data;
					}

					$current_tokens = array_slice($target_tokens, $i, 1000);
					$Firebase->send($current_tokens);
				}
			}
		}
}
