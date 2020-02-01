<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateComplaintsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('complaints', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('comp_title', 250);
			$table->text('comp_desc', 65535);
			$table->integer('comp_type');
			$table->integer('comp_source');
			$table->string('FullName', 250);
			$table->string('phoneNo', 250);
			$table->string('email', 250);
			$table->string('Address', 250);
			$table->string('enq_date', 250);
			$table->string('nxt_fup', 250);
			$table->string('enq_file', 250);
			$table->text('enq_notes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('complaints');
	}

}
