var OraSchool = angular.module('disciplinesController', []);

OraSchool.controller('disciplinesController', function(dataFactory,$rootScope,$scope) {
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.status_id = 1;
    $scope.disciplines = {};
    $scope.totalItems = 0;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Disciplines';
    });

    $scope.listAllData = function(pageNumber) {
	    showHideLoad();
      dataFactory.httpRequest('index.php/disciplines/listAll/' + pageNumber).then(function(data) {
          $scope.disciplines = data.disciplines;
          $scope.totalItems = data.totalItems;
          showHideLoad(true);
      });
    }
    $scope.listAllData(1);

    $scope.pageChanged = function(newPage) {
        $scope.listAllData(newPage);
    };

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/disciplines/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.disciplines.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.viewDiscipline = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/discipline_view/' + id).then(function(data) {
            $scope.viewModal = !$scope.viewModal;
            $scope.modalTitle = data.discipline.title;
            $scope.modalClass = "modal-lg";
            $scope.disciplinemodal_data = data;
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/disciplines/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();
            $scope.listAllData(1);
            $scope.changeView('list');
            showHideLoad(true);
        }
        $('#disciplineFileEdit').val('');
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