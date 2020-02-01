<?php
namespace App\Http\Controllers;

class enquiriesController extends Controller {
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

		if(!$this->panelInit->can( array("enquiries.list","enquiries.View","enquiries.add_enq","enquiries.edit_enq","enquiries.del_enq","enquiries.Download","enquiries.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["enquiries"] = \enquiries::orderby('id','DESC');
		if($search != ""){
			$toReturn["enquiries"] = $toReturn["enquiries"]->where(function($query) use ($search){
						$query->where("enq_title","like","%".$search."%")->orWhere("enq_desc","like","%".$search."%")->orWhere("FullName","like","%".$search."%")->orWhere("phoneNo","like","%".$search."%")->orWhere("email","like","%".$search."%")->orWhere("Address","like","%".$search."%")->orWhere("enq_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["enquiries"]->count();
		$toReturn["enquiries"] = $toReturn["enquiries"]->select('id','enq_title','enq_type','enq_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_file')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["enquiries"] as $key => $value) {
			$toReturn["enquiries"][$key]["enq_date"] = $this->panelInit->unix_to_date($toReturn["enquiries"][$key]["enq_date"]);
			$toReturn["enquiries"][$key]["nxt_fup"] = $this->panelInit->unix_to_date($toReturn["enquiries"][$key]["nxt_fup"]);
		}

		if($page == 1){
			$toReturn["enq_type"] = array();
			$wel_office = \wel_office::where('av_for','LIKE','%enq_type%')->select('id','cat_title')->get();
			foreach ($wel_office as $key => $value) {
				$toReturn['enq_type'][ $value['id'] ] = $value['cat_title'];
			}


			$toReturn["enq_source"] = array();
			$wel_office = \wel_office::where('av_for','LIKE','%enq_source%')->select('id','cat_title')->get();
			foreach ($wel_office as $key => $value) {
				$toReturn['enq_source'][ $value['id'] ] = $value['cat_title'];
			}

		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){
		return $this->listAll($page,$keyword);
	}

	public function create(){

		if(!$this->panelInit->can( "enquiries.add_enq" )){
			exit;
		}

		$enquiries = new \enquiries();
		$enquiries->id = \Input::get('id');
		$enquiries->enq_title = \Input::get('enq_title');
		if(\Input::has('enq_desc')){
			$enquiries->enq_desc = \Input::get('enq_desc');
		}
		$enquiries->enq_type = \Input::get('enq_type');
		if(\Input::has('enq_source')){
			$enquiries->enq_source = \Input::get('enq_source');
		}
		$enquiries->FullName = \Input::get('FullName');
		if(\Input::has('phoneNo')){
			$enquiries->phoneNo = \Input::get('phoneNo');
		}
		if(\Input::has('email')){
			$enquiries->email = \Input::get('email');
		}
		if(\Input::has('Address')){
			$enquiries->Address = \Input::get('Address');
		}
		$enquiries->enq_date = $this->panelInit->date_to_unix(\Input::get('enq_date'));
		if(\Input::has('nxt_fup')){
			$enquiries->nxt_fup = $this->panelInit->date_to_unix(\Input::get('nxt_fup'));
		}


		if (\Input::hasFile('enq_file')) {
			$fileInstance = \Input::file('enq_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['add_enq'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/enquiries',$newFileName);

			$enquiries->enq_file = $newFileName;
		}

		if(\Input::has('enq_notes')){
			$enquiries->enq_notes = \Input::get('enq_notes');
		}
		$enquiries->save();

		user_log('Enquiries', 'create', $enquiries->enq_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_enq'],$this->panelInit->language['enq_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "enquiries.edit_enq" )){
			exit;
		}

		$enquiries = \enquiries::select('id','enq_title','enq_desc','enq_type','enq_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_file','enq_notes')->where('id',$id)->first()->toArray();
		$enquiries['enq_date'] = $this->panelInit->unix_to_date($enquiries['enq_date']);
			$enquiries['nxt_fup'] = $this->panelInit->unix_to_date($enquiries['nxt_fup']);

		return $enquiries;
	}

	public function view($id){

		if(!$this->panelInit->can( "enquiries.View" )){
			exit;
		}

		$toReturn["enq_type"] = array();
		$wel_office = \wel_office::where('av_for','LIKE','%enq_type%')->select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['enq_type'][ $value['id'] ] = $value['cat_title'];
		}


		$toReturn["enq_source"] = array();
		$wel_office = \wel_office::where('av_for','LIKE','%enq_source%')->select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['enq_source'][ $value['id'] ] = $value['cat_title'];
		}

		$enquiries = \enquiries::where('id',$id)->select('id','enq_title','enq_desc','enq_type','enq_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_file','enq_notes')->first()->toArray();
		$enquiries['enq_date'] = $this->panelInit->unix_to_date($enquiries['enq_date']);
		$enquiries['nxt_fup'] = $this->panelInit->unix_to_date($enquiries['nxt_fup']);
		if(isset($toReturn['enq_type'][$enquiries['enq_type']])){
			$enquiries['enq_type'] =  $toReturn['enq_type'][$enquiries['enq_type']];
		}
		if(isset($toReturn['enq_source'][$enquiries['enq_source']])){
			$enquiries['enq_source'] =  $toReturn['enq_source'][$enquiries['enq_source']];
		}

		return $enquiries;
	}

	public function edit($id){

		if(!$this->panelInit->can( "enquiries.edit_enq" )){
			exit;
		}

		$enquiries = \enquiries::find($id);
		$enquiries->id = \Input::get('id');
		$enquiries->enq_title = \Input::get('enq_title');
		if(\Input::has('enq_desc')){
			$enquiries->enq_desc = \Input::get('enq_desc');
		}
		$enquiries->enq_type = \Input::get('enq_type');
		if(\Input::has('enq_source')){
			$enquiries->enq_source = \Input::get('enq_source');
		}
		$enquiries->FullName = \Input::get('FullName');
		if(\Input::has('phoneNo')){
			$enquiries->phoneNo = \Input::get('phoneNo');
		}
		if(\Input::has('email')){
			$enquiries->email = \Input::get('email');
		}
		if(\Input::has('Address')){
			$enquiries->Address = \Input::get('Address');
		}
		$enquiries->enq_date = $this->panelInit->date_to_unix(\Input::get('enq_date'));
		if(\Input::has('nxt_fup')){
			$enquiries->nxt_fup = $this->panelInit->date_to_unix(\Input::get('nxt_fup'));
		}


		if (\Input::hasFile('enq_file')) {
			$fileInstance = \Input::file('enq_file');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_enq'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($enquiries->enq_file != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/enquiries".$enquiries->enq_file);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/enquiries',$newFileName);

			$enquiries->enq_file = $newFileName;
		}

		if(\Input::has('enq_notes')){
			$enquiries->enq_notes = \Input::get('enq_notes');
		}
		$enquiries->save();

		user_log('Enquiries', 'edit', $enquiries->enq_title);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_enq'],$this->panelInit->language['enq_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "enquiries.del_enq" )){
			exit;
		}

		if ( $postDelete = \enquiries::where('id', $id)->first() ){
  		if($postDelete->enq_file != ""){ @unlink(uploads_config()['uploads_file_path'] . '/enquiries'.$postDelete->enq_file); }
  		user_log('Enquiries', 'delete', $postDelete->enq_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_enq'],$this->panelInit->language['enq_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_enq'],$this->panelInit->language['enq_not_exist']);
  	}
	}

	public function download($id){

		if(!$this->panelInit->can( "enquiries.Download" )){
			exit;
		}

		$toReturn = \enquiries::where('id',$id)->select("id","enq_file","enq_title")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/enquiries/".$toReturn->enq_file)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->enq_title). "." .pathinfo($toReturn->enq_file, PATHINFO_EXTENSION);
			user_log('Enquiries', 'download', $toReturn->enq_title);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/enquiries/".$toReturn->enq_file);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function export($type){

		if(!$this->panelInit->can( "enquiries.Export" )){
			exit;
		}

		$toReturn["enq_type"] = array();
		$wel_office = \wel_office::select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['enq_type'][ $value['id'] ] = $value['cat_title'];
		}

		$toReturn["enq_source"] = array();
		$wel_office = \wel_office::select('id','cat_title')->get();
		foreach ($wel_office as $key => $value) {
			$toReturn['enq_source'][ $value['id'] ] = $value['cat_title'];
		}

		$header = array ($this->panelInit->language["enq_title"],$this->panelInit->language["enq_desc"],$this->panelInit->language["enq_type"],$this->panelInit->language["enq_source"],$this->panelInit->language["FullName"],$this->panelInit->language["phoneNo"],$this->panelInit->language["email"],$this->panelInit->language["Address"],$this->panelInit->language["Date"],$this->panelInit->language["nxt_fup"],$this->panelInit->language["Notes"]);

		$data = array();
		$enquiries = \enquiries::select('id','enq_title','enq_desc','enq_type','enq_source','FullName','phoneNo','email','Address','enq_date','nxt_fup','enq_notes')->get()->toArray();
		foreach ($enquiries as $value) {
			$value["enq_type"] = (isset($toReturn['enq_type'][ $value['id'] ])?$toReturn['enq_type'][ $value['id'] ]:"");
			$value["enq_source"] = (isset($toReturn['enq_source'][ $value['id'] ])?$toReturn['enq_source'][ $value['id'] ]:"");

			$data[] = array ($value['enq_title'],$value['enq_desc'],$value['enq_type'],$value['enq_source'],$value['FullName'],$value['phoneNo'],$value['email'],$value['Address'],$this->panelInit->unix_to_date($value['enq_date']),$this->panelInit->unix_to_date($value['nxt_fup']),$value['enq_notes']);
		}

		user_log('Enquiries', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("enquiries-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["enquiries"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["enquiries"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");

		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["enquiries"],
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
			$pdfbuilder->output("enquiries.pdf");
		}
	}
}