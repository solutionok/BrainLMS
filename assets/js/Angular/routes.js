OraSchool.config(function($routeProvider,$locationProvider) {

    $routeProvider.when('/', {
        templateUrl : 'assets/templates/home.html',
        controller  : 'dashboardController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/admins', {
        templateUrl : 'assets/templates/admins.html',
        controller  : 'adminsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/donation-transaction-history', {
        templateUrl : 'assets/templates/donation-transaction-history.html',
        controller  : 'donationTransactionController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/employees', {
        templateUrl : 'assets/templates/employees.html',
        controller  : 'employeesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/teachers', {
        templateUrl : 'assets/templates/teachers.html',
        controller  : 'teachersController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/students', {
        templateUrl : 'assets/templates/students.html',
        controller  : 'studentsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/students/admission', {
        templateUrl : 'assets/templates/students.html',
        controller  : 'studentsController',
        methodName: 'admission',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/student/categories', {
        templateUrl : 'assets/templates/student_categories.html',
        controller  : 'student_categories',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/student/types', {
        templateUrl : 'assets/templates/student_types.html',
        controller  : 'studentTypesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/students/marksheet', {
        templateUrl : 'assets/templates/students.html',
        controller  : 'studentsController',
        methodName: 'marksheet',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/parents', {
        templateUrl : 'assets/templates/stparents.html',
        controller  : 'parentsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/hostel', {
        templateUrl : 'assets/templates/hostel.html',
        controller  : 'hostelController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/hostelCat', {
        templateUrl : 'assets/templates/hostelCat.html',
        controller  : 'hostelCatController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/classes', {
        templateUrl : 'assets/templates/classes.html',
        controller  : 'classesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/sections', {
        templateUrl : 'assets/templates/sections.html',
        controller  : 'sectionsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/subjects', {
        templateUrl : 'assets/templates/subjects.html',
        controller  : 'subjectsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/newsboard', {
        templateUrl : 'assets/templates/newsboard.html',
        controller  : 'newsboardController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/newsboard/:newsId', {
        templateUrl : 'assets/templates/newsboard.html',
        controller  : 'newsboardController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/library', {
        templateUrl : 'assets/templates/library.html',
        controller  : 'libraryController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/lib_subscription', {
        templateUrl : 'assets/templates/library.html',
        controller  : 'libraryController',
        methodName: 'subscription',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })


    .when('/library_issues', {
        templateUrl : 'assets/templates/library_issues.html',
        controller  : 'library_issues',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/library_return', {
        templateUrl : 'assets/templates/library_issues.html',
        controller  : 'library_issues',
        methodName: 'library_return',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/account', {
        templateUrl : 'assets/templates/accountSettings.html',
        controller  : 'accountSettingsController',
        methodName: 'profile',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/account/email', {
        templateUrl : 'assets/templates/accountSettings.html',
        controller  : 'accountSettingsController',
        methodName: 'email',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/account/password', {
        templateUrl : 'assets/templates/accountSettings.html',
        controller  : 'accountSettingsController',
        methodName: 'password',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/account/invoices', {
        templateUrl : 'assets/templates/accountSettings.html',
        controller  : 'accountSettingsController',
        methodName: 'invoices',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/classschedule', {
        templateUrl : 'assets/templates/classschedule.html',
        controller  : 'classScheduleController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/institution-timetable-teacherwise', {
        templateUrl : 'assets/templates/institution-timetable-teacherwise.html',
        controller  : 'institutionTimetableTeacherwiseController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/institution-timetable-classwise', {
        templateUrl : 'assets/templates/institution-timetable-classwise.html',
        controller  : 'institutionTimetableClasswiseController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/teacher-availability', {
        templateUrl : 'assets/templates/teacher-availability.html',
        controller  : 'teacherAvailabilityController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })
    .when('/teacher-presence', {
        templateUrl : 'assets/templates/teacher-presence.html',
        controller  : 'teacherPresenceController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/attendance', {
        templateUrl : 'assets/templates/attendance.html',
        controller  : 'attendanceController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/attendance_report', {
        templateUrl : 'assets/templates/attendance_report.html',
        controller  : 'attendance_reportController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/staffAttendance', {
        templateUrl : 'assets/templates/staffAttendance.html',
        controller  : 'staffAttendanceController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/staffAttendance_report', {
        templateUrl : 'assets/templates/staffAttendance_report.html',
        controller  : 'staffAttendance_reportController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/gradeLevels', {
        templateUrl : 'assets/templates/gradeLevels.html',
        controller  : 'gradeLevelsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/examsList', {
        templateUrl : 'assets/templates/examsList.html',
        controller  : 'examsListController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/events', {
        templateUrl : 'assets/templates/events.html',
        controller  : 'eventsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/events/:eventId', {
        templateUrl : 'assets/templates/events.html',
        controller  : 'eventsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/assignments', {
        templateUrl : 'assets/templates/assignments.html',
        controller  : 'assignmentsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/homework', {
        templateUrl : 'assets/templates/homework.html',
        controller  : 'homeworkController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/materials', {
        templateUrl : 'assets/templates/materials.html',
        controller  : 'materialsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/mailsms', {
        templateUrl : 'assets/templates/mailsms.html',
        controller  : 'mailsmsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/messages', {
        templateUrl : 'assets/templates/messages.html',
        controller  : 'messagesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/messages/:messageId', {
        templateUrl : 'assets/templates/messages.html',
        controller  : 'messagesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/onlineExams', {
        templateUrl : 'assets/templates/onlineExams.html',
        controller  : 'onlineExamsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/calender', {
        templateUrl : 'assets/templates/calender.html',
        controller  : 'calenderController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/transports', {
        templateUrl : 'assets/templates/transportation.html',
        controller  : 'TransportsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })


    .when('/transport_vehicles', {
        templateUrl : 'assets/templates/transport_vehicles.html',
        controller  : 'transport_vehicles',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/transport_members', {
        templateUrl : 'assets/templates/transportation.html',
        controller  : 'transport_members',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

		.when('/invoice_transport_schedule', {
	        templateUrl : 'assets/templates/invoice_transport_schedule.html',
	        controller  : 'invoice_transport_schedule',
	        resolve: {
	            essentialData: function(srvLibrary) {
	                return srvLibrary.getEssentials();
	            }
	        }
	    })

    .when('/settings', {
        templateUrl : 'assets/templates/settings.html',
        controller  : 'settingsController',
        methodName: 'settings',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/terms', {
        templateUrl : 'assets/templates/settings.html',
        controller  : 'settingsController',
        methodName: 'terms',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/media', {
        templateUrl : 'assets/templates/media.html',
        controller  : 'mediaController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/static', {
        templateUrl : 'assets/templates/static.html',
        controller  : 'staticController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/static/:pageId', {
        templateUrl: 'assets/templates/static.html',
        controller: 'staticController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/attendanceStats', {
        templateUrl : 'assets/templates/attendanceStats.html',
        controller  : 'attendanceStatsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/polls', {
        templateUrl : 'assets/templates/polls.html',
        controller  : 'pollsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/mailsmsTemplates', {
        templateUrl : 'assets/templates/mailsmsTemplates.html',
        controller  : 'mailsmsTemplatesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/pay-fee', {
        templateUrl : 'assets/templates/invoices.html',
        controller  : 'invoicesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/pay-fee/current', {
        templateUrl : 'assets/templates/invoices.html',
        controller  : 'invoicesController',
        methodName: 'currentinvoices',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/pay-fee/due', {
        templateUrl : 'assets/templates/invoices.html',
        controller  : 'invoicesController',
        methodName: 'dueinvoices',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/pay-fee/paid', {
        templateUrl : 'assets/templates/paid-invoices.html',
        controller  : 'invoicesController',
        methodName: 'paidinvoices',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/expenses', {
        templateUrl : 'assets/templates/expenses.html',
        controller  : 'expensesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/expensesCat', {
        templateUrl : 'assets/templates/expensesCat.html',
        controller  : 'expensesCatController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/incomes', {
        templateUrl : 'assets/templates/incomes.html',
        controller  : 'incomesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/incomesCat', {
        templateUrl : 'assets/templates/incomesCat.html',
        controller  : 'incomesCatController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/languages', {
        templateUrl : 'assets/templates/languages.html',
        controller  : 'languagesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/upgrade', {
        templateUrl : 'assets/templates/upgrade.html',
        controller  : 'upgradeController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/promotion', {
        templateUrl : 'assets/templates/promotion.html',
        controller  : 'promotionController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/academicYear', {
        templateUrl : 'assets/templates/academicYear.html',
        controller  : 'academicYearController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/reports', {
        templateUrl : 'assets/templates/reports.html',
        controller  : 'reportsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/vacation', {
        templateUrl : 'assets/templates/vacation.html',
        controller  : 'vacationController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/vacation/approve', {
        templateUrl : 'assets/templates/vacation.html',
        controller  : 'vacationController',
        methodName  : 'approve',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/vacation/mine', {
        templateUrl : 'assets/templates/vacation.html',
        controller  : 'vacationController',
        methodName  : 'mine',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/mobileNotif', {
        templateUrl : 'assets/templates/mobileNotif.html',
        controller  : 'mobileNotifController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/dbexports', {
        templateUrl : 'assets/templates/dbexports.html',
        controller  : 'dbexportsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/frontend/pages', {
        templateUrl : 'assets/templates/frontend_pages.html',
        controller  : 'frontend_pagesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/payroll/salary_base', {
        templateUrl : 'assets/templates/payroll_salary.html',
        controller  : 'payroll_salaryController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/payroll/hourly_base', {
        templateUrl : 'assets/templates/payroll_hourly.html',
        controller  : 'payroll_hourlyController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/payroll/users_salary', {
        templateUrl : 'assets/templates/users_salary.html',
        controller  : 'users_salaryController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/payroll/dopayment', {
        templateUrl : 'assets/templates/payroll_make_pay.html',
        controller  : 'payroll_make_payController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/frontend/settings', {
        templateUrl : 'assets/templates/frontend_settings.html',
        controller  : 'frontend_settingsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/roles', {
        templateUrl : 'assets/templates/roles.html',
        controller  : 'rolesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/wel_office_cat', {
        templateUrl : 'assets/templates/wel_office_cat.html',
        controller  : 'wel_office_cat',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/visitors', {
        templateUrl : 'assets/templates/visitors.html',
        controller  : 'visitors',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/visitors/:viewId', {
        templateUrl : 'assets/templates/visitors.html',
        controller  : 'visitors',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/phone_calls', {
        templateUrl : 'assets/templates/phone_calls.html',
        controller  : 'phone_calls',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/postal', {
        templateUrl : 'assets/templates/postal.html',
        controller  : 'postal',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })


    .when('/con_mess', {
        templateUrl : 'assets/templates/con_mess.html',
        controller  : 'con_mess',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/con_mess/:viewId', {
        templateUrl : 'assets/templates/con_mess.html',
        controller  : 'con_mess',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/departments', {
        templateUrl : 'assets/templates/departments.html',
        controller  : 'departments',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/designations', {
        templateUrl : 'assets/templates/designations.html',
        controller  : 'designations',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/enquiries', {
        templateUrl : 'assets/templates/enquiries.html',
        controller  : 'enquiries',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })


    .when('/enquiries/:viewId', {
        templateUrl : 'assets/templates/enquiries.html',
        controller  : 'enquiries',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/complaints', {
        templateUrl : 'assets/templates/complaints.html',
        controller  : 'complaints',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })


    .when('/complaints/:viewId', {
        templateUrl : 'assets/templates/complaints.html',
        controller  : 'complaints',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/inv_cat', {
        templateUrl : 'assets/templates/inv_cat.html',
        controller  : 'inv_cat',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/suppliers', {
        templateUrl : 'assets/templates/suppliers.html',
        controller  : 'suppliers',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/stores', {
        templateUrl : 'assets/templates/stores.html',
        controller  : 'stocksstores',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/items_code', {
        templateUrl : 'assets/templates/items_code.html',
        controller  : 'items_code',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/items_stock', {
        templateUrl : 'assets/templates/items_stock.html',
        controller  : 'items_stock',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/inv_issue', {
        templateUrl : 'assets/templates/inv_issue.html',
        controller  : 'inv_issue',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })


    .when('/certificates', {
        templateUrl : 'assets/templates/certificates.html',
        controller  : 'certificatesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/user-Logs', {
        templateUrl : 'assets/templates/user-Logs.html',
        controller  : 'userLogsController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .when('/disciplines', {
        templateUrl : 'assets/templates/disciplines.html',
        controller  : 'disciplinesController',
        resolve: {
            essentialData: function(srvLibrary) {
                return srvLibrary.getEssentials();
            }
        }
    })

    .otherwise({
        redirectTo:'/'
    });
});

OraSchool.factory('srvLibrary', ['$http','$rootScope', function($http,$rootScope) {
    var sdo = {
        getEssentials: function() {
            if(typeof($rootScope.dashboardData) == "undefined"){
                var promise = $http({
                    method: 'GET',
                    url: 'index.php/dashboard'
                });
                promise.success(function(data, status, headers, conf) {
                    $rootScope.dashboardData = data;
                    $rootScope.phrase = $rootScope.dashboardData.language;

                    $rootScope.angDateFormat = $rootScope.dashboardData.dateformat;
                    if($rootScope.angDateFormat == ""){
                        $rootScope.angDateFormat = "MM/dd/yyyy";
                    }else{
                        $rootScope.angDateFormat = $rootScope.angDateFormat.replace('d','dd');
                        $rootScope.angDateFormat = $rootScope.angDateFormat.replace('m','MM');
                        $rootScope.angDateFormat = $rootScope.angDateFormat.replace('Y','yyyy');
                    }

                    if($rootScope.dashboardData.gcalendar == "ethiopic"){
                        $rootScope.dashboardData.gcalendar = "ethiopian";
                    }

                    return true;
                });
                return promise;
            }else{
                return true;
            }
        }
    }
    return sdo;
}]);

OraSchool.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

OraSchool.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(file, uploadUrl){
        var fd = new FormData();
        angular.forEach(file, function(value, key) {
            fd.append(key, value);
        });
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
        .success(function(){
        })
        .error(function(){
        });
    }
}]);

OraSchool.factory('dataFactory', function($http) {
    var myService = {
        httpRequest: function(url,method,params,dataPost,upload) {
            var passParameters = {};
            passParameters.url = url;

            if (typeof method == 'undefined'){
                passParameters.method = 'GET';
            }else{
                passParameters.method = method;
            }

            if (typeof params != 'undefined'){
                passParameters.params = params;
            }

            if (typeof dataPost != 'undefined'){
                passParameters.data = dataPost;
            }

            if (typeof upload != 'undefined'){
                var fd = new FormData();

                angular.forEach(dataPost, function(value, key) {
                    if(typeof value == 'object' && upload.indexOf(key) == -1 ){
                        value = JSON.stringify(value);
                    }
                    fd.append(key, value);
                });

                passParameters.data = fd;

                passParameters.transformRequest = angular.identity;
                passParameters.headers = {'Content-Type': undefined};
            }

            var promise = $http(passParameters).then(function (response) {
                if(typeof response.data == 'string' && response.data != 1){
                    // if(response.data.substr('loginMark')){
                    //     location.reload();
                    //     return;
                    // }
                    $.toast({
                        heading: 'Error',
                        text: response.data,
                        position: 'top-right',
                        loaderBg:'#ff6849',
                        icon: 'error',
                        hideAfter: 3000,
                        stack: 6
                    });
                    return false;
                }
                if(response.data.jsMessage){
                    $.toast({
                        heading: response.data.jsTitle,
                        text: response.data.jsMessage,
                        position: 'top-right',
                        loaderBg:'#ff6849',
                        icon: 'info',
                        hideAfter: 3000,
                        stack: 6
                    });
                }
                return response.data;
            },function(response){
                // if(response.data.substr('loginMark')){
                //     location.reload();
                //     return;
                // }
                $.toast({
                    heading: 'Error',
                    text: 'An error occured while processing your request.',
                    position: 'top-right',
                    loaderBg:'#ff6849',
                    icon: 'error',
                    hideAfter: 3000,
                    stack: 6
                });
            });
            return promise;
        }
    };
    return myService;
});

OraSchool.directive('datePicker', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                var dateformatVal = jQuery('#dateformatVal').val();
                if(typeof dateformatVal == "undefined"){
                    var dateformatVal = $rootScope.dashboardData.dateformat;
                }
                var dateformat = dateformatVal;
                if(dateformat == ""){
                    dateformat = 'dd-mm-yyyy';
                }else{
                    dateformat = dateformat.replace('d','dd');
                    dateformat = dateformat.replace('m','mm');
                    dateformat = dateformat.replace('Y','yyyy');
                }

                var calendar = jQuery('#gcalendarVal').val();
                if(typeof calendar == "undefined"){
                    calendar = $rootScope.dashboardData.gcalendar;
                }
                calendar = $.calendars.instance(calendar);

                if(typeof attrs.id == "undefined"){
                    $(".datemask").calendarsPicker({calendar: calendar,dateFormat:dateformat,showAnim:''});
                    $(".datemask").attr("autocomplete", "off");
                }else{
                    $("#"+attrs.id).calendarsPicker({calendar: calendar,dateFormat:dateformat,showAnim:''});
                    $("#"+attrs.id).attr("autocomplete", "off");
                }
            };
        }
    };
});

OraSchool.directive('carouselInit', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                $('.carousel').carousel()
            };
        }
    };
});

OraSchool.directive('mobileNumber', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function(scope, element, attrs,ngModel) {
            var telInput = $(element);

            if( $("#countryVal").val() != undefined ){
                var countryVal = $("#countryVal").val();
            }else{
                var countryVal = $rootScope.dashboardData.country;
            }

            telInput.intlTelInput({utilsScript: jQuery('#utilsScript').val(),nationalMode: false,initialCountry:countryVal});

            scope.$watch(attrs.ngModel, function(value) {
                telInput.intlTelInput("setNumber",element.val());
            });

            scope.$watch(attrs.ngModel, function(value) {
                if(value == "" || typeof value === "undefined"){
                    ngModel.$setValidity(attrs.ngModel, true);
                    return;
                }
                if (telInput.intlTelInput("isValidNumber")) {
                    ngModel.$setValidity(attrs.ngModel, true);
                } else {
                    ngModel.$setValidity(attrs.ngModel, false);
                }
            });
        }
    };
});
OraSchool.directive('checklistModel', ['$parse', '$compile', function($parse, $compile) {
    // contains
    function contains(arr, item, comparator) {
        if (angular.isArray(arr)) {
            for (var i = arr.length; i--;) {
                if (comparator(arr[i], item)) {
                    return true;
                }
            }
        }
        return false;
    }

    // add
    function add(arr, item, comparator) {
        arr = angular.isArray(arr) ? arr : [];
        if(!contains(arr, item, comparator)) {
            arr.push(item);
        }
        return arr;
    }

    // remove
    function remove(arr, item, comparator) {
        if (angular.isArray(arr)) {
            for (var i = arr.length; i--;) {
                if (comparator(arr[i], item)) {
                    arr.splice(i, 1);
                    break;
                }
            }
        }
        return arr;
    }

    // http://stackoverflow.com/a/19228302/1458162
    function postLinkFn(scope, elem, attrs) {
        // exclude recursion, but still keep the model
        var checklistModel = attrs.checklistModel;
        attrs.$set("checklistModel", null);
        // compile with `ng-model` pointing to `checked`
        $compile(elem)(scope);
        attrs.$set("checklistModel", checklistModel);

        // getter for original model
        var checklistModelGetter = $parse(checklistModel);
        var checklistChange = $parse(attrs.checklistChange);
        var checklistBeforeChange = $parse(attrs.checklistBeforeChange);
        var ngModelGetter = $parse(attrs.ngModel);



        var comparator = angular.equals;

        if (attrs.hasOwnProperty('checklistComparator')){
            if (attrs.checklistComparator[0] == '.') {
                var comparatorExpression = attrs.checklistComparator.substring(1);
                comparator = function (a, b) {
                    return a[comparatorExpression] === b[comparatorExpression];
                };

            } else {
                comparator = $parse(attrs.checklistComparator)(scope.$parent);
            }
        }

        // watch UI checked change
        var unbindModel = scope.$watch(attrs.ngModel, function(newValue, oldValue) {
            if (newValue === oldValue) {
                return;
            }

            if (checklistBeforeChange && (checklistBeforeChange(scope) === false)) {
                ngModelGetter.assign(scope, contains(checklistModelGetter(scope.$parent), getChecklistValue(), comparator));
                return;
            }

            setValueInChecklistModel(getChecklistValue(), newValue);

            if (checklistChange) {
                checklistChange(scope);
            }
        });

        // watches for value change of checklistValue
        var unbindCheckListValue = scope.$watch(getChecklistValue, function(newValue, oldValue) {
            if( newValue != oldValue && angular.isDefined(oldValue) && scope[attrs.ngModel] === true ) {
                var current = checklistModelGetter(scope.$parent);
                checklistModelGetter.assign(scope.$parent, remove(current, oldValue, comparator));
                checklistModelGetter.assign(scope.$parent, add(current, newValue, comparator));
            }
        }, true);

        var unbindDestroy = scope.$on('$destroy', destroy);

        function destroy() {
            unbindModel();
            unbindCheckListValue();
            unbindDestroy();
        }

        function getChecklistValue() {
            return attrs.checklistValue ? $parse(attrs.checklistValue)(scope.$parent) : attrs.value;
        }

        function setValueInChecklistModel(value, checked) {
            var current = checklistModelGetter(scope.$parent);
            if (angular.isFunction(checklistModelGetter.assign)) {
                if (checked === true) {
                    checklistModelGetter.assign(scope.$parent, add(current, value, comparator));
                } else {
                    checklistModelGetter.assign(scope.$parent, remove(current, value, comparator));
                }
            }

        }

        // declare one function to be used for both $watch functions
        function setChecked(newArr, oldArr) {
            if (checklistBeforeChange && (checklistBeforeChange(scope) === false)) {
                setValueInChecklistModel(getChecklistValue(), ngModelGetter(scope));
                return;
            }
            ngModelGetter.assign(scope, contains(newArr, getChecklistValue(), comparator));
        }

        // watch original model change
        // use the faster $watchCollection method if it's available
        if (angular.isFunction(scope.$parent.$watchCollection)) {
            scope.$parent.$watchCollection(checklistModel, setChecked);
        } else {
            scope.$parent.$watch(checklistModel, setChecked, true);
        }
    }

    return {
        restrict: 'A',
        priority: 1000,
        terminal: true,
        scope: true,
        compile: function(tElement, tAttrs) {

            if (!tAttrs.checklistValue && !tAttrs.value) {
                throw 'You should provide `value` or `checklist-value`.';
            }

            // by default ngModel is 'checked', so we set it if not specified
            if (!tAttrs.ngModel) {
                // local scope var storing individual checkbox model
                tAttrs.$set("ngModel", "checked");
            }

            return postLinkFn;
        }
    };
}]);
OraSchool.directive('ngEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.ngEnter);
                });

                event.preventDefault();
            }
        });
    };
});
OraSchool.directive('chatBox', function($parse, $timeout){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                $('#chat-box').slimScroll({
                    height: '500px',alwaysVisible: true,start : "bottom"
                });
            };
        }
    };
});
OraSchool.directive('scrollBox', function($parse, $timeout){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                $('#'+attrs.id).slimScroll({
                    height: attrs.height,alwaysVisible: true,start : "bottom"
                });
            };
        }
    };
});
OraSchool.directive('invoceDougnuts', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                var doughnutChart = echarts.init(document.getElementById('m-piechart'));
                // specify chart configuration item and data
                option = {
                    tooltip: {
                        trigger: 'item'
                        , formatter: "{a} <br/>{b} : {c} ({d}%)"
                    }
                    , legend: {
                        orient: 'horizontal'
                        , x: 'center'
                        , show: false
                        , y: 'bottom'
                        , data: ['80', '60', '20', '140']
                    }
                    , toolbox: {
                        show: false
                        , feature: {
                            dataView: {
                                show: true
                                , readOnly: false
                            }
                            , magicType: {
                                show: false
                                , type: ['pie', 'funnel']
                                , option: {
                                    funnel: {
                                        x: '25%'
                                        , width: '50%'
                                        , funnelAlign: 'center'
                                        , max: 1548
                                    }
                                }
                            }
                            , restore: {
                                show: true
                            }
                            , saveAsImage: {
                                show: true
                            }
                        }
                    }
                    , color: ["#745af2", "#f62d51"]
                    , calculable: true
                    , series: [
                        {
                            name: 'Invoices'
                            , type: 'pie'
                            , radius: ['70%', '90%']
                            , itemStyle: {
                                normal: {
                                    label: {
                                        show: false
                                    }
                                    , labelLine: {
                                        show: false
                                    }
                                }
                                , emphasis: {
                                    label: {
                                        show: true
                                        , position: 'center'
                                        , textStyle: {
                                            fontSize: '30'
                                            , fontWeight: 'bold'
                                        }
                                    }
                                }
                            }
                            , data: [
                                {
                                    value: $rootScope.dashboardData.stats.invoices, name: 'Invoices'
                                }
                                , {
                                    value: $rootScope.dashboardData.stats.dueInvoices, name: 'Due Invoices'
                                }
                                ]
                            }
                        ]
                };
                // use configuration item and data specified to show chart
                doughnutChart.setOption(option, true), $(function () {
                    function resize() {
                        setTimeout(function () {
                            doughnutChart.resize()
                        }, 100)
                    }
                    $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                });
            };
        }
    };
});
OraSchool.directive('colorbox', function() {
    return {
        restrict: 'AC',
        link: function (scope, element, attrs) {
            var itemsVars = {transition:'elastic',title:attrs.title,rel:'gallery',scalePhotos:true};
            if(attrs.youtube){
                itemsVars['iframe'] = true;
                itemsVars['innerWidth'] = 640;
                itemsVars['innerHeight'] = 390;
            }
            if(attrs.vimeo){
                itemsVars['iframe'] = true;
                itemsVars['innerWidth'] = 500;
                itemsVars['innerHeight'] = 409;
            }
            if(!attrs.youtube && !attrs.vimeo){
                itemsVars['height'] = "100%";
            }
            $(element).colorbox(itemsVars);
        }
    };
});

OraSchool.directive('ckEditor', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function ($scope, element, attrs, ngModel) {

            if($rootScope.dashboardData.wysiwyg_type == "advanced"){
                var ckconfig = {};
                ckconfig.enterMode = CKEDITOR.ENTER_BR;
                ckconfig.shiftEnterMode = CKEDITOR.ENTER_P;
                ckconfig.extraPlugins = 'font,justify';

                var ck = CKEDITOR.replace(element[0],ckconfig);

                ck.on('pasteState', function () {
                    $scope.$apply(function () {
                        ngModel.$setViewValue(ck.getData());
                    });
                });

                ngModel.$render = function (value) {
                    ck.setData(ngModel.$modelValue);
                };
            }else{
                $(element).summernote({height: 300});

                $(element).on('summernote.change', function(we, contents, $editable) {
                    $scope.$apply(function () {
                        ngModel.$setViewValue(contents);
                    });
                });

                ngModel.$render = function (value) {
                    $(element).summernote('code', ngModel.$modelValue);
                };

            }

        }
    };
});

OraSchool.directive('calendarBox', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                var calendar = $.calendars.instance($rootScope.dashboardData.gcalendar);
                $('#calendar').calendarsPicker({
                	calendar: calendar,
                	showOtherMonths:false,
                	selectOtherMonths:false,
                	onSelect:null,
                	onChangeMonthYear:showOtherCalEvents
                });

                var todayDate = calendar.today();
                var d = calendar.newDate(todayDate._year, todayDate._month, 1);

                var start = calendar.minDay+"-"+todayDate._month+"-"+todayDate._year;
                var end = d.daysInMonth()+"-"+todayDate._month+"-"+todayDate._year;

                $.get("index.php/calender",{start : start, end : end},function(data) {
                    populateEventsInFullCal(data,$rootScope.dashboardData.gcalendar);
                }
                );
            };
        }
    };
});

function showOtherCalEvents(year,month,inst) {
    var gc = $.calendars.instance(inst.drawDate._calendar.local['name']);
    var d = gc.newDate(year, month, 1);

    var start = gc.minDay+"-"+month+"-"+year;
    var end = d.daysInMonth()+"-"+month+"-"+year;

    $.get("index.php/calender",{start : start, end : end},function(data) {
            populateEventsInFullCal(data,inst.drawDate._calendar.local['name']);
        }
    );
}

function populateEventsInFullCal(events,cal_name){
    $.each( events, function( key, value ) {
        if($("#"+value.id).length == 0){
            $(".jdd"+value.start).after( "<a href='" + value.url + "' class='fullCalEvent' style='color:" + value.textColor + " !important;background-color:" + value.backgroundColor + " !important' id='" + value.id + "'>" + value.title + "</a>" );
        }
    });
}

OraSchool.directive('smsCounter', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                $('#messageContentSms').countSms('#sms-counter');
            };
        }
    };
});
OraSchool.directive('modal', function () {
    return {
        template: '<div class="modal fade">' +
        '<div class="modal-dialog {{modalClass}}">' +
        '<div class="modal-content">' +
        '<div class="modal-header">' +
        '<h4 class="modal-title">{{ modalTitle }}</h4>' +
        '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' +
        '</div>' +
        '<div class="modal-body" ng-transclude></div>' +
        '</div>' +
        '</div>' +
        '</div>',
        restrict: 'E',
        transclude: true,
        replace:true,
        scope:true,
        link: function postLink(scope, element, attrs) {
            scope.$watch(attrs.visible, function(value){
                if(value == true)
                $(element).modal('show');
                else
                $(element).modal('hide');
            });

            $(element).on('shown.bs.modal', function(){
                scope.$apply(function(){
                    scope.$parent[attrs.visible] = true;
                });
            });

            $(element).on('hidden.bs.modal', function(){
                scope.$apply(function(){
                    scope.$parent[attrs.visible] = false;
                });
            });
        }
    };
});

OraSchool.directive('scalendarBox', function($parse, $timeout,$rootScope){
    return {
        restrict: 'A',
        replace: true,
        transclude: false,
        compile: function(element, attrs) {
            return function (scope, slider, attrs, controller) {
                $('#scalendar').fullCalendar({
                    events: "calender",
                    lang: $rootScope.dashboardData.languageUniversal
                });
            };
        }
    };
});
OraSchool.directive('tooltip', function(){
    return {
        restrict: 'A',
        link: function(scope, element, attrs){
            $(element).hover(function(){
                $(element).tooltip('show');
            }, function(){
                $(element).tooltip('hide');
            });
        }
    };
});

OraSchool.directive('showtab',function () {
    return {
        link: function (scope, element, attrs) {
            element.click(function(e) {
                e.preventDefault();
                $(element).tab('show');
            });
        }
    };
});

OraSchool.directive('tabheads',function () {
    return {
        link: function (scope, element, attrs) {
            $(element).children().first().addClass('active');
        }
    };
});

OraSchool.directive('tabcontent',function () {
    return {
        link: function (scope, element, attrs) {
            $(element).children().first().addClass('active');
        }
    };
});

OraSchool.directive('parseStyle', function($interpolate) {
    return function(scope, elem) {
        var exp = $interpolate(elem.html()),
            watchFunc = function () { return exp(scope); };

        scope.$watch(watchFunc, function (html) {
            elem.html(html);
        });
    };
});

OraSchool.filter('object2Array', function() {
    return function(input) {
        var out = [];
        for(i in input){
            out.push(input[i]);
        }
        return out;
    }
});

function uploadSuccessOrError(response){
    if(typeof response == 'string' && response != 1){
        $.toast({
            heading: 'School Application',
            text: response,
            position: 'top-right',
            loaderBg:'#ff6849',
            icon: 'error',
            hideAfter: 3000,
            stack: 6
        });
        return false;
    }
    if(response.jsMessage){
        $.toast({
            heading: response.jsTitle,
            text: response.jsMessage,
            position: 'top-right',
            loaderBg:'#ff6849',
            icon: 'info',
            hideAfter: 3000,
            stack: 6
        });
    }
    if(response.jsStatus){
        if(response.jsStatus == "0"){
            return false;
        }
    }
    return response;
}

function successOrError(data){
    if(data.jsStatus){
        if(data.jsStatus == "0"){
            return false;
        }
    }
    return data;
}

//New Functions Implementation

function apiResponse(response,image){
    if(response.status){
        if(typeof response.title !== 'undefined'){
            if(response.status == "success"){
                $.toast({
                    heading: response.title,
                    text: response.message,
                    position: 'top-right',
                    loaderBg:'#ff6849',
                    icon: 'success',
                    hideAfter: 3000,
                    stack: 6
                });
            }
            if(response.status == "failed"){
                $.toast({
                    heading: response.title,
                    text: response.message,
                    position: 'top-right',
                    loaderBg:'#ff6849',
                    icon: 'error',
                    hideAfter: 3000,
                    stack: 6
                });
            }
        }
        if(response.data){
            return response.data;
        }
    }else{
        return response;
    }
}

function apiModifyTable(originalData,id,response){
    angular.forEach(originalData, function (item,key) {
        if(item.id == id){
            originalData[key] = response;
        }
    });
    return originalData;
}


OraSchool.directive('typeahead', ['$compile', '$timeout', function($compile, $timeout) {
    return {
        restrict: 'A',
        transclude: true,
        scope: {
            ngModel: '=',
            typeahead: '=',
            typeaheadType: '=',
            typeaheadCallback: "="
        },
        link: function(scope, elem, attrs) {
        		var force_active = false;
        		scope.active = 0

        		scope.customFilter = function(item) {
        			search_value_lenth = scope.ngModel.length;
            	return item.name.substring(0, search_value_lenth).toLowerCase() == scope.ngModel.toLowerCase();
            }

            var template = `
            	<div class="dropdown search-typeahead">
            		<ul class="dropdown-menu" style="display:block;" ng-hide="!ngModel.length || !filitered.length || selected">
            			<li class="dropdown-item" ng-repeat="item in filitered = (typeahead | filter:customFilter | limitTo:5) track by $index" ng-click="click(item)" style="cursor:pointer" ng-class="{active:$index==active}" ng-mouseenter="mouseenter($index)">
            				<a>{{item.name}}</a>
            			</li>
            		</ul>
            	</div>`

            elem.bind('blur', function() {
                $timeout(function() {
                    scope.selected = true
                }, 100)
            })

            elem.bind("keydown", function($event) {
                if($event.keyCode == 38 && scope.active > 0) { // arrow up
                    scope.active--
                    scope.$digest()
                } else if($event.keyCode == 40 && scope.active < scope.filitered.length - 1) { // arrow down
                    scope.active++
                    scope.$digest()
                } else if($event.keyCode == 13 || $event.keyCode == 9 || $event.keyCode == 11) { // enter or tab
                    scope.$apply(function() {
                        scope.click(scope.filitered[scope.active])
                    })
                }

                scope.$watch('ngModel', function(input) {
	                if(scope.selected && scope.selected.name == input) {
	                    return
	                }

	                scope.selected = false

	                // if we have an exact match and there is only one item in the list, automatically select it
	                if(input && scope.filitered.length == 1 && scope.filitered[0].name.toLowerCase() == input.toLowerCase()) {
	                    scope.click(scope.filitered[0])
	                }
		            })

	            	elem.after($compile(template)(scope))
            })

            scope.click = function(item) {
                scope.ngModel = item.name
                scope.selected = item
                if(scope.typeaheadCallback) {
                    scope.typeaheadCallback(item)
                }
                elem[0].blur()
            }
            scope.mouseenter = function($index) {
                scope.active = $index
            }
        }
    }
}]);

OraSchool.filter('toArray', function () {
    'use strict';

    return function (obj) {
        if (!(obj instanceof Object)) {
            return obj;
        }

        return Object.keys(obj).map(function (key) {
            return Object.defineProperty(obj[key], '$key', {__proto__: null, value: key});
        });
    }
});