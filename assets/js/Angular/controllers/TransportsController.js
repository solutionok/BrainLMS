var OraSchool = angular.module('TransportsController', []);

OraSchool.controller('TransportsController', function(dataFactory,$scope,$rootScope,$sce) {
    $scope.transports = {};
    $scope.transportsList = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.busTrackInfo = {};
    $scope.gps_iframe_link = '';
    $scope.loading_transports = true;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Transports';
    });

    $scope.load_data = function(){
    		showHideLoad();
        dataFactory.httpRequest('index.php/transports/listAll').then(function(data) {
            $scope.transports = data.routes;
            $scope.vehicles = data.vehicles;
            $scope.loading_transports = false;
            showHideLoad(true);
        });
    }
    $scope.load_data();

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/transports/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.transports.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.list = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/transports/list/'+id).then(function(data) {
            $scope.changeView('listSubs');
            $scope.transportsList = data;
            showHideLoad(true);
        });
    }

    /* ----- trackBus ------ */

    function detection_gpsDirection_status() {
    	var date  = new Date();
    	var time = date.getHours() + ':' + date.getMinutes();
    	var direction_state = 'drop';

    	var pickup_buses_start_at = 6; // 6 AM
    	var drop_buses_start_at = 1.5 + 12; // 1:30 PM
    	var limit_moving_1 = 1; // decrease 1 hour
    	var limit_moving_2 = 3; // increase 3 hours

    	if(date.getHours() >= (pickup_buses_start_at-limit_moving_1) && date.getHours() <= (pickup_buses_start_at+limit_moving_2)) {
    		var direction_state = 'pickup';
    	} else if (date.getHours() >= (drop_buses_start_at-limit_moving_1) && date.getHours() <= (drop_buses_start_at+limit_moving_2)) {
    		var direction_state = 'drop';
    	}

    	return direction_state;
    }

    $scope.trackBus = function(transport) {
    	var direction_state = detection_gpsDirection_status();

    	$scope.gps_iframe_link = 'https://gps.cutebrains.com/'
	    	+ '?plate_number=' + transport.vehicle_plate
	    	+ '&stoppages=' + transport.transportTitle
	    	+ '&js_o=' + transport.vehicle_type_name
	    	+ '&way=' + direction_state

      $scope.changeView('bus_track');
    }

    $scope.trustSrc = function(src) {
		  return $sce.trustAsResourceUrl(src);
		}

    /* ----- trackBus ------ */

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show" ){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.listSubs = false;
        $scope.views.bus_track = false;
        $scope.views[view] = true;
    }
});