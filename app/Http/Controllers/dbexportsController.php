<?php
namespace App\Http\Controllers;
use Ifsnop\Mysqldump as IMysqldump;

class dbexportsController extends Controller {

	var $data = array();
	var $panelInit ;
	var $layout = 'dashboard';

	public function __construct(){
		if(app('request')->header('Authorization') != "" || \Input::has('token')){
			$this->middleware('jwt.auth');
		}else{
			$this->middleware('authApplication');
		}

		$this->panelInit = new \DashboardInit();
		$this->data['panelInit'] = $this->panelInit;
		$this->data['breadcrumb']['Settings'] = \URL::to('/dashboard/languages');
		$this->data['users'] = $this->panelInit->getAuthUser();
		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}

		if(!$this->panelInit->can( "dbExport.dbExport" )){
			exit;
		}
	}

	public function export() {
		try {

			$connection = config('database.default');
			$db_host = config("database.connections.{$connection}.host");
			$db_port = config("database.connections.{$connection}.port");
			$db_name = config("database.connections.{$connection}.database");
			$db_username = config("database.connections.{$connection}.username");
			$db_password = config("database.connections.{$connection}.password");

		    $dump = new IMysqldump\Mysqldump('mysql:host='.$db_host.';dbname='.$db_name, $db_username, $db_password);

		    header('Content-Type: application/octet-stream');
				header("Content-Transfer-Encoding: Binary");
				header("Content-disposition: attachment; filename=\"Cutebrains_dump.sql\"");

		    $dump->start();

		} catch (\Exception $e) {
		    echo 'mysqldump-php error: ' . $e->getMessage();
		}
	}

}
