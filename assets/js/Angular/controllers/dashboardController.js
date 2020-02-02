var OraSchool = angular.module('dashboardController', []);

OraSchool.controller('dashboardController', function(dataFactory,$rootScope,$scope,$sce) {
		$scope.views = {};
    $scope.views.dashboard = true;
    $scope.dashboardItemsData = {};
    $scope.employees = {};
    $scope.roles = {};
    $scope.departments = {};
    $scope.designations = {};
    $scope.students = {};
    $scope.classes = {};
    $scope.sections = {};
    $scope.roles = {};
    $scope.student_categories = {};
    $scope.current_page = 1;
    $scope.students_totalItems = 0;
    $scope.employee_totalItems = 0;
    $scope.filter_students_input_class = '0';
    $scope.filter_students_input_section = '0';
    $scope.gbs_random_value = Math.random();

    setInterval(function(){
    	$scope.gbs_random_value = Math.random();
    }, 2000);

    showHideLoad(true);

    $scope.$on('$viewContentLoaded', function() {
    	url = new URL(window.location.href);
			if (url.searchParams.get('view') == 'students') {
				$scope.changeView('e', 'students');
			}
    });

    $scope.changeView = function(e, view) {
    	if(typeof e == 'object') {
    		e.preventDefault();
    	}

    	if(view == 'dashboard') {
    		$scope.getDashboardItemsData();
    	}
    	if(view == 'employees') {
    		$scope.getEmployeesResultsPage();
    	}
    	if(view == 'students') {
    		$scope.getStudentsResultsPage();
    	}

    	$scope.views.dashboard = false;
    	$scope.views.employees = false;
    	$scope.views.students = false;
    	$scope.views.events = false;
    	$scope.views.bus_track = false;
    	$scope.views.marksheet = false;
      $scope.views[view] = true;
    }

    $scope.getDashboardItemsData = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/dashboard/listItems').then(function(data) {
        	if(data.status) {
	        	$scope.dashboardItemsData = data.data;
	          showHideLoad(true);
        	} else {
        		console.log('Error');
        	}
        });
    }

    $scope.getEmployeesData = function(pageNumber) {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/employees/listAll/'+pageNumber).then(function(data) {
          $scope.employees = data.employees;
          $scope.employee_totalItems = data.totalItems;
          $scope.roles = data.roles;
          $scope.departments = data.departments;
          $scope.designations = data.designations;
          showHideLoad(true);
      });
    }

    $scope.employee_account_status = function(user_id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/employees/account_status/'+user_id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.employees[$index].account_active = response.account_active;
            }
            showHideLoad(true);
        });
    }

    $scope.getStudentsData = function(pageNumber) {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/students/listAll/'+pageNumber).then(function(data) {
          $scope.students = data.students ;
          $scope.classes = data.classes ;
          $scope.sections = data.sections ;
          $scope.students_totalItems = data.totalItems;
          $scope.roles = data.roles;
          $scope.student_categories = data.student_categories;
          showHideLoad(true);
      });
    }

    $scope.getCurrentSections = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.filter_students_input_class}).then(function(data) {
            $scope.sections = data.sections;
            $scope.filter_students_input_section = 0;
        });
    }

    $scope.filterStudentsByClassAndSection = function(pageNumber) {
    		showHideLoad();
    		var class_input = $scope.filter_students_input_class;
    		var section_input = $scope.filter_students_input_section;

    		if($scope.filter_students_input_class != null && $scope.filter_students_input_class != '0') {
    			input_class = [$scope.filter_students_input_class];
    		} else {
    			input_class = '';
    		}
    		if($scope.filter_students_input_section != null && $scope.filter_students_input_section != '0') {
    			input_section = [$scope.filter_students_input_section];
    		} else {
    			input_section = '';
    		}
    		if(
    			($scope.filter_students_input_class != null && $scope.filter_students_input_class != '0')
    			||
    			($scope.filter_students_input_section != null && $scope.filter_students_input_section != '0')
    		) {
    			send_data = {
	    			searchInput: {
	    				'class': input_class,
		        	'section': input_section,
	    			}
    			}
    		} else {
    			send_data = {};
    		}

        dataFactory.httpRequest('index.php/students/listAll/'+pageNumber, 'GET', send_data).then(function(data) {
            $scope.students = data.students;
	          $scope.students_totalItems = data.totalItems
            showHideLoad(true);
        });
    }

    $scope.getEmployeesResultsPage = function(newpage = ""){
        if(newpage != ""){
            $scope.current_page = newpage;
        }
        $scope.getEmployeesData($scope.current_page);
    }

    $scope.getStudentsResultsPage = function(newpage = ""){
        if(newpage != ""){
            $scope.current_page = newpage;
        }
        $scope.getStudentsData($scope.current_page);
    }

    /* ----- trackBus ------ */

    $scope.busTrackInfo = {};
    $scope.gps_iframe_link = '';

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

    $scope.trackBus = function(e, student_id) {
    	var direction_state = detection_gpsDirection_status();

    	showHideLoad();
      dataFactory.httpRequest('index.php/students/get-bus-track-info/'+student_id).then(function(data) {
          $scope.busTrackInfo = data.data[0];
          if($scope.busTrackInfo.transport_vehicle != null) {
	          $scope.gps_iframe_link = 'https://gps.cutebrains.com/'
	          + '?plate_number=' + $scope.busTrackInfo.transport_vehicle.plate_number
	          + '&stoppages=' + $scope.busTrackInfo.transport.transportTitle
	          + '&js_o=' + $scope.busTrackInfo.transport_vehicle.vehicle_type_name
	          + '&way=' + direction_state;

	          $scope.changeView(e, 'bus_track');
          }
          showHideLoad(true);
      });
    }

    $scope.trustSrc = function(src) {
		  return $sce.trustAsResourceUrl(src);
		}

    /* ----- trackBus ------ */

    $scope.marksheet = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/marksheet/'+id).then(function(data) {
            $scope.studentMarksheet = data;
            $scope.changeView('e', 'marksheet');
            showHideLoad(true);
        });
    }

    $scope.getDashboardItemsData();
});

OraSchool.filter('capitalize', function() {
    return function(input) {
      return (angular.isString(input) && input.length > 0) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : input;
    }
});