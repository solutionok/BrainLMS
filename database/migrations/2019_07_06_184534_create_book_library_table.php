<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBookLibraryTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('book_library', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('bookName');
			$table->text('bookDescription');
			$table->string('bookISBN');
			$table->string('bookAuthor');
			$table->string('bookPublisher');
			$table->string('bookType');
			$table->string('bookPrice')->nullable();
			$table->string('bookFile')->nullable();
			$table->integer('bookState')->nullable();
			$table->integer('bookQuantity');
			$table->text('bookShelf');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('book_library');
	}

}
