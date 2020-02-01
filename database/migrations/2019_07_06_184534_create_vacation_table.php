<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateVacationTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('vacation', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('userid'); // one
			$table->string('vacDate', 250);
			$table->integer('acYear'); // one
			$table->string('role', 10);
			$table->integer('acceptedVacation')->nullable()->default(-1);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('vacation');
	}

}
