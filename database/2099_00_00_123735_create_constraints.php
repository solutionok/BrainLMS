<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateConstraints extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('assignments_answers', function (Blueprint $table) {
            $table->foreign('assignmentId')
                ->references('id')->on('assignments')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('userId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('assignments', function (Blueprint $table) {
            // $table->foreign('classId')
            //     ->references('id')->on('classes')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');

            // $table->foreign('sectionId')
            //     ->references('id')->on('sections')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');

            $table->foreign('subjectId')
                ->references('id')->on('subject')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('teacherId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('attendance', function (Blueprint $table) {
            $table->foreign('classId')
                ->references('id')->on('classes')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('subjectId')
                ->references('id')->on('subject')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('studentId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('class_schedule', function (Blueprint $table) {
            $table->foreign('classId')
                ->references('id')->on('classes')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('sectionId')
                ->references('id')->on('sections')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('subjectId')
                ->references('id')->on('subject')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('teacherId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('classes', function (Blueprint $table) {
            $table->foreign('classAcademicYear')
                ->references('id')->on('academic_year')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('dormitoryId')
                ->references('id')->on('dormitories')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('exam_marks', function (Blueprint $table) {
            $table->foreign('examId')
                ->references('id')->on('exams_list')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('classId')
                ->references('id')->on('classes')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('subjectId')
                ->references('id')->on('subject')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('studentId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('homeworks', function (Blueprint $table) {
            $table->foreign('subjectId')
                ->references('id')->on('subject')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('teacherId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('hostel_cat', function (Blueprint $table) {
            $table->foreign('catTypeId')
                ->references('id')->on('hostel_cat')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('income', function (Blueprint $table) {
            $table->foreign('incomeCategory')
                ->references('id')->on('income_cat')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('items_stock', function (Blueprint $table) {
            $table->foreign('store_id')
                ->references('id')->on('stores')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('supplier_id')
                ->references('id')->on('suppliers')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('library_issue', function (Blueprint $table) {
            // $table->foreign('issue_id')
            //     ->references('id')->on('inv_issue')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');

            // $table->foreign('user_id')
            //     ->references('id')->on('users')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');

            $table->foreign('book_id')
                ->references('id')->on('book_library')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('media_items', function (Blueprint $table) {
            $table->foreign('albumId')
                ->references('id')->on('media_albums')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('messages_list', function (Blueprint $table) {
            $table->foreign('userId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('toId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('messages', function (Blueprint $table) {
            $table->foreign('userId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('fromId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('toId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('mm_uploads', function (Blueprint $table) {
            $table->foreign('user_id')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('online_exams_grades', function (Blueprint $table) {
            $table->foreign('examId')
                ->references('id')->on('exams_list')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('studentId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('payroll_history', function (Blueprint $table) {
            $table->foreign('userid')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('pay_by_userid')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('sections', function (Blueprint $table) {
            $table->foreign('classId')
                ->references('id')->on('classes')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            // $table->foreign('teacherId')
            //     ->references('id')->on('users')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');
        });

        Schema::table('student_academic_years', function (Blueprint $table) {
            $table->foreign('studentId')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('academicYearId')
                ->references('id')->on('academic_year')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('classId')
                ->references('id')->on('classes')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('sectionId')
                ->references('id')->on('sections')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('student_docs', function (Blueprint $table) {
            $table->foreign('user_id')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('study_material', function (Blueprint $table) {
            // $table->foreign('class_id')
            //     ->references('id')->on('classes')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');

           	// $table->foreign('sectionId')
            //     ->references('id')->on('sections')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');

            $table->foreign('subject_id')
                ->references('id')->on('subject')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('teacher_id')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('subject', function (Blueprint $table) {
            // $table->foreign('teacherId')
            //     ->references('id')->on('users')
            //     ->onUpdate('cascade')
            //     ->onDelete('cascade');
        });

        Schema::table('users', function (Blueprint $table) {
            $table->foreign('role_perm')
                ->references('id')->on('roles')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('department')
                ->references('id')->on('departments')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreign('designation')
                ->references('id')->on('designations')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('vacation', function (Blueprint $table) {
            $table->foreign('userid')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });

        Schema::table('notifications_mob_history', function (Blueprint $table) {
            $table->foreign('user_id')
                ->references('id')->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });
    }
}
