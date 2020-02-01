<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMediaItemsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('media_items', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('albumId')->default(0);
			$table->integer('mediaType');
			$table->string('mediaURL', 250);
			$table->string('mediaURLThumb', 250)->nullable();
			$table->string('mediaTitle', 250);
			$table->text('mediaDescription', 65535);
			$table->integer('mediaDate');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('media_items');
	}

}
