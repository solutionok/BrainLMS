<?php
namespace App\Http\Controllers;

class phoneCallsControllers extends Controller {
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

        if(!$this->panelInit->can( array("phn_calls.list","phn_calls.add_call","phn_calls.edit_call","phn_calls.del_call","phn_calls.Export") )){
            exit;
        }

        $toReturn = array();

        $toReturn["phone_calls"] = \phone_calls::orderby('id','DESC');
        if($search != ""){
            $toReturn["phone_calls"] = $toReturn["phone_calls"]->where(function($query) use ($search){
                        $query->where("FullName","like","%".$search."%")->orWhere("phoneNo","like","%".$search."%")->orWhere("email","like","%".$search."%")->orWhere("call_details","like","%".$search."%");
                });
        }
        $toReturn["totalItems"] = $toReturn["phone_calls"]->count();
        $toReturn["phone_calls"] = $toReturn["phone_calls"]->select('id','FullName','phoneNo','email','call_type','purpose','call_time','nxt_follow','call_duration')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();

        foreach ($toReturn["phone_calls"] as $key => $value) {
            $toReturn["phone_calls"][$key]["call_time"] = json_decode($toReturn["phone_calls"][$key]["call_time"]);
            $toReturn["phone_calls"][$key]["nxt_follow"] = json_decode($toReturn["phone_calls"][$key]["nxt_follow"]);
        }

        if($page == 1){
            $toReturn["wel_office"] = array();
            $wel_office = \wel_office::where('av_for','LIKE','%phone_purpose%')->select('id','cat_title')->get();
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

        if(!$this->panelInit->can( "phn_calls.add_call" )){
            exit;
        }

        $phone_calls = new \phone_calls();
        $phone_calls->id = \Input::get('id');
        $phone_calls->FullName = \Input::get('FullName');
        if(\Input::has('phoneNo')){
            $phone_calls->phoneNo = \Input::get('phoneNo');
        }
        if(\Input::has('email')){
            $phone_calls->email = \Input::get('email');
        }
        $phone_calls->call_type = \Input::get('call_type');
        $phone_calls->purpose = \Input::get('purpose');

        $call_time = \Input::get('call_time');
        if(!is_array($call_time)){
            $call_time = json_decode($call_time,true);
        }
        $call_time["ts"] = $this->panelInit->date_to_unix($call_time["date"]) + ( $call_time["hour"] * 60 * 60 ) + ( $call_time["min"] * 60 );
        if($call_time["ampm"] == "pm"){
            $call_time["ts"] += (12 * 60 * 60);
        }
        $phone_calls->call_time = json_encode($call_time);
        if(\Input::has('nxt_follow')){

            $nxt_follow = \Input::get('nxt_follow');
            if(!is_array($nxt_follow)){
                $nxt_follow = json_decode($nxt_follow,true);
            }
            $nxt_follow["ts"] = $this->panelInit->date_to_unix($nxt_follow["date"]) + ( $nxt_follow["hour"] * 60 * 60 ) + ( $nxt_follow["min"] * 60 );
            if($nxt_follow["ampm"] == "pm"){
                $nxt_follow["ts"] += (12 * 60 * 60);
            }
            $phone_calls->nxt_follow = json_encode($nxt_follow);
        }
        if(\Input::has('call_duration')){
            $phone_calls->call_duration = \Input::get('call_duration');
        }
        $phone_calls->call_details = \Input::get('call_details');
        $phone_calls->save();

        user_log('Phone calls', 'create', $phone_calls->FullName);

        return $this->panelInit->apiOutput(true,$this->panelInit->language['add_call'],$this->panelInit->language['call_add']);
    }

    public function fetch($id){

        if(!$this->panelInit->can( "phn_calls.edit_call" )){
            exit;
        }

        $phone_calls = \phone_calls::select('id','FullName','phoneNo','email','call_type','purpose','call_time','nxt_follow','call_duration','call_details')->where('id',$id)->first()->toArray();
        $phone_calls['call_time'] = json_decode($phone_calls['call_time']);
            $phone_calls['nxt_follow'] = json_decode($phone_calls['nxt_follow']);

        return $phone_calls;
    }

