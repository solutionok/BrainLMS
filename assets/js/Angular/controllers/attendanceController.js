var OraSchool = angular.module('attendanceController', []);

OraSchool.controller('attendanceController', function(dataFactory,$scope) {
    $scope.classes = {};
    $scope.attendanceModel;
    $scope.subjects = {};
    $scope.views = {};
    $scope.form = {};
    $scope.userRole ;
    $scope.class = {};
    $scope.subject = {};
    $scope.students = {};
    $scope.sechow = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Attendance';
    });

    $scope.getCurrentDate = function() {
    	var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth() + 1; //January is 0!

			var yyyy = today.getFullYear();
			if (dd < 10) {
			  dd = '0' + dd;
			}
			if (mm < 10) {
			  mm = '0' + mm;
			}
			var today = dd + '/' + mm + '/' + yyyy;
			return today;
    }

    dataFactory.httpRequest('index.php/attendance/data').then(function(data) {
        $scope.classes = data.classes;
        $scope.subjects = data.subject;
        $scope.attendanceModel = data.attendanceModel;
        $scope.userRole = data.userRole;
        $scope.changeView('list');

        if($scope.classes.length) {
        	$scope.form.classId = $scope.classes[0].id;
        	$scope.form.attendanceDay = $scope.getCurrentDate();
        	$scope.subjectList();
        }

        showHideLoad(true);
    });

    $scope.selectAll = function(type){
        if ($scope.selectedAll) {
            $scope.selectedAll = true;
        } else {
            $scope.selectedAll = false;
        }
        angular.forEach($scope.students, function (item) {
            item.attendance = type;
        });
    }

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/attendance/get-current-sections-and-subjects','POST',{},{
        	"classId":$scope.form.classId
        }).then(function(data) {
            $scope.subjects = data.subjects;
            $scope.sections = data.sections;

            if($scope.sections.length) {
            	$scope.form.sectionId = $scope.sections[0].id;
            }
        });
    }

    $scope.startAttendance = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/attendance/list','POST',{},$scope.form).then(function(data) {
            $scope.class = data.class;
            $scope.sechow = data.sechow;
            if(data.subject){
                $scope.subject = data.subject;
            }
            $scope.students = data.students;
            angular.forEach($scope.students, function (item) {
            	if(item.attendance.length == 0) {
            		item.attendance = true;
            	}
		        });
            $scope.changeView('lists');
            showHideLoad(true);
        });
    }

    $scope.saveAttendance = function(){
        showHideLoad();
        $scope.form.classId = $scope.class.id;
        $scope.form.attendanceDay = $scope.form.attendanceDay;
        $scope.form.stAttendance = $scope.students;
        if($scope.subject.id){
            $scope.form.subject = $scope.subject.id;
        }
        dataFactory.httpRequest('index.php/attendance','POST',{},$scope.form).then(function(data) {
            apiResponse(data,'add');
            $scope.changeView('list');
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
    		if(view == "lists"){
    			// $scope.selectAll(1);
        }

        $scope.views.list = false;
        $scope.views.lists = false;
        $scope.views.edit = false;
        $scope.views.editSub = false;
        $scope.views.addSub = false;
        $scope.views[view] = true;
    }
});