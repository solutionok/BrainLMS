var OraSchool = angular.module('sectionsController', []);

OraSchool.controller('sectionsController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.sections = {};
    $scope.classes = {};
    $scope.teachers = {};
    $scope.classTeachers = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, '\\$&');
		    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
		    return decodeURIComponent(results[2].replace(/\+/g, ' '));
		}

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Sections';
    });

    dataFactory.httpRequest('index.php/sections/listAll').then(function(data) {
        $scope.sections = data.sections;
      	$scope.classes = data.classes;
        $scope.teachers = data.teachers;
        showHideLoad(true);
    });

    $scope.getClassTeacherByClassId = function(state, classTeacherIds) {
    	class_id = $scope.form.classId
    	if(class_id > 0) {
    		showHideLoad();
    		dataFactory.httpRequest(`index.php/classes/get-class-teachers-by-class-id/${class_id}`).then(function(data) {
		        $scope.classTeachers = data.classTeachers;
		    		forceUpdateClassTeacherIds(state, classTeacherIds);
		        showHideLoad(true);
		    });
    	}
    }

    function forceUpdateClassTeacherIds(state, classTeacherIds) {
    	if(state == 'edit') {
	    	setTimeout(function(){
	        	$scope.form.classTeacherId = classTeacherIds
	        	$scope.$apply();
		    }, 200)
      }
    }

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
      dataFactory.httpRequest('index.php/sections/'+id).then(function(data) {
          $scope.changeView('edit');
          $scope.form.id = data.id;
          $scope.form.sectionName = data.sectionName;
          $scope.form.classId = data.classId;
          $scope.getClassTeacherByClassId('edit', data.classTeacherId);
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