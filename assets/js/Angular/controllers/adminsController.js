var OraSchool = angular.module('adminsController', []);

OraSchool.controller('adminsController', function(dataFactory,$rootScope,$scope) {
    $scope.admins = {};
    $scope.roles = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.comVia = ["mail","sms","phone"];
    $scope.form.customPermissions = [];

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Admins';
    });

    $scope.load_admins = function(){
        dataFactory.httpRequest('index.php/admins/listAll').then(function(data) {
            $scope.admins = data.admins;
            $scope.roles = data.roles;
            $scope.changeView('list');
            showHideLoad(true);
        });
    }
    $scope.load_admins();

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();
            $scope.load_admins();
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/admins/delete/'+item.id,'POST',{},{}).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.admins.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/admins/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.hasPermission = function(permission){
        var caseNow = $.inArray(permission, $scope.form.customPermissions) > -1;
        return caseNow;
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();
            $scope.load_admins();
        }
        showHideLoad(true);
    }

    $scope.account_status = function(user_id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/admins/account_status/'+user_id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.admins[$index].account_active = response.account_active;
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.comVia = ["mail","sms","phone"];
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});