var OraSchool = angular.module('payroll_make_payController', []);

OraSchool.controller('payroll_make_payController', function(dataFactory,$rootScope,$scope) {
    $scope.views = {};
    $scope.form = {};
    $scope.views.list = true;
    $scope.salary_base = {};
    $scope.hourly_base = {};
    $scope.employees = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Payroll make pay';
    });

    showHideLoad(true);
    $scope.search_users = function(){
        showHideLoad();
        $scope.show_results_table = true;
        dataFactory.httpRequest('index.php/make_payment/search','POST',{},{'user':$scope.form.user_search}).then(function(data) {
            $scope.employees = data.employees;
            $scope.salary_base = data.salary_base;
            $scope.hourly_base = data.hourly_base;
            $scope.currency_symbol = data.currency_symbol;
            showHideLoad(true);
        });
    }

    $scope.make_payment = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/make_payment/'+id).then(function(data) {
            response = apiResponse(data,'remove');
            if(data.status == "success"){
                $scope.changeView('make_payment');
                $scope.user_data = response;
                $scope.form.userid = $scope.user_data.user.id;
                $scope.form.pay_overtime_count = 0;
                $scope.recalculate_salary();
            }
            showHideLoad(true);
        });
    }

    $scope.make_user_payment_submit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/make_payment/'+$scope.form.userid,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'remove');
            if(data.status == "success"){
                $scope.user_data = response;
                $scope.form = {};
                $scope.form.userid = $scope.user_data.user.id;
                $scope.form.pay_overtime_count = 0;
            }
            showHideLoad(true);
        });
    }

    $scope.recalculate_salary = function(){
        $scope.form.pay_amount = 0;
        if($scope.user_data.user.salary_type == "monthly"){
            $scope.form.pay_amount += parseInt($scope.user_data.user.salary_details.net_salary);
            $scope.form.pay_amount += parseInt($scope.user_data.user.salary_details.hour_overtime * $scope.form.pay_overtime_count);
        }

        if($scope.user_data.user.salary_type == "hourly"){
            $scope.form.pay_amount += parseInt($scope.user_data.user.salary_details.hourly_cost * $scope.form.pay_hours);
        }
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/make_payment/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.user_data.history.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views.make_payment = false;
        $scope.views[view] = true;
    }
});