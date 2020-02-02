var OraSchool = angular.module('transport_members', []);

OraSchool.controller('transport_members', function(dataFactory,$scope,$rootScope) {
    $scope.transports = {};
    $scope.transportsList = {};
    $scope.views = {};
    $scope.views.members = true;
    $scope.form = {};
    $scope.userRole = $rootScope.dashboardData.role;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Transport members';
    });

    $scope.load_data = function(){
        dataFactory.httpRequest('index.php/transports/members').then(function(data) {
            $scope.transports = data.transports;
            showHideLoad(true);
        });
    }
    $scope.load_data();

    $scope.search_users = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/members','POST',{},$scope.form).then(function(data) {
            $scope.transport_members = data
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.listSubs = false;
        $scope.views[view] = true;
    }
});