<?php
namespace App\Http\Controllers;

class postalController extends Controller {
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

		if(!$this->panelInit->can( array("postal.list","postal.add_postal","postal.edit_postal","postal.del_postal","postal.Download","postal.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["postal"] = \postal::orderby('id','DESC');
		if($search != ""){
			$toReturn["postal"] = $toReturn["postal"]->where(function($query) use ($search){
						$query->where("refno","like","%".$search."%")->orWhere("postal_type","like","%".$search."%")->orWhere("postal_from","like","%".$search."%")->orWhere("postal_to","like","%".$search."%")->orWhere("postal_desc","like","%".$search."%")->orWhere("postal_time","like","%".$search."%")->orWhere("postal_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["postal"]->count();
		$toReturn["postal"] = $toReturn["postal"]->select('id','refno','postal_type','postal_from','postal_to','postal_time','attachment')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["postal"] as $key => $value) {
			$toReturn["postal"][$key]["postal_time"] = json_decode($toReturn["postal"][$key]["postal_time"]);
		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){

		return $this->listAll($page,$keyword);

	}

	public function create(){

		if(!$this->panelInit->can( "postal.add_postal" )){
			exit;
		}

		$postal = new \postal();
		if(\Input::has('id')){
			$postal->id = \Input::get('id');
		}
		$postal->refno = \Input::get('refno');
		$postal->postal_type = \Input::get('postal_type');
		$postal->postal_from = \Input::get('postal_from');
		$postal->postal_to = \Input::get('postal_to');
		if(\Input::has('postal_desc')){
			$postal->postal_desc = \Input::get('postal_desc');
		}

		$postal_time = \Input::get('postal_time');
		if(!is_array($postal_time)){
			$postal_time = json_decode($postal_time,true);
		}
		$postal_time["ts"] = $this->panelInit->date_to_unix($postal_time["date"]) + ( $postal_time["hour"] * 60 * 60 ) + ( $postal_time["min"] * 60 );
		if($postal_time["ampm"] == "pm"){
			$postal_time["ts"] += (12 * 60 * 60);
		}
		$postal->postal_time = json_encode($postal_time);


		if (\Input::hasFile('attachment')) {
			$fileInstance = \Input::file('attachment');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['add_postal'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/postal/',$newFileName);

			$postal->attachment = $newFileName;
		}

		if(\Input::has('postal_notes')){
			$postal->postal_notes = \Input::get('postal_notes');
		}
		$postal->save();
		user_log('Postal', 'create', $postal->refno);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_postal'],$this->panelInit->language['postal_added']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "postal.edit_postal" )){
			exit;
		}

		$postal = \postal::select('id','refno','postal_type','postal_from','postal_to','postal_desc','postal_time','attachment','postal_notes')->where('id',$id)->first()->toArray();
		$postal['postal_time'] = json_decode($postal['postal_time']);

		return $postal;
	}

	public function edit($id){

		if(!$this->panelInit->can( "postal.edit_postal" )){
			exit;
		}

		$postal = \postal::find($id);
		if(\Input::has('id')){
			$postal->id = \Input::get('id');
		}
		$postal->refno = \Input::get('refno');
		$postal->postal_type = \Input::get('postal_type');
		$postal->postal_from = \Input::get('postal_from');
		$postal->postal_to = \Input::get('postal_to');
		if(\Input::has('postal_desc')){
			$postal->postal_desc = \Input::get('postal_desc');
		}

		$postal_time = \Input::get('postal_time');
		if(!is_array($postal_time)){
			$postal_time = json_decode($postal_time,true);
		}
		$postal_time["ts"] = $this->panelInit->date_to_unix($postal_time["date"]) + ( $postal_time["hour"] * 60 * 60 ) + ( $postal_time["min"] * 60 );
		if($postal_time["ampm"] == "pm"){
			$postal_time["ts"] += (12 * 60 * 60);
		}
		$postal->postal_time = json_encode($postal_time);


		if (\Input::hasFile('attachment')) {
			$fileInstance = \Input::file('attachment');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_postal'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($postal->attachment != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/postal/".$postal->attachment);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/postal/',$newFileName);

			$postal->attachment = $newFileName;
		}

		if(\Input::has('postal_notes')){
			$postal->postal_notes = \Input::get('postal_notes');
		}
		$postal->save();
		user_log('Postal', 'edit', $postal->refno);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_postal'],$this->panelInit->language['postal_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "postal.del_postal" )){
			exit;
		}

		if ( $postDelete = \postal::where('id', $id)->first() ){
  		if($postDelete->attachment != ""){ @unlink(uploads_config()['uploads_file_path'] . '/postal/'.$postDelete->attachment); }
  		user_log('Postal', 'delete', $postDelete->refno);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_postal'],$this->panelInit->language['postal_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_postal'],$this->panelInit->language['postal_not_exist']);
  	}
	}

	public function download($id){

		if(!$this->panelInit->can( "postal.Download" )){
			exit;
		}

		$toReturn = \postal::where('id',$id)->select("id","attachment","refno")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/postal/".$toReturn->attachment)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->refno). "." .pathinfo($toReturn->attachment, PATHINFO_EXTENSION);
			user_log('Postal', 'delete', $toReturn->refno);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/postal/".$toReturn->attachment);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function export($type){
		if(!$this->panelInit->can( "postal.Export" )){
			exit;
		}

		$header = array ($this->panelInit->language["refno"],$this->panelInit->language["type"],$this->panelInit->language["from"],$this->panelInit->language["to"],$this->panelInit->language["Description"],$this->panelInit->language["time"],$this->panelInit->language["Notes"]);

		$data = array();
		$postal = \postal::select('refno','postal_type','postal_from','postal_to','postal_desc','postal_time','postal_notes')->get()->toArray();
		foreach ($postal as $value) {

			$postal_time = json_decode($value["postal_time"],true);
			$value["postal_time"] = "";
			if(is_array($postal_time) AND isset($postal_time["date"]) ){
				$value["postal_time"] = $postal_time["date"]." ".$postal_time["hour"].":".$postal_time["min"]." ".$postal_time["ampm"];
			}

			$data[] = array ($value['refno'],$value['postal_type'],$value['postal_from'],$value['postal_to'],$value['postal_desc'],$value['postal_time'],$value['postal_notes']);
		}

		user_log('Postal', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("postal-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["postal"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["postal"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");
		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["postal"],
					"author" => $this->data["panelInit"]->settingsArray["siteTitle"],
					"topMarginValue" => 10
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
			$pdfbuilder->output("postal.pdf");
		}
	}
}