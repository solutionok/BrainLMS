var OraSchool = angular.module('attendance_reportController', []);

OraSchool.controller('attendance_reportController', function(dataFactory,$scope,$rootScope) {
    $scope.classes = {};
    $scope.attendanceModel;
    $scope.subjects = {};
    $scope.views = {};
    $scope.form = {};
    $scope.userRole ;
    $scope.class = {};
    $scope.subject = {};
    $scope.students = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Attendance report';
    });

    dataFactory.httpRequest('index.php/attendance/data').then(function(data) {
        $scope.classes = data.classes;
        $scope.subjects = data.subject;
        $scope.attendanceModel = data.attendanceModel;
        $scope.changeView('list');
        showHideLoad(true);
    });

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.classId}).then(function(data) {
            $scope.subjects = data.subjects;
            $scope.sections = data.sections;
        });
    }

    $scope.generateReport = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/attendance/report','POST',{},$scope.form).then(function(data) {
            $scope.students = data.students;
            $scope.date_range = data.date_range;
            $scope.class = data.class;
            $scope.subject = data.subject;
            $scope.changeView('report');
            showHideLoad(true);
        });
    }

    $scope.firstChunk = function(textdata){
        var splitted = textdata.split("/");
        if($rootScope.dashboardData.dateformat == "m/d/Y"){
            return splitted[1];
        }
        if($rootScope.dashboardData.dateformat == "d/m/Y"){
            return splitted[0];
        }
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views.report = false;
        $scope.views[view] = true;
    }
});