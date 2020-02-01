<?php
namespace App\Http\Controllers;

class conMessController extends Controller {
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

		if(!$this->panelInit->can( array("con_mess.list","con_mess.View","con_mess.del_mess","con_mess.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["contact_messages"] = \contact_messages::orderby('id','DESC');
		if($search != ""){
			$toReturn["contact_messages"] = $toReturn["contact_messages"]->where(function($query) use ($search){
						$query->where("mail_subject","like","%".$search."%")->orWhere("firstName","like","%".$search."%")->orWhere("lastName","like","%".$search."%")->orWhere("email","like","%".$search."%")->orWhere("message","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["contact_messages"]->count();
		$toReturn["contact_messages"] = $toReturn["contact_messages"]->select('id','mail_subject','firstName','lastName','email','message_time')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["contact_messages"] as $key => $value) {
			$toReturn["contact_messages"][$key]['message_time'] = $this->panelInit->unix_to_date($toReturn["contact_messages"][$key]['message_time'], $this->panelInit->settingsArray['dateformat']." hr:mn a");
		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){
		return $this->listAll($page,$keyword);
	}

	public function view($id){

		if(!$this->panelInit->can( "con_mess.View" )){
			exit;
		}

		$contact_messages = \contact_messages::where('id',$id)->select('id','mail_subject','firstName','lastName','email','message','message_time')->first()->toArray();
		$contact_messages['message_time'] = $this->panelInit->unix_to_date($contact_messages['message_time'], $this->panelInit->settingsArray['dateformat']." hr:mn a");

		return $contact_messages;
	}

	public function delete($id){

		if(!$this->panelInit->can( "con_mess.del_mess" )){
			exit;
		}

		if ( $postDelete = \contact_messages::where('id', $id)->first() ){
			user_log('Contact messages', 'delete', $postDelete->mail_subject);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_mess'],$this->panelInit->language['mess_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_mess'],$this->panelInit->language['mess_not_exist']);
  	}
	}

	public function export($type){

		if(!$this->panelInit->can( "con_mess.Export" )){
			exit;
		}

		$header = array ($this->panelInit->language["mail_subj"],$this->panelInit->language["firstName"],$this->panelInit->language["lastName"],$this->panelInit->language["email"],$this->panelInit->language["message"],$this->panelInit->language["time"]);

		$data = array();
		$contact_messages = \contact_messages::select('mail_subject','firstName','lastName','email','message','message_time')->get()->toArray();
		foreach ($contact_messages as $value) {
			$value['message_time'] = $this->panelInit->unix_to_date($value['message_time'], $this->panelInit->settingsArray['dateformat']." hr:mn a");
			$data[] = array ($value['mail_subject'],$value['firstName'],$value['lastName'],$value['email'],$value['message'],$value['message_time']);
		}

		user_log('Contact messages', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("contact_messages-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["con_mess"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["con_mess"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");
		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["con_mess"],
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
			$pdfbuilder->output("contact_messages.pdf");
		}
	}
}