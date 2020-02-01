var OraSchool = angular.module('employeesController', []);

OraSchool.controller('employeesController', function(dataFactory,$rootScope,$scope) {
    $scope.employees = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.comVia = ["mail","sms","phone"];

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Employees';
    });

    $scope.load_data = function(){
        dataFactory.httpRequest('index.php/employees/listAll').then(function(data) {
            $scope.employees = data.employees;
            $scope.roles = data.roles;
            $scope.departments = data.departments;
            $scope.designations = data.designations;
            $scope.changeView('list');
            showHideLoad(true);
        });
    }
    $scope.load_data();

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            // reset form
            $scope.form = {};
            $('[name="photo"]').val('');

            $scope.employees.push(response);
            $scope.load_data();
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/employees/delete/'+item.id,'POST',{},{}).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.employees.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/employees/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            // reset form
            $scope.form = {};
            $('[name="photo"]').val('');

            $scope.load_data();
        }
        showHideLoad(true);
    }

    $scope.account_status = function(user_id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/employees/account_status/'+user_id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.employees[$index].account_active = response.account_active;
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.comVia = ["mail","sms","phone"];
        }
        if(view == "edit"){
        		console.log($scope.form)
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});