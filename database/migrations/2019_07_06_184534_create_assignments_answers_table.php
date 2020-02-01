<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAssignmentsAnswersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('assignments_answers', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('fileName', 250);
			$table->text('userNotes', 65535);
			$table->integer('userTime');
			// Relations
			$table->integer('assignmentId'); // one
			$table->integer('userId'); // one
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('assignments_answers');
	}

}
