<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateStudentDocsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('student_docs', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('user_id');
			$table->string('file_title', 250);
			$table->string('file_name', 250);
			$table->text('file_notes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('student_docs');
	}

}
