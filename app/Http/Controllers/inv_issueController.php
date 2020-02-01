<?php
namespace App\Http\Controllers;

class inv_issueController extends Controller {
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

		if(!$this->panelInit->can( array("iss_ret.list","iss_ret.issue_item","iss_ret.edit_item","iss_ret.del_item","iss_ret.Download","iss_ret.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["inv_issue"] = \inv_issue::orderby('id','DESC');
		if($search != ""){
			$toReturn["inv_issue"] = $toReturn["inv_issue"]->where(function($query) use ($search){
						$query->where("refno","like","%".$search."%")->orWhere("qty","like","%".$search."%")->orWhere("issue_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["inv_issue"]->count();
		$toReturn["inv_issue"] = $toReturn["inv_issue"]->select('id','refno','item_cat','item_title','qty','issue_tu','issue_date','ret_date','is_returned','attachment','issue_notes')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["inv_issue"] as $key => $value) {
			$toReturn["inv_issue"][$key]["issue_tu"] = json_decode($toReturn["inv_issue"][$key]["issue_tu"]);
			if(!is_array($toReturn["inv_issue"][$key]["issue_tu"])){
				$toReturn["inv_issue"][$key]["issue_tu"] = array();
			}

			$toReturn["inv_issue"][$key]["issue_date"] = $this->panelInit->unix_to_date($toReturn["inv_issue"][$key]["issue_date"]);
			$toReturn["inv_issue"][$key]["ret_date"] = $this->panelInit->unix_to_date($toReturn["inv_issue"][$key]["ret_date"]);
		}

		if($page == 1){
			$toReturn["inv_cat"] = array();
			$inv_cat = \inv_cat::select('id','cat_title')->get();
			foreach ($inv_cat as $key => $value) {
				$toReturn['inv_cat'][ $value['id'] ] = $value['cat_title'];
			}


			$toReturn["items_code"] = array();
			$items_code = \items_code::select('id','item_title')->get();
			foreach ($items_code as $key => $value) {
				$toReturn['items_code'][ $value['id'] ] = $value['item_title'];
			}

		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){
		return $this->listAll($page,$keyword);
	}

	public function create(){

		if(!$this->panelInit->can( "iss_ret.issue_item" )){
			exit;
		}

		$inv_issue = new \inv_issue();
		if(\Input::has('id')){
			$inv_issue->id = \Input::get('id');
		}
		$inv_issue->refno = \Input::get('refno');
		$inv_issue->item_cat = \Input::get('item_cat');
		$inv_issue->item_title = \Input::get('item_title');
		$inv_issue->qty = \Input::get('qty');
		$inv_issue->issue_tu = \Input::get('issue_tu_ser');
		$inv_issue->issue_date = $this->panelInit->date_to_unix(\Input::get('issue_date'));
		if(\Input::has('ret_date')){
			$inv_issue->ret_date = $this->panelInit->date_to_unix(\Input::get('ret_date'));
		}

		if (\Input::hasFile('attachment')) {
			$fileInstance = \Input::file('attachment');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['issue_item'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/stock/',$newFileName);

			$inv_issue->attachment = $newFileName;
		}

		if(\Input::has('issue_notes')){
			$inv_issue->issue_notes = \Input::get('issue_notes');
		}
		$inv_issue->save();

		user_log('Invoice issues', 'create', $inv_issue->refno);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['issue_item'],$this->panelInit->language['item_issued']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "iss_ret.edit_item" )){
			exit;
		}

		$inv_issue = \inv_issue::select('id','refno','item_cat','item_title','qty','issue_tu','issue_date','ret_date','attachment','issue_notes')->where('id',$id)->first()->toArray();
		$inv_issue['issue_tu'] = json_decode($inv_issue['issue_tu'],true);
			$inv_issue['issue_date'] = $this->panelInit->unix_to_date($inv_issue['issue_date']);
			$inv_issue['ret_date'] = $this->panelInit->unix_to_date($inv_issue['ret_date']);

		return $inv_issue;
	}

	public function edit($id){

		if(!$this->panelInit->can( "iss_ret.edit_item" )){
			exit;
		}

		$inv_issue = \inv_issue::find($id);
		if(\Input::has('id')){
			$inv_issue->id = \Input::get('id');
		}
		$inv_issue->refno = \Input::get('refno');
		$inv_issue->item_cat = \Input::get('item_cat');
		$inv_issue->item_title = \Input::get('item_title');
		$inv_issue->qty = \Input::get('qty');
		$inv_issue->issue_tu = \Input::get('issue_tu_ser');
		$inv_issue->issue_date = $this->panelInit->date_to_unix(\Input::get('issue_date'));
		if(\Input::has('ret_date')){
			$inv_issue->ret_date = $this->panelInit->date_to_unix(\Input::get('ret_date'));
		}

		if (\Input::hasFile('attachment')) {
			$fileInstance = \Input::file('attachment');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_item'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($inv_issue->attachment != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/stock/".$inv_issue->attachment);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/stock/',$newFileName);

			$inv_issue->attachment = $newFileName;
		}

		if(\Input::has('issue_notes')){
			$inv_issue->issue_notes = \Input::get('issue_notes');
		}
		$inv_issue->save();

		user_log('Invoice issues', 'edit', $inv_issue->refno);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_item'],$this->panelInit->language['item_edit']);
	}

	public function return_item($id){

		if(!$this->panelInit->can( "iss_ret.edit_item" )){
			exit;
		}

		$inv_issue = \inv_issue::find($id);
		$inv_issue->ret_date = time();
		$inv_issue->is_returned = 1;
		$inv_issue->save();

		user_log('Invoice issues', 'return', $inv_issue->refno);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_item'],$this->panelInit->language['item_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "iss_ret.del_item" )){
			exit;
		}

		if ( $postDelete = \inv_issue::where('id', $id)->first() ){
  		if($postDelete->attachment != ""){ @unlink(uploads_config()['uploads_file_path'] . '/stock/'.$postDelete->attachment); }
  		user_log('Invoice issues', 'delete', $postDelete->refno);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_item'],$this->panelInit->language['item_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_item'],$this->panelInit->language['item_not_exist']);
  	}
	}

	public function download($id){

		if(!$this->panelInit->can( "iss_ret.Download" )){
			exit;
		}

		$toReturn = \inv_issue::where('id',$id)->select("id","attachment","refno")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/stock/".$toReturn->attachment)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->refno). "." .pathinfo($toReturn->attachment, PATHINFO_EXTENSION);
			user_log('Invoice issues', 'download', $toReturn->refno);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/stock/".$toReturn->attachment);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function export($type){

		if(!$this->panelInit->can( "iss_ret.Export" )){
			exit;
		}


		$toReturn["inv_cat"] = array();
		$inv_cat = \inv_cat::select('id','cat_title')->get();
		foreach ($inv_cat as $key => $value) {
			$toReturn['inv_cat'][ $value['id'] ] = $value['cat_title'];
		}

		$toReturn["items_code"] = array();
		$items_code = \items_code::select('id','item_title')->get();
		foreach ($items_code as $key => $value) {
			$toReturn['items_code'][ $value['id'] ] = $value['item_title'];
		}



		$header = array ($this->panelInit->language["refno"],$this->panelInit->language["Category"],$this->panelInit->language["item"],$this->panelInit->language["quantity"],$this->panelInit->language["issue_to"],$this->panelInit->language["issue_date"],$this->panelInit->language["ret_date"],$this->panelInit->language["Notes"]);

		$data = array();
		$inv_issue = \inv_issue::select('id','refno','item_cat','item_title','qty','issue_tu','issue_date','ret_date','issue_notes')->get()->toArray();
		foreach ($inv_issue as $value) {
			$value["item_cat"] = (isset($toReturn['inv_cat'][ $value['id'] ])?$toReturn['inv_cat'][ $value['id'] ]:"");
			$value["item_title"] = (isset($toReturn['items_code'][ $value['id'] ])?$toReturn['items_code'][ $value['id'] ]:"");

			$issue_tu = json_decode($value["issue_tu"],true);
			$value["issue_tu"] = "";
			if(is_array($issue_tu)){
				foreach ($issue_tu as $key_ => $value_) {
					$value["issue_tu"] .= $value_["user"].PHP_EOL;
				}
			}

			$data[] = array ($value['refno'],$value['item_cat'],$value['item_title'],$value['qty'],$value['issue_tu'],$value['issue_date'],$value['ret_date'],$value['issue_notes']);
		}

		user_log('Invoice issues', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("inv_issue-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["iss_ret"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["iss_ret"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");
		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["iss_ret"],
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
			$pdfbuilder->output("inv_issue.pdf");
		}
	}

	public function searchUser($keyword){

		if(!$this->panelInit->can( array("iss_ret.edit_item","iss_ret.issue_item") )){
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

	public function load_items($cat_id){
		$to_return = array();

		$to_return['items'] = \items_code::select('id','item_title')->where('item_cat',$cat_id)->get()->toArray();
		$items_stock = \items_stock::select('item_id','qty')->where('cat_id',$cat_id)->get()->toArray();

		$to_return['qty'] = array();
		foreach ($items_stock as $key => $value) {
			if(!isset($to_return['qty'][$value['item_id']])){
				$to_return['qty'][$value['item_id']] = 0;
			}
			$to_return['qty'][$value['item_id']] = $to_return['qty'][$value['item_id']] + intval($value['qty']);
		}

		return $to_return;
	}

}