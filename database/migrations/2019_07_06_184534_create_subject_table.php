<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSubjectTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('subject', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('subjectTitle', 250);
			$table->string('passGrade', 250);
			$table->string('finalGrade', 250);
			// Relations
			$table->text('teacherId', 65535)->nullable(); // many - real relation from class_schedule table
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('subject');
	}

}
