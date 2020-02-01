<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
    	try {
			    DB::connection()->getPdo();
			} catch (\Exception $e) {
			    die("The system is under maintenance.");
			}

			// if(get_server_info()['server_type'] == 'sxd') {
			// 	die('Cute Brains is down for maintenance. We will be back soon');
			// }

    	date_default_timezone_set('Asia/Kolkata');
    	// DB::connection()->enableQueryLog();
    }

    protected function websiteUnderMaintance() {
	    // 	if(!is_null(request()->input('running')) && request()->input('running') == 'run') {
	    // 		DB::table('settings')->where('fieldName', 'site_status')->update([
					// 	'fieldValue' => 1
					// ]);
	    // 	} elseif(!is_null(request()->input('running')) && request()->input('running') == 'down') {
	    // 		DB::table('settings')->where('fieldName', 'site_status')->update([
					// 	'fieldValue' => 0
					// ]);
	    // 	}

	    // 	$site_status = DB::table('settings')->where('fieldName', 'site_status')->first()->fieldValue;
	    // 	if($site_status == 0) {
	    //     echo 'Service under maintenance.';
	    //     die;
	    // 	}
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
