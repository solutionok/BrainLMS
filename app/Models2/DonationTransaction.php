<?php

namespace App\Models2;

use App\Models2\User;
use Illuminate\Database\Eloquent\Model;

class DonationTransaction extends Model {
	public $timestamps = false;
	protected $table = 'donation_transactions';
	public $appends = ['user_name'];

	public static function allStatuses() {
		return [
			'0' => 'Failed',
			'1' => 'Success',
			'2' => 'Awaiting',
		];
	}

	public static function getStatus($value) {
		if(isset(self::allStatuses()[$value])) {
			return self::allStatuses()[$value];
		} else {
			return $value;
		}
	}

	public function getUserNameAttribute() {
		if(User::where('id', $this->attributes['user_id'])->count()) {
			return User::find($this->attributes['user_id'])->fullName;
		} else {
			return '-';
		}
	}

}
