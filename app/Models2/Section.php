<?php

namespace App\Models2;

use Illuminate\Database\Eloquent\Model;
use Watson\Rememberable\Rememberable;

class Section extends Model {
	use Rememberable;

	public $timestamps = false;
	protected $table = 'sections';
}
