<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMessagesListTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('messages_list', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('lastMessage', 250);
			$table->string('lastMessageDate', 250);
			$table->integer('messageStatus');
			$table->boolean('enable_reply')->default(1);
			// Relations
			$table->integer('userId'); // one
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
		Schema::drop('messages_list');
	}

}
