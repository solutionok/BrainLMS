var OraSchool = angular.module('subjectsController', []);

OraSchool.controller('subjectsController', function(dataFactory,$rootScope,$scope) {
    $scope.subjects = {};
    $scope.teachers = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Subjects';
    });

    dataFactory.httpRequest('index.php/subjects/listAll').then(function(data) {
        $scope.subjects = data.subjects;
        angular.forEach($scope.subjects, function(value, key) {
            $scope.subjects[key].teacherId = JSON.parse($scope.subjects[key].teacherId);
        });
        $scope.teachers = data.teachers;
        $scope.classes = data.classes;
        showHideLoad(true);
    });

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/subjects','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                response.teacherId = JSON.parse(response.teacherId);
                $scope.subjects.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/subjects/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.subjects.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/subjects/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/subjects/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                response.teacherId = JSON.parse(response.teacherId);
                $scope.subjects = apiModifyTable($scope.subjects,response.id,response);
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