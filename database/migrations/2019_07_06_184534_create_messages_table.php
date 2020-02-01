<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMessagesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('messages', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('messageText', 65535);
			$table->string('dateSent', 250);
			$table->boolean('enable_reply')->default(1);
			// Relations
			$table->integer('messageId'); // one
			$table->integer('userId'); // one
			$table->integer('fromId'); // one
			$table->integer('toId'); // one
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('messages');
	}

}
