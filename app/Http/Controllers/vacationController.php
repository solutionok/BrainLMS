<?php
namespace App\Http\Controllers;

class vacationController extends Controller {

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

	public function getVacation(){

		if(!$this->panelInit->can( array("Vacation.reqVacation") )){
			exit;
		}

    $currentUserVacations = \vacation::where('userid',$this->data['users']->id)->where('acYear',$this->panelInit->selectAcYear)->count();

		if(\Input::has('toDate')){
			$daysList = $this->panelInit->date_ranges(\Input::get('fromDate'),\Input::get('toDate'));
		}else{
			$daysList = $this->panelInit->date_ranges(\Input::get('fromDate'));
		}

		$daysList = $this->remove_off_days($daysList);

		$daysList_ = array();
		foreach($daysList as $key => $value){
			if(isset($value['status'])){
				continue;
			}
			$daysList_[] = $value;
		}

    if($this->data['users']->role != "student" AND (count($daysList_) + $currentUserVacations) > $this->panelInit->settingsArray['teacherVacationDays'] ){
        return $this->panelInit->apiOutput(false,$this->panelInit->language['reqVacation'],$this->panelInit->language['vacNoBalance']);
    }

    if($this->data['users']->role == "student" AND (count($daysList_) + $currentUserVacations) > $this->panelInit->settingsArray['studentVacationDays'] ){
        return $this->panelInit->apiOutput(false,$this->panelInit->language['reqVacation'],$this->panelInit->language['vacNoBalance']);
    }

    return $this->panelInit->apiOutput(true,$this->panelInit->language['reqVacation'],$this->panelInit->language['confirmVacation'],$daysList);
	}

  public function saveVacation(){

  	if(!$this->panelInit->can( array("Vacation.reqVacation") )){
			exit;
		}

    $daysList = \Input::get('days');
    $currentUserVacations = \vacation::where('userid',$this->data['users']->id)->where('acYear',$this->panelInit->selectAcYear)->count();

		$daysList_ = array();
		foreach($daysList as $key => $value){
			if(isset($value['status'])){
				continue;
			}
			$daysList_[] = $value;
		}

    if($this->data['users']->role != "student" AND (count($daysList_) + $currentUserVacations) > $this->panelInit->settingsArray['teacherVacationDays'] ){
        return $this->panelInit->apiOutput(false,$this->panelInit->language['reqVacation'],$this->panelInit->language['vacNoBalance']);
    }

    if($this->data['users']->role == "student" AND (count($daysList_) + $currentUserVacations) > $this->panelInit->settingsArray['studentVacationDays'] ){
        return $this->panelInit->apiOutput(false,$this->panelInit->language['reqVacation'],$this->panelInit->language['vacNoBalance']);
    }

    foreach ($daysList_ as $key => $value) {
        $vacation = new \vacation();
        $vacation->userid = $this->data['users']->id;
        $vacation->vacDate = $value['timestamp'];
        $vacation->acYear = $this->panelInit->selectAcYear;
				$vacation->role = $this->data['users']->role;
        $vacation->save();
    }

    return $this->panelInit->apiOutput(true,$this->panelInit->language['reqVacation'],$this->panelInit->language['vacSubmitted']);
  }

	public function delete($id){

		if(!$this->panelInit->can( array("Vacation.reqVacation") )){
			exit;
		}

		if ( $postDelete = \vacation::where('id', $id)->first() ) {
				user_log('Vacation', 'delete');
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delVacation'],$this->panelInit->language['vacDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delVacation'],$this->panelInit->language['vacNotExist']);
    }
	}

	public function get_approval(){

		if(!$this->panelInit->can( array("Vacation.appVacation") )){
			exit;
		}

    $vacation = \vacation::leftJoin('users', 'users.id', '=', 'vacation.userid')->where('acYear',$this->panelInit->selectAcYear)->where('acceptedVacation','-1')->select('vacation.id as id','vacation.vacDate as vacDate','users.id as userid','users.username as username','users.email as email','users.fullName as fullName','users.role as role')->get();
    foreach ($vacation as $key => $value) {
    	$vacation[$key]['vacDate'] = $this->panelInit->unix_to_date($vacation[$key]['vacDate']);
    }
    return $vacation;
	}

	public function set_approval(){

		if(!$this->panelInit->can( array("Vacation.appVacation") )){
			exit;
		}

		$vacation = \vacation::find(\Input::get('id'));
		$vacation->acceptedVacation = \Input::get('status');
		$vacation->save();

		if(\Input::get('status') == 1){
			\attendance::where('studentId',$vacation->userid)->where('date',$vacation->vacDate)->delete();
		}

		user_log('Vacation', 'set_approval');

    return $this->panelInit->apiOutput(true,$this->panelInit->language['appVacation'],$this->panelInit->language['vacStatChged']);
	}

	public function my_vacations(){

		if(!$this->panelInit->can( array("Vacation.myVacation") )){
			exit;
		}

		$vacation = \vacation::where('userid',$this->data['users']->id)->where('acYear',$this->panelInit->selectAcYear)->get();
    foreach ($vacation as $key => $value) {
    	$vacation[$key]['vacDate'] = $this->panelInit->unix_to_date($vacation[$key]['vacDate']);
    }
    return $vacation;
	}

	public function remove_off_days($daysList){
		$weekDaysOff = json_decode($this->panelInit->settingsArray['daysWeekOff']);
		$officialVacation = json_decode($this->panelInit->settingsArray['officialVacationDay']);

		foreach ($daysList as $key => $day) {
			if(in_array($day['dow'], $weekDaysOff)){
				$daysList[$key]['status'] = "dow";
			}
			if(in_array($day['timestamp'], $officialVacation)){
				$daysList[$key]['status'] = "offv";
			}
		}

		return $daysList;
	}

}
