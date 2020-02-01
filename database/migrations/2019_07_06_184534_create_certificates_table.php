<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCertificatesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('certificates', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('certificate_name', 250);
			$table->text('header_left', 65535);
			$table->text('header_right', 65535);
			$table->text('header_middle', 65535);
			$table->text('main_title', 65535);
			$table->text('main_content', 65535);
			$table->text('footer_left', 65535);
			$table->text('footer_right', 65535);
			$table->text('footer_middle', 65535);
			$table->string('certificate_image', 250);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('certificates');
	}

}
