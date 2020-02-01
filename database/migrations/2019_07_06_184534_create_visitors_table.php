<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateVisitorsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('visitors', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('pass_id', 250);
			$table->string('fullName', 250);
			$table->string('phoneNo', 250);
			$table->string('email', 250);
			$table->string('id_pass_id', 250);
			$table->integer('no_pers')->default(1);
			$table->string('usr_type', 250);
			$table->text('student', 65535);
			$table->string('std_relation', 250);
			$table->string('comp_name', 250);
			$table->text('to_meet', 65535);
			$table->text('purpose', 65535);
			$table->text('check_in', 65535);
			$table->text('check_out', 65535);
			$table->string('docs', 250);
			$table->text('visit_notes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('visitors');
	}

}
