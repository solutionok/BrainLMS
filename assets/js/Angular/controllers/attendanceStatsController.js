var OraSchool = angular.module('attendanceStatsController', []);

OraSchool.controller('attendanceStatsController', function(dataFactory,$scope,$sce) {
    $scope.attendanceStats = {};
    $scope.attendanceData = {};
    $scope.userRole;
    $scope.views = {};
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Attendance stats';
    });

    dataFactory.httpRequest('index.php/attendance/stats').then(function(data) {
        $scope.attendanceStats = data;
        if(data.role == "student"){
            $scope.changeView('lists');
        }else if(data.role == "parent"){
            $scope.changeView('listp');
        }
        $scope.userRole = data.attendanceModel;
        showHideLoad(true);
    });

    $scope.statsAttendance = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/attendance/stats','POST',{},$scope.form).then(function(data) {
            if(data){
                $scope.attendanceData = data;
                $scope.changeView('listdata');
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.listdata = false;
        $scope.views.lists = false;
        $scope.views.listp = false;
        $scope.views[view] = true;
    }
});