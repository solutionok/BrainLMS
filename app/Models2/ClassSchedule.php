<?php

namespace App\Models2;

use Illuminate\Database\Eloquent\Model;
use Watson\Rememberable\Rememberable;

class ClassSchedule extends Model {
	use Rememberable;

	public $timestamps = false;
	protected $table = 'class_schedule';
	protected $fillable = ['dayOfWeek', 'startTime', 'endTime', 'teacherId'];
}
