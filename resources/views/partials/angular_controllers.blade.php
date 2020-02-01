<?php
	if(get_server_info()['server_type'] == 'local' || get_server_info()['server_type'] == 'dev') {
		srand(mt_rand(1, 9999));
		$random_num = '?v=' . mt_rand(10000, 99999);
	} else {
		// srand(mt_rand(1, 5));
		$random_num = '';
	}
?>

<script src="{{URL::asset('assets/js/Angular/controllers/mediaController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/donationTransactionController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/libraryController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/reportsController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/teachersController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/studentsController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/invoicesController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/messagesController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/sectionsController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/attendanceController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/mobileNotifController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/users_salaryController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/classScheduleController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/institutionTimetableTeacherwiseController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/institutionTimetableClasswiseController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/teacherAvailabilityController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/teacherPresenceController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/attendance_reportController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/settingsController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/userLogsController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/rolesController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/disciplinesController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/helper_controllers/communications-filter.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/helper_controllers/discipline-filter.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/homeworkController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/studentTypesController.js' . $random_num )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/academicYearController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/accountSettingsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/adminsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/assignmentsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/attendanceStatsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/certificatesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/classesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/complaintsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/con_messController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/dbexportsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/departmentsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/designationsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/dormitoriesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/employeesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/enquiriesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/eventsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/examsListController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/expensesCatController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/expensesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/frontend_pagesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/frontend_settingsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/gradeLevelsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/hostelCatController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/hostelController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/incomesCatController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/incomesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/inv_catController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/inv_issueController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/invoice_transport_scheduleController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/items_codeController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/items_stockController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/languagesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/library_issuesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/mailsmsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/mailsmsTemplatesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/mainController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/materialsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/newsboardController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/onlineExamsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/parentsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/payroll_hourlyController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/payroll_make_payController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/payroll_salaryController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/phone_callsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/pollsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/postalController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/promotionController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/registerationController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/staffAttendance_reportController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/staffAttendanceController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/staticController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/stocksstoresController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/student_categoriesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/subjectsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/suppliersController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/transport_membersController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/transport_vehiclesController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/TransportsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/vacationController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/visitorsController.js') }}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/controllers/wel_office_catController.js') }}" type="text/javascript"></script>