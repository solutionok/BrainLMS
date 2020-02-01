<?php
namespace App\Http\Controllers;

class itemsStockController extends Controller {
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

		if(!$this->panelInit->can( array("items_stock.list","items_stock.add_item","items_stock.edit_item","items_stock.del_item","items_stock.Download","items_stock.Export") )){
			exit;
		}

		$toReturn = array();

		$toReturn["items_stock"] = \items_stock::orderby('id','DESC');
		if($search != ""){
			$toReturn["items_stock"] = $toReturn["items_stock"]->where(function($query) use ($search){
						$query->where("refno","like","%".$search."%")->orWhere("qty","like","%".$search."%")->orWhere("stock_notes","like","%".$search."%");
				});
		}
		$toReturn["totalItems"] = $toReturn["items_stock"]->count();
		$toReturn["items_stock"] = $toReturn["items_stock"]->select('id','refno','cat_id','item_id','store_id','supplier_id','qty','stock_date','stock_attach')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

		foreach ($toReturn["items_stock"] as $key => $value) {
			$toReturn["items_stock"][$key]["stock_date"] = $this->panelInit->unix_to_date($toReturn["items_stock"][$key]["stock_date"]);
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

			$toReturn["stores"] = array();
			$stores = \stores::select('id','store_title')->get();
			foreach ($stores as $key => $value) {
				$toReturn['stores'][ $value['id'] ] = $value['store_title'];
			}


			$toReturn["suppliers"] = array();
			$suppliers = \suppliers::select('id','supp_name')->get();
			foreach ($suppliers as $key => $value) {
				$toReturn['suppliers'][ $value['id'] ] = $value['supp_name'];
			}

		}

