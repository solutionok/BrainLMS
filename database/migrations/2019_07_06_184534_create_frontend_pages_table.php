<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateFrontendPagesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('frontend_pages', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('page_title', 250);
			$table->string('page_permalink', 250);
			$table->text('page_content');
			$table->string('page_status', 250);
			$table->string('page_visibility', 250);
			$table->integer('page_navbar_visible');
			$table->string('page_password', 250);
			$table->string('page_publish_date', 250);
			$table->integer('page_publish_specific_date');
			$table->string('page_template', 250);
			$table->text('page_feat_image', 65535);
			$table->text('page_slider_images');
			$table->integer('page_order')->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('frontend_pages');
	}

}
