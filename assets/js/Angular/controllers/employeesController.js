var OraSchool = angular.module('employeesController', []);

OraSchool.controller('employeesController', function(dataFactory,$rootScope,$scope) {
    $scope.employees = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.comVia = ["mail","sms","phone"];
    $scope.current_page = 1;
    $scope.totalItemsTemp = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Employees';
    });

    $scope.totalItems = 0;
    $scope.pageChanged = function(newPage) {
        $scope.current_page = newPage;
        $scope.getResultsPage();
    };

    $scope.load_data = function(pageNumber){
    		showHideLoad();
        dataFactory.httpRequest('index.php/employees/listAll/'+pageNumber).then(function(data) {
            $scope.employees = data.employees;
            $scope.totalItems = data.totalItems;
            $scope.roles = data.roles;
            $scope.departments = data.departments;
            $scope.designations = data.designations;
            $scope.changeView('list');
            showHideLoad(true);
        });
    }

    $scope.getResultsPage = function(newpage = ""){
        if(newpage != ""){
            $scope.current_page = newpage;
        }
        $scope.load_data( $scope.current_page );
    }
    $scope.getResultsPage();

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();
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
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});