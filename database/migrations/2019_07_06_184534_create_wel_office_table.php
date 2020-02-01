<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateWelOfficeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('wel_office', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('cat_title', 250);
			$table->text('cat_desc', 65535);
			$table->string('av_for', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('wel_office');
	}

}
