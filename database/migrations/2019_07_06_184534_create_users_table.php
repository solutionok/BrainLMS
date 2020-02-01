<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('username', 250);
			$table->string('email', 200);
			$table->string('password', 100);
			$table->string('remember_token', 250);
			$table->string('fullName', 250);
			$table->string('role', 10);
			$table->integer('role_perm'); // one
			$table->integer('department')->nullable(); // one
			$table->integer('designation')->nullable(); // one
			$table->integer('studentAcademicYear'); // one
			$table->integer('activated')->default(1);
			$table->string('studentRollId', 250)->nullable();
			$table->string('admission_number', 250);
			$table->integer('admission_date');
			$table->integer('std_category');
			$table->text('auth_session', 65535);
			$table->integer('birthday')->default(0);
			$table->string('gender', 10)->nullable();
			$table->text('address', 65535)->nullable();
			$table->string('phoneNo', 250)->nullable();
			$table->string('mobileNo', 250)->nullable();
			$table->integer('studentClass')->nullable()->default(0);
			$table->integer('studentSection')->nullable()->default(0);
			$table->integer('studentType')->nullable();
			$table->string('religion', 250);
			$table->string('parentProfession', 250)->nullable();
			$table->text('parentOf', 65535);
			$table->string('photo', 250)->nullable()->default('');
			$table->text('isLeaderBoard', 65535);
			$table->string('restoreUniqId', 250);
			$table->integer('transport')->default(0);
			$table->integer('transport_vehicle')->nullable()->default(0);
			$table->integer('hostel'); // one
			$table->text('medical');
			$table->string('user_position', 250);
			$table->integer('defLang')->default(0);
			$table->string('defTheme', 20);
			$table->string('salary_type', 250);
			$table->integer('salary_base_id');
			$table->text('comVia', 65535);
			$table->text('father_info', 65535);
			$table->text('mother_info', 65535);
			$table->integer('biometric_id');
			$table->string('library_id', 250);
			$table->integer('account_active')->default(1);
			$table->string('customPermissionsType', 10)->nullable();
			$table->text('customPermissions', 65535);
			$table->text('firebase_token');
			$table->date('updated_at');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
	}

}
