<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHostelCatTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('hostel_cat', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('catTitle', 250);
			$table->integer('catFees');
			$table->text('catNotes', 65535);
			// Relations
			$table->integer('catTypeId'); // one - hostel_cat itself relation
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('hostel_cat');
	}

}
