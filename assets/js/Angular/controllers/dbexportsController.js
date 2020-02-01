var OraSchool = angular.module('dbexportsController', []);

OraSchool.controller('dbexportsController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.views = {};
    $scope.messages = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.selectedUsers = [];
    $scope.formS = {};
    $scope.sendNewScope = "form";

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | DB exports';
    });

    showHideLoad(true);
    $scope.loadNotifications = function(page){
        dataFactory.httpRequest('index.php/mobileNotif/listAll/' + page).then(function(data) {
            $scope.subject_list = data.subject_list;
            $scope.messages = data.items;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "send"){
            $scope.form = {};
        }
        $scope.views.send = false;
        $scope.views.list = false;
        $scope.views.settings = false;
        $scope.views[view] = true;
    }
});