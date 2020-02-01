<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMediaAlbumsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('media_albums', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('albumTitle', 250);
			$table->text('albumDescription', 65535);
			$table->string('albumImage', 250);
			$table->integer('albumParent')->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('media_albums');
	}

}
