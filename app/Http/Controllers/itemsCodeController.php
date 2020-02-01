<?php
namespace App\Http\Controllers;

class itemsCodeController extends Controller {
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

		if(!$this->panelInit->can( array("items_code.list","items_code.add_item","items_code.edit_item","items_code.del_item","items_code.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["items_code"] = \items_code::orderby('id','DESC');
		if($search != ""){
			$toReturn["items_code"] = $toReturn["items_code"]->where(function($query) use ($search){
						$query->where("item_title","like","%".$search."%")->orWhere("item_desc","like","%".$search."%")->orWhere("item_code","like","%".$search."%")->orWhere("item_pn","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["items_code"]->count();
		$toReturn["items_code"] = $toReturn["items_code"]->select('id','item_title','item_desc','item_cat','item_code','item_pn')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
				if($page == 1){
			$toReturn["inv_cat"] = array();
			$inv_cat = \inv_cat::select('id','cat_title')->get();
			foreach ($inv_cat as $key => $value) {
				$toReturn['inv_cat'][ $value['id'] ] = $value['cat_title'];
			}

		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){

		return $this->listAll($page,$keyword);

	}

	public function create(){

		if(!$this->panelInit->can( "items_code.add_item" )){
			exit;
		}

		$items_code = new \items_code();
		if(\Input::has('id')){
			$items_code->id = \Input::get('id');
		}
		$items_code->item_title = \Input::get('item_title');
		if(\Input::has('item_desc')){
			$items_code->item_desc = \Input::get('item_desc');
		}
		$items_code->item_cat = \Input::get('item_cat');
		if(\Input::has('item_code')){
			$items_code->item_code = \Input::get('item_code');
		}
		if(\Input::has('item_pn')){
			$items_code->item_pn = \Input::get('item_pn');
		}
		$items_code->save();
		user_log('Items code', 'create', $items_code->item_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_item'],$this->panelInit->language['item_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "items_code.edit_item" )){
			exit;
		}

		$items_code = \items_code::select('id','item_title','item_desc','item_cat','item_code','item_pn')->where('id',$id)->first()->toArray();

		return $items_code;
	}

	public function edit($id){

		if(!$this->panelInit->can( "items_code.edit_item" )){
			exit;
		}

		$items_code = \items_code::find($id);
		if(\Input::has('id')){
			$items_code->id = \Input::get('id');
		}
		$items_code->item_title = \Input::get('item_title');
		if(\Input::has('item_desc')){
			$items_code->item_desc = \Input::get('item_desc');
		}
		$items_code->item_cat = \Input::get('item_cat');
		if(\Input::has('item_code')){
			$items_code->item_code = \Input::get('item_code');
		}
		if(\Input::has('item_pn')){
			$items_code->item_pn = \Input::get('item_pn');
		}
		$items_code->save();
		user_log('Items code', 'edit', $items_code->item_title);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_item'],$this->panelInit->language['item_add']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "items_code.del_item" )){
			exit;
		}

		if ( $postDelete = \items_code::where('id', $id)->first() ){
			user_log('Items code', 'delete', $postDelete->item_title);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_item'],$this->panelInit->language['item_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_item'],$this->panelInit->language['item_not_exist']);
  	}
	}

	public function export($type){

		if(!$this->panelInit->can( "items_code.Export" )){
			exit;
		}


		$toReturn["inv_cat"] = array();
		$inv_cat = \inv_cat::select('id','cat_title')->get();
		foreach ($inv_cat as $key => $value) {
			$toReturn['inv_cat'][ $value['id'] ] = $value['cat_title'];
		}



		$header = array ($this->panelInit->language["item_title"],$this->panelInit->language["Description"],$this->panelInit->language["Category"],$this->panelInit->language["item_code"],$this->panelInit->language["item_pn"]);

		$data = array();
		$items_code = \items_code::select('id','item_title','item_desc','item_cat','item_code','item_pn')->get()->toArray();
		foreach ($items_code as $value) {
			$value["item_cat"] = (isset($toReturn['inv_cat'][ $value['id'] ])?$toReturn['inv_cat'][ $value['id'] ]:"");

			$data[] = array ($value['item_title'],$value['item_desc'],$value['item_cat'],$value['item_code'],$value['item_pn']);
		}

		user_log('Items code', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("items_code-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["items_code"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["items_code"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");

		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["items_code"],
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
			$pdfbuilder->output("items_code.pdf");
		}
	}


}