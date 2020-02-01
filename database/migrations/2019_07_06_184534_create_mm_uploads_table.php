<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMmUploadsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mm_uploads', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->string('file_orig_name', 250);
			$table->string('file_uploaded_name', 250);
			$table->integer('file_size');
			$table->string('file_mime', 250);
			$table->integer('file_uploaded_time');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mm_uploads');
	}

}
