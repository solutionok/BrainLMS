<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePayrollHistoryTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('payroll_history', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('userid');
			$table->integer('pay_by_userid');
			$table->string('salary_type', 250);
			$table->decimal('salary_value', 10, 0);
			$table->decimal('hour_overtime', 10, 0);
			$table->decimal('hour_count', 10, 0);
			$table->integer('pay_month');
			$table->integer('pay_year');
			$table->integer('pay_date');
			$table->decimal('pay_amount', 10, 0);
			$table->string('pay_method', 250);
			$table->text('pay_comments', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('payroll_history');
	}

}
