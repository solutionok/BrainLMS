<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMobNotificationsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mob_notifications', function(Blueprint $table) {
			$table->increments('id');
			$table->text('notifTo');
			$table->text('notifToIds');
			$table->text('notifData');
			$table->integer('notifDate');
			$table->string('notifSender');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mob_notifications');
	}

}
