<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHostelTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('hostel', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('hostelTitle', 250);
			$table->string('hostelType', 10);
			$table->text('hostelAddress', 65535);
			$table->text('hostelManager', 65535);
			$table->text('managerPhoto', 65535);
			$table->text('managerContact', 65535);
			$table->text('hostelNotes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('hostel');
	}

}
