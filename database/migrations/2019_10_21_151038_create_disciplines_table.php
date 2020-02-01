<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDisciplinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('disciplines', function(Blueprint $table) {
        $table->increments('id');
				$table->string('title');
				$table->text('description');
				$table->integer('trial_date'); // timestamp
				$table->text('complained_by'); // JSON
				$table->text('complained_against'); // JSON
				$table->text('responsible_officials'); // JSON
				$table->text('jury'); // JSON
				$table->text('comments')->nullable();
				$table->string('status_id')->default(1); // 1: pending
				$table->string('attachment_file')->nullable();
				$table->string('created_at');
				$table->string('updated_at');
    	});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('disciplines');
    }
}
