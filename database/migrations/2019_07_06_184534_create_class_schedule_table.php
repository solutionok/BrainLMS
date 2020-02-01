<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateClassScheduleTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('class_schedule', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('dayOfWeek', 10);
			$table->string('startTime', 20);
			$table->string('endTime', 20);
			// Relations
			$table->integer('classId'); // one
			$table->integer('sectionId'); // one
			$table->integer('subjectId'); // one
			$table->integer('teacherId'); // one
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('class_schedule');
	}

}
