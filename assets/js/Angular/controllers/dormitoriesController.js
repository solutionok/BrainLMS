var OraSchool = angular.module('dormitoriesController', []);

OraSchool.controller('dormitoriesController', function(dataFactory,$rootScope,$scope) {
    $scope.dormitories = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Dormitories';
    });

    dataFactory.httpRequest('index.php/dormitories/listAll').then(function(data) {
        $scope.dormitories = data;
        showHideLoad(true);
    });

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/dormitories/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/dormitories/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.dormitories = apiModifyTable($scope.dormitories,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/dormitories/delete/'+item.id,'POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.dormitories.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/dormitories','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.dormitories.push(response);
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