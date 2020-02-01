var OraSchool = angular.module('staffAttendance_reportController', []);

OraSchool.controller('staffAttendance_reportController', function(dataFactory,$scope,$rootScope) {
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.employees = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Staff attendance report';
    });

    showHideLoad(true);

    $scope.generateReport = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/sattendance/report','POST',{},$scope.form).then(function(data) {
            $scope.employees = data.employees;
            $scope.date_range = data.date_range;
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