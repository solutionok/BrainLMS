<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSubjectVideosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('subject_videos', function(Blueprint $table){
				$table->increments('id');
				$table->string('title');
				$table->string('description')->nullable();
				$table->integer('class_id')->nullable();
				$table->integer('subject_id')->nullable();
				$table->string('sub_category1')->nullable();
				$table->string('sub_category2')->nullable();
				$table->text('link');
				$table->boolean('is_english')->default(1);
				$table->timestamps();
				$table->softDeletes();
			});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::drop('subject_videos');
    }
}
