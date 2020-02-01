<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateExpensesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('expenses', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('expenseTitle', 250);
			$table->integer('expenseDate');
			$table->integer('expenseAmount');
			$table->string('expenseImage', 250);
			$table->text('expenseNotes', 65535)->nullable();
			// Relations
			$table->integer('expenseCategory'); // one - expenses_cat
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('expenses');
	}

}
