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

    dataFactory.httpRequest('index.php/attendance/data').then(function(data) {
        $scope.classes = data.classes;
        $scope.subjects = data.subject;
        $scope.attendanceModel = data.attendanceModel;
        $scope.userRole = data.userRole;
        $scope.changeView('list');
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
    		showHideLoad();
        dataFactory.httpRequest('index.php/attendance/get-current-sections-and-subjects','POST',{},{
        	"classId": $scope.form.classId
        }).then(function(data) {
            $scope.subjects = data.subjects;
            $scope.sections = data.sections;
            showHideLoad(true);
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
        $scope.form.sectionName = $scope.sechow.sectionName;
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