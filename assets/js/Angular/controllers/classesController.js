var OraSchool = angular.module('classesController', []);

OraSchool.controller('classesController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.teachers = {};
    // $scope.dormitory = {};
    $scope.subject = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.feeTypes = {};
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Classes';
    });

    $scope.getListData = function() {
	    dataFactory.httpRequest('index.php/classes/listAll').then(function(data) {
	        $scope.classes = data.classes;
	        $scope.teachers = data.teachers;
	        // $scope.dormitory = data.dormitory;
	        $scope.subject = data.subject;
	        showHideLoad(true);
	    });
    }

    $scope.getListData();

    $scope.addClass = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/feeTypes/listAll').then(function(data) {
            $scope.feeTypes = data;
            $scope.changeView('add');
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        $scope.form.allocationValues = $scope.feeTypes;
        dataFactory.httpRequest('index.php/classes','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.classes.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/classes/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.classes.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/classes/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/classes/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.classes = apiModifyTable($scope.classes,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        if(view == "list") {
        		$scope.getListData();
        }

        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});