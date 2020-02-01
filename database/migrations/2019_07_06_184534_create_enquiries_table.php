<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEnquiriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('enquiries', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('enq_title', 250);
			$table->text('enq_desc', 65535);
			$table->integer('enq_type');
			$table->integer('enq_source');
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
		Schema::drop('enquiries');
	}

}
