var OraSchool = angular.module('eventsController', []);

OraSchool.controller('eventsController', function(dataFactory,$routeParams,$rootScope,$sce,$scope) {
    $scope.events = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole ;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Events';
    });

    if($routeParams.eventId){
        showHideLoad();
        dataFactory.httpRequest('index.php/events/'+$routeParams.eventId).then(function(data) {
            $scope.form = data;
            $scope.eventDescription = $sce.trustAsHtml(data.eventDescription);
            $scope.changeView('read');
            showHideLoad(true);
        });
    }else{
        dataFactory.httpRequest('index.php/events/listAll').then(function(data) {
            angular.forEach(data.events, function (item) {
                item.eventDescription = $sce.trustAsHtml(item.eventDescription);
            });
            $scope.events = data.events;
            $scope.userRole = data.userRole;
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/events/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        showHideLoad();

        response = apiResponse(data,'edit');
        if(data.status == "success"){
            response.eventDescription = $sce.trustAsHtml(response.eventDescription);
            $scope.events = apiModifyTable($scope.events,response.id,response);
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/events/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.events.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        response = apiResponse(data,'add');
        if(data.status == "success"){
            response.eventDescription = $sce.trustAsHtml(response.eventDescription);
            $scope.events.push(response);
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.fe_status =function(id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/events/fe_active/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.events[$index].fe_active = response.fe_active;
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.eventDescription = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});