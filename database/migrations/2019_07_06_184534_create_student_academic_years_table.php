<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateStudentAcademicYearsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('student_academic_years', function(Blueprint $table)
		{
			$table->increments('id');
			// Relations
			$table->integer('studentId'); // one
			$table->integer('academicYearId'); // one
			$table->integer('classId'); // one
			$table->integer('sectionId')->default(0); // one
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('student_academic_years');
	}

}
