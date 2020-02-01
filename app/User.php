<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Facades\JWTAuth;

class User extends Authenticatable
{
    /*
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public $timestamps = false;


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
