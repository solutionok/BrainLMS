var OraSchool = angular.module('settingsController', []);

OraSchool.controller('settingsController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.views = {};
    $scope.form = {};
    $scope.languages = {};
    $scope.newDayOff ;
    var methodName = $route.current.methodName;
    $scope.oldThemeVal;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Settings';
    });

    $scope.changeView = function(view){
        $scope.views.settings = false;
        $scope.views.terms = false;
        $scope.views[view] = true;
    }

    if(methodName == "settings"){
        dataFactory.httpRequest('index.php/siteSettings/langs').then(function(data) {
            $scope.languages = data.languages;
            showHideLoad(true);
        });
        dataFactory.httpRequest('index.php/siteSettings/siteSettings').then(function(data) {
            $scope.form = data.settings;
            $scope.timezone_list = data.timezone_list;
            $scope.formS = data.smsProvider;
            $scope.formM = data.mailProvider;
            $scope.oldThemeVal = $scope.form.layoutColor;
            $scope.globalcalendars = data.globalcalendars;
            $scope.biometric_device_status = data.biometric_device_status;
            showHideLoad(true);
        });
        $scope.changeView('settings');
    }else if(methodName == "terms"){
        dataFactory.httpRequest('index.php/siteSettings/terms').then(function(data) {
            $scope.form = data;
            showHideLoad(true);
        });
        $scope.changeView('terms');
    }

    $scope.isDaySelected = function(arrayData,valueData){
        return arrayData.indexOf(valueData) > -1;
    }

    $scope.officialVacationDayAdd = function(){
        if($scope.newDayOff == '' || typeof $scope.newDayOff === "undefined"){ return; }
        $scope.form.officialVacationDay.push($scope.newDayOff);
    }

    $scope.removeVacationDay = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            $scope.form.officialVacationDay.splice(index,1);
        }
    }

    $scope.moduleActivated = function(module){
        return $.inArray(module, $scope.form.activatedModules) > -1;
    }

    $scope.saveEdit = function(){
        showHideLoad();
        $scope.form.smsProvider = $scope.formS;
        $scope.form.mailProvider = $scope.formM;
        dataFactory.httpRequest('index.php/siteSettings/siteSettings','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            location.reload();
            showHideLoad(true);
        });
    }

    $scope.saveTerms = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/siteSettings/terms','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            showHideLoad(true);
        });
    }

    $scope.test_mail_function = function(){
        $scope.modalTitle = "Test Mail Function";
        $scope.test_mail_function_modal = !$scope.test_mail_function_modal;
        $scope.testmailform = {};
    }

    $scope.test_mail_function_action = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/siteSettings/test_mail_function','POST',{},$scope.testmailform).then(function(server_response) {
            alert("Server Response : " + server_response.message);
            $scope.test_mail_function_modal = !$scope.test_mail_function_modal;
            showHideLoad(true);
        });
    }

    $scope.test_sms_function = function(){
        $scope.modalTitle = "Test SMS Function";
        $scope.test_sms_function_modal = !$scope.test_sms_function_modal;
        $scope.testsmsform = {};
    }

    $scope.test_sms_function_action = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/siteSettings/test_sms_function','POST',{},$scope.testsmsform).then(function(server_response) {
            alert("Server Response : " + server_response.message);
            $scope.test_sms_function_modal = !$scope.test_sms_function_modal;
            showHideLoad(true);
        });
    }
});