    public function edit($id){

        if(!$this->panelInit->can( "phn_calls.edit_call" )){
            exit;
        }

        $phone_calls = \phone_calls::find($id);
        $phone_calls->id = \Input::get('id');
        $phone_calls->FullName = \Input::get('FullName');
        if(\Input::has('phoneNo')){
            $phone_calls->phoneNo = \Input::get('phoneNo');
        }
        if(\Input::has('email')){
            $phone_calls->email = \Input::get('email');
        }
        $phone_calls->call_type = \Input::get('call_type');
        $phone_calls->purpose = \Input::get('purpose');

        $call_time = \Input::get('call_time');
        if(!is_array($call_time)){
            $call_time = json_decode($call_time,true);
        }
        $call_time["ts"] = $this->panelInit->date_to_unix($call_time["date"]) + ( $call_time["hour"] * 60 * 60 ) + ( $call_time["min"] * 60 );
        if($call_time["ampm"] == "pm"){
            $call_time["ts"] += (12 * 60 * 60);
        }
        $phone_calls->call_time = json_encode($call_time);
        if(\Input::has('nxt_follow')){

            $nxt_follow = \Input::get('nxt_follow');
            if(!is_array($nxt_follow)){
                $nxt_follow = json_decode($nxt_follow,true);
            }
            $nxt_follow["ts"] = $this->panelInit->date_to_unix($nxt_follow["date"]) + ( $nxt_follow["hour"] * 60 * 60 ) + ( $nxt_follow["min"] * 60 );
            if($nxt_follow["ampm"] == "pm"){
                $nxt_follow["ts"] += (12 * 60 * 60);
            }
            $phone_calls->nxt_follow = json_encode($nxt_follow);
        }
        if(\Input::has('call_duration')){
            $phone_calls->call_duration = \Input::get('call_duration');
        }
        $phone_calls->call_details = \Input::get('call_details');
        $phone_calls->save();
        user_log('Phone calls', 'edit', $phone_calls->FullName);
        return $this->panelInit->apiOutput(true,$this->panelInit->language['edit_call'],$this->panelInit->language['call_edit']);
    }

    public function delete($id){
        if(!$this->panelInit->can( "phn_calls.del_call" )){
            exit;
        }

        if ( $postDelete = \phone_calls::where('id', $id)->first() ){
    				user_log('Phone calls', 'delete', $postDelete->FullName);
            $postDelete->delete();
        		return $this->panelInit->apiOutput(true,$this->panelInit->language['del_call'],$this->panelInit->language['call_del']);
        }else{
            return $this->panelInit->apiOutput(true,$this->panelInit->language['del_call'],$this->panelInit->language['call_not_exst']);
        }
    }

    public function export($type){

        if(!$this->panelInit->can( "phn_calls.Export" )){
            exit;
        }


        $toReturn["wel_office"] = array();
        $wel_office = \wel_office::select('id','cat_title')->get();
        foreach ($wel_office as $key => $value) {
            $toReturn['wel_office'][ $value['id'] ] = $value['cat_title'];
        }

        $header = array ($this->panelInit->language["FullName"],$this->panelInit->language["phoneNo"],$this->panelInit->language["email"],$this->panelInit->language["call_type"],$this->panelInit->language["purpose"],$this->panelInit->language["time"],$this->panelInit->language["nxt_fup"],$this->panelInit->language["call_dur"],$this->panelInit->language["call_det"]);

        $data = array();
        $phone_calls = \phone_calls::select('id','FullName','phoneNo','email','call_type','purpose','call_time','nxt_follow','call_duration','call_details')->get()->toArray();
        foreach ($phone_calls as $value) {
            $value["purpose"] = (isset($toReturn['wel_office'][ $value['id'] ])?$toReturn['wel_office'][ $value['id'] ]:"");

            $call_time = json_decode($value["call_time"],true);
            $value["call_time"] = "";
            if(is_array($call_time) AND isset($call_time["date"]) ){
                $value["call_time"] = $call_time["date"]." ".$call_time["hour"].":".$call_time["min"]." ".$call_time["ampm"];
            }

            $nxt_follow = json_decode($value["nxt_follow"],true);
            $value["nxt_follow"] = "";
            if(is_array($nxt_follow) AND isset($nxt_follow["date"]) ){
                $value["nxt_follow"] = $nxt_follow["date"]." ".$nxt_follow["hour"].":".$nxt_follow["min"]." ".$nxt_follow["ampm"];
            }

            $data[] = array ($value['FullName'],$value['phoneNo'],$value['email'],$value['call_type'],$value['purpose'],$value['call_time'],$value['nxt_follow'],$value['call_duration'],$value['call_details']);
        }

        user_log('Phone calls', 'export');

        if($type == "excel"){

            $xls_data = array();
            $xls_data[] = $header;
            foreach($data as $value){
                $xls_data[] = $value;
            }

            \Excel::create("phone_calls-Sheet", function($excel) use($xls_data) {

                // Set the title
                $excel->setTitle($this->panelInit->language["phn_calls"]);

                // Chain the setters
                $excel->setCreator("Cutebrains")->setCompany("Virtu");

                $excel->sheet($this->panelInit->language["phn_calls"], function($sheet) use($xls_data) {
                    $sheet->freezeFirstRow();
                    $sheet->fromArray($xls_data, null, "A1", true,false);
                });

            })->download("xls");

        }
        if($type == "pdf"){
            $doc_details = array(
                    "title" => $this->panelInit->language["phn_calls"],
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
            $pdfbuilder->output("phone_calls.pdf");
        }
    }
}