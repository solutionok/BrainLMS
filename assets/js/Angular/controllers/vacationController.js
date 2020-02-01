var OraSchool = angular.module('vacationController', []);

OraSchool.controller('vacationController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.views = {};
    $scope.form = {};
    $scope.vacation ;
    $scope.vacation_requests = {};
    $scope.my_requests = {};
    var methodName = $route.current.methodName;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Vacation';
    });

    if(methodName == "approve"){
        $scope.views.list_approve = true;
        showHideLoad();
        dataFactory.httpRequest('index.php/vacation/approve').then(function(data) {
            $scope.vacation_requests = data;
            showHideLoad(true);
        });
    }else if(methodName == "mine"){
        $scope.views.list_mine = true;
        showHideLoad();
        dataFactory.httpRequest('index.php/vacation/mine').then(function(data) {
            $scope.my_requests = data;
            showHideLoad(true);
        });
    }else{
        $scope.views.list = true;
        showHideLoad(true);
    }

    $scope.approveVacation = function(userid,status,index){
        showHideLoad();
        dataFactory.httpRequest('index.php/vacation/approve','POST',{},{'id':userid,'status':status}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                console.log(index);
                $scope.vacation_requests.splice(index,1);
                console.log($scope.vacation_requests);
            }
            showHideLoad(true);
        });
    }

    $scope.getVacation = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/vacation','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.vacation = response;
                $scope.changeView('lists');
            }
            showHideLoad(true);
        });
    }

    $scope.confirmVacation = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/vacation/confirm','POST',{},{'days':$scope.vacation}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.lists = false;
        $scope.views.list_approve = false;
        $scope.views.list_mine = false;
        $scope.views[view] = true;
    }
});