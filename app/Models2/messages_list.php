<?php

namespace App\Models2;

use App\Models2\Message;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class messages_list extends Model {
	public $timestamps = false;
	protected $table = 'messages_list';
	protected $appends = [
		'send_status',
		// 'sender_receiver_data',
		// 'receiver_role'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'userId', 'id');
	}

	public function getMainMessageAttribute()
	{
		return Message::where('messageId', $this->attributes['id'])->first();
	}

	public function getSendStatusAttribute()
	{
		$status = '';
		$fromId = Message::where('messageId', $this->attributes['id'])->select('fromId')->first()->fromId;

		if($this->attributes['userId'] != $fromId) {
			$status = 'received';
		} else {
			$status = 'sent';
		}

		return $status;
	}

	// public function getSenderReceiverDataAttribute() {
	// 	$user = User::find($this->attributes['toId']);
	// 	return $user;
	// }

	// public function getReceiverRoleAttribute() {
	// 	$role = User::find($this->attributes['toId'])->role;
	// 	return $role;
	// }
}
