<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateLibraryIssueTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('library_issue', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('issue_id', 250);
			$table->text('user_id', 65535);
			$table->integer('book_id');
			$table->string('serial_num', 250);
			$table->integer('issue_date');
			$table->integer('ret_date');
			$table->integer('is_returned')->default(0);
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
		Schema::drop('library_issue');
	}

}
