var OraSchool = angular.module('accountSettingsController', []);

OraSchool.controller('accountSettingsController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.account = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.languages = {};
    $scope.languageAllow ;
    var methodName = $route.current.methodName;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Account settings';
    });

    $scope.changeView = function(view){
        if(view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.profile = false;
        $scope.views.email = false;
        $scope.views.password = false;
        $scope.views.invoices = false;
        $scope.views.invoiceDetails = false;
        $scope.views[view] = true;
    }

    if(methodName == "profile"){
        dataFactory.httpRequest('index.php/accountSettings/langs').then(function(data) {
            $scope.languages = data.languages;
            $scope.languageAllow = data.languageAllow;
            $scope.layoutColorUserChange = data.layoutColorUserChange;
            showHideLoad(true);
        });
        dataFactory.httpRequest('index.php/accountSettings/data').then(function(data) {
            $scope.form = data;
            $scope.oldThemeVal = data.defTheme;
            $scope.defLang = data.defLang;
            $scope.changeView('profile');
            showHideLoad(true);
        });
    }else if(methodName == "email"){
        $scope.form = {};
        $scope.changeView('email');
        showHideLoad(true);
    }else if(methodName == "password"){
        $scope.form = {};
        $scope.changeView('password');
        showHideLoad(true);
    }else if(methodName == "invoices"){
        dataFactory.httpRequest('index.php/accountSettings/invoices').then(function(data) {
            $scope.invoices = data.invoices;
            $scope.changeView('invoices');
            showHideLoad(true);
        });
    }

    $scope.seeInvoice = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/accountSettings/invoices/'+id).then(function(data) {
            $scope.invoice = data;
            $scope.changeView('invoiceDetails');
            showHideLoad(true);
        });
    }

    $scope.payOnline = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/invoice/'+id).then(function(data) {
            $scope.invoice = data;
            $scope.modalTitle = "Pay Invoice Online";
            $scope.payOnlineModal = !$scope.payOnlineModal;
            showHideLoad(true);
        });
    }

    $scope.payOnlineNow = function(id){
        $scope.form.invoice = id;
    }

    $scope.saveEmail = function(){
        if($scope.form.email != $scope.form.reemail){
            alert($rootScope.phrase.mailReMailDontMatch);
        }else{
            showHideLoad();
            dataFactory.httpRequest('index.php/accountSettings/email','POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'edit');
                showHideLoad(true);
            });
        }
    }

    $scope.savePassword = function(){
        if($scope.form.newPassword != $scope.form.repassword){
            alert($rootScope.phrase.passRepassDontMatch);
        }else{
            showHideLoad();
            dataFactory.httpRequest('index.php/accountSettings/password','POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'edit');
                showHideLoad(true);
            });
        }
    }

    $scope.saveProfile = function(data){
        response = apiResponse(data,'edit');
        if(response){
            if($scope.form.defTheme != $scope.oldThemeVal){
                location.reload();
            }
            if($scope.form.defLang != $scope.defLang){
                location.reload();
            }
            $scope.form = response;
        }
        showHideLoad(true);
    }
});