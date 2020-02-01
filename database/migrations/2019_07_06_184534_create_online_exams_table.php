<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOnlineExamsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('online_exams', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('examTitle', 250);
			$table->text('examDescription', 65535)->nullable();
			$table->string('examClass', 250);
			$table->text('sectionId', 65535);
			$table->integer('examTeacher');
			$table->integer('examSubject');
			$table->string('examDate', 250);
			$table->integer('exAcYear');
			$table->string('ExamEndDate', 250);
			$table->integer('examTimeMinutes')->default(0);
			$table->integer('examDegreeSuccess');
			$table->integer('ExamShowGrade')->default(0);
			$table->integer('random_questions');
			$table->text('examQuestion', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('online_exams');
	}

}
