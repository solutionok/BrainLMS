var OraSchool = angular.module('invoice_transport_schedule', []);

OraSchool.controller('invoice_transport_schedule', function(dataFactory,$scope,$rootScope) {
    $scope.transportsSchedules = {};
    $scope.views = {};
    $scope.views.invoice_transport_schedule = true;
    $scope.form = {};
    $scope.userRole = $rootScope.dashboardData.role;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Invoice transport schedule';
    });

		$scope.load_data = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/schedule').then(function(data) {
            $scope.changeView('invoice_transport_schedule');
            $scope.form = data;
            showHideLoad(true);
        });
    }
    $scope.load_data();

    $scope.changeView = function(view){
            $scope.form = {};
        $scope.views[view] = true;
    }
});