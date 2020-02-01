var OraSchool = angular.module('frontend_settingsController', []);

OraSchool.controller('frontend_settingsController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.views = {};
    $scope.form = {};
    $scope.newDayOff ;
    var methodName = $route.current.methodName;
    $scope.oldThemeVal;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Frontend settings';
    });

    $scope.changeView = function(view){
        $scope.views.settings = false;
        $scope.views.terms = false;
        $scope.views[view] = true;
    }

    dataFactory.httpRequest('index.php/frontend/settings').then(function(data) {
        $scope.form = data;
        showHideLoad(true);
    });

    $scope.saveSettings = function(){
        showHideLoad();
        $scope.form.smsProvider = $scope.formS;
        $scope.form.mailProvider = $scope.formM;
        dataFactory.httpRequest('index.php/frontend/settings','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            location.reload();
            showHideLoad(true);
        });
    }
});