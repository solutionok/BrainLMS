<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNotificationsMobHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
    	Schema::create('notifications_mob_history', function(Blueprint $table) {
        $table->increments('id');
				$table->string('name');
				$table->text('value')->nullable();
				$table->integer('user_id')->nullable()->unsigned(); // one
				$table->string('date');
				$table->string('type')->nullable();
				$table->string('payload_id')->nullable();
				$table->boolean('is_seen')->default(0)->nullable();
				$table->timestamps();
    	});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('notifications_mob_history');
    }
}
