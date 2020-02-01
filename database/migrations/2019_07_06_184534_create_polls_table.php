<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePollsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('polls', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('pollTitle', 250);
			$table->text('pollOptions', 65535);
			$table->string('pollTarget', 10);
			$table->integer('pollStatus')->default(1);
			$table->text('userVoted', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('polls');
	}

}
