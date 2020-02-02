var OraSchool = angular.module('mobileNotifController', []);

OraSchool.controller('mobileNotifController', function(dataFactory,$rootScope,$route,$scope,$location,$routeParams) {
    $scope.messages = {};
    $scope.views = {};
    $scope.form = {};
    $scope.form.selectedUsers = [];
    $scope.sendNewScope = "form";
    $scope.totalItems = 0;
    $scope.active_table = 'sendNotif';

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Mobile Notifications';
    });

    $scope.getClickedTab = function(value) {
  		$scope.active_table = value;
    }

    $scope.loadNotifications = function(page){
        dataFactory.httpRequest('index.php/mobileNotif/listAll/' + page).then(function(data) {
            $scope.messages = data.items;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.loadNotifications(1);

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/mobileNotif/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.messages.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.removeUser = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.selectedUsers) {
                if($scope.form.selectedUsers[x].id == index){
                    $scope.form.selectedUsers.splice(x,1);
                    break;
                }
            }
        }
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

    $scope.changeView('list');
});