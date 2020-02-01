<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePaymentscollectionTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('paymentscollection', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('invoiceId');
			$table->float('collectionAmount', 10, 0);
			$table->integer('collectionDate');
			$table->string('collectionMethod', 250);
			$table->text('collectionNote', 65535);
			$table->integer('collectedBy');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('paymentscollection');
	}

}
