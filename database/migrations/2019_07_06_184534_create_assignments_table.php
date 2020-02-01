<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAssignmentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('assignments', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('AssignTitle', 250);
			$table->text('AssignDescription', 65535)->nullable();
			$table->string('AssignFile', 250);
			$table->string('AssignDeadLine', 250);
			// Relations
			$table->text('classId', 65535); // many
			$table->text('sectionId', 65535); // many
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
		Schema::drop('assignments');
	}

}
