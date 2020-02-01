<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOnlineExamsGradesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('online_exams_grades', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('examId');
			$table->integer('studentId');
			$table->text('examQuestionsAnswers', 65535)->nullable();
			$table->integer('examGrade')->nullable();
			$table->string('examDate', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('online_exams_grades');
	}

}
