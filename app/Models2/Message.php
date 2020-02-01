<?php

namespace App\Models2;

use App\Models2\User;
use Illuminate\Database\Eloquent\Model;

class Message extends Model {
	public $timestamps = false;
	protected $table = 'messages';
  protected $appends = [
    'dateSent',
  ];

	public static function getReceivedMessages()
	{
		User::$withoutAppends = true;
		return self::with('from')
		  ->where('toId', \Auth::user()->id)
		  ->get();
	}

	public function from() {
		return $this->belongsTo(User::class, 'fromId');
	}

	public function getDateSentAttribute()
	{
		return date('m/d/Y', $this->attributes['dateSent']);
	}
}