<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateExamMarksTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('exam_marks', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('examMark', 65535);
			$table->string('totalMarks', 250);
			$table->text('markComments', 65535)->nullable();
			// Relations
			$table->integer('examId'); // one
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
		Schema::drop('exam_marks');
	}

}
