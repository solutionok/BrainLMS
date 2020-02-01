<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateGradeLevelsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('grade_levels', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('gradeName', 250);
			$table->text('gradeDescription', 65535)->nullable();
			$table->string('gradePoints', 250);
			$table->string('gradeFrom', 250);
			$table->string('gradeTo', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('grade_levels');
	}

}
