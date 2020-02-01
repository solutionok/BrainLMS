<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHomeworksTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('homeworks', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('homeworkTitle', 250);
			$table->text('homeworkDescription')->nullable();
			$table->string('homeworkFile', 250);
			$table->string('homeworkDate', 250);
			$table->integer('homeworkSubmissionDate');
			$table->integer('homeworkEvaluationDate')->nullable();
			// Relations
			$table->text('classId', 65535); // many
			$table->text('sectionId', 65535); // many
			$table->text('studentsCompleted'); // many
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
		Schema::drop('homeworks');
	}

}
