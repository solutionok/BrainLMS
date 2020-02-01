<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOnlineExamsQuestionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('online_exams_questions', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('question_text');
			$table->string('question_type', 250);
			$table->text('question_answers', 65535);
			$table->float('question_mark', 10, 0);
			$table->string('question_image', 250);
			$table->integer('question_subject');
			$table->integer('employee_id');
			$table->integer('is_shared')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('online_exams_questions');
	}

}
