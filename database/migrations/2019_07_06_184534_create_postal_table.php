<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostalTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('postal', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('postal_type', 250);
			$table->string('refno', 250);
			$table->text('postal_from', 65535);
			$table->string('postal_to', 250);
			$table->text('postal_desc', 65535);
			$table->string('postal_time', 250);
			$table->string('attachment', 250);
			$table->text('postal_notes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('postal');
	}

}
