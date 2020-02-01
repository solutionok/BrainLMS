<?php

include('helper_routes.php');

Route::get('/lastappv','LoginController@lastappv');
Route::get('/login','LoginController@index')->name('login');
Route::post('/login','LoginController@attemp');
Route::get('/logout','LoginController@logout');

Route::get('/forgetpwd','LoginController@forgetpwd');
Route::post('/forgetpwd','LoginController@forgetpwdStepOne');
Route::get('/forgetpwd/{uniqid}','LoginController@forgetpwdStepTwo');
Route::post('/forgetpwd/{uniqid}','LoginController@forgetpwdStepTwo');

Route::get('/register/classes','LoginController@registerClasses');
Route::get('/register/searchStudents/{student}','LoginController@searchStudents');
Route::post('/register/sectionsList','LoginController@sectionsList');
Route::get('/register/searchUsers/{usersType}/{student}','LoginController@searchUsers');
Route::get('/register','LoginController@register');
Route::post('/register','LoginController@registerPost');

Route::get('/terms','LoginController@terms');

// Dashboard
Route::group( array('middleware'=>'web') ,function(){
	Route::get('/','frontendPagesController@index');
	Route::get('/portal','DashboardController@index');
	Route::get('/cms','DashboardController@cms');

	Route::post('auth/register', 'AuthController@register');
	Route::post('auth/token-register', 'AuthController@tokenRegister');
	Route::post('auth/authenticate', 'AuthController@authenticate');
	Route::get('auth/authenticate/user', 'AuthController@getAuthenticatedUser');

	Route::get('/dashboard','DashboardController@dashboardData');
	Route::get('/dashboard/baseUser','DashboardController@baseUser');
	Route::get('/calender','DashboardController@calender');
	Route::post('/dashboard/polls','DashboardController@savePolls');
	Route::get('/uploads/{section}/{image}','DashboardController@image');
    Route::post('/dashboard/changeAcYear','DashboardController@changeAcYear');
    Route::post('/dashboard/classesList','DashboardController@classesList');
    Route::post('/dashboard/subjectList','DashboardController@subjectList');
    Route::post('/dashboard/sectionsSubjectsList','DashboardController@sectionsSubjectsList');
    Route::get('/dashboard/profileImage/{id}','DashboardController@profileImage');
    Route::get('/dashboard/mobnotif','DashboardController@mobNotif');
    Route::get('/dashboard/mobnotif/{id}','DashboardController@mobNotif');
    Route::post('/dashaboard','DashboardController@dashaboardData');
    Route::post('/ml_upload','DashboardController@ml_upload');
    Route::get('/ml_upload/load','DashboardController@ml_load');
    Route::get('/ml_upload/load/{id}','DashboardController@ml_load');

	//Languages & phrases
	Route::get('/languages','DashboardController@index');
	Route::get('/languages/listAll','LanguagesController@listAll');
	Route::post('/languages','LanguagesController@create');
	Route::get('/languages/{id}','LanguagesController@fetch');
    Route::post('/languages/delete/{id}','LanguagesController@delete');
    Route::post('/languages/{id}','LanguagesController@edit');

	//Admins
	Route::get('/admins','DashboardController@index');
	Route::get('/admins/listAll','AdminsController@listAll');
	Route::post('/admins','AdminsController@create');
	Route::get('/admins/{id}','AdminsController@fetch');
    Route::post('/admins/account_status/{id}','AdminsController@account_status');
    Route::post('/admins/delete/{id}','AdminsController@delete');
    Route::post('/admins/{id}','AdminsController@edit');

	//Accountants
	Route::get('/employees','DashboardController@index');
	Route::get('/employees/listAll','employeesController@listAll');
	Route::get('/employees/listAll/{page}','employeesController@listAll');
	Route::post('/employees/listAll/{page}','employeesController@listAll');
	Route::post('/employees','employeesController@create');
  Route::get('/employees/fetch-by-department-id/{id}','employeesController@fetchByDepartmentId');
  Route::get('/employees/fetch-all','employeesController@fetchAll');
	Route::get('/employees/{id}','employeesController@fetch');
  Route::post('/employees/account_status/{id}','employeesController@account_status');
  Route::post('/employees/delete/{id}','employeesController@delete');
  Route::post('/employees/{id}','employeesController@edit');

	//Teachers
	Route::get('/teachers','DashboardController@index');
	Route::post('/teachers/import/{type}','TeachersController@import');
    Route::post('/teachers/reviewImport','TeachersController@reviewImport');
	Route::get('/teachers/export','TeachersController@export');
	Route::get('/teachers/exportpdf','TeachersController@exportpdf');
	Route::post('/teachers/upload','TeachersController@uploadFile');
	Route::get('/teachers/waitingApproval','TeachersController@waitingApproval');
	Route::post('/teachers/leaderBoard/{id}','TeachersController@leaderboard');
    Route::post('/teachers/approveOne/{id}','TeachersController@approveOne');
	Route::get('/teachers/profile/{id}','TeachersController@profile');
	Route::get('/teachers/listAll','TeachersController@listAll');
	Route::get('/teachers/listAll/{page}','TeachersController@listAll');
	Route::get('/teachers/get-by-class-id/{class_id}','TeachersController@fetch_teachers_by_class_id');
	Route::post('/teachers/get-by-class-section','TeachersController@fetch_by_class_and_section');
	Route::post('/teachers/get-by-class-subject','TeachersController@fetch_by_class_and_subject');
	Route::post('/teachers/listAll/{page}','TeachersController@listAll');
	Route::post('/teachers','TeachersController@create');
	Route::get('/teachers/{id}','TeachersController@fetch');
    Route::post('/teachers/leaderBoard/delete/{id}','TeachersController@leaderboardRemove');
    Route::post('/teachers/account_status/{id}','TeachersController@account_status');
    Route::post('/teachers/delete/{id}','TeachersController@delete');
    Route::post('/teachers/{id}','TeachersController@edit');

	//Students
	Route::get('/students','DashboardController@index');
  Route::get('/students/fetch-by-class-id/{id}','StudentsController@fetchByClassId');
  Route::get('/students/fetch-by-class-ids','StudentsController@fetchByClassIds');
  Route::post('/students/fetch-by-class-section','StudentsController@fetchByClassIdAndSectionId');
  Route::get('/students/fetch-all','StudentsController@fetchAll');
  Route::get('/students/get-bus-track-info/{student_id}','StudentsController@getInfoBusTrack');
    Route::get('/students/preAdmission','StudentsController@preAdmission');
	Route::post('/students/import/{type}','StudentsController@import');
    Route::post('/students/reviewImport','StudentsController@reviewImport');
	Route::get('/students/export','StudentsController@export');
	Route::get('/students/exportpdf','StudentsController@exportpdf');
	Route::post('/students/upload','StudentsController@uploadFile');
	Route::post('/students/rem_std_docs','StudentsController@rem_std_docs');
    Route::get('/students/waitingApproval','StudentsController@waitingApproval');
	Route::get('/students/gradStdList','StudentsController@gradStdList');
    Route::post('/students/account_status/{id}','StudentsController@account_status');
	Route::post('/students/approveOne/{id}','StudentsController@approveOne');
    Route::get('/students/print/marksheet/{student}/{exam}','StudentsController@marksheetPDF');
    Route::get('/students/marksheet/{id}','StudentsController@marksheet');
    Route::get('/students/medical/{id}','StudentsController@medical');
	Route::post('/students/medical','StudentsController@saveMedical');
	Route::get('/students/attendance/{id}','StudentsController@attendance');
	Route::get('/students/search_parent/{id}','StudentsController@search_parent');
	Route::get('/students/profile/{id}','StudentsController@profile');
	Route::post('/students/leaderBoard/{id}','StudentsController@leaderboard');
    Route::get('/students/listAll','StudentsController@listAll');
	Route::get('/students/listAll/{page}','StudentsController@listAll');
	Route::post('/students/listAll/{page}','StudentsController@listAll');
    Route::post('/students','StudentsController@create');
	Route::get('/students/{id}','StudentsController@fetch');
    Route::post('/students/printbulk/marksheet','StudentsController@marksheetBulkPDF');
    Route::post('/students/leaderBoard/delete/{id}','StudentsController@leaderboardRemove');
    Route::post('/students/acYear/delete/{student}/{id}','StudentsController@acYearRemove');
    Route::post('/students/delete/{id}','StudentsController@delete');
	Route::post('/students/{id}','StudentsController@edit');

	//Student Categories
	Route::get('/student_categories','DashboardController@index');
	Route::get('/student_categories/listAll','studentCategoryController@listAll');
	Route::post('/student_categories','studentCategoryController@create');
	Route::get('/student_categories/export/{type}','studentCategoryController@export');
	Route::get('/student_categories/{id}','studentCategoryController@fetch');
	Route::post('/student_categories/delete/{id}','studentCategoryController@delete');
	Route::post('/student_categories/{id}','studentCategoryController@edit');

	//Student Types
	Route::get('/student_types','DashboardController@index');
	Route::get('/student_types/listAll','studentTypeController@listAll');
	Route::post('/student_types','studentTypeController@create');
	Route::get('/student_types/export/{type}','studentTypeController@export');
	Route::get('/student_types/{id}','studentTypeController@fetch');
	Route::post('/student_types/delete/{id}','studentTypeController@delete');
	Route::post('/student_types/{id}','studentTypeController@edit');

	//Certificates
	Route::get('/certificates','DashboardController@index');
	Route::get('/certificates/listAll','certificatesController@listAll');
	Route::post('/certificates','certificatesController@create');
	Route::get('/certificates/download/{id}','certificatesController@download');
	Route::get('/certificates/export/{type}','certificatesController@export');
	Route::get('/certificates/{id}','certificatesController@fetch');
	Route::post('/certificates/delete/{id}','certificatesController@delete');
	Route::post('/certificates/{id}','certificatesController@edit');

	//Parents
	Route::get('/parents/search/{student}','ParentsController@searchStudents');
    Route::post('/parents/import/{type}','ParentsController@import');
    Route::post('/parents/reviewImport','ParentsController@reviewImport');
  Route::get('/parents/fetch-by-class-id/{id}','ParentsController@fetchByClassId');
	Route::get('/parents/fetch-all','ParentsController@fetchAll');
	Route::get('/parents/export','ParentsController@export');
	Route::get('/parents/exportpdf','ParentsController@exportpdf');
	Route::get('/parents','DashboardController@index');
	Route::post('/parents/upload','ParentsController@uploadFile');
	Route::get('/parents/waitingApproval','ParentsController@waitingApproval');
	Route::get('/parents/profile/{id}','ParentsController@profile');
	Route::post('/parents/approveOne/{id}','ParentsController@approveOne');
	Route::get('/parents/listAll','ParentsController@listAll');
	Route::get('/parents/listAll/{page}','ParentsController@listAll');
	Route::post('/parents/listAll/{page}','ParentsController@listAll');
	Route::post('/parents','ParentsController@create');
	Route::get('/parents/{id}','ParentsController@fetch');
    Route::post('/parents/account_status/{id}','ParentsController@account_status');
    Route::post('/parents/delete/{id}','ParentsController@delete');
	Route::post('/parents/{id}','ParentsController@edit');

	//Classes
	Route::get('/classes','DashboardController@index');
	Route::get('/classes/listAll','ClassesController@listAll');
	Route::get('/classes/get-class-teachers-by-class-id/{class_id}','ClassesController@get_class_teachers_by_class_id');
	Route::get('/classes/get-subjects-by-class-id/{class_id}','ClassesController@get_subjects_by_class_id');
	Route::get('/classes/get-class-id-by-class-name/{class_name}','ClassesController@getClassIdByClassName');
	Route::post('/classes','ClassesController@create');
	Route::get('/classes/fetch-all','ClassesController@fetchAll');
	Route::get('/classes/{id}','ClassesController@fetch');
    Route::post('/classes/delete/{id}','ClassesController@delete');
	Route::post('/classes/{id}','ClassesController@edit');

  //Sections
	Route::get('/sections','DashboardController@index');
	Route::get('/sections/listAll','sectionsController@listAll');
	Route::get('/sections/fetch-with-class/{class_id}','sectionsController@get_sections_with_class_id');
	Route::post('/sections','sectionsController@create');
	Route::get('/sections/{id}','sectionsController@fetch');
    Route::post('/sections/delete/{id}','sectionsController@delete');
	Route::post('/sections/{id}','sectionsController@edit');

	//subjects
	Route::get('/subjects','DashboardController@index');
	Route::get('/subjects/listAll','SubjectsController@listAll');
	Route::post('/subjects','SubjectsController@create');
	Route::get('/subjects/list-video-subjects', 'SubjectsController@listSubjectVideoSubjects');
	Route::get('/subjects/list-videos', 'SubjectsController@listSubjectVideos');
	Route::get('/subjects/{id}','SubjectsController@fetch');
  Route::post('/subjects/delete/{id}','SubjectsController@delete');
	Route::post('/subjects/{id}','SubjectsController@edit');

	//NewsBoard
	Route::get('/newsboard','DashboardController@index');
	Route::get('/newsboard/listAll/{page}','NewsBoardController@listAll');
    Route::get('/newsboard/search/{keyword}/{page}','NewsBoardController@search');
	Route::post('/newsboard','NewsBoardController@create');
	Route::get('/newsboard/{id}','NewsBoardController@fetch');
    Route::post('/newsboard/fe_active/{id}','NewsBoardController@fe_active');
    Route::post('/newsboard/delete/{id}','NewsBoardController@delete');
	Route::post('/newsboard/{id}','NewsBoardController@edit');

	//Library
	Route::get('/library','DashboardController@index');
	Route::get('/library/listAll','LibraryController@listAll');
	Route::get('/library/listAll/{page}','LibraryController@listAll');
    Route::get('/library/download/{id}','LibraryController@download');
    Route::get('/library/search/{keyword}/{page}','LibraryController@search');
	Route::post('/library','LibraryController@create');
    Route::post('/library/members','LibraryController@library_members');
    Route::post('/library/members_set','LibraryController@library_members_set');
	Route::get('/library/export','LibraryController@export');
	Route::get('/library/exportpdf','LibraryController@exportpdf');
	Route::post('/library/import/{type}','LibraryController@import');
  	Route::post('/library/reviewImport','LibraryController@reviewImport');
	Route::get('/library/{id}','LibraryController@fetch');
    Route::post('/library/delete/{id}','LibraryController@delete');
	Route::post('/library/{id}','LibraryController@edit');

	//Library Issue Book
	Route::get('/library_issues','DashboardController@index');
	Route::get('/library_issues/listAll','libraryIssuesControllers@listAll');
	Route::get('/library_issues/listAll/{page}','libraryIssuesControllers@listAll');
	Route::get('/library_issues/search/{keyword}/{page}','libraryIssuesControllers@search');
	Route::post('/library_issues','libraryIssuesControllers@create');
	Route::get('/library_issues/export/{type}','libraryIssuesControllers@export');
	Route::get('/library_issues/searchUser/{keyword}','libraryIssuesControllers@searchUser');
	Route::get('/library_issues/{id}','libraryIssuesControllers@fetch');
	Route::post('/library_issues/delete/{id}','libraryIssuesControllers@delete');
	Route::post('/library_issues/return/{id}','libraryIssuesControllers@book_return');
	Route::post('/library_issues/{id}','libraryIssuesControllers@edit');

	Route::get('/library_issues/listIssued','libraryIssuesControllers@listIssued');
	Route::get('/library_issues/listIssued/{page}','libraryIssuesControllers@listIssued');
	Route::get('/library_issues/searchIssued/{keyword}/{page}','libraryIssuesControllers@searchIssued');


	//Account Settings & user profile
	Route::get('/accountSettings','DashboardController@index');
	Route::get('/accountSettings/langs','AccountSettingsController@langs');
	Route::get('/accountSettings/data','AccountSettingsController@listAll');
	Route::post('/accountSettings/profile','AccountSettingsController@saveProfile');
	Route::post('/accountSettings/email','AccountSettingsController@saveEmail');
	Route::post('/accountSettings/password','AccountSettingsController@savePassword');
	Route::get('/accountSettings/invoices','AccountSettingsController@invoices');
	Route::get('/accountSettings/invoices/{id}','AccountSettingsController@invoicesDetails');
	Route::get('/accountSettings/get-user-profile-data','AccountSettingsController@getUserProfileData');

	// Class Schedule - Timetable
	Route::get('/classschedule','DashboardController@index');
	Route::post('/classschedule/import/{type}','ClassScheduleController@import');
	Route::post('/classschedule/reviewImport','ClassScheduleController@reviewImport');
	Route::get('/classschedule/export-full-timetables','ClassScheduleController@exportFull');
	Route::get('/classschedule/export-juniors-timetables','ClassScheduleController@exportJuniors');
	Route::get('/classschedule/export-seniors-timetables','ClassScheduleController@exportSeniors');
	Route::get('/classschedule/listAll','ClassScheduleController@listAll');

	// advanced timetable
	Route::get('/classschedule/list-teacherwise/{day_number}/{page?}','ClassScheduleController@listTeacherwise');
	Route::get('/classschedule/list-classwise/{day_number}/{page?}','ClassScheduleController@listClasswise');
	Route::get('/classschedule/fetch-parameters','ClassScheduleController@fetchParameters');
	Route::post('/classschedule/advanced-timetable/teacherwise/store','ClassScheduleController@advancedTimetableTeacherwiseStore');
	Route::post('/classschedule/advanced-timetable/classwise/store','ClassScheduleController@advancedTimetableClasswiseStore');
	Route::post('/classschedule/advanced-timetable/exclude-teacher','ClassScheduleController@advancedTimetableExcludeTeacher');
	Route::post('/classschedule/advanced-timetable/remove-period','ClassScheduleController@advancedTimetableRemovePeriod');

	Route::get('/classschedule/teacher-presence/{page?}','ClassScheduleController@teacherPresence');
	Route::get('/classschedule/teacher-availability/{page?}','ClassScheduleController@teacherAvailability');

	Route::get('/classschedule/{id}','ClassScheduleController@fetch');
	Route::get('/classschedule-teacher','ClassScheduleController@fetchForTeacher');
	Route::get('/classschedule/sub/{id}','ClassScheduleController@fetchSub');
	Route::post('/classschedule/sub/{id}','ClassScheduleController@editSub');
  Route::post('/classschedule/delete/{class}/{id}','ClassScheduleController@delete');
	Route::post('/classschedule/{id}','ClassScheduleController@addSub');

	//Site Settings
  Route::get('/settings','DashboardController@index');
	Route::post('/siteSettings/test_mail_function','SiteSettingsController@test_mail_function');
	Route::post('/siteSettings/test_sms_function','SiteSettingsController@test_sms_function');
	Route::get('/siteSettings/langs','SiteSettingsController@langs');
	Route::get('/siteSettings/{title}','SiteSettingsController@listAll');
	Route::post('/siteSettings/{title}','SiteSettingsController@save');

	//Attendance
  Route::get('/attendance','DashboardController@index');
	Route::get('/attendance/data','AttendanceController@listAll');
	Route::post('/attendance/list','AttendanceController@listAttendance');
	Route::post('/attendance/get-current-sections-and-subjects','AttendanceController@currentSectionsSubjectsList');
	Route::post('/attendance/report','AttendanceController@reportAttendance');
	Route::post('/attendance','AttendanceController@saveAttendance');
	Route::get('/attendance/stats','AttendanceController@getStats');
	Route::post('/attendance/biometric','AttendanceController@biometric');

	//Grade Levels
	Route::get('/gradeLevels','DashboardController@index');
	Route::get('/gradeLevels/listAll','GradeLevelsController@listAll');
	Route::post('/gradeLevels','GradeLevelsController@create');
	Route::get('/gradeLevels/{id}','GradeLevelsController@fetch');
    Route::post('/gradeLevels/delete/{id}','GradeLevelsController@delete');
	Route::post('/gradeLevels/{id}','GradeLevelsController@edit');

	//Exams List
	Route::get('/examsList','DashboardController@index');
	Route::get('/examsList/listAll','ExamsListController@listAll');
	Route::post('/examsList/notify/{id}','ExamsListController@notifications');
	Route::post('/examsList','ExamsListController@create');
	Route::get('/examsList/{id}','ExamsListController@fetch');
    Route::post('/examsList/getMarks','ExamsListController@fetchMarks');
	Route::post('/examsList/{id}','ExamsListController@edit');
    Route::post('/examsList/delete/{id}','ExamsListController@delete');
	Route::post('/examsList/saveMarks/{exam}/{class}/{subject}','ExamsListController@saveMarks');

	//Events
	Route::get('/events','DashboardController@index');
	Route::get('/events/listAll','EventsController@listAll');
	Route::get('/events/listAll-upcoming','EventsController@listAllUpcoming');
	Route::get('/events/events_and_notices/listAll','EventsController@listAllEventAndNotices');
	Route::post('/events','EventsController@create');
	Route::get('/events/{id}','EventsController@fetch');
    Route::post('/events/delete/{id}','EventsController@delete');
    Route::post('/events/fe_active/{id}','EventsController@fe_active');
	Route::post('/events/{id}','EventsController@edit');

	//Assignments
	Route::get('/assignments','DashboardController@index');
	Route::get('/assignments/listAll','AssignmentsController@listAll');
    Route::get('/assignments/listAnswers/{id}','AssignmentsController@listAnswers');
	Route::post('/assignments','AssignmentsController@create');
    Route::get('/assignments/download/{id}','AssignmentsController@download');
    Route::get('/assignments/downloadAnswer/{id}','AssignmentsController@downloadAnswer');
    Route::get('/assignments/{id}','AssignmentsController@fetch');
    Route::post('/assignments/checkUpload','AssignmentsController@checkUpload');
    Route::post('/assignments/delete/{id}','AssignmentsController@delete');
	Route::post('/assignments/upload/{id}','AssignmentsController@upload');
	Route::post('/assignments/{id}','AssignmentsController@edit');

	//Homework
	Route::get('/homeworks','DashboardController@index');
	Route::get('/homeworks/listAll/{page}','homeworksController@listAll');
	Route::get('/homeworks/search/{keyword}/{page}','homeworksController@search');
	Route::post('/homeworks','homeworksController@create');
    Route::get('/homeworks/download/{id}','homeworksController@download');
    Route::get('/homeworks/{id}','homeworksController@fetch');
    Route::get('/homeworks_view/{id}','homeworksController@fetch_view');
    Route::post('/homeworks/delete/{id}','homeworksController@delete');
    Route::post('/homeworks/apply/{id}','homeworksController@apply');
	Route::post('/homeworks/{id}','homeworksController@edit');

	// Discipline
	Route::get('/disciplines','DashboardController@index');
	Route::get('/disciplines/listAll/{page}','DisciplineController@listAll');
	Route::get('/disciplines/download/{id}','DisciplineController@download');
	Route::post('/disciplines','DisciplineController@create');
	Route::get('/disciplines/{id}','DisciplineController@fetch');
	Route::post('/disciplines/delete/{id}','DisciplineController@delete');
	Route::get('/discipline_view/{id}','DisciplineController@fetch_view');
	Route::post('/disciplines/save-post-comment','DisciplineController@savePostComment');
	Route::post('/disciplines/{id}','DisciplineController@edit');
	Route::get('/disciplines/fetch-by-word-complained-by/{word}','DisciplineController@fetchComplainedByByWord');
	Route::get('/disciplines/fetch-by-word-responsible-officials/{word}','DisciplineController@fetchResponsibleOfficialsByWord');
	Route::get('/disciplines/fetch-by-word-jury/{word}','DisciplineController@fetchJuryByWord');

    //Study Material
	Route::get('/materials','DashboardController@index');
	Route::get('/materials/listAll','StudyMaterialController@listAll');
	Route::post('/materials','StudyMaterialController@create');
    Route::get('/materials/download/{id}','StudyMaterialController@download');
    Route::get('/materials/{id}','StudyMaterialController@fetch');
    Route::post('/materials/delete/{id}','StudyMaterialController@delete');
	Route::post('/materials/{id}','StudyMaterialController@edit');

	//Mail / SMS
	Route::get('/mailsms','DashboardController@index');
	Route::get('/mailsms/listAll','MailSmsController@listAll');
	Route::get('/mailsms/listAll/{page}','MailSmsController@listAll');
	Route::post('/mailsms/delete/{id}','MailSmsController@delete');
	Route::get('/mailsms/templates','MailSmsController@templates');
	Route::post('/mailsms','MailSmsController@create');
	Route::get('/mailsms/settings','MailSmsController@settings');
	Route::post('/mailsms/settings','MailSmsController@settingsSave');

    //Mobile Notifications
	// Route::get('/mobileNotif','DashboardController@index');
	// Route::get('/mobileNotif/listAll','mobileNotifController@listAll');
	// Route::get('/mobileNotif/listAll/{page}','mobileNotifController@listAll');
	// Route::get('/mobileNotif/list_classes','mobileNotifController@list_classes');
	// Route::post('/mobileNotif','mobileNotifController@create');
 //    Route::post('/mobileNotif/delete/{id}','mobileNotifController@delete');

	//Messages
	Route::get('/messages','DashboardController@index');
	Route::post('/messages','MessagesController@create');
	Route::get('/messages/listAll/{page}','MessagesController@listMessages');
    Route::get('/messages/searchUser/{user}','MessagesController@searchUser');
	Route::post('/messages/read','MessagesController@read');
	Route::post('/messages/unread','MessagesController@unread');
	Route::post('/messages/delete','MessagesController@delete');
	Route::get('/messages/{id}','MessagesController@fetch');
	Route::post('/messages/{id}','MessagesController@reply');
	Route::get('/messages/ajax/{from}/{to}/{before}','MessagesController@ajax');
	Route::get('/messages/before/{from}/{to}/{before}','MessagesController@before');

	//Online Exams
	Route::get('/onlineExams','DashboardController@index');
	Route::get('/onlineExams/listAll','OnlineExamsController@listAll');
	Route::get('/onlineExams/questions','OnlineExamsController@questions');
	Route::get('/onlineExams/questions/{id}','OnlineExamsController@fetchQuestions');
	Route::get('/onlineExams/searchQuestion/{keyword}','OnlineExamsController@searchQuestion');
	Route::post('/onlineExams/questions/{id}','OnlineExamsController@editQuestions');
	Route::post('/onlineExams/questions/delete/{id}','OnlineExamsController@deleteQuestions');
	Route::post('/onlineExams/questions','OnlineExamsController@createQuestions');
    Route::post('/onlineExams/take/{id}','OnlineExamsController@take');
	Route::post('/onlineExams/took/{id}','OnlineExamsController@took');
	Route::get('/onlineExams/marks/{id}','OnlineExamsController@marks');
	Route::get('/onlineExams/export/{id}/{type}','OnlineExamsController@export');
	Route::post('/onlineExams','OnlineExamsController@create');
	Route::get('/onlineExams/{id}','OnlineExamsController@fetch');
    Route::post('/onlineExams/delete/{id}','OnlineExamsController@delete');
	Route::post('/onlineExams/{id}','OnlineExamsController@edit');

	//Transportation
	Route::get('/transports','DashboardController@index');
	Route::get('/transports/listAll','TransportsController@listAll');
	Route::get('/transports/members','TransportsController@members');
	Route::get('/transports/schedule','TransportsController@schedule');
	Route::post('/transports/members','TransportsController@getmembers');
	Route::post('/transports','TransportsController@create');
	Route::get('/transports/{id}','TransportsController@fetch');
    Route::post('/transports/delete/{id}','TransportsController@delete');
	Route::post('/transports/{id}','TransportsController@edit');

	//Transport Vehicles
	Route::get('/transport_vehicles','DashboardController@index');
	Route::get('/transport_vehicles/listAll','transportVehiclessController@listAll');
	Route::post('/transport_vehicles','transportVehiclessController@create');
	Route::get('/transport_vehicles/download/{id}','transportVehiclessController@download');
	Route::get('/transport_vehicles/export/{type}','transportVehiclessController@export');
	Route::get('/transport_vehicles/{id}','transportVehiclessController@fetch');
	Route::post('/transport_vehicles/delete/{id}','transportVehiclessController@delete');
	Route::post('/transport_vehicles/{id}','transportVehiclessController@edit');

	//Media
	Route::get('/media','DashboardController@index');
	Route::get('/media/listAll','MediaController@listAlbum');
	Route::get('/media/listAll/{id}','MediaController@listAlbumById');
	Route::get('/media/resize/{file}/{width}/{height}','MediaController@resize');
    Route::get('/media/image/{id}','MediaController@image');
	Route::post('/media/newAlbum','MediaController@newAlbum');
	Route::get('/media/editAlbum/{id}','MediaController@fetchAlbum');
	Route::post('/media/editAlbum/{id}','MediaController@editAlbum');
	Route::post('/media','MediaController@create');
	Route::get('/media/{id}','MediaController@fetch');
    Route::post('/media/album/delete/{id}','MediaController@deleteAlbum');
    Route::post('/media/delete/{id}','MediaController@delete');
    Route::post('/media/{id}','MediaController@edit');

	//Static pages
	Route::get('/static','DashboardController@index');
	Route::get('/static/listAll','StaticPagesController@listAll');
    Route::get('/static/listUser','StaticPagesController@listUser');
	Route::get('/static/active/{id}','StaticPagesController@active');
	Route::post('/static','StaticPagesController@create');
	Route::get('/static/{id}','StaticPagesController@fetch');
    Route::post('/static/delete/{id}','StaticPagesController@delete');
	Route::post('/static/{id}','StaticPagesController@edit');

	//Polls
	Route::get('/polls','DashboardController@index');
	Route::get('/polls/listAll','PollsController@listAll');
	Route::post('/polls/active/{id}','PollsController@makeActive');
	Route::post('/polls','PollsController@create');
	Route::get('/polls/{id}','PollsController@fetch');
    Route::post('/polls/delete/{id}','PollsController@delete');
	Route::post('/polls/{id}','PollsController@edit');

	//Mail / SMS Templates
	Route::get('/mailsmsTemplates','DashboardController@index');
	Route::get('/MailSMSTemplates/listAll','MailSMSTemplatesController@listAll');
	Route::get('/MailSMSTemplates/{id}','MailSMSTemplatesController@fetch');
	Route::post('/MailSMSTemplates','MailSMSTemplatesController@add');
	Route::post('/MailSMSTemplates/delete/{id}','MailSMSTemplatesController@delete');
	Route::post('/MailSMSTemplates/{id}','MailSMSTemplatesController@edit');

	//invoices
	Route::get('/invoices','DashboardController@index');
	Route::get('/invoices/listAll','invoicesController@listAll');
	Route::get('/invoices/listAll/{page}','invoicesController@listAll');
	Route::get('/invoices/listAllNotPaid','invoicesController@listAllNotPaid');
	Route::get('/invoices/listAllNotPaid/{page}','invoicesController@listAllNotPaid');
	Route::get('/invoices/fetch-payment-methods','invoicesController@fetchPaymentMethods');
	Route::get('/invoices/advanced-listAll/{page}','invoicesController@advancedListAll');
	Route::get('/invoices/current-listAll/{page}','invoicesController@currentListAll');
	Route::get('/invoices/list-paid','invoicesController@listPaid');
	Route::get('/invoices/list-paid/{page}','invoicesController@listPaid');
  Route::post('/invoices/listAll/{page}','invoicesController@listAll');
	Route::post('/invoices/paySuccess/{id}','DashboardController@paySuccess');
	Route::get('/invoices/paySuccess','DashboardController@paySuccess');
	Route::get('/invoices/payFailed','DashboardController@payFailed');
	Route::post('/invoices/payFailed','DashboardController@payFailed');
  Route::get('/invoices/searchUsers/{student}','invoicesController@searchStudents');
  Route::get('/invoices/search/{keyword}/{page}','invoicesController@search');
	Route::get('/invoices/failed','invoicesController@paymentFailed');
	Route::get('/invoices/invoice/{id}','invoicesController@invoice');
	Route::get('/invoices/export/{type}','invoicesController@export');
	Route::get('/invoices/details/{id}','invoicesController@PaymentData');
	Route::post('/invoices/import/excel','invoicesController@importExcel');
	Route::get('/invoices/import/download-sample','invoicesController@downloadImportFeeSample');
	Route::post('/invoices','invoicesController@create');
	Route::get('/invoices/{id}','invoicesController@fetch');
	Route::post('/invoices/collect/{id}','invoicesController@collect');
	Route::post('/invoices/revert/{id}','invoicesController@revert');
	Route::post('/invoices/delete/{id}','invoicesController@delete');
	Route::post('/invoices/pay/{id}','DashboardController@pay');
	Route::get('/invoices/pay/multi','DashboardController@multiPay');
	Route::post('/invoices/{id}','invoicesController@edit');

	//Expenses Cat
	Route::get('/expensesCat','expensesCatController@index');
	Route::get('/expensesCat/listAll','expensesCatController@listAll');
	Route::post('/expensesCat','expensesCatController@create');
	Route::get('/expensesCat/{id}','expensesCatController@fetch');
    Route::post('/expensesCat/delete/{id}','expensesCatController@delete');
	Route::post('/expensesCat/{id}','expensesCatController@edit');

    //Expenses
	Route::get('/expenses','expensesController@index');
	Route::get('/expenses/listAll','expensesController@listAll');
	Route::get('/expenses/listAll/{page}','expensesController@listAll');
	Route::post('/expenses','expensesController@create');
    Route::get('/expenses/download/{id}','expensesController@download');
	Route::get('/expenses/{id}','expensesController@fetch');
    Route::post('/expenses/delete/{id}','expensesController@delete');
	Route::post('/expenses/{id}','expensesController@edit');

	//Expenses Cat
	Route::get('/incomesCat','incomesCatController@index');
	Route::get('/incomesCat/listAll','incomesCatController@listAll');
	Route::post('/incomesCat','incomesCatController@create');
	Route::get('/incomesCat/{id}','incomesCatController@fetch');
    Route::post('/incomesCat/delete/{id}','incomesCatController@delete');
	Route::post('/incomesCat/{id}','incomesCatController@edit');

    //Expenses
	Route::get('/incomes','incomesController@index');
	Route::get('/incomes/listAll','incomesController@listAll');
	Route::get('/incomes/listAll/{page}','incomesController@listAll');
	Route::post('/incomes','incomesController@create');
    Route::get('/incomes/download/{id}','incomesController@download');
	Route::get('/incomes/{id}','incomesController@fetch');
    Route::post('/incomes/delete/{id}','incomesController@delete');
	Route::post('/incomes/{id}','incomesController@edit');

	//Promotion
    Route::get('/promotion','DashboardController@index');
    Route::get('/promotion/search/{student}','promotionController@searchStudents');
	Route::get('/promotion/listData','promotionController@listAll');
	Route::post('/promotion/listStudents','promotionController@listStudents');
	Route::post('/promotion','promotionController@promoteNow');

    //Academic Year
    Route::get('/academicYear','DashboardController@index');
	Route::get('/academic/listAll','academicYearController@listAll');
	Route::post('/academic/active/{id}','academicYearController@active');
	Route::post('/academic','academicYearController@create');
	Route::get('/academic/{id}','academicYearController@fetch');
    Route::post('/academic/delete/{id}','academicYearController@delete');
	Route::post('/academic/{id}','academicYearController@edit');

    //Staff Attendance
	Route::get('/staffAttendance','DashboardController@index');
	Route::post('/sattendance/list','SAttendanceController@listAttendance');
	Route::post('/sattendance','SAttendanceController@saveAttendance');
	Route::post('/sattendance/report','SAttendanceController@reportAttendance');

    //Reports
    Route::get('/reports','DashboardController@index');
    Route::post('/reports','reportsController@report');
    Route::get('/reports/preAttendace','reportsController@preAttendaceStats');
    Route::get('/reports/preCert','reportsController@preCert');
    Route::post('/reports/certGetStdList','reportsController@certGetStdList');
    Route::get('/reports/export-invoice/{type}/{ids}','invoicesController@exportAsReport');

    //vacation
    Route::get('/vacation','vacationController@index');
    Route::post('/vacation','vacationController@getVacation');
    Route::post('/vacation','vacationController@getVacation');
    Route::post('/vacation/confirm','vacationController@saveVacation');
    Route::post('/vacation/delete/{id}','vacationController@delete');
    Route::get('/vacation/approve','vacationController@get_approval');
    Route::post('/vacation/approve','vacationController@set_approval');
    Route::get('/vacation/mine','vacationController@my_vacations');

    //Hostel
	Route::get('/hostel','DashboardController@index');
	Route::get('/hostel/listAll','hostelController@listAll');
    Route::get('/hostel/listSubs/{id}','hostelController@listSubs');
	Route::post('/hostel','hostelController@create');
	Route::get('/hostel/{id}','hostelController@fetch');
    Route::post('/hostel/delete/{id}','hostelController@delete');
	Route::post('/hostel/{id}','hostelController@edit');

    //HostelCat
	Route::get('/hostelCat','DashboardController@index');
	Route::get('/hostelCat/listAll','hostelCatController@listAll');
	Route::post('/hostelCat','hostelCatController@create');
	Route::get('/hostelCat/{id}','hostelCatController@fetch');
    Route::post('/hostelCat/delete/{id}','hostelCatController@delete');
	Route::post('/hostelCat/{id}','hostelCatController@edit');

    //Salary Base
	Route::get('/salary_base','DashboardController@index');
	Route::get('/salary_base/listAll','salary_baseController@listAll');
	Route::post('/salary_base','salary_baseController@create');
	Route::get('/salary_base/{id}','salary_baseController@fetch');
    Route::post('/salary_base/delete/{id}','salary_baseController@delete');
	Route::post('/salary_base/{id}','salary_baseController@edit');

    //hourly Base
	Route::get('/hourly_base','DashboardController@index');
	Route::get('/hourly_base/listAll','hourly_baseController@listAll');
	Route::post('/hourly_base','hourly_baseController@create');
	Route::get('/hourly_base/{id}','hourly_baseController@fetch');
    Route::post('/hourly_base/delete/{id}','hourly_baseController@delete');
	Route::post('/hourly_base/{id}','hourly_baseController@edit');

	//hourly Base
	Route::get('/users_salary','DashboardController@index');
	Route::post('/users_salary/search','users_salaryController@search_user');
	Route::post('/users_salary/{id}','users_salaryController@edit');

	//Make Payment
	Route::get('/make_payment','DashboardController@index');
	Route::post('/make_payment/search','make_paymentController@search_user');
	Route::get('/make_payment/{id}','make_paymentController@get_user_details');
	Route::post('/make_payment/delete/{id}','make_paymentController@make_user_payment_remove');
	Route::post('/make_payment/{id}','make_paymentController@make_user_payment_submit');

	//Backup & Restore
	Route::get('/backup','dbexportsController@export');

	//Frontend Website
	Route::get('/frontend','DashboardController@index');
	Route::get('/frontend/listAll','frontendController@listAll');
	Route::post('/frontend','frontendController@create');
	Route::get('/frontend/settings','frontendController@get_settings');
	Route::post('/frontend/settings','frontendController@set_settings');
	Route::post('/frontend/gen_permalink','frontendController@gen_permalink');
	Route::post('/frontend/check_permalink/{id}','frontendController@check_permalink');
	Route::get('/frontend/{id}','frontendController@fetch');
    Route::post('/frontend/account_status/{id}','frontendController@account_status');
    Route::post('/frontend/delete/{id}','frontendController@delete');
    Route::post('/frontend/{id}','frontendController@edit');

	//Biometric integration
	Route::get('/biometric','biometricController@get_devices');
	Route::post('/biometric','biometricController@sync_devices');

	//Roles Permissions
	Route::get('/roles','DashboardController@index');
	Route::get('/roles/listAll','rolesController@listAll');
	Route::get('/roles/listCustom1','rolesController@listCustom1');
	Route::get('/roles/get-users-by-role-id/{role_id}','rolesController@fetch_users_by_role_id');
	Route::post('/roles','rolesController@create');
	Route::get('/roles/{id}','rolesController@fetch');
	Route::post('/roles/delete/{id}','rolesController@delete');
	Route::post('/roles/{id}','rolesController@edit');

	//Welcome Office Categories
	Route::get('/wel_office_cat','DashboardController@index');
	Route::get('/wel_office_cat/listAll','welOfficeCatController@listAll');
	Route::post('/wel_office_cat','welOfficeCatController@create');
	Route::get('/wel_office_cat/{id}','welOfficeCatController@fetch');
	Route::post('/wel_office_cat/delete/{id}','welOfficeCatController@delete');
	Route::post('/wel_office_cat/{id}','welOfficeCatController@edit');

	//Visitors
	Route::get('/visitors','DashboardController@index');
	Route::get('/visitors/listAll','visitorsController@listAll');
	Route::get('/visitors/listAll/{page}','visitorsController@listAll');
	Route::get('/visitors/search/{keyword}/{page}','visitorsController@search');
	Route::post('/visitors','visitorsController@create');
	Route::get('/visitors/view/{id}','visitorsController@view');
	Route::get('/visitors/download/{id}','visitorsController@download');
	Route::get('/visitors/export/{type}','visitorsController@export');
	Route::get('/visitors/searchUser/{keyword}','visitorsController@searchUser');
	Route::get('/visitors/{id}','visitorsController@fetch');
	Route::post('/visitors/delete/{id}','visitorsController@delete');
	Route::post('/visitors/checkout/{id}','visitorsController@checkout');
	Route::post('/visitors/{id}','visitorsController@edit');

	//Phone Calls
	Route::get('/phone_calls','DashboardController@index');
	Route::get('/phone_calls/listAll','phoneCallsControllers@listAll');
	Route::get('/phone_calls/listAll/{page}','phoneCallsControllers@listAll');
	Route::get('/phone_calls/search/{keyword}/{page}','phoneCallsControllers@search');
	Route::post('/phone_calls','phoneCallsControllers@create');
	Route::get('/phone_calls/export/{type}','phoneCallsControllers@export');
	Route::get('/phone_calls/{id}','phoneCallsControllers@fetch');
	Route::post('/phone_calls/delete/{id}','phoneCallsControllers@delete');
	Route::post('/phone_calls/{id}','phoneCallsControllers@edit');

	//Postal
	Route::get('/postal','DashboardController@index');
	Route::get('/postal/listAll','postalController@listAll');
	Route::get('/postal/listAll/{page}','postalController@listAll');
	Route::get('/postal/search/{keyword}/{page}','postalController@search');
	Route::post('/postal','postalController@create');
	Route::get('/postal/download/{id}','postalController@download');
	Route::get('/postal/export/{type}','postalController@export');
	Route::get('/postal/{id}','postalController@fetch');
	Route::post('/postal/delete/{id}','postalController@delete');
	Route::post('/postal/{id}','postalController@edit');

	//Contact Messages
	Route::get('/con_mess','DashboardController@index');
	Route::get('/con_mess/listAll','conMessController@listAll');
	Route::get('/con_mess/listAll/{page}','conMessController@listAll');
	Route::get('/con_mess/search/{keyword}/{page}','conMessController@search');
	Route::get('/con_mess/view/{id}','conMessController@view');
	Route::get('/con_mess/export/{type}','conMessController@export');
	Route::post('/con_mess/delete/{id}','conMessController@delete');

	//Departments
	Route::get('/departments','DashboardController@index');
	Route::get('/departments/listAll','departmentsControllers@listAll');
	Route::post('/departments','departmentsControllers@create');
	Route::get('/departments/fetch-all','departmentsControllers@fetchAll');
	Route::get('/departments/{id}','departmentsControllers@fetch');
	Route::post('/departments/delete/{id}','departmentsControllers@delete');
	Route::post('/departments/{id}','departmentsControllers@edit');

	//Designations
	Route::get('/designations','DashboardController@index');
	Route::get('/designations/listAll','designationsController@listAll');
	Route::post('/designations','designationsController@create');
	Route::get('/designations/export/{type}','designationsController@export');
	Route::get('/designations/{id}','designationsController@fetch');
	Route::post('/designations/delete/{id}','designationsController@delete');
	Route::post('/designations/{id}','designationsController@edit');

	//Enquiries
	Route::get('/enquiries','DashboardController@index');
	Route::get('/enquiries/listAll','enquiriesController@listAll');
	Route::get('/enquiries/listAll/{page}','enquiriesController@listAll');
	Route::get('/enquiries/search/{keyword}/{page}','enquiriesController@search');
	Route::post('/enquiries','enquiriesController@create');
	Route::get('/enquiries/view/{id}','enquiriesController@view');
	Route::get('/enquiries/download/{id}','enquiriesController@download');
	Route::get('/enquiries/export/{type}','enquiriesController@export');
	Route::get('/enquiries/{id}','enquiriesController@fetch');
	Route::post('/enquiries/delete/{id}','enquiriesController@delete');
	Route::post('/enquiries/{id}','enquiriesController@edit');

	//Complaints
	Route::get('/complaints','DashboardController@index');
	Route::get('/complaints/listAll','complaintsController@listAll');
	Route::get('/complaints/listAll/{page}','complaintsController@listAll');
	Route::get('/complaints/search/{keyword}/{page}','complaintsController@search');
	Route::post('/complaints','complaintsController@create');
	Route::get('/complaints/view/{id}','complaintsController@view');
	Route::get('/complaints/download/{id}','complaintsController@download');
	Route::get('/complaints/export/{type}','complaintsController@export');
	Route::get('/complaints/{id}','complaintsController@fetch');
	Route::post('/complaints/delete/{id}','complaintsController@delete');
	Route::post('/complaints/{id}','complaintsController@edit');


	//Inventory Categories
	Route::get('/inv_cat','DashboardController@index');
	Route::get('/inv_cat/listAll','invCatController@listAll');
	Route::post('/inv_cat','invCatController@create');
	Route::get('/inv_cat/{id}','invCatController@fetch');
	Route::post('/inv_cat/delete/{id}','invCatController@delete');
	Route::post('/inv_cat/{id}','invCatController@edit');

	//Inventory Suppliers
	Route::get('/suppliers','DashboardController@index');
	Route::get('/suppliers/listAll','suppliersControllers@listAll');
	Route::get('/suppliers/listAll/{page}','suppliersControllers@listAll');
	Route::get('/suppliers/search/{keyword}/{page}','suppliersControllers@search');
	Route::post('/suppliers','suppliersControllers@create');
	Route::get('/suppliers/export/{type}','suppliersControllers@export');
	Route::get('/suppliers/{id}','suppliersControllers@fetch');
	Route::post('/suppliers/active/{id}','suppliersControllers@active');
	Route::post('/suppliers/delete/{id}','suppliersControllers@delete');
	Route::post('/suppliers/{id}','suppliersControllers@edit');

	//Inventory Stores
	Route::get('/stores','DashboardController@index');
	Route::get('/stores/listAll','storesController@listAll');
	Route::post('/stores','storesController@create');
	Route::get('/stores/{id}','storesController@fetch');
	Route::post('/stores/delete/{id}','storesController@delete');
	Route::post('/stores/{id}','storesController@edit');

	//Inventory Items
	Route::get('/items_code','DashboardController@index');
	Route::get('/items_code/listAll','itemsCodeController@listAll');
	Route::get('/items_code/listAll/{page}','itemsCodeController@listAll');
	Route::get('/items_code/search/{keyword}/{page}','itemsCodeController@search');
	Route::post('/items_code','itemsCodeController@create');
	Route::get('/items_code/export/{type}','itemsCodeController@export');
	Route::get('/items_code/{id}','itemsCodeController@fetch');
	Route::post('/items_code/delete/{id}','itemsCodeController@delete');
	Route::post('/items_code/{id}','itemsCodeController@edit');

	//Items Stock
	Route::get('/items_stock','DashboardController@index');
	Route::get('/items_stock/listAll','itemsStockController@listAll');
	Route::get('/items_stock/listAll/{page}','itemsStockController@listAll');
	Route::get('/items_stock/search/{keyword}/{page}','itemsStockController@search');
	Route::post('/items_stock','itemsStockController@create');
	Route::post('/items_stock/load_items/{cat_id}','itemsStockController@load_items');
	Route::get('/items_stock/download/{id}','itemsStockController@download');
	Route::get('/items_stock/export/{type}','itemsStockController@export');
	Route::get('/items_stock/{id}','itemsStockController@fetch');
	Route::post('/items_stock/delete/{id}','itemsStockController@delete');
	Route::post('/items_stock/{id}','itemsStockController@edit');

	//Inventory Issue/Return
	Route::get('/inv_issue','DashboardController@index');
	Route::get('/inv_issue/listAll','inv_issueController@listAll');
	Route::get('/inv_issue/listAll/{page}','inv_issueController@listAll');
	Route::get('/inv_issue/search/{keyword}/{page}','inv_issueController@search');
	Route::post('/inv_issue','inv_issueController@create');
	Route::post('/inv_issue/load_items/{cat_id}','inv_issueController@load_items');
	Route::post('/inv_issue/return/{id}','inv_issueController@return_item');
	Route::get('/inv_issue/download/{id}','inv_issueController@download');
	Route::get('/inv_issue/export/{type}','inv_issueController@export');
	Route::get('/inv_issue/searchUser/{keyword}','inv_issueController@searchUser');
	Route::get('/inv_issue/{id}','inv_issueController@fetch');
	Route::post('/inv_issue/delete/{id}','inv_issueController@delete');
	Route::post('/inv_issue/{id}','inv_issueController@edit');

	// Dashboard items
	Route::get('/dashboard/listItems','DashboardController@homeItems');

	// global search
	Route::post('/global-search/get-users-data', 'DashboardController@globalSearch');

	// get marksheet collection of students's parents/teachers
	Route::get('/marksheet-collection/{user_id}', 'MarkSheetController@collection');

	Route::get('/get-notification-count-alert', 'DashboardController@getNotificationCountAlertAndData');
	Route::get('/reset-notifications-seen-status', 'DashboardController@resetNotificationsSeenStatus');
	Route::get('/get-list-stoppages', 'DashboardController@getListStoppages');
	Route::get('/get-notifications-redirect-links', function() {
		return \App\Models2\NotificationMobHistory::getNotificationsRedirectLinks();
	});

	Route::get('/preview-vision-2020', function(){
		return view('vision-2020');
	});

	Route::post('uploads-config', function() {
		return uploads_config();
	});

	// User logs
	Route::get('/user-logs/listAll/{page}','UserLogsController@listAll');
	Route::post('/user-logs/listAll/{page}','UserLogsController@listAll');
	Route::get('/user-logs/export/{type}','UserLogsController@export');

	// donation
	Route::post('/payments/save-success-donation', 'DonationTransactionController@saveSuccessDonation');
	Route::post('/payments/donation_transactions','DonationTransactionController@donation_transactions');
	Route::get('/payments/donation_transactions/refresh/{item_id}','DonationTransactionController@refreshDonation');
	Route::post('/payments/get-status/{donation_id}','DonationTransactionController@getStatus');


});


// Route::get('/invoices/success/redirect-request','invoicesController@paymentSuccessRedirectRequest');
Route::post('/invoices/success/{id}','invoicesController@paymentSuccess');
Route::get('/frontend/profileImage/{id}','frontendPagesController@profileImage');
Route::any('/{any}', 'frontendPagesController@index')->where('any', '.*');