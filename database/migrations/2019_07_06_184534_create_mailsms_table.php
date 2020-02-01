<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMailsmsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mailsms', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('mailTo', 65535);
			$table->string('mailType', 250);
			$table->text('messageData');
			$table->string('messageDate', 250);
			$table->string('messageSender', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mailsms');
	}

}
