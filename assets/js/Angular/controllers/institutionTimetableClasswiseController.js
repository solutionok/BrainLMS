var OraSchool = angular.module('institutionTimetableClasswiseController', []);

OraSchool.controller('institutionTimetableClasswiseController', function(dataFactory,$rootScope,$scope,$sce,$filter) {
		$scope.server_info = JSON.parse($rootScope.dashboardData.server_info);
		$scope.ImportModalStatus = false;
		$scope.inputDisabledStatus = true;
		$scope.timetable = [];
		$scope.totalItems = 0;
		$scope.loading = true;
		$scope.all_teachers = [];
		$scope.all_classes = [];
		$scope.all_sections = [];
		$scope.custom_sections = [];
		$scope.all_subjects = [];
		$scope.new_teacher = '';
		$scope.disabledAssignTeacherBtn = false;
		$scope.typeahead_selected_teacher = 0;
		$scope.typeahead_selected_class = 0;
		$scope.typeahead_selected_section = 0;
		$scope.typeahead_selected_subject = 0;
		$scope.currentDisplayDay = 'Monday';
		$scope.main_search_value = '';

		$scope.filtered_sections = [];
		$scope.search = {};
		$scope.search.class_id = 0;
		$scope.search.section_id = 0;
		$scope.searchStatus = false;

		function getKeyByValue(object, id) {
      return Object.keys(object).find(key => object[key].id == id);
    }
    function getKeyByValue2(object, id) {
      return Object.keys(object).find(key => object[key].rand_id == id);
    }

		function pickupTime() {
			$('input.pickup-time').ptTimeSelect({
  			onClose: function(i){
  				var value = $(i).val()
  				var period_id = $(i).data('period-id');
  				var period_rand_id = $(i).data('period-rand-id');
  				var time_type = $(i).data('time-type');

  				angular.forEach($scope.timetable, function(_item, key) {
		    		var periods = _item[1];
		    		var period_key = getKeyByValue($scope.timetable[key][1], period_id);
		    		var period_rand_key = getKeyByValue2($scope.timetable[key][1], period_rand_id);
		    		if(periods[period_key] != undefined) {
		    			if(time_type == 'startTime') {
		    				$scope.timetable[key][1][period_key].startTime = value;
		    			} else if(time_type == 'endTime') {
		    				$scope.timetable[key][1][period_key].endTime = value;
		    			}
		    		} else if(periods[period_rand_key] != undefined) {
		    			if(time_type == 'startTime') {
		    				$scope.timetable[key][1][period_rand_key].startTime = value;
		    			} else if(time_type == 'endTime') {
		    				$scope.timetable[key][1][period_rand_key].endTime = value;
		    			}
		    		}
					});
				}
  		})
		}

		$scope.__filterSectionById = function(section_id) {
			var section = $scope.all_sections.find(item => item.id == section_id);
			return section;
		}
		$scope.__filterClassBySectionId = function(section_id) {
			var section = $scope.all_sections.find(item => item.id == section_id);
			var _class = $scope.all_classes.find(item => item.id == section.classId);
			return _class;
		}


    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Institution Timetable';
    	setTimeout(function(){
    		pickupTime()
    	}, 2500)
    });

    $scope.getAllList = function(pageNumber, day) {
    	var day_number = 0;

    	switch(day) {
    		case 'Monday': day_number = 2; break;
    		case 'Tuesday': day_number = 3; break;
    		case 'Wednesday': day_number = 4; break;
    		case 'Thursday': day_number = 5; break;
    		case 'Friday': day_number = 6; break;
    		case 'Saturday': day_number = 7; break;
    	}

    	if(day_number == 0) {
    		$.toast({
            heading: 'There is something wrong with choosing the day of the week, please refresh the page then try again.',
            position: 'top-right',
            loaderBg:'#ff6849',
            icon: 'error',
            hideAfter: 3000,
            stack: 6
        });
    	}

    	if(typeof pageNumber == "undefined"){
        pageNumber = $scope.pageNumber;
      }
      $scope.pageNumber = pageNumber;

    	showHideLoad();
	    dataFactory.httpRequest('index.php/classschedule/list-classwise/' + day_number + '/' + pageNumber).then(function(data) {
	    	// convert sectionId as key to normal obj incremental
				$scope.timetable = Object.entries(data.data);
	    	$scope.totalItems = data.totalItems;
	    	$scope.loading = false;
        showHideLoad(true);
      });
    }
    $scope.getAllList(1, 'Monday');

    $scope.pageChangedCaller = false;
    $scope.pageChanged = function(newPage) {
    	if ($scope.pageChangedCaller) {
		    return;
		  }

		  $scope.pageChangedCaller = true;

	    setTimeout(function(){
	    	$scope.pageChangedCaller = false;
	    }, 200);

      $scope.getAllList(newPage, $scope.currentDisplayDay);
    }

    $scope.fetchParameters = function() {
    	showHideLoad();
	    dataFactory.httpRequest('index.php/classschedule/fetch-parameters').then(function(data) {
	    	$scope.all_teachers = data.teachers;
	    	$scope.all_classes = data.classes;
	    	$scope.all_sections = data.sections;
	    	$scope.all_subjects = data.subjects;

        showHideLoad(true);
      });
    }
    $scope.fetchParameters();

    $scope.updatePeriod = function(period_id) {
    	angular.forEach($scope.timetable, function(_item, key) {
    		var periods = _item[1];
    		var period_key = getKeyByValue($scope.timetable[key][1], period_id);
    		if(periods[period_key] != undefined) {
    			current_status = $scope.timetable[key][1][period_key].disabled_status;
			  	$scope.timetable[key][1][period_key].disabled_status = !current_status;
    		}
			});
    }
    $scope.removePeriod = function(period_id) {
    	angular.forEach($scope.timetable, function(_item, key) {
    		var periods = _item[1];
    		var period_key = getKeyByValue($scope.timetable[key][1], period_id);
    		if(periods[period_key] != undefined) {
    			if(confirm('Are you sure to remove period?')) {
    				$('[tooltip]').tooltip('hide');
    				dataFactory.httpRequest('index.php/classschedule/advanced-timetable/remove-period', 'POST', {}, {
    					period_id: period_id
    				}).then(function(data) {
				    	response = apiResponse(data, 'success');
		  				delete $scope.timetable[key][1][period_key];
			        showHideLoad(true);
			      });
    			}
    		}
			});
    }
    $scope.addNewPeriod = function(_key) {
    	var random_number = ("" + Math.random()).substring(2,7);
    	var section_id = $scope.timetable[_key][0];
    	var _class = $scope.__filterClassBySectionId(section_id);
    	var section = $scope.__filterSectionById(section_id);

    	$scope.timetable[_key][1]["a" + random_number] = {
    		'startTime': '',
    		'endTime': '',
    		'class_name': _class.name,
    		'section_name': section.name,
    		'subject_name': '',
    		'rand_id': random_number
    	}
    	setTimeout(function(){
    		pickupTime()
    	}, 150)
    }
    $scope.removeAllPeriods = function(_key, teacher_id) {
    	if(confirm('Are you sure to remove all periods of "' + $scope.pluckAllTeachers[teacher_id] + '"?')) {
    		$scope.timetable[_key][1] = {};
    	}
    }
    $scope.changeAssignInputValue = function() {
    	$scope.disabledAssignTeacherBtn = false;
    }

    $scope.callbackTeachers = function(item){
        $scope.typeahead_selected_teacher = item
    }
    $scope.callbackClasses = function(item){
        $scope.typeahead_selected_class = item
    }
    $scope.callbackSections = function(item){
        $scope.typeahead_selected_section = item
    }
    $scope.callbackSubjects = function(item){
        $scope.typeahead_selected_subject = item
    }

    $scope.changeDisplayDay = function(day) {
    	$scope.currentDisplayDay = day
    	var current_page_number = 1
    	if($scope.pageNumber != undefined) {
    		current_page_number = $scope.pageNumber
    	}
    	if($scope.searchStatus) {
    		$scope.searchFor();
    	} else {
    		$scope.getAllList(current_page_number, day);
    	}
    }
    $scope.saveAllChanges = function() {
    	showHideLoad();
	    dataFactory.httpRequest('index.phpclassschedule/advanced-timetable/classwise/store', 'POST', {}, {
	    	currentDisplayDay: $scope.currentDisplayDay,
	    	timetable: $scope.timetable
	    }).then(function(data) {
	    	response = apiResponse(data, 'success');
        showHideLoad(true);
      });
    }

    $scope.updateFilteredSections = function(class_id) {
    	$scope.filtered_sections = [];

    	if(class_id > 0) {
    		// update filtered sections
    		angular.forEach($scope.all_sections, function(section, key) {
    			if(section.classId == class_id) {
    				$scope.filtered_sections.push({
    					id: section.id,
    					name: section.name
    				})
    			}
				});

				$scope.searchStatus = true;
    	} else {
    		$scope.searchStatus = false;
    	}

    	$scope.search.section_id = 0;
    }
    $scope.searchFor = function(){
    	var currentDay = $scope.currentDisplayDay;
    	var day_number;

    	switch(currentDay) {
    		case 'Monday': day_number = 2; break;
    		case 'Tuesday': day_number = 3; break;
    		case 'Wednesday': day_number = 4; break;
    		case 'Thursday': day_number = 5; break;
    		case 'Friday': day_number = 6; break;
    		case 'Saturday': day_number = 7; break;
    	}

    	showHideLoad();
	    dataFactory.httpRequest('index.php/classschedule/list-classwise/' + day_number, 'GET', {
	    	class_id: $scope.search.class_id,
	    	section_id: $scope.search.section_id,
	    }).then(function(data) {
				$scope.timetable = Object.entries(data.data);
	    	$scope.searchStatus = true;
        showHideLoad(true);
      });
    }
    $scope.resetFilter = function() {
    	$scope.searchStatus = false;
    	$scope.search.class_id = 0;
    	$scope.search.section_id = 0;
    	$('[tooltip]').tooltip('hide');
    	$scope.getAllList($scope.pageNumber, $scope.currentDisplayDay);
    }
});