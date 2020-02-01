<?php
namespace App\Http\Controllers;

class suppliersControllers extends Controller {
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

		if(!$this->panelInit->can( array("suppliers.list","suppliers.add_supp","suppliers.edit_supp","suppliers.del_supp","suppliers.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["suppliers"] = \suppliers::orderby('id','DESC');
		if($search != ""){
			$toReturn["suppliers"] = $toReturn["suppliers"]->where(function($query) use ($search){
						$query->where("supp_name","like","%".$search."%")->orWhere("supp_desc","like","%".$search."%")->orWhere("supp_phone","like","%".$search."%")->orWhere("supp_mail","like","%".$search."%")->orWhere("supp_address","like","%".$search."%")->orWhere("cont_per_name","like","%".$search."%")->orWhere("cont_per_phone","like","%".$search."%")->orWhere("cont_per_mail","like","%".$search."%")->orWhere("supp_status","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["suppliers"]->count();
		$toReturn["suppliers"] = $toReturn["suppliers"]->select('id','supp_name','supp_desc','supp_phone','supp_mail','supp_address','cont_per_name','cont_per_phone','cont_per_mail','supp_status')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
				return $toReturn;
	}

	public function search($keyword,$page = 1){

		return $this->listAll($page,$keyword);
	}

	public function create(){

		if(!$this->panelInit->can( "suppliers.add_supp" )){
			exit;
		}

		$suppliers = new \suppliers();
		$suppliers->id = \Input::get('id');
		$suppliers->supp_name = \Input::get('supp_name');
		if(\Input::has('supp_desc')){
			$suppliers->supp_desc = \Input::get('supp_desc');
		}
		if(\Input::has('supp_phone')){
			$suppliers->supp_phone = \Input::get('supp_phone');
		}
		if(\Input::has('supp_mail')){
			$suppliers->supp_mail = \Input::get('supp_mail');
		}
		if(\Input::has('supp_address')){
			$suppliers->supp_address = \Input::get('supp_address');
		}
		$suppliers->cont_per_name = \Input::get('cont_per_name');
		if(\Input::has('cont_per_phone')){
			$suppliers->cont_per_phone = \Input::get('cont_per_phone');
		}
		if(\Input::has('cont_per_mail')){
			$suppliers->cont_per_mail = \Input::get('cont_per_mail');
		}
		$suppliers->supp_status = \Input::get('supp_status');
		$suppliers->save();
		user_log('Suppliers', 'create', $suppliers->supp_name);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_supp'],$this->panelInit->language['supp_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "suppliers.edit_supp" )){
			exit;
		}

		$suppliers = \suppliers::select('id','supp_name','supp_desc','supp_phone','supp_mail','supp_address','cont_per_name','cont_per_phone','cont_per_mail','supp_status')->where('id',$id)->first()->toArray();

		return $suppliers;
	}

	public function edit($id){

		if(!$this->panelInit->can( "suppliers.edit_supp" )){
			exit;
		}

		$suppliers = \suppliers::find($id);
		$suppliers->id = \Input::get('id');
		$suppliers->supp_name = \Input::get('supp_name');
		if(\Input::has('supp_desc')){
			$suppliers->supp_desc = \Input::get('supp_desc');
		}
		if(\Input::has('supp_phone')){
			$suppliers->supp_phone = \Input::get('supp_phone');
		}
		if(\Input::has('supp_mail')){
			$suppliers->supp_mail = \Input::get('supp_mail');
		}
		if(\Input::has('supp_address')){
			$suppliers->supp_address = \Input::get('supp_address');
		}
		$suppliers->cont_per_name = \Input::get('cont_per_name');
		if(\Input::has('cont_per_phone')){
			$suppliers->cont_per_phone = \Input::get('cont_per_phone');
		}
		if(\Input::has('cont_per_mail')){
			$suppliers->cont_per_mail = \Input::get('cont_per_mail');
		}
		$suppliers->supp_status = \Input::get('supp_status');
		$suppliers->save();
		user_log('Suppliers', 'edit', $suppliers->supp_name);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_supp'],$this->panelInit->language['supp_edit']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "suppliers.del_supp" )){
			exit;
		}

		if ( $postDelete = \suppliers::where('id', $id)->first() ){
			user_log('Suppliers', 'delete', $postDelete->supp_name);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_supp'],$this->panelInit->language['supp_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_supp'],$this->panelInit->language['supp_not_exist']);
  	}
	}

	public function active($id){

		if(!$this->panelInit->can( "suppliers.edit_supp" )){
			exit;
		}

		$suppliers = \suppliers::find($id);
		if($suppliers->supp_status == "1"){
			$suppliers->supp_status = "0";
		}else{
			$suppliers->supp_status = "1";
		}
		$suppliers->save();
		user_log('Suppliers', 'update_status', $suppliers->supp_name);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_supp'],$this->panelInit->language['supp_edit']);
	}

	public function export($type){

		if(!$this->panelInit->can( "suppliers.Export" )){
			exit;
		}

		$header = array ($this->panelInit->language["supp_name"],$this->panelInit->language["Description"],$this->panelInit->language["supp_phone"],$this->panelInit->language["supp_mail"],$this->panelInit->language["supp_address"],$this->panelInit->language["cont_per_name"],$this->panelInit->language["cont_per_phone"],$this->panelInit->language["cont_per_mail"],$this->panelInit->language["Status"]);

		$data = array();
		$suppliers = \suppliers::select('supp_name','supp_desc','supp_phone','supp_mail','supp_address','cont_per_name','cont_per_phone','cont_per_mail','supp_status')->get()->toArray();
		foreach ($suppliers as $value) {
			$data[] = array ($value['supp_name'],$value['supp_desc'],$value['supp_phone'],$value['supp_mail'],$value['supp_address'],$value['cont_per_name'],$value['cont_per_phone'],$value['cont_per_mail'],$value['supp_status']);
		}

		user_log('Suppliers', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("suppliers-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["suppliers"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["suppliers"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");
		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["suppliers"],
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
			$pdfbuilder->output("suppliers.pdf");
		}
	}
}