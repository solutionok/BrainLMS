<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateClassesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('classes', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('className');
			// Relations
			$table->integer('classAcademicYear'); // one
			$table->integer('dormitoryId')->nullable(); // one
			$table->text('classTeacher')->nullable(); // many - real relation from class_schedule table
			$table->text('classSubjects')->nullable(); // many - real relation from class_schedule table
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('classes');
	}

}
