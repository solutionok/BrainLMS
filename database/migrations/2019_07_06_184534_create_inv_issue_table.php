<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateInvIssueTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('inv_issue', function(Blueprint $table)
		{
			$table->increments('id')->index('id_2');
			$table->string('refno', 250);
			$table->integer('item_cat');
			$table->integer('item_title');
			$table->integer('qty');
			$table->text('issue_tu', 65535);
			$table->integer('issue_date');
			$table->integer('ret_date');
			$table->integer('is_returned')->default(0);
			$table->string('attachment', 250);
			$table->text('issue_notes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('inv_issue');
	}

}
