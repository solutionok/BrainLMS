var OraSchool = angular.module('payroll_hourlyController', []);

OraSchool.controller('payroll_hourlyController', function(dataFactory,$rootScope,$scope) {
    $scope.hourly_base = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Payroll hourly';
    });

    dataFactory.httpRequest('index.php/hourly_base/listAll').then(function(data) {
        $scope.hourly_base = data;
        showHideLoad(true);
    });

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/hourly_base/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/hourly_base/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.hourly_base = apiModifyTable($scope.hourly_base,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/hourly_base/delete/'+item.id,'POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.hourly_base.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/hourly_base','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.hourly_base.push(response);
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
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});