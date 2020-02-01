<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateItemsCodeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('items_code', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('item_title', 250);
			$table->text('item_desc', 65535);
			$table->integer('item_cat');
			$table->string('item_code', 250);
			$table->string('item_pn', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('items_code');
	}

}
