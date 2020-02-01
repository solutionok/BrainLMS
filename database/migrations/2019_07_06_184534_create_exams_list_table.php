<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateExamsListTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('exams_list', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('examTitle', 250);
			$table->text('examDescription', 65535)->nullable();
			$table->string('examDate', 250);
			$table->integer('examEndDate');
			// Relations
			$table->integer('examAcYear'); // one
			$table->text('examClasses'); // many
			$table->text('examMarksheetColumns'); // many
			$table->text('examSchedule'); // many - object
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('exams_list');
	}

}
