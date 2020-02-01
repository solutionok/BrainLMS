var OraSchool = angular.module('payroll_salaryController', []);

OraSchool.controller('payroll_salaryController', function(dataFactory,$rootScope,$scope) {
    $scope.salary_base = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Payroll salaries';
    });

    dataFactory.httpRequest('index.php/salary_base/listAll').then(function(data) {
        $scope.salary_base = data;
        showHideLoad(true);
    });

    $scope.addAllowencRow = function(){
        if(typeof($scope.form.salary_allowence) == "undefined"){
            $scope.form.salary_allowence = [];
        }
        $scope.form.salary_allowence.push({'title':'','amount':''});
    }

    $scope.removeAllowenceRow = function(row,index){
        $scope.form.salary_allowence.splice(index,1);
        $scope.recalcTotalAmount();
    }

    $scope.addDeductionRow = function(){
        if(typeof($scope.form.salary_deduction) == "undefined"){
            $scope.form.salary_deduction = [];
        }
        $scope.form.salary_deduction.push({'title':'','amount':''});
    }

    $scope.removeDeductionRow = function(row,index){
        $scope.form.salary_deduction.splice(index,1);
        $scope.recalcTotalAmount();
    }

    $scope.recalcTotalAmount = function(){
        $scope.form.gross_salary = parseInt($scope.form.salary_basic);
        angular.forEach($scope.form.salary_allowence, function(value, key) {
            $scope.form.gross_salary += parseInt(value.amount);
        });
        $scope.form.net_salary = parseInt($scope.form.gross_salary);
        angular.forEach($scope.form.salary_deduction, function(value, key) {
            $scope.form.net_salary -= parseInt(value.amount);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/salary_base/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/salary_base/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.salary_base = apiModifyTable($scope.salary_base,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/salary_base/delete/'+item.id,'POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.salary_base.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/salary_base','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.salary_base.push(response);
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