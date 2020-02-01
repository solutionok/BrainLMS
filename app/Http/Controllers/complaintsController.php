<?php
namespace App\Http\Controllers;

class complaintsController extends Controller {
	var $data = array();
	var $panelInit;

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

		if(!$this->panelInit->can( array("complaints.list","complaints.View","complaints.add_complaint","complaints.edit_complaint","complaints.del_complaint","complaints.Download","complaints.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["complaints"] = \complaints::orderby('id','DESC');
		if($search != ""){
			$toReturn["complaints"] = $toReturn["complaints"]->where(function($query) use ($search){
						$query->where("comp_title","like","%".$search."%")->orWhere("comp_desc","like","%".$search."%")->orWhere("FullName","like","%".$search."%")->orWhere("phoneNo","like","%".$search."%")->orWhere("email","like","%".$search."%")->orWhere("Address","like","%".$search."%")->orWhere("enq_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["complaints"]->count();
		$toReturn["complaints"] = $toReturn["complaints"]->select('id','comp_title','comp_type','comp_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_file')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["complaints"] as $key => $value) {
			$toReturn["complaints"][$key]["enq_date"] = $this->panelInit->unix_to_date($toReturn["complaints"][$key]["enq_date"]);
			$toReturn["complaints"][$key]["nxt_fup"] = $this->panelInit->unix_to_date($toReturn["complaints"][$key]["nxt_fup"]);
		}

		if($page == 1){
			$toReturn["comp_type"] = array();
			$wel_office = \wel_office::where('av_for','LIKE','%comp_type%')->select('id','cat_title')->get();
			foreach ($wel_office as $key => $value) {
				$toReturn['comp_type'][ $value['id'] ] = $value['cat_title'];
			}


			$toReturn["comp_source"] = array();
			$wel_office = \wel_office::where('av_for','LIKE','%comp_source%')->select('id','cat_title')->get();
			foreach ($wel_office as $key => $value) {
				$toReturn['comp_source'][ $value['id'] ] = $value['cat_title'];
			}

		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){
		return $this->listAll($page,$keyword);
	}

	public function create(){
		if(!$this->panelInit->can( "complaints.add_complaint" )){
			exit;
		}

		$complaints = new \complaints();
		$complaints->id = \Input::get('id');
		$complaints->comp_title = \Input::get('comp_title');
		if(\Input::has('comp_desc')){
			$complaints->comp_desc = \Input::get('comp_desc');
		}
		$complaints->comp_type = \Input::get('comp_type');
		if(\Input::has('comp_source')){
			$complaints->comp_source = \Input::get('comp_source');
		}
		$complaints->FullName = \Input::get('FullName');
		if(\Input::has('phoneNo')){
			$complaints->phoneNo = \Input::get('phoneNo');
		}
		if(\Input::has('email')){
			$complaints->email = \Input::get('email');
		}
		if(\Input::has('Address')){
			$complaints->Address = \Input::get('Address');
		}
		$complaints->enq_date = $this->panelInit->date_to_unix(\Input::get('enq_date'));
		if(\Input::has('nxt_fup')){
			$complaints->nxt_fup = $this->panelInit->date_to_unix(\Input::get('nxt_fup'));
		}

		if (\Input::hasFile('enq_file')) {
			$fileInstance = \Input::file('enq_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['add_complaint'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/enquiries/',$newFileName);

			$complaints->enq_file = $newFileName;
		}
		if(\Input::has('enq_notes')){
			$complaints->enq_notes = \Input::get('enq_notes');
		}

		$complaints->save();

		user_log('Complaints', 'create', $complaints->comp_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_complaint'],$this->panelInit->language['complaint_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "complaints.edit_complaint" )){
			exit;
		}

		$complaints = \complaints::select('id','comp_title','comp_desc','comp_type','comp_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_file','enq_notes')->where('id',$id)->first()->toArray();
		$complaints['enq_date'] = $this->panelInit->unix_to_date($complaints['enq_date']);
			$complaints['nxt_fup'] = $this->panelInit->unix_to_date($complaints['nxt_fup']);

		return $complaints;
	}

	public function view($id){

		if(!$this->panelInit->can( "complaints.View" )){
			exit;
		}

		$toReturn["comp_type"] = array();
		$wel_office = \wel_office::where('av_for','LIKE','%comp_type%')->select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['comp_type'][ $value['id'] ] = $value['cat_title'];
		}


		$toReturn["comp_source"] = array();
		$wel_office = \wel_office::where('av_for','LIKE','%comp_source%')->select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['comp_source'][ $value['id'] ] = $value['cat_title'];
		}

		$complaints = \complaints::where('id',$id)->select('id','comp_title','comp_desc','comp_type','comp_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_file','enq_notes')->first()->toArray();
		$complaints['enq_date'] = $this->panelInit->unix_to_date($complaints['enq_date']);
		$complaints['nxt_fup'] = $this->panelInit->unix_to_date($complaints['nxt_fup']);
		if(isset($toReturn['comp_type'][$complaints['comp_type']])){
			$complaints['comp_type'] =  $toReturn['comp_type'][$complaints['comp_type']];
		}
		if(isset($toReturn['comp_source'][$complaints['comp_source']])){
			$complaints['comp_source'] =  $toReturn['comp_source'][$complaints['comp_source']];
		}

		return $complaints;
	}

	public function edit($id){
		if(!$this->panelInit->can( "complaints.edit_complaint" )){
			exit;
		}

		$complaints = \complaints::find($id);
		$complaints->id = \Input::get('id');
		$complaints->comp_title = \Input::get('comp_title');
		if(\Input::has('comp_desc')){
			$complaints->comp_desc = \Input::get('comp_desc');
		}
		$complaints->comp_type = \Input::get('comp_type');
		if(\Input::has('comp_source')){
			$complaints->comp_source = \Input::get('comp_source');
		}
		$complaints->FullName = \Input::get('FullName');
		if(\Input::has('phoneNo')){
			$complaints->phoneNo = \Input::get('phoneNo');
		}
		if(\Input::has('email')){
			$complaints->email = \Input::get('email');
		}
		if(\Input::has('Address')){
			$complaints->Address = \Input::get('Address');
		}
		$complaints->enq_date = $this->panelInit->date_to_unix(\Input::get('enq_date'));
		if(\Input::has('nxt_fup')){
			$complaints->nxt_fup = $this->panelInit->date_to_unix(\Input::get('nxt_fup'));
		}


		if (\Input::hasFile('enq_file')) {
			$fileInstance = \Input::file('enq_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_complaint'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($complaints->enq_file != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/enquiries/".$complaints->enq_file);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/enquiries/',$newFileName);

			$complaints->enq_file = $newFileName;
		}
		if(\Input::has('enq_notes')){
			$complaints->enq_notes = \Input::get('enq_notes');
		}

		$complaints->save();
		user_log('Complaints', 'edit', $complaints->comp_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_complaint'],$this->panelInit->language['complaint_edit']);
	}

	public function delete($id){
		if(!$this->panelInit->can( "complaints.del_complaint" )){
			exit;
		}

		if ( $postDelete = \complaints::where('id', $id)->first() ){
  		if($postDelete->enq_file != ""){ @unlink(uploads_config()['uploads_file_path'] . '/enquiries/'.$postDelete->enq_file); }
  		user_log('Complaints', 'delete', $postDelete->comp_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_complaint'],$this->panelInit->language['complaint_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_complaint'],$this->panelInit->language['complaint_not_exist']);
  	}
	}

	public function download($id){

		if(!$this->panelInit->can( "complaints.Download" )){
			exit;
		}

		$toReturn = \complaints::where('id',$id)->select("id","enq_file","comp_title")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/enquiries/".$toReturn->enq_file)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->comp_title). "." .pathinfo($toReturn->enq_file, PATHINFO_EXTENSION);
			user_log('Complaints', 'download', $toReturn->comp_title);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/enquiries/".$toReturn->enq_file);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function export($type){
		if(!$this->panelInit->can( "complaints.Export" )){
			exit;
		}

		$toReturn["comp_type"] = array();
		$wel_office = \wel_office::where('av_for','LIKE','%comp_type%')->select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['comp_type'][ $value['id'] ] = $value['cat_title'];
		}

		$toReturn["comp_source"] = array();
		$wel_office = \wel_office::where('av_for','LIKE','%comp_source%')->select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['comp_source'][ $value['id'] ] = $value['cat_title'];
		}


		$header = array ($this->panelInit->language["complaint_title"],$this->panelInit->language["comp_desc"],$this->panelInit->language["comp_type"],$this->panelInit->language["comp_source"],$this->panelInit->language["FullName"],$this->panelInit->language["phoneNo"],$this->panelInit->language["email"],$this->panelInit->language["Address"],$this->panelInit->language["Date"],$this->panelInit->language["nxt_fup"],$this->panelInit->language["Notes"]);

		$data = array();
		$complaints = \complaints::select('id','comp_title','comp_desc','comp_type','comp_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_notes')->get()->toArray();
		foreach ($complaints as $value) {
			$value["comp_type"] = (isset($toReturn['comp_type'][ $value['id'] ])?$toReturn['comp_type'][ $value['id'] ]:"");
			$value["comp_source"] = (isset($toReturn['comp_source'][ $value['id'] ])?$toReturn['comp_source'][ $value['id'] ]:"");

			$data[] = array ($value['comp_title'],$value['comp_desc'],$value['comp_type'],$value['comp_source'],$value['FullName'],$value['phoneNo'],$value['email'],$value['Address'],$this->panelInit->unix_to_date($value['enq_date']),$this->panelInit->unix_to_date($value['nxt_fup']),$value['enq_notes']);
		}

		user_log('Complaints', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("complaints-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["complaints"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["complaints"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");
		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["complaints"],
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
			$pdfbuilder->output("complaints.pdf");
		}
	}

}