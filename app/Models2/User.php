<?php

namespace App\Models2;

use App\Models2\ClassSchedule;
use App\Models2\MClass;
use App\Models2\Main;
use App\Models2\Section;
use App\Models2\StudentAcademicYear;
use App\Models2\academic_year;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;

class User extends Authenticatable {
	public $timestamps = false;
	public $customPermissionsDecoded = "";
	protected $table = 'users';
	protected $hidden = array('password');
	public $appends = ['sections', 'classes', 'user_log_info', 'teacher_availability_info'];

	//---------------------------------------------------------

	public static $withoutAppends = false;
	protected function getArrayableAppends() {
    if(self::$withoutAppends){
        return [];
    }
    return parent::getArrayableAppends();
	}

	public function mclass() {
		return $this->belongsTo(MClass::class, 'studentClass', 'id');
	}

	public function section() {
		return $this->belongsTo(Section::class, 'studentSection', 'id');
	}

	public function transport() {
		return $this->belongsTo(Transportation::class, 'transport', 'id');
	}

	public function transport_vehicle() {
		return $this->belongsTo(TransportVehicle::class, 'transport_vehicle', 'id');
	}

	//---------------------------------------------------------

	public function getSectionsAttribute() {
		$section_ids = Main::getSectionIdsByTeacherId($this->attributes['id']);
		$data = Section::whereIn('id', $section_ids)->get()->toArray();
		return $data;
	}

	public function getClassesAttribute() {
		$class_ids = Main::getClassesIdsByTeacherId($this->attributes['id']);
		$data = MClass::whereIn('id', $class_ids)->get()->toArray();
		return $data;
	}

	public function getUserLogInfoAttribute() {
		$user_info = '';

		if($this->attributes['id'] > 0) {
			if(isset($this->attributes['username'])) {
				$username = ' / ' . $this->attributes['username'];
			} else {
				$username = '';
			}
			$user_info .= '<b style="font-size: 13px; font-weight: 500">' . $this->attributes['fullName'] . $username . '</b>';
			if(isset($this->attributes['role'])) {
				$user_info .= '<br>';
				$user_info .= '<b style="font-size: 13px">' . 'Role: ' . $this->attributes['role'] . '</b>';
			}
		}

		return $user_info;
	}

	public function getTeacherAvailabilityInfoAttribute() {
		$info = '';

		if($this->attributes['id'] > 0) {
			$info .= '<b style="font-size: 13px; font-weight: 500">' . $this->attributes['fullName'] . '</b><br>';
			if(isset($this->attributes['username'])) {
				$info .= '<b style="font-size: 13px;">' . $this->attributes['username'] . '</b><br>';
			}
			$info .= '<b style="font-size: 13px;">Emp ID: ' . $this->attributes['id'] . '</b>';
		}

		return $info;
	}

	//---------------------------------------------------------

	public static function getRealParentIdsFromStudentId($student_id) {
		$parent_ids = [];
		$query = self::where('role', 'parent')
			->select('id')
		  ->where('parentOf', 'LIKE', '%"id":' . $student_id . '%');

		if($query->count()) {
			$parent_ids = $query->pluck('id');
		}

		return $parent_ids;
	}

	public static function getParentIdsFromStudentId($student_id) {
		$parent_ids = [];
		$query = self::where('role', 'parent')
			->select('id')
		  ->where('parentOf', 'LIKE', '%"id":' . $student_id . '%');

		if($query->count()) {
			$parent_ids = $query->get('id')->toArray();
		}

		return $parent_ids;
	}

	public static function getStudentsIdsFromParentId($parent_id) {
		$student_ids = [];
		$students_array = json_decode(self::find($parent_id)->parentOf);
		if(count($students_array)) {
			foreach ($students_array as $key => $value) {
				$student_ids[] = $value->id;
			}
		}
		return $student_ids;
	}

	public static function getStudentIdsOfTeacherByTeacherId($teacher_id) {
		$classes_ids = Main::getClassesIdsByTeacherId($teacher_id);
		$student_ids = self::getStudentsIdsFromClassesIds($classes_ids);
		return $student_ids;
	}

	public static function getTeachersIdsWhoseTeachingForStudentsIds($students_ids) {
		$classesSectionsIds = self::whereIn('id', $students_ids)->select('id', 'studentClass', 'studentSection')->get()->toArray();
		$teacher_ids = [];

		foreach ($classesSectionsIds as $key => $collection) {
			$query = ClassSchedule::where([
				'classId' => $collection['studentClass'],
				'sectionId' => $collection['studentSection']
			]);
			if($query->count()) {
				$teacher_ids[] = $query->first()->teacherId;
			}
		}

		return $teacher_ids;
	}

	public static function getStudentsIdsFromClassesIds($classes_ids) {
		$ids = [];
		$default_academic_year_id = academic_year::where('isDefault','1')->first()->id;

		foreach ($classes_ids as $key => $class_id) {
			$query = StudentAcademicYear::where('academicYearId', $default_academic_year_id)
			  ->where('classId', $class_id);

			if($query->count()) {
				$student_ids = $query->pluck('studentId')->toArray();
				$ids = array_merge($ids, $student_ids);
			}
		}

		return array_unique($ids);
	}

	public static function getBusTrackInfo($student_id) {
		$info = [];

		$info = self::with('transport', 'transport_vehicle')
		  ->where('role', 'student')
		  ->where('id', $student_id)
		  ->get();

		return $info;
	}

	public static function getUserAuhtToken() {
		$current_user = Auth::guard('web')->user();

		$format = self::find($current_user->id);
		$token = JWTAuth::fromUser($format);

		return $token;
	}
}
