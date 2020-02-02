var OraSchool = angular.module('expensesController', []);

OraSchool.controller('expensesController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.expenses = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Expenses';
    });

    $scope.listExpenses = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/expenses/listAll/'+pageNumber).then(function(data) {
            $scope.expenses = data.expenses;
            $scope.totalItems = data.totalItems;
            $scope.expenses_cat = data.expenses_cat;
            $scope.totalExpenses = data.totalExpenses;
            showHideLoad(true);
        });
    }

    $scope.listExpenses(1);

    $scope.getTotal = function(key){
        var total = 0;
        for(var i = 0; i < $scope.expenses[key].length; i++){
            total += parseInt($scope.expenses[key][i].expenseAmount);
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
        dataFactory.httpRequest('index.php/expenses/'+id).then(function(data) {
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
            dataFactory.httpRequest('index.php/expenses/delete/'+item.id,'POST').then(function(data) {
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