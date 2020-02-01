<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateStudyMaterialTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('study_material', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('material_title', 250);
			$table->text('material_description', 65535)->nullable();
			$table->string('material_file', 250)->nullable();
			// Relations
			$table->text('class_id', 65535); // many
			$table->text('sectionId', 65535); // many
			$table->integer('subject_id')->nullable(); // one
			$table->integer('teacher_id'); // one
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('study_material');
	}

}
