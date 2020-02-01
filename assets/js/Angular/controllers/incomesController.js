var OraSchool = angular.module('incomesController', []);

OraSchool.controller('incomesController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.incomes = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Incomes';
    });

    $scope.listIncome = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/incomes/listAll/'+pageNumber).then(function(data) {
            $scope.incomes = data.incomes;
            $scope.totalItems = data.totalItems;
            $scope.totalIncome = data.totalIncome;
            $scope.income_cat = data.income_cat;
            showHideLoad(true);
        });
    }

    $scope.listIncome(1);

    $scope.getTotal = function(key){
        var total = 0;
        for(var i = 0; i < $scope.incomes[key].length; i++){
            total += parseInt($scope.incomes[key][i].expenseAmount);
        }
        return total;
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        response = apiResponse(data,'add');
        if(data.status == "success"){
            $route.reload();
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/incomes/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        showHideLoad();
        response = apiResponse(data,'edit');
        if(data.status == "success"){
            $route.reload();
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/incomes/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $route.reload();
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