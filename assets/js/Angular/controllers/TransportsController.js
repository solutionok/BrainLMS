var OraSchool = angular.module('TransportsController', []);

OraSchool.controller('TransportsController', function(dataFactory,$scope,$rootScope) {
    $scope.transports = {};
    $scope.transportsList = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole = $rootScope.dashboardData.role;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Transports';
    });

    $scope.load_data = function(){
        dataFactory.httpRequest('index.php/transports/listAll').then(function(data) {
            $scope.transports = data.routes;
            $scope.vehicles = data.vehicles;
            showHideLoad(true);
        });
    }
    $scope.load_data();

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }


    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/transports/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.transports.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.list = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/list/'+id).then(function(data) {
            $scope.changeView('listSubs');
            $scope.transportsList = data;
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show" ){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.listSubs = false;
        $scope.views[view] = true;
    }
});