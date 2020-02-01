<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePaymentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('payments', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('paymentTitle', 250);
			$table->text('paymentDescription', 65535)->nullable();
			$table->integer('paymentStudent');
			$table->text('paymentRows');
			$table->float('paymentAmount', 10, 0);
			$table->float('paymentDiscount', 10, 0);
			$table->float('paymentDiscounted', 10, 0);
			$table->float('paidAmount', 10, 0)->default(0);
			$table->integer('paymentStatus');
			$table->integer('paymentDate');
			$table->integer('dueDate');
			$table->integer('dueNotified')->default(0);
			$table->string('paymentUniqid', 250)->nullable();
			$table->text('paymentSuccessDetails', 65535)->nullable();
			$table->string('paidMethod', 250)->nullable();
			$table->integer('paidTime')->nullable();
			$table->integer('discount_id');
			$table->string('fine_amount')->nullable()->default('0');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('payments');
	}

}
