<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTransportationTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('transportation', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('transportTitle', 250);
			$table->text('routeDetails', 65535)->nullable();
			$table->text('vehicles_list', 65535);
			$table->string('transportFare', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('transportation');
	}

}
