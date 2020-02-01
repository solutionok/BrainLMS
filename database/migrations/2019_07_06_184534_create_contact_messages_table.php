<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateContactMessagesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('contact_messages', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('mail_subject', 250);
			$table->string('firstName', 250);
			$table->string('lastName', 250);
			$table->string('email', 250);
			$table->text('message');
			$table->integer('message_time');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('contact_messages');
	}

}
