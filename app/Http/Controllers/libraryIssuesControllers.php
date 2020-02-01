<?php
namespace App\Http\Controllers;

class libraryIssuesControllers extends Controller {
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

		if(!$this->panelInit->can( array("issue_book.list","issue_book.add_issue","issue_book.edit_issue","issue_book.del_issue","issue_book.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["library_issue"] = \library_issue::orderby('id','DESC');
		if($search != ""){
			$toReturn["library_issue"] = $toReturn["library_issue"]->where(function($query) use ($search){
						$query->where("issue_id","like","%".$search."%")->orWhere("serial_num","like","%".$search."%")->orWhere("issue_date","like","%".$search."%")->orWhere("issue_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["library_issue"]->count();
		$toReturn["library_issue"] = $toReturn["library_issue"]->select('id','issue_id','user_id','book_id','serial_num','issue_date','ret_date','issue_notes')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["library_issue"] as $key => $value) {
			$toReturn["library_issue"][$key]["user_id"] = json_decode($toReturn["library_issue"][$key]["user_id"]);
			if(!is_array($toReturn["library_issue"][$key]["user_id"])){
				$toReturn["library_issue"][$key]["user_id"] = array();
			}

			$toReturn["library_issue"][$key]["issue_date"] = $this->panelInit->unix_to_date($toReturn["library_issue"][$key]["issue_date"]);
			if($toReturn["library_issue"][$key]["ret_date"] != "" AND $toReturn["library_issue"][$key]["ret_date"] != 0){
				$toReturn["library_issue"][$key]["ret_date"] = $this->panelInit->unix_to_date($toReturn["library_issue"][$key]["ret_date"]);
			}else{
				$toReturn["library_issue"][$key]["ret_date"] = "";
			}
		}

		if($page == 1){
			$toReturn["books"] = array();
			$books = \book_library::select('id','bookName')->get();
			foreach ($books as $key => $value) {
				$toReturn['books'][ $value['id'] ] = $value['bookName'];
			}

		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){

		return $this->listAll($page,$keyword);
	}

	public function create(){

		if(!$this->panelInit->can( "issue_book.add_issue" )){
			exit;
		}

		$library_issue = new \library_issue();
		if(\Input::has('id')){
			$library_issue->id = \Input::get('id');
		}
		$library_issue->issue_id = \Input::get('issue_id');
		$library_issue->user_id = \Input::get('user_id_ser');
		$library_issue->book_id = \Input::get('book_id');
		if(\Input::has('serial_num')){
			$library_issue->serial_num = \Input::get('serial_num');
		}
		$library_issue->issue_date = $this->panelInit->date_to_unix(\Input::get('issue_date'));
		if(\Input::has('ret_date')){
			$library_issue->ret_date = $this->panelInit->date_to_unix(\Input::get('ret_date'));
		}
		if(\Input::has('issue_notes')){
			$library_issue->issue_notes = \Input::get('issue_notes');
		}
		$library_issue->save();
		user_log('Library issues', 'create', 'Serial number: ' . $library_issue->serial_num);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_issue'],$this->panelInit->language['issue_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "issue_book.edit_issue" )){
			exit;
		}

		$library_issue = \library_issue::select('id','issue_id','user_id','book_id','serial_num','issue_date','ret_date','issue_notes')->where('id',$id)->first()->toArray();
		$library_issue['user_id'] = json_decode($library_issue['user_id'],true);

		$library_issue['issue_date'] = $this->panelInit->unix_to_date($library_issue['issue_date']);

		if($library_issue['ret_date'] != "" AND $library_issue['ret_date'] != 0){
			$library_issue['ret_date'] = $this->panelInit->unix_to_date($library_issue['ret_date']);
		}else{
			$library_issue['ret_date'] = "";
		}

		return $library_issue;
	}

	public function edit($id){

		if(!$this->panelInit->can( "issue_book.edit_issue" )){
			exit;
		}

		$library_issue = \library_issue::find($id);
		if(\Input::has('id')){
			$library_issue->id = \Input::get('id');
		}
		$library_issue->issue_id = \Input::get('issue_id');
		$library_issue->user_id = \Input::get('user_id_ser');
		$library_issue->book_id = \Input::get('book_id');
		if(\Input::has('serial_num')){
			$library_issue->serial_num = \Input::get('serial_num');
		}
		$library_issue->issue_date = $this->panelInit->date_to_unix(\Input::get('issue_date'));
		if(\Input::has('ret_date')){
			$library_issue->ret_date = $this->panelInit->date_to_unix(\Input::get('ret_date'));
		}
		if(\Input::has('issue_notes')){
			$library_issue->issue_notes = \Input::get('issue_notes');
		}
		$library_issue->save();
		user_log('Library issues', 'edit', 'Serial number: ' . $library_issue->serial_num);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_issue'],$this->panelInit->language['issue_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "issue_book.del_issue" )){
			exit;
		}

		if ( $postDelete = \library_issue::where('id', $id)->first() ){
			user_log('Library issues', 'delete', 'Serial number: ' . $library_issue->serial_num);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_issue'],$this->panelInit->language['issue_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_issue'],$this->panelInit->language['issue_not_exist']);
  	}
	}

	public function export($type){

		if(!$this->panelInit->can( "issue_book.Export" )){
			exit;
		}


		$toReturn["roles"] = array();
		$roles = \roles::select('id','role_title')->get();
		foreach ($roles as $key => $value) {
			$toReturn['roles'][ $value['id'] ] = $value['role_title'];
		}

		$header = array ($this->panelInit->language["issue_id"],$this->panelInit->language["user"],$this->panelInit->language["bookTitle"],$this->panelInit->language["serial_no"],$this->panelInit->language["issue_date"],$this->panelInit->language["ret_date"],$this->panelInit->language["Notes"]);

		$data = array();
		$library_issue = \library_issue::select('id','issue_id','user_id','book_id','serial_num','issue_date','ret_date','issue_notes')->get()->toArray();
		foreach ($library_issue as $value) {

			$user_id = json_decode($value["user_id"],true);
			$value["user_id"] = "";
			if(is_array($user_id)){
				foreach ($user_id as $key_ => $value_) {
					$value["user_id"] .= $value_["user"].PHP_EOL;
				}
			}
			$value["book_id"] = (isset($toReturn['roles'][ $value['id'] ])?$toReturn['roles'][ $value['id'] ]:"");

			$data[] = array ($value['issue_id'],$value['user_id'],$value['book_id'],$value['serial_num'],$value['issue_date'],$value['ret_date'],$value['issue_notes']);
		}

		user_log('Library issues', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("library_issue-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["issue_book"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["issue_book"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");

		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["issue_book"],
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
			$pdfbuilder->output("library_issue.pdf");
		}
	}

	public function searchUser($keyword){

		if(!$this->panelInit->can( array("issue_book.edit_issue","issue_book.add_issue") )){
			exit;
		}

		$users_list = \User::where(function($query) use ($keyword){
								$query->where("fullName","like","%".$keyword."%")->orWhere("username","like","%".$keyword."%")->orWhere("email","like","%".$keyword."%")->orWhere("library_id","like","%".$keyword."%");
							})->where('library_id','!=','')->get();
		$retArray = array();
		foreach ($users_list as $user) {
			$retArray[$user->id] = array("id"=>$user->id,"name"=>$user->fullName,"email"=>$user->email,"library_id"=>$user->library_id);
		}

		return $retArray;
	}


	public function listIssued($page = 1,$search = ""){

		if(!$this->panelInit->can( array("issue_book.book_return") )){
			exit;
		}

		$toReturn = array();

		$toReturn["library_issue"] = \library_issue::orderby('id','DESC')->where('is_returned','0');
		if($search != ""){
			$toReturn["library_issue"] = $toReturn["library_issue"]->where(function($query) use ($search){
						$query->where("issue_id","like","%".$search."%")->orWhere("serial_num","like","%".$search."%")->orWhere("issue_date","like","%".$search."%")->orWhere("issue_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["library_issue"]->count();
		$toReturn["library_issue"] = $toReturn["library_issue"]->select('id','issue_id','user_id','book_id','serial_num','issue_date','ret_date','issue_notes')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["library_issue"] as $key => $value) {
			$toReturn["library_issue"][$key]["user_id"] = json_decode($toReturn["library_issue"][$key]["user_id"]);
			if(!is_array($toReturn["library_issue"][$key]["user_id"])){
				$toReturn["library_issue"][$key]["user_id"] = array();
			}

			$toReturn["library_issue"][$key]["issue_date"] = $this->panelInit->unix_to_date($toReturn["library_issue"][$key]["issue_date"]);
			$toReturn["library_issue"][$key]["ret_date"] = $this->panelInit->unix_to_date($toReturn["library_issue"][$key]["ret_date"]);
		}

		if($page == 1){
			$toReturn["books"] = array();
			$books = \book_library::select('id','bookName')->get();
			foreach ($books as $key => $value) {
				$toReturn['books'][ $value['id'] ] = $value['bookName'];
			}

		}

		return $toReturn;
	}

	public function searchIssued($keyword,$page = 1){

		if(!$this->panelInit->can( array("issue_book.book_return") )){
			exit;
		}

		return $this->listIssued($page,$keyword);
	}

	function book_return(){
		if(!$this->panelInit->can( array("issue_book.book_return") )){
			exit;
		}

		$library_issue = \library_issue::find( \Input::get('id') );
		$library_issue->ret_date = $this->panelInit->date_to_unix(\Input::get('ret_date'));
		$library_issue->is_returned = 1;
		$library_issue->save();

		user_log('Library issues', 'return_book', 'Serial number: ' . $library_issue->serial_num);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_issue'],$this->panelInit->language['issue_edit']);
	}
}