		return $toReturn;
	}

	public function search($keyword,$page = 1){

		return $this->listAll($page,$keyword);

	}

	public function create(){

		if(!$this->panelInit->can( "items_stock.add_item" )){
			exit;
		}

		$items_stock = new \items_stock();
		if(\Input::has('id')){
			$items_stock->id = \Input::get('id');
		}
		$items_stock->refno = \Input::get('refno');
		$items_stock->cat_id = \Input::get('cat_id');
		$items_stock->item_id = \Input::get('item_id');
		if(\Input::has('store_id')){
			$items_stock->store_id = \Input::get('store_id');
		}
		if(\Input::has('supplier_id')){
			$items_stock->supplier_id = \Input::get('supplier_id');
		}
		$items_stock->qty = \Input::get('qty_type').\Input::get('qty');
		$items_stock->stock_date = $this->panelInit->date_to_unix(\Input::get('stock_date'));


		if (\Input::hasFile('stock_attach')) {
			$fileInstance = \Input::file('stock_attach');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['add_item'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/stock/',$newFileName);

			$items_stock->stock_attach = $newFileName;
		}

		if(\Input::has('stock_notes')){
			$items_stock->stock_notes = \Input::get('stock_notes');
		}
		$items_stock->save();
		user_log('Items stock', 'create', $items_stock->refno);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['add_item'],$this->panelInit->language['item_add']);
	}

	public function fetch($id){

		if(!$this->panelInit->can( "items_stock.edit_item" )){
			exit;
		}

		$items_stock = \items_stock::select('id','refno','cat_id','item_id','store_id','supplier_id','qty','stock_date','stock_attach','stock_notes')->where('id',$id)->first()->toArray();
		$items_stock['stock_date'] = $this->panelInit->unix_to_date($items_stock['stock_date']);

		if (strpos($items_stock['qty'], '-') !== false) {
			$items_stock['qty_type'] = '-';
		}else{
			$items_stock['qty_type'] = '+';
		}
		$items_stock['qty'] = str_replace(array('+','-'), "", $items_stock['qty']);

		return $items_stock;
	}

	public function edit($id){

		if(!$this->panelInit->can( "items_stock.edit_item" )){
			exit;
		}

		$items_stock = \items_stock::find($id);
		if(\Input::has('id')){
			$items_stock->id = \Input::get('id');
		}
		$items_stock->refno = \Input::get('refno');
		$items_stock->cat_id = \Input::get('cat_id');
		$items_stock->item_id = \Input::get('item_id');
		if(\Input::has('store_id')){
			$items_stock->store_id = \Input::get('store_id');
		}
		if(\Input::has('supplier_id')){
			$items_stock->supplier_id = \Input::get('supplier_id');
		}
		$items_stock->qty = \Input::get('qty_type').\Input::get('qty');
		$items_stock->stock_date = $this->panelInit->date_to_unix(\Input::get('stock_date'));


		if (\Input::hasFile('stock_attach')) {
			$fileInstance = \Input::file('stock_attach');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['edit_item'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($items_stock->stock_attach != ""){
				@unlink(uploads_config()['uploads_file_path'] . "/stock/".$items_stock->stock_attach);
			}

			$newFileName = uniqid().".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/stock/',$newFileName);

			$items_stock->stock_attach = $newFileName;
		}

		if(\Input::has('stock_notes')){
			$items_stock->stock_notes = \Input::get('stock_notes');
		}
		$items_stock->save();
		user_log('Items stock', 'edit', $items_stock->refno);
		return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_item'],$this->panelInit->language['item_add']);
	}

	public function delete($id){

		if(!$this->panelInit->can( "items_stock.del_item" )){
			exit;
		}

		if ( $postDelete = \items_stock::where('id', $id)->first() ){
  		if($postDelete->stock_attach != ""){ @unlink(uploads_config()['uploads_file_path'] . '/stock/'.$postDelete->stock_attach); }
  		user_log('Items stock', 'delete', $postDelete->refno);
  		$postDelete->delete();
			return $this->panelInit->apiOutput(true,$this->panelInit->language['del_item'],$this->panelInit->language['item_del']);
  	}else{
  		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_item'],$this->panelInit->language['item_not_exist']);
  	}
	}

	public function download($id){

		if(!$this->panelInit->can( "items_stock.Download" )){
			exit;
		}

		$toReturn = \items_stock::where('id',$id)->select("id","stock_attach","refno")->first();
		if(file_exists(uploads_config()['uploads_file_path'] . "/stock/".$toReturn->stock_attach)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','',$toReturn->refno). "." .pathinfo($toReturn->stock_attach, PATHINFO_EXTENSION);
			user_log('Items stock', 'download', $toReturn->refno);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . "/stock/".$toReturn->stock_attach);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function export($type){

		if(!$this->panelInit->can( "items_stock.Export" )){
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

		$toReturn["stores"] = array();
		$stores = \stores::select('id','store_title')->get();
		foreach ($stores as $key => $value) {
			$toReturn['stores'][ $value['id'] ] = $value['store_title'];
		}

		$toReturn["suppliers"] = array();
		$suppliers = \suppliers::select('id','supp_name')->get();
		foreach ($suppliers as $key => $value) {
			$toReturn['suppliers'][ $value['id'] ] = $value['supp_name'];
		}



		$header = array ($this->panelInit->language["refno"],$this->panelInit->language["Category"],$this->panelInit->language["item"],$this->panelInit->language["store"],$this->panelInit->language["supplier"],$this->panelInit->language["quantity"],$this->panelInit->language["Date"],$this->panelInit->language["Notes"]);

		$data = array();
		$items_stock = \items_stock::select('id','refno','cat_id','item_id','store_id','supplier_id','qty','stock_date','stock_notes')->get()->toArray();
		foreach ($items_stock as $value) {
			$value["cat_id"] = (isset($toReturn['inv_cat'][ $value['cat_id'] ])?$toReturn['inv_cat'][ $value['cat_id'] ]:"");
			$value["item_id"] = (isset($toReturn['items_code'][ $value['item_id'] ])?$toReturn['items_code'][ $value['item_id'] ]:"");
			$value["store_id"] = (isset($toReturn['stores'][ $value['store_id'] ])?$toReturn['stores'][ $value['store_id'] ]:"");
			$value["supplier_id"] = (isset($toReturn['suppliers'][ $value['supplier_id'] ])?$toReturn['suppliers'][ $value['supplier_id'] ]:"");

			$data[] = array ($value['refno'],$value['cat_id'],$value['item_id'],$value['store_id'],$value['supplier_id'],$value['qty'],$this->panelInit->unix_to_date($value['stock_date']),$value['stock_notes']);
		}

		user_log('Items stock', 'export');

		if($type == "excel"){

			$xls_data = array();
			$xls_data[] = $header;
			foreach($data as $value){
				$xls_data[] = $value;
			}

			\Excel::create("items_stock-Sheet", function($excel) use($xls_data) {

			    // Set the title
			    $excel->setTitle($this->panelInit->language["items_stock"]);

			    // Chain the setters
			    $excel->setCreator("Cutebrains")->setCompany("Virtu");

				$excel->sheet($this->panelInit->language["items_stock"], function($sheet) use($xls_data) {
					$sheet->freezeFirstRow();
					$sheet->fromArray($xls_data, null, "A1", true,false);
				});

			})->download("xls");
		}
		if($type == "pdf"){
			$doc_details = array(
					"title" => $this->panelInit->language["items_stock"],
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
			$pdfbuilder->output("items_stock.pdf");
		}
	}

	public function load_items($cat_id){
		return \items_code::select('id','item_title')->where('item_cat',$cat_id)->get()->toArray();
	}

}