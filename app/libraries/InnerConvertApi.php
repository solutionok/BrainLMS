<?php

namespace App\Libraries;

use ConvertApi\ConvertApi;
use Illuminate\Support\Facades\DB;

class InnerConvertApi extends ConvertApi {
	protected $api_secret_keys = [];
	protected $user_info;
	protected $convert_api_table = 'convert_files_api_secret_keys';

	public function __construct() {
		$this->read_secret_keys();
		$connection_status = false;

		if(count($this->api_secret_keys)) {
			$convertApi = new ConvertApi;
			$counter = 1;

			foreach ($this->api_secret_keys as $id => $key) {
				$user_data = [];
				$convertApi->setApiSecret($key);

				try {
					$user_data = $convertApi->getUser();
				} catch(\Exception $e) {
					if($e->getMessage() == 'Invalid user credentials - bad secret. Code: 4010') {
						// invalid user
						$this->delete_key($id);
					}
				}

				if(count($user_data)) {
					if($user_data['SecondsLeft'] < 10) {
						$this->delete_key($id);
					} else {
						$connection_status = true;
						break;
					}
				}

				$counter++;
			}
		} else {
 			echo 'api secret keys is empty';
 			exit;
		}

		if(!$connection_status) {
			echo 'api secret keys is empty';
 			exit;
		}
	}

	protected function read_secret_keys() {
		$this->api_secret_keys = DB::table($this->convert_api_table)->pluck('secret_key', 'id');
	}

	protected function delete_key($id) {
		DB::table($this->convert_api_table)->where('id', $id)->delete();
	}
}