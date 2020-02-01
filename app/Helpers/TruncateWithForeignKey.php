<?php

namespace App\Helpers;

use Illuminate\Support\Facades\DB;

trait TruncateWithForeignKey {

	public function TruncateWithForeignKey($tableName)
	{
		DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table($tableName)->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
	}

}