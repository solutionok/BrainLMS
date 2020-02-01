<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePayrollSalaryBaseTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('payroll_salary_base', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('salary_title', 250);
			$table->decimal('salary_basic', 10, 0);
			$table->decimal('hour_overtime', 10, 0);
			$table->text('salary_allowence');
			$table->text('salary_deduction');
			$table->decimal('net_salary', 10, 0);
			$table->decimal('gross_salary', 10, 0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('payroll_salary_base');
	}

}
