<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEventsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('events', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('eventTitle', 250);
			$table->text('eventDescription')->nullable();
			$table->string('eventFor', 10)->nullable();
			$table->string('enentPlace', 250)->nullable();
			$table->text('eventImage', 65535);
			$table->integer('fe_active');
			$table->string('eventDate', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('events');
	}

}
