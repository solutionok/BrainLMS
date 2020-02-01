<?php

namespace App\Jobs;

use App\Jobs\Job;
use App\Models2\NotificationMobHistory;
use App\Models2\User;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Auth;
use Illuminate\Bus\Queueable;

class SendMessageNotification implements ShouldQueue
{
    use InteractsWithQueue, SerializesModels, Queueable;

    protected $user_id;
	  protected $tokens_list;
	  protected $user_ids;
	  protected $message_list_id;
	  protected $auth_user_fullname;

    public function __construct($user_id, $tokens_list, $user_ids, $message_list_id, $auth_user_fullname)
    {
        $this->user_id = $user_id;
        $this->tokens_list = $tokens_list;
        $this->user_ids = $user_ids;
        $this->message_list_id = $message_list_id;
        $this->auth_user_fullname = $auth_user_fullname;
    }

    public function handle(NotificationMobHistory $notificationMobHistory) {
      if(User::find($this->user_id)->firebase_token != ""){
				$notificationMobHistory->sendPushNotification(
					$this->tokens_list,
					$this->user_ids,
					"New Message From " . $this->auth_user_fullname,
					'Messages',
					"messages",
					$this->message_list_id,
					// setting array
				);
				// for queue work display
				echo 'Send firebase notification to : ' . User::find($this->user_id)->fullName . PHP_EOL;
			} else {
				$notificationMobHistory->saveNotificationsToDBModel(
					$this->tokens_list,
					$this->user_ids,
					"New Message From " . $this->auth_user_fullname,
					'Messages',
					"messages",
					$this->message_list_id
				);
				// for queue work display
				echo 'Save notification to DB for : ' . User::find($this->user_id)->fullName . PHP_EOL;
			}
    }

    public function failed(\Exception $exception)
    {
      \Log::error($exception->getMessage());
    }
}