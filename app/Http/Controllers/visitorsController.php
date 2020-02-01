<?php
namespace App\Http\Controllers;

class visitorsController extends Controller {
	var $data = array();
	var $panelInit ;

	public function __construct(){
		if(app('request')->header('Authorization') != "" || \Input::has('token')){
			$this->middleware('jwt.auth');
		}else{
			$this->middleware('authApplication');
		}

		$this->panelInit = new \DashboardInit();
		$this->data['panelInit'] = $this->panelInit;
		$this->data['users'] = $this->panelInit->getAuthUser();

		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}
	}

	public function listAll($page = 1,$search = ""){

		if(!$this->panelInit->can( array("visitors.list","visitors.View","visitors.add_vis","visitors.edit_vis","visitors.del_vis","visitors.Download","visitors.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["visitors"] = \visitors::orderby('id','DESC');
		if($search != ""){
			$toReturn["visitors"] = $toReturn["visitors"]->where(function($query) use ($search){
						$query->where("pass_id","like","%".$search."%")->orWhere("fullName","like","%".$search."%")->orWhere("phoneNo","like","%".$search."%")->orWhere("email","like","%".$search."%")->orWhere("std_relation","like","%".$search."%")->orWhere("purpose","like","%".$search."%")->orWhere("visit_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["visitors"]->count();
		$toReturn["visitors"] = $toReturn["visitors"]->select('id','pass_id','fullName','phoneNo','email','id_pass_id','usr_type','comp_name','student','to_meet','purpose','check_in','check_out')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["visitors"] as $key => $value) {
			$toReturn["visitors"][$key]["student"] = json_decode($toReturn["visitors"][$key]["student"]);
			if(!is_array($toReturn["visitors"][$key]["student"])){
				$toReturn["visitors"][$key]["student"] = array();
			}

			$toReturn["visitors"][$key]["to_meet"] = json_decode($toReturn["visitors"][$key]["to_meet"]);
			if(!is_array($toReturn["visitors"][$key]["to_meet"])){
				$toReturn["visitors"][$key]["to_meet"] = array();
			}

			$toReturn["visitors"][$key]["check_in"] = json_decode($toReturn["visitors"][$key]["check_in"]);
			$toReturn["visitors"][$key]["check_out"] = json_decode($toReturn["visitors"][$key]["check_out"]);
		}

		if($page == 1){
            $toReturn["wel_office"] = array();
            $wel_office = \wel_office::where('av_for','LIKE','%visit_purpose%')->select('id','cat_title')->get();
            foreach ($wel_office as $key => $value) {
                $toReturn['wel_office'][ $value->id ] = $value->cat_title;
            }

        }

		return $toReturn;
	}

	public function search($keyword,$page = 1){

		return $this->listAll($page,$keyword);
	}

	public function create(){

		if(!$this->panelInit->can( "visitors.add_vis" )){
			exit;
		}

		$visitors = new \visitors();
		if(\Input::has('id')){
			$visitors->id = \Input::get('id');
		}
		$visitors->pass_id = \Input::get('pass_id');
		$visitors->fullName = \Input::get('fullName');
		if(\Input::has('phoneNo')){
			$visitors->phoneNo = \Input::get('phoneNo');
		}
		if(\Input::has('email')){
			$visitors->email = \Input::get('email');
		}
		$visitors->id_pass_id = \Input::get('id_pass_id');
		if(\Input::has('no_pers')){
			$visitors->no_pers = \Input::get('no_pers');
		}
		$visitors->usr_type = \Input::get('usr_type');
		if(\Input::has('student_ser')){
			$visitors->student = \Input::get('student_ser');
		}
		if(\Input::has('std_relation')){
			$visitors->std_relation = \Input::get('std_relation');
		}
		if(\Input::has('comp_name')){
			$visitors->comp_name = \Input::get('comp_name');
		}
		if(\Input::has('to_meet_ser')){
			$visitors->to_meet = \Input::get('to_meet_ser');
		}
		$visitors->purpose = \Input::get('purpose');
		if(\Input::has('check_in')){

			$check_in = \Input::get('check_in');
			if(!is_array($check_in)){
				$check_in = json_decode($check_in,true);
			}
			$check_in["ts"] = $this->panelInit->date_to_unix($check_in["date"]) + ( $check_in["hour"] * 60 * 60 ) + ( $check_in["min"] * 60 );
			if($check_in["ampm"] == "pm"){
				$check_in["ts"] += (12 * 60 * 60);
			}
			$visitors->check_in = json_encode($check_in);
		}
		if(\Input::has('check_out')){

			$check_out = \Input::get('check_out');
			if(!is_array($check_out)){
				$check_out = json_decode($check_out,true);
			}
			if(count($check_out) == 4 && $check_out["date"] != "" && $check_out["hour"] != "" && $check_out["min"] != "" && $check_out["ampm"] != ""){
				$check_out["ts"] = $this->panelInit->date_to_unix($check_out["date"]) + ( $check_out["hour"] * 60 * 60 ) + ( $check_out["min"] * 60 );
				if($check_out["ampm"] == "pm"){
					$check_out["ts"] += (12 * 60 * 60);
				}
				$visitors->check_out = json_encode($check_out);
			}
		}

		if (\Input::hasFile('docs')) {
			$fileInstance = \Input::file('docs');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['add_vis'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/visitors/',$newFileName);

			$visitors->docs = $newFileName;
		}

		if(\Input::has('visit_notes')){
			$visitors->visit_notes = \Input::get('visit_notes');
		}
		$visitors->save();

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_vis'],$this->panelInit->language['vis_added']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "visitors.edit_vis" )){
			exit;
		}

		$visitors = \visitors::select('id','pass_id','fullName','phoneNo','email','id_pass_id','no_pers','usr_type','student','std_relation','comp_name','to_meet','purpose','check_in','check_out','docs','visit_notes')->where('id',$id)->first()->toArray();
		$visitors['student'] = json_decode($visitors['student'],true);
			$visitors['to_meet'] = json_decode($visitors['to_meet'],true);
			if(!is_array($visitors['to_meet'])){
				$visitors['to_meet'] = array();
			}
			$visitors['check_in'] = json_decode($visitors['check_in']);
			$visitors['check_out'] = json_decode($visitors['check_out']);

		return $visitors;
	}

	public function view($id){

		if(!$this->panelInit->can( "visitors.View" )){
			exit;
		}

		$visitors = \visitors::where('id',$id)->select('id','pass_id','fullName','phoneNo','email','id_pass_id','no_pers','usr_type','student','std_relation','comp_name','to_meet','purpose','check_in','check_out','docs','visit_notes')->first()->toArray();
		$visitors['student'] = json_decode($visitors['student'],true);
			$visitors['to_meet'] = json_decode($visitors['to_meet'],true);
			$visitors['check_in'] = json_decode($visitors['check_in']);
			$visitors['check_out'] = json_decode($visitors['check_out']);

		return $visitors;
	}

	public function edit($id){

		if(!$this->panelInit->can( "visitors.edit_vis" )){
			exit;
		}

		$visitors = \visitors::find($id);
		if(\Input::has('id')){
			$visitors->id = \Input::get('id');
		}
		$visitors->pass_id = \Input::get('pass_id');
		$visitors->fullName = \Input::get('fullName');
		if(\Input::has('phoneNo')){
			$visitors->phoneNo = \Input::get('phoneNo');
		}
		if(\Input::has('email')){
			$visitors->email = \Input::get('email');
		}
		$visitors->id_pass_id = \Input::get('id_pass_id');
		if(\Input::has('id_pass_id')){
			$visitors->no_pers = \Input::get('no_pers');
		}
		$visitors->usr_type = \Input::get('usr_type');
		if(\Input::has('student_ser')){
			$visitors->student = \Input::get('student_ser');
		}
		if(\Input::has('std_relation')){
			$visitors->std_relation = \Input::get('std_relation');
		}
		if(\Input::has('comp_name')){
			$visitors->comp_name = \Input::get('comp_name');
		}
		if(\Input::has('to_meet_ser')){
			$visitors->to_meet = \Input::get('to_meet_ser');
		}
		$visitors->purpose = \Input::get('purpose');
		if(\Input::has('check_in')){

			$check_in = \Input::get('check_in');
			if(!is_array($check_in)){
				$check_in = json_decode($check_in,true);
			}
			$check_in["ts"] = $this->panelInit->date_to_unix($check_in["date"]) + ( $check_in["hour"] * 60 * 60 ) + ( $check_in["min"] * 60 );
			if($check_in["ampm"] == "pm"){
				$check_in["ts"] += (12 * 60 * 60);
			}
			$visitors->check_in = json_encode($check_in);
		}
		if(\Input::has('check_out')){

			$check_out = \Input::get('check_out');
			if(!is_array($check_out)){
				$check_out = json_decode($check_out,true);
			}
			if(is_array($check_out) && count($check_out) == 4 && $check_out["date"] != "" && $check_out["hour"] != "" && $check_out["min"] != "" && $check_out["ampm"] != ""){
				$check_out["ts"] = $this->panelInit->date_to_unix($check_out["date"]) + ( $check_out["hour"] * 60 * 60 ) + ( $check_out["min"] * 60 );
				if($check_out["ampm"] == "pm"){
					$check_out["ts"] += (12 * 60 * 60);
				}
				$visitors->check_out = json_encode($check_out);
			}
		}

		if (\Input::hasFile('docs')) {
			$fileInstance = \Input::file('docs');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_vis'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($visitors->docs != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/visitors/".$visitors->docs);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/visitors/',$newFileName);

			$visitors->docs = $newFileName;
		}

		if(\Input::has('visit_notes')){
			$visitors->visit_notes = \Input::get('visit_notes');
		}
		$visitors->save();
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_vis'],$this->panelInit->language['vis_mod']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "visitors.del_vis" )){
			exit;
		}

		if ( $postDelete = \visitors::where('id', $id)->first() ){
        		if($postDelete->docs != ""){ @unlink(uploads_config()['uploads_file_path'] . '/visitors/'.$postDelete->docs); }

        		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_vis'],$this->panelInit->language['vis_deleted']);
        	}else{
        		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_vis'],$this->panelInit->language['vis_not_exist']);
        	}
	}

	public function download($id){

		if(!$this->panelInit->can( "visitors.Download" )){
			exit;
		}

		$toReturn = \visitors::where('id',$id)->select("id","docs","pass_id")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/visitors/".$toReturn->docs)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->pass_id). "." .pathinfo($toReturn->docs, PATHINFO_EXTENSION);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/visitors/".$toReturn->docs);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function checkout($id){

		if(!$this->panelInit->can( "visitors.edit_vis" )){
			exit;
		}

		$visitors = \visitors::find($id);
		if(\Input::has('check_out')){

			$check_out = \Input::get('check_out');
			if(!is_array($check_out)){
				$check_out = json_decode($check_out,true);
			}
			if(count($check_out) == 4 && $check_out["date"] != "" && $check_out["hour"] != "" && $check_out["min"] != "" && $check_out["ampm"] != ""){
				$check_out["ts"] = $this->panelInit->date_to_unix($check_out["date"]) + ( $check_out["hour"] * 60 * 60 ) + ( $check_out["min"] * 60 );
				if($check_out["ampm"] == "pm"){
					$check_out["ts"] += (12 * 60 * 60);
				}
				$visitors->check_out = json_encode($check_out);
			}
		}
		$visitors->save();

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_vis'],$this->panelInit->language['vis_mod']);
	}

	public function export($type){

		if(!$this->panelInit->can( "visitors.Export" )){
			exit;
		}

		$wel_office = array();
        $wel_office_tmp = \wel_office::where('av_for','LIKE','%visit_purpose%')->select('id','cat_title')->get();
        foreach ($wel_office_tmp as $key => $value) {
            $wel_office[ $value->id ] = $value->cat_title;
        }

		$header = array ($this->panelInit->language["pass_id"],$this->panelInit->language["visitor"],$this->panelInit->language["id_pass"],$this->panelInit->language["no_pers"],$this->panelInit->language["usr_typ"],$this->panelInit->language["to_meet"],$this->panelInit->language["purpose"],$this->panelInit->language["chkin"],$this->panelInit->language["chkout"],$this->panelInit->language["Notes"]);

		$data = array();
		$visitors = \visitors::select('pass_id','fullName','phoneNo','email','id_pass_id','no_pers','usr_type','student','comp_name','to_meet','purpose','check_in','check_out','visit_notes')->get()->toArray();
		foreach ($visitors as $value) {
			$student = json_decode($value['student'],true);
			$value['student'] = "";
			if(is_array($student)){
				foreach ($student as $key_ => $value_) {
					$value['student'] .= $value_['user'].PHP_EOL;
				}
			}

			$to_meet = json_decode($value['to_meet'],true);
			$value['to_meet'] = "";
			if(is_array($to_meet)){
				foreach ($to_meet as $key_ => $value_) {
					$value['to_meet'] .= $value_['user'].PHP_EOL;
				}
			}

			$check_in = json_decode($value['check_in'],true);
			$value['check_in'] = "";
			if(is_array($check_in) AND isset($check_in['date']) ){
				$value['check_in'] = $check_in['date']." ".$check_in['hour'].":".$check_in['min']." ".$check_in['ampm'];
			}

			$check_out = json_decode($value['check_out'],true);
			$value['check_out'] = "";
			if(is_array($check_out) AND isset($check_out['date']) ){
				$value['check_out'] = $check_out['date']." ".$check_out['hour'].":".$check_out['min']." ".$check_out['ampm'];
			}

			$data[] = array ($value['pass_id'],$value['fullName'].PHP_EOL.$value['phoneNo'].PHP_EOL.$value['email'],$value['id_pass_id'],$value['no_pers'],$value['usr_type'] .PHP_EOL.($value['usr_type'] == 'parent'?$value['student']:$value['comp_name']),$value['to_meet'],(isset($wel_office[$value['purpose']])?$wel_office[$value['purpose']]:""),$value['check_in'],$value['check_out'],$value['visit_notes']);
		}

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("visitors-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["visitors"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["visitors"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->getStyle('A1')->getAlignment()->setWrapText(true);
					$sheet->fromArray($xls_data);
				});

			})->download("xls");

		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["visitors"],
					"author" => $this->data["panelInit"]->settingsArray["siteTitle"],
					"topMarginValue" => 10,
					"orientation" => "L"
				);


			if( $this->panelInit->isRTL == "1" ){
				$doc_details["is_rtl"] = true;
			}

			$pdfbuilder = new \PdfBuilder($doc_details);

			$content = "<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\"><thead><tr>";

			foreach ($header as $value) {
				$content .="<th style='width:15%;border: solid 1px #000000; padding:2px;'>".$value."</th>";
			}

			$content .="</tr></thead><tbody>";

			foreach($data as $row)
			{
				$content .= "<tr>";
				foreach($row as $col){
					$content .="<td>".$col."</td>";
				}
				$content .= "</tr>";
			}

		    $content .= "</tbody></table>";

			$pdfbuilder->table($content, array("border" => "0","align"=>"") );
			$pdfbuilder->output("visitors.pdf");
		}
	}

	public function searchUser($keyword){

		if(!$this->panelInit->can( array("visitors.edit_vis","visitors.add_vis") )){
			exit;
		}

		$users_list = \User::where(function($query) use ($keyword){
								$query->where("fullName","like","%".$keyword."%")->orWhere("username","like","%".$keyword."%")->orWhere("email","like","%".$keyword."%");
							})->get();
		$retArray = array();
		foreach ($users_list as $user) {
			$retArray[$user->id] = array("id"=>$user->id,"name"=>$user->fullName,"email"=>$user->email);
		}

		return $retArray;
	}


}