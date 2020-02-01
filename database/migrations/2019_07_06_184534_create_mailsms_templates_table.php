<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMailsmsTemplatesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mailsms_templates', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('templateTitle', 250);
			$table->text('templateMail')->nullable();
			$table->text('templateSMS', 65535)->nullable();
			$table->text('templateVars', 65535)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mailsms_templates');
	}

}
