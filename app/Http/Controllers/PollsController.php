<?php
namespace App\Http\Controllers;

class PollsController extends Controller {

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
		if(!$this->panelInit->can( array("Polls.list","Polls.addPoll","Polls.editPoll","Polls.delPoll") )){
			exit;
		}

		return \polls::get();
	}

	public function delete($id){

		if(!$this->panelInit->can( "Polls.delPoll" )){
			exit;
		}

		if ( $postDelete = \polls::where('id', $id)->first() ) {
    		user_log('Polls', 'delete', $postDelete->pollTitle);
        $postDelete->delete();
        return $this->panelInit->apiOutput(true,$this->panelInit->language['delPoll'],$this->panelInit->language['pollDel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delPoll'],$this->panelInit->language['pollNotExist']);
    }
	}

	public function create(){

		if(!$this->panelInit->can( "Polls.addPoll" )){
			exit;
		}

		$polls = new \polls();
		$polls->pollTitle = \Input::get('pollTitle');
		$polls->pollOptions = json_encode(\Input::get('pollOptions'));
		$polls->pollTarget = \Input::get('pollTarget');
		$polls->pollStatus = '0';
		$polls->save();

		user_log('Polls', 'create', $polls->pollTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addPoll'],$this->panelInit->language['pollCreated'],$polls->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Polls.editPoll" )){
			exit;
		}

		$polls = \polls::where('id',$id)->first();
		$polls->pollOptions = json_decode($polls->pollOptions,true);
		if(!is_array($polls->pollOptions)){
			$polls->pollOptions = array();
		}
		return $polls;
	}

	function makeActive($id){

		if(!$this->panelInit->can( "Polls.editPoll" )){
			exit;
		}

		$polls = \polls::where('id',$id)->first();

		$pollOptions = json_decode($polls->pollOptions,true);
		if(count($pollOptions) == 0){
			return $this->panelInit->apiOutput(false,$this->panelInit->language['activatePoll'],"Poll has no options");
		}

		\polls::where('pollStatus','1')->update(array('pollStatus' => '0'));

		$polls->pollStatus = 1;
		$polls->save();

		user_log('Polls', 'make_active', $polls->pollTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['activatePoll'],$this->panelInit->language['pollActivated'],array("id"=>$polls->id));
	}

	function edit($id){

		if(!$this->panelInit->can( "Polls.editPoll" )){
			exit;
		}

		$polls = \polls::find($id);
		$polls->pollTitle = \Input::get('pollTitle');
		$polls->pollOptions = json_encode(\Input::get('pollOptions'));
		$polls->pollTarget = \Input::get('pollTarget');
		$polls->pollStatus = \Input::get('pollStatus');
		$polls->save();

		user_log('Polls', 'edit', $polls->pollTitle);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editPoll'],$this->panelInit->language['pollUpdated'],$polls->toArray() );
	}
}
