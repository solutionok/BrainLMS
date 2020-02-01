<?php

namespace App\Models2;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudentType extends Model {
	use SoftDeletes;
	protected $table = 'student_types';
	protected $dates = ['deleted_at'];
}
