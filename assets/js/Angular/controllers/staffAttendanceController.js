var OraSchool = angular.module('staffAttendanceController', []);

OraSchool.controller('staffAttendanceController', function(dataFactory,$scope) {
    $scope.views = {};
    $scope.form = {};
    $scope.views.list = true;
    $scope.teachers = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Staff attendance';
    });

    showHideLoad(true);
    $scope.startAttendance = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/sattendance/list','POST',{},$scope.form).then(function(data) {
            $scope.teachers = data.teachers;
            if(typeof data.InOut != "undefined"){
                $scope.form.InOut = data.InOut;
            }
            $scope.changeView('lists');
            showHideLoad(true);
        });
    }

    $scope.selectAll = function(type){
        if ($scope.selectedAll) {
            $scope.selectedAll = true;
        } else {
            $scope.selectedAll = false;
        }
        angular.forEach($scope.teachers, function (item) {
            item.attendance = type;
        });
    }

    $scope.saveAttendance = function(){
        showHideLoad();
        $scope.form.attendanceDay = $scope.form.attendanceDay;
        $scope.form.stAttendance = $scope.teachers;
        dataFactory.httpRequest('index.php/sattendance','POST',{},$scope.form).then(function(data) {
            apiResponse(data,'add');
            $scope.changeView('list');
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views.lists = false;
        $scope.views.edit = false;
        $scope.views.editSub = false;
        $scope.views.addSub = false;
        $scope.views[view] = true;
    }
});