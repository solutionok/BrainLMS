var OraSchool = angular.module('expensesCatController', []);

OraSchool.controller('expensesCatController', function(dataFactory,$rootScope,$scope) {
    $scope.expensesCats = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Expenses Categories';
    });

    dataFactory.httpRequest('index.php/expensesCat/listAll').then(function(data) {
        $scope.expensesCats = data;
        showHideLoad(true);
    });

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/expensesCat','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.expensesCats.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/expensesCat/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/expensesCat/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.expensesCats = apiModifyTable($scope.expensesCats,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/expensesCat/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.expensesCats.splice(index,1);
                }
                showHideLoad(true);
            });
        }
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