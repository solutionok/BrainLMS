<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAttendanceTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('attendance', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('date', 250);
			$table->integer('status');
			$table->string('in_time', 20);
			$table->string('out_time', 20);
			$table->text('attNotes', 65535);
			// Relations
			$table->integer('classId'); // one
			$table->integer('subjectId'); // one
			$table->integer('studentId'); // one
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('attendance');
	}

}
