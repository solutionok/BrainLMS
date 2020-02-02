var OraSchool = angular.module('users_salaryController', []);

OraSchool.controller('users_salaryController', function(dataFactory,$scope) {
    $scope.views = {};
    $scope.form = {};
    $scope.views.list = true;
    $scope.salary_base = {};
    $scope.hourly_base = {};
    $scope.employees = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Users salary';
    });

    showHideLoad(true);
    $scope.search_users = function(){
        showHideLoad();
        $scope.show_results_table = true;
        dataFactory.httpRequest('index.php/users_salary/search','POST',{},{'user':$scope.form.user_search}).then(function(data) {
            $scope.employees = data.employees;
            $scope.salary_base = data.salary_base;
            $scope.hourly_base = data.hourly_base;
            showHideLoad(true);
        });
    }

    $scope.edit = function(employee){
        $scope.form = employee;
        $scope.modalTitle = "Edit employee salary base";
        $scope.edit_base_modal = !$scope.edit_base_modal;
        if(!$scope.form.salary_type){
            $scope.form.salary_type = "monthly";
        }
    }

    $scope.update_user_salary = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/users_salary/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'remove');
            if(data.status == "success"){
                $scope.edit_base_modal = !$scope.edit_base_modal;
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views.lists = false;
        $scope.views.edit = false;
        $scope.views.editSub = false;
        $scope.views.addSub = false;
        $scope.views[view] = true;
    }
});