var OraSchool = angular.module('eventsController', []);

OraSchool.controller('eventsController', function(dataFactory,$routeParams,$rootScope,$sce,$scope) {
    $scope.events = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole;
    $scope.events_upcoming = {};
    $scope.loading_event_list = true;
    $scope.loading_event_upcoming = true;
    $scope.uploads_provider = '';

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Events';
    });

    $scope.fetchEventsList = function() {
    	dataFactory.httpRequest('index.php/events/events_and_notices/listAll').then(function(data) {
          angular.forEach(data.events, function (item) {
              item.eventDescription = $sce.trustAsHtml(item.eventDescription);
          });
          $scope.events = data.events;
          $scope.userRole = data.userRole;
          $scope.loading_event_list = false;
          showHideLoad(true);
      });
    }
    $scope.fetchEventsListUpcoming = function() {
    	dataFactory.httpRequest('index.php/events/listAll-upcoming').then(function(data) {
          angular.forEach(data.events, function (item) {
              item.eventDescription = $sce.trustAsHtml(item.eventDescription);
          });
          $scope.events_upcoming = data.events;
          $scope.loading_event_upcoming = false;
          showHideLoad(true);
      });
    }

    $scope.fetchEventsListUpcoming();

    $scope.fetchEventDetailsByEventId = function(event_id) {
    	showHideLoad();
      dataFactory.httpRequest('index.php/events/'+event_id).then(function(data) {
          $scope.form = data;
          $scope.eventDescription = $sce.trustAsHtml(data.eventDescription);
          $scope.changeView('read');
          showHideLoad(true);
      });
    }

    $scope.getUploadsConfig = function() {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/uploads-config', 'POST').then(function(data) {
          $scope.uploads_provider = data.uploads_provider;
          showHideLoad(true);
      });
    }
    $scope.getUploadsConfig();

    if($routeParams.eventId){
    	$scope.fetchEventDetailsByEventId($routeParams.eventId);
    }else{
    	$scope.fetchEventsList();
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

    $scope.saveAddEvent = function(data){
        showHideLoad();
        response = apiResponse(data,'add');
        if(data.status == "success"){
            response.eventDescription = $sce.trustAsHtml(response.eventDescription);
            $scope.events.push(response);
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.saveAddNotice = function(data){
        showHideLoad();
        response = apiResponse(data,'add');
        if(data.status == "success"){
            response.newsText = $sce.trustAsHtml(response.newsText);
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
        if(view == "list") {
        	$scope.fetchEventsList();
        }
        $scope.views.list = false;
        $scope.views.edit = false;
        $scope.views.read = false;
        $scope.views.add_type = false;
        $scope.views.add_event = false;
        $scope.views.add_notice = false;
        $scope.views[view] = true;
    }
});

OraSchool.filter('capitalize', function() {
    return function(input) {
      return (angular.isString(input) && input.length > 0) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : input;
    }
});