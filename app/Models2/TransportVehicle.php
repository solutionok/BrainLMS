<?php

namespace App\Models2;

use Illuminate\Database\Eloquent\Model;

class TransportVehicle extends Model {
	public $timestamps = false;
	protected $table = "transport_vehicles";
	public $appends = ['vehicle_type_name'];

	public static function getVehiclesTypeArray() {
		return [
			1 => 'senior',
			2 => 'junior'
		];
	}

	public function getVehicleTypeNameAttribute() {
		if(isset(self::getVehiclesTypeArray()[$this->attributes['vehicle_type']])) {
			return self::getVehiclesTypeArray()[$this->attributes['vehicle_type']];
		} else {
			return '';
		}
	}
}