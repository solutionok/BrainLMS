<?php
namespace App\Http\Controllers;

class LicenseController extends Controller {

	var $data = array();
	var $panelInit ;

	public function __construct(){

	}

	public function index()
	{
		return \View::make('license', $this->data);
	}

	public function proceed()
	{
		return \View::make('license', $this->data);
	}

	public function update(){
		return true;
	}

	public function sbApi($cpc){
		return true;
	}

}
