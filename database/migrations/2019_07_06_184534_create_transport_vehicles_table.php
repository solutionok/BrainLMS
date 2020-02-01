<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTransportVehiclesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('transport_vehicles', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('plate_number', 250);
			$table->string('vehicle_color', 250);
			$table->string('vehicle_model', 250);
			$table->string('driver_name', 250);
			$table->string('driver_photo', 250);
			$table->string('driver_license', 250);
			$table->text('driver_contact', 65535);
			$table->text('vehicle_notes', 65535);
			$table->integer('vehicle_type')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('transport_vehicles');
	}

}
