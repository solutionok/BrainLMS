var OraSchool = angular.module('markSheetsController', []);

OraSchool.controller('markSheetsController', function(dataFactory,$rootScope,$scope,$sce) {
		$scope.studentMarksheet = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Mark sheets';
    });

    $scope.marksheet = function(){
    		var user_id = $rootScope.dashboardData.userId;

        showHideLoad();
        dataFactory.httpRequest('index.php/marksheet-collection/' + user_id).then(function(data) {
            $scope.studentMarksheet = data.marks;
            showHideLoad(true);
        });
    }

    $scope.marksheet();
});