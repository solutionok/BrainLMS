var OraSchool = angular.module('materialsController', []);

OraSchool.controller('materialsController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.subject = {};
    $scope.materials = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.loading = true;
    $scope.userRole;
    $scope.uploads_provider = '';
    $scope.current_shown_item = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Materials';
    });

    $scope.listAll = function(){
	    showHideLoad();
	    dataFactory.httpRequest('index.php/materials/listAll').then(function(data) {
	        $scope.classes = data.classes;
	        $scope.materials = data.materials;
	        $scope.userRole = data.userRole
	        $scope.loading = false;
	        showHideLoad(true);
	    });
    }
    $scope.listAll();

    $scope.getUploadsConfig = function() {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/uploads-config', 'POST').then(function(data) {
          $scope.uploads_provider = data.uploads_provider;
          showHideLoad(true);
      });
    }
    $scope.getUploadsConfig();

    $scope.numberSelected = function(item){
        var count = $(item + " :selected").length;
        if(count == 0){
            return true;
        }
    }

    $scope.showMaterial = function(item) {
    	$scope.current_shown_item = item;
    	console.log(item);
    	$scope.changeView('upload_file');
    }

    $scope.sectionsList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.class_id}).then(function(data) {
            $scope.subject = data.subjects;
            $scope.sections = data.sections;
            $scope.form.subject = data.subjects;
            $scope.form.sections = data.sections;
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/materials/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.isSectionSelected = function(arrayData,valueData){
        return arrayData.indexOf(valueData) > -1;
    }

    $scope.saveEdit = function(data){
        response = apiResponse(data,'edit');
        if(data.status == "success"){
            showHideLoad();
            $scope.materials = apiModifyTable($scope.materials,response.id,response);
            $scope.changeView('list');
            showHideLoad(true);
        }
        $('#material_edit_file').val('');
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/materials/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.materials.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(data){
        response = apiResponse(data,'add');
        if(data.status == "success"){
            showHideLoad();
            $scope.materials.push(response);
            $scope.changeView('list');
            showHideLoad(true);
        }
        $('#material_add_file').val('');
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.upload_file = false;
        $scope.views[view] = true;
    }
});