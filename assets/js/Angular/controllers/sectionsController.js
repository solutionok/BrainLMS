var OraSchool = angular.module('sectionsController', []);

OraSchool.controller('sectionsController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.sections = {};
    $scope.classes = {};
    $scope.teachers = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Sections';
    });

    dataFactory.httpRequest('index.php/sections/listAll').then(function(data) {
        $scope.sections = data.sections;
        $scope.classes = data.classes;
        $scope.teachers = data.teachers;
        showHideLoad(true);
    });

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/sections','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $route.reload();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/sections/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/sections/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $route.reload();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/sections/delete/'+item.id,'POST').then(function(data) {
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