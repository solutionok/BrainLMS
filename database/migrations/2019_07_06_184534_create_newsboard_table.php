<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateNewsboardTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('newsboard', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('newsTitle', 250);
			$table->text('newsText');
			$table->string('newsFor', 250);
			$table->integer('newsDate');
			$table->string('newsImage', 250);
			$table->integer('fe_active');
			$table->integer('creationDate');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('newsboard');
	}

}
