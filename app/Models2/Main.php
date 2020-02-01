<?php

namespace App\Models2;

use App\Models2\ClassSchedule;
use App\Models2\MClass;
use App\Models2\Section;
use App\Models2\AcademicYear;
use App\Models2\User;
use Illuminate\Database\Eloquent\Model;

class Main extends Model {

	// Classes & Sections ------------------------------------------------

	public static function getSectionsByClassId($class_id) {
		return Section::where('classId', $class_id)->get()
			->toArray();
	}

	public static function getSectionsIdsByClassesIds($classes_ids) {
		return Section::whereIn('classId', $classes_ids)
			->pluck('id');
	}

	public static function getClassesBySectionIds($sectionsIds) {
		$classesIds = Section::whereIn('id', $sectionsIds)->pluck('classId');
		$classes = self::whereIn('id', $classesIds);
		return $classes;
	}

	public static function getClassIdsBySectionIds($section_ids) {
		$class_ids = Section::whereIn('id', $section_ids)
			->distinct()
			->pluck('classId')
			->toArray();

		return $class_ids;
	}

	public static function getClassIdBySectionId($sectionId) {
		if(Section::where('id', $sectionId)->count()) {
			return Section::where('id', $sectionId)->first()->classId;
		} else {
			return 0;
		}
	}

	public static function getTeacherIdsByClassId($class_id) {
		$section_ids = Section::where('classId', $class_id)->pluck('id')->toArray();
		$teacher_ids = ClassSchedule::whereIn('sectionId', $section_ids)
			->select('teacherId')
			->distinct()
			->pluck('teacherId')
			->toArray();

		return $teacher_ids;
	}

	public static function getTeacherIdsBySectionId($section_id) {
		$teacher_ids = ClassSchedule::where('sectionId', $section_id)
			->select('teacherId')
			->distinct()
			->pluck('teacherId')
			->toArray();

		return $teacher_ids;
	}

	public static function getClassesIdsOfStudentsIds($students_ids) {
		$class_ids = User::where('role', 'student')
			->whereIn('id', $students_ids)
		  ->select('studentClass')
		  ->pluck('studentClass')
		  ->toArray();

		return $class_ids;
	}

	public static function getClassesIdsByParentId($parent_id) {
		// get students ids by parent id
		$students_ids = User::getStudentsIdsFromParentId($parent_id);

		// get class ids by students ids
		$classes_ids = self::getClassesIdsOfStudentsIds($students_ids);

		return $classes_ids;
	}

	public static function getClassesIdsByTeacherId($teacher_id) {
		$sections_ids = ClassSchedule::where('teacherId', $teacher_id)
			->remember(60 * 60)
			->select('sectionId')
			->distinct()
			->pluck('sectionId')
			->toArray();

		$class_ids = Section::whereIn('id', $sections_ids)
			->remember(60 * 60)
			->distinct()
			->pluck('classId')
			->toArray();

		return $class_ids;
	}

	public static function getSectionIdsByTeacherId($teacher_id) {
		$sections_ids = ClassSchedule::where('teacherId', $teacher_id)
			->remember(60 * 60)
			->select('sectionId')
			->distinct()
			->pluck('sectionId')
			->toArray();

		return $sections_ids;
	}

	public static function getSectionsOfClassTeacher($teacher_id) {
		return self::where("classTeacherId", 'LIKE', '%"' . $teacher_id . '"%')
			->pluck('id');
	}

	public static function getSectionsIdsByClassTeacherId($class_teacher_id) {
		return Section::where('classTeacherId', 'LIKE', '%"' . $class_teacher_id . '"%')
		  ->pluck('id');
	}

	// Classes & Sections ------------------------------------------------


	// Subjects ----------------------------------------------------------

	public static function getSubjectsIdsByClassesIds($classes_ids) {
		$section_ids = Section::whereIn('classId', $classes_ids)->distinct()->pluck('id')->toArray();
		$subject_ids = ClassSchedule::whereIn('sectionId', $section_ids)
			->select('subjectId')
			->distinct()
			->pluck('subjectId')
			->toArray();

		return $subject_ids;
	}

	public static function getSubjectIdsByClassId($class_id) {
		$section_ids = Section::where('classId', $class_id)->pluck('id')->toArray();
		$subject_ids = ClassSchedule::whereIn('sectionId', $section_ids)
			->select('subjectId')
			->distinct()
			->pluck('subjectId')
			->toArray();

		return $subject_ids;
	}

	public static function getSubjectsIdsByTeacherId($teacher_id) {
		$subject_ids = ClassSchedule::where('teacherId', $teacher_id)
			->remember(60 * 60)
			->select('subjectId')
			->distinct()
			->pluck('subjectId')
			->toArray();

		return $subject_ids;
	}

	public static function getTeacherIdsBySubjectId($subject_id) {
		$teacher_ids = ClassSchedule::where('subjectId', $subject_id)
			->select('teacherId')
			->distinct()
			->pluck('teacherId')
			->toArray();

		return $teacher_ids;
	}

	public static function getClassIdsBySubjectId($subject_id) {
		$section_ids = ClassSchedule::where('subjectId', $subject_id)
			->select('sectionId')
			->distinct()
			->pluck('sectionId')
			->toArray();

		$class_ids = self::getClassIdsBySectionIds($section_ids);

		return $class_ids;
	}

	// Subjects ----------------------------------------------------------
}
