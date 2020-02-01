<?php

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	public $timestamps = false;

	public $customPermissionsDecoded = "";

	protected $table = 'users';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password');

	/**
	 * Get the unique identifier for the user.
	 *
	 * @return mixed
	 */
	public function getAuthIdentifier()
	{
		return $this->getKey();
	}

	/**
	 * Get the password for the user.
	 *
	 * @return string
	 */
	public function getAuthPassword()
	{
		return $this->password;
	}

	/**
	 * Get the e-mail address where password reminders are sent.
	 *
	 * @return string
	 */
	public function getReminderEmail()
	{
		return $this->email;
	}

	public function getRememberToken()
	{
	    return $this->remember_token;
	}

	public function setRememberToken($value)
	{
	    $this->remember_token = $value;
	}

	public function getRememberTokenName()
	{
	    return 'remember_token';
	}

	public function customPermissionsAsJson()
	{
		if($this->customPermissionsDecoded == ""){
			$this->customPermissionsDecoded = json_decode($this->customPermissions);
		}
		return $this->customPermissionsDecoded;
	}

	public function scopeHasThePerm($perm)
	{
		if($this->role == "admin" AND $this->customPermissionsType == "custom" AND is_array($this->customPermissionsAsJson()) AND !in_array($perm,$this->customPermissionsAsJson())){
			return false;
		}else{
			return true;
		}
	}
}
