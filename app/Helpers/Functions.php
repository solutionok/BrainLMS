<?php

use App\Models2\NotificationMobHistory;
use App\Models2\UserLog;
use Illuminate\Support\Facades\Auth;

function all_pagination_number() {
	if(env('APP_TYPE') == 'mob') {
		return 10;
	} else if(env('APP_TYPE') == 'web') {
		return 20;
	} else {
		return 20;
	}
}

// make notification seen
function updateSeenNotificationMobHistory($user_id, $type, $payload_id) {
	$query = NotificationMobHistory::where('user_id', $user_id)
	  ->where('type', $type);

	if(!is_null($payload_id)) {
		$query->where('payload_id', $payload_id);
	}

	$NotificationMobHistory = $query->pluck('id');

	if($query->count()) {
		foreach ($NotificationMobHistory as $notification_id) {
			$NotificationMobHistory = NotificationMobHistory::find($notification_id);
			$NotificationMobHistory->is_seen = 1;
			$NotificationMobHistory->save();
		}
	}
}

function uploads_config() {
	if(config('app.env') == 'local') {
		return [
			'uploads_provider' => 'https://upload.cutebrains.com/dev',
			'uploads_file_path' => '../dev_uploads',
		];
	} else {
		$production_type = get_server_info()['server_type'];
		return [
			'uploads_provider' => 'https://upload.cutebrains.com/' . $production_type,
			'uploads_file_path' => '../../cutebrains_uploads/' . $production_type,
		];
	}
}

function get_server_info() {
	$full = url()->current();
	$native = str_replace(['https://', 'http://'], ['', ''], $full);
	$native = explode('/', $native)[0];
	$native = explode('.', $native)[0];

	switch ($native) {
		case 'demo':
		case 'demo-m':
			$server_type = 'demo';
			$database_name = 'cutebrains_demo1';
			$app_debug = true;
			$debugbar_enable = false;
		break;
		case 'sri':
		case 'sri-m':
			$server_type = 'sri';
			$database_name = 'cutebrains_sri1';
			$app_debug = true;
			$debugbar_enable = false;
		break;
		case 'sxd':
		case 'sxds':
		case 'm':
			$server_type = 'sxd';
			$database_name = 'cutebrains_sxd1';
			$app_debug = true;
			$debugbar_enable = false;
		break;
		case 'dpsgr':
		case 'dpsgr-m':
			$server_type = 'dpsgr';
			$database_name = 'cutebrains_dpsgr1';
			$app_debug = true;
			$debugbar_enable = false;
		break;
		case 'svarndps':
		case 'svarndps-m':
			$server_type = 'svarndps';
			$database_name = 'cutebrains_svarndps1';
			$app_debug = true;
			$debugbar_enable = false;
		break;
		case 'dev':
		case 'work':
			$server_type = 'dev';
			$database_name = 'cutebrains_dev1';
			$app_debug = true;
			$debugbar_enable = true;
		break;
		// for localhost
		default:
			$server_type = 'local';
			$database_name = 'l5_cutebrains';
			$app_debug = true;
			$debugbar_enable = true;
		break;
	}

	return [
		'server_type' => $server_type,
		'database_name' => $database_name,
		'app_debug' => $app_debug,
		'debugbar_enable' => $debugbar_enable,
		'user_ip' => request()->ip(),
	];
}

function user_log($module_name, $action, $payload = null) {
	// if(get_server_info()['server_type'] == 'local' || get_server_info()['server_type'] == 'dev') {
		if(Auth::check()) {
			$user_log = new UserLog;
			$user_log->user_id = Auth::user()->id;
			$user_log->user_ip = request()->ip();
			$user_log->module_name = $module_name;
			$user_log->action = $action;
			$user_log->payload = $payload;
			$user_log->date = time();
			$user_log->save();
		}
	// }
}