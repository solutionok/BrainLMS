<?php

namespace App\Jobs;

use App\Jobs\Job;
use App\Models2\Attendance;
use App\Models2\NotificationMobHistory;
use App\Models2\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Auth;

class SendAttendance implements ShouldQueue
{
    use InteractsWithQueue, SerializesModels, Queueable;

    protected $stAttendance;
    protected $class_id;
    protected $attendanceDay;
    protected $subjectId;
    protected $attendanceModel;
    protected $absentNotif;
    protected $attendanceDay_input;
    protected $settingsArray;

    public function __construct($stAttendance, $class_id, $attendanceDay, $subjectId, $attendanceModel, $absentNotif, $attendanceDay_input, $settingsArray)
    {
        $this->stAttendance = $stAttendance;
        $this->class_id = $class_id;
        $this->attendanceDay = $attendanceDay;
        $this->subjectId = $subjectId;
        $this->attendanceModel = $attendanceModel;
        $this->absentNotif = $absentNotif;
        $this->attendanceDay_input = $attendanceDay_input;
        $this->settingsArray = $settingsArray;
    }

    public function handle(NotificationMobHistory $notificationMobHistory) {
  		User::$withoutAppends = true;
    	foreach($this->stAttendance as $key => $value){

				if(isset($value['attendance']) AND strlen($value['attendance']) > 0){

					$attendanceN = Attendance::where('studentId',$value['id'])
					  ->where('date', $this->attendanceDay)
					  ->where('classId', $this->class_id);

					if($this->attendanceModel == "subject"){
						$attendanceN = $attendanceN->where('subjectId', $this->subjectId);
					}

					$changed_att_status = true;
					if($attendanceN->count() == 0){
						$attendanceN = new Attendance;
					}else{
						$attendanceN = $attendanceN->first();

						if($attendanceN->status == $value['attendance']){
							$changed_att_status = false;
						}
					}

					$attendanceN->classId = $this->class_id;
					$attendanceN->date = $this->attendanceDay;
					$attendanceN->studentId = $value['id'];
					$attendanceN->status = $value['attendance'];
					if(isset($value['attNotes'])){
						$attendanceN->attNotes = $value['attNotes'];
					}
					if($this->attendanceModel == "subject"){
						$attendanceN->subjectId = $this->subjectId;
					}
					$attendanceN->save();

					if($changed_att_status == false){
						continue;
					}

					if($this->absentNotif != "0"){

						$parents = User::where('parentOf','like','%"'.$value['id'].'"%')
						  ->orWhere('parentOf','like','%:'.$value['id'].'}%')->get();
						$student = User::where('id',$value['id'])->first();

						$absentStatus = "";
						switch ($value['attendance']) {
							case '0':
								$absentStatus = 'Absent';
								break;
							case '1':
								$absentStatus = "Present";
								break;
							case '2':
								$absentStatus = 'Late';
								break;
							case '3':
								$absentStatus = 'LateExecuse';
								break;
							case '4':
								$absentStatus = 'earlyDismissal';
								break;
							case '9':
								$absentStatus = 'acceptedVacation';
								break;
						}

						foreach ($parents as $parent) {
							//Send Push Notifications
							if(is_array(json_decode($parent->firebase_token))) {
								$token = (array) json_decode($parent->firebase_token);
								$tokens = array_merge([], $token);
							} else if ($this->isJson($parent->firebase_token)) {
								$token = (array) json_decode($parent->firebase_token);
								$tokens = array_merge([], $token);
							} else {
								$token = $parent->firebase_token;
								$tokens = array_merge([], [$token]);
							}

							if($parent->firebase_token != '') {
								$notificationMobHistory->sendPushNotification(
									$tokens,
									$parent->id,
									'Attendance for student: ' . $student->fullName . " is " . $absentStatus . " - Date: " . $this->attendanceDay_input,
									'Attendance',
									"attendance",
									"",
									(array) $this->settingsArray
								);
								echo 'Send firebase notification to: ' . $student->fullName . PHP_EOL;
							}
							$notificationMobHistory->saveNotificationsToDBModel(
								$tokens,
								$parent->id,
								'Attendance for student: ' . $student->fullName . " is " . $absentStatus . " - Date: " . $this->attendanceDay_input,
								'Attendance',
								"attendance",
								""
							);
							echo 'Save notification to DB for: ' . $student->fullName . PHP_EOL;
						}
					}
				}
			}
    }

    protected function isJson($string) {
	    $decoded = json_decode($string); // decode our JSON string
		    if ( !is_object($decoded) && !is_array($decoded) ) {
		        return false;
		    }
		    return (json_last_error() == JSON_ERROR_NONE);
		}

    public function failed(\Exception $exception)
    {
      \Log::error($exception->getMessage());
    }
}