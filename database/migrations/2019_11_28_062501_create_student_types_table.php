<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('student_types', function(Blueprint $table) {
        $table->increments('id');
				$table->string('title');
				$table->text('description')->nullable();
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
        Schema::drop('student_types');
    }
}
