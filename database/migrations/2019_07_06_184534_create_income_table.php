<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateIncomeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('income', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('incomeDate');
			$table->string('incomeTitle', 250);
			$table->integer('incomeAmount');
			$table->integer('incomeCategory');
			$table->string('incomeImage', 250);
			$table->text('incomeNotes', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('income');
	}

}
