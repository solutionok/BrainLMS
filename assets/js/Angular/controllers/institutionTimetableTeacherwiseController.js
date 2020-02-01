var OraSchool = angular.module('institutionTimetableTeacherwiseController', []);

OraSchool.controller('institutionTimetableTeacherwiseController', function(dataFactory,$rootScope,$scope,$sce) {
		$scope.server_info = JSON.parse($rootScope.dashboardData.server_info);
		$scope.ImportModalStatus = false;
		$scope.inputDisabledStatus = true;
		$scope.timetable = [];
		$scope.totalItems = 0;
		$scope.loading = true;
		$scope.pluckAllTeachers = [];
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
		$scope.search = {};
		$scope.search.teacher_name = '';
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
	    dataFactory.httpRequest('index.php/classschedule/list-teacherwise/' + day_number + '/' + pageNumber).then(function(data) {
	    	// convert teacherId as key to normal obj incremental
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

	      angular.forEach($scope.all_teachers, function(teacher, key) {
	      	$scope.pluckAllTeachers[teacher.id] = teacher.name
				}, $scope.pluckAllTeachers);

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
    $scope.resetPeriod = function(period_id) {
    	angular.forEach($scope.timetable, function(_item, key) {
    		var periods = _item[1];
    		var period_key = getKeyByValue($scope.timetable[key][1], period_id);
    		if(periods[period_key] != undefined) {
    			if(confirm('Are you sure to reset period?')) {
			  	 	$scope.timetable[key][1][period_key].startTime = '';
				  	$scope.timetable[key][1][period_key].endTime = '';
				  	$scope.timetable[key][1][period_key].class_name = '';
				  	$scope.timetable[key][1][period_key].section_name = '';
				  	$scope.timetable[key][1][period_key].subject_name = '';
    			}
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
    	$scope.timetable[_key][1]["a" + random_number] = {
    		'startTime': '',
    		'endTime': '',
    		'class_name': '',
    		'section_name': '',
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
    $scope.excludeTeacher = function(_key, teacher_id) {
    	if(confirm('Are you sure to exclude "' + $scope.pluckAllTeachers[teacher_id] + '"?')) {
    		$('[tooltip]').tooltip('hide');
    		showHideLoad();
		    dataFactory.httpRequest('index.php/classschedule/advanced-timetable/exclude-teacher', 'POST', {}, {
		    	currentDisplayDay: $scope.currentDisplayDay,
		    	teacher_id: teacher_id
		    }).then(function(data) {
		    	response = apiResponse(data, 'success');
  				$scope.timetable.splice(_key, 1);
	        showHideLoad(true);
	      });
    	}
    }
    $scope.assignNewTeacher = function() {
    	if($scope.typeahead_selected_teacher != 0) {
    		var current_teacher_id = $scope.typeahead_selected_teacher.id;
    		var random_number = ("" + Math.random()).substring(2,7);

    		// check teacher founded
    		if($scope.timetable.find(item => item[0] == current_teacher_id) == undefined) {

	    		$scope.timetable.splice(0, 0, []);
	    		$scope.timetable[0][0] = current_teacher_id + ""

	    		$scope.timetable[0][1] = {}
	    		$scope.timetable[0][1]["0" + random_number] = {
			    	'startTime': '',
		    		'endTime': '',
		    		'class_name': '',
		    		'section_name': '',
		    		'subject_name': ''
		    	}

		    	setTimeout(function(){
		    		pickupTime()
		    	}, 150)

		    	// $scope.new_teacher = '';
		    	// $('[name="new_teacher"]').val('');
		    	// $scope.disabledAssignTeacherBtn = true;
    		} else {
    			angular.forEach($scope.timetable, function(item, key) {
		      	if(item[0] == current_teacher_id) {
		      		$.toast({
                  heading: 'Teacher already exists within collection',
                  position: 'top-right',
                  loaderBg:'#ff6849',
                  icon: 'warning',
                  hideAfter: 3000,
                  stack: 6
              });
    				}
					});
    		}
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

    $scope.importTimetable = function() {
    	$scope.modalTitle = 'Import timetable';
    	$scope.importType = 'excel';
    	$scope.ImportModalStatus = true;
    }
    $scope.saveImported = function(content){
        content = uploadSuccessOrError(content);
        if(content){
            $scope.importReview = content;
            $scope.ImportModalStatus = false;
            if(content.status == 'success') {
	            $.toast({
	                heading: content.title,
	                text: content.message,
	                position: 'top-right',
	                loaderBg:'#ff6849',
	                icon: 'success',
	                hideAfter: 3000,
	                stack: 6
	            });
            } else if(content.status == 'failed') {
            	$.toast({
	                heading: content.title,
	                text: content.message,
	                position: 'top-right',
	                loaderBg:'#ff6849',
	                icon: 'error',
	                hideAfter: 10000,
	                stack: 6
	            });
            }
            showHideLoad();
            // $scope.changeView('reviewImport');
        }
        showHideLoad(true);
    }

    $scope.typing = function(event, type, keyword) {
    	if(type == 'section') {
    		elem = angular.element(event.target)
  			var current_class_name = elem.parent().find('[name="class_name"]').val()
  			if(current_class_name == '' && keyword.length >= 0) {
  				$.toast({
              heading: 'Please select class first',
              position: 'top-right',
              loaderBg:'#ff6849',
              icon: 'error',
              hideAfter: 3000,
              stack: 6
          });
          return;
  			} else {
	  			var class_id = $scope.all_classes.find(item => item.name == current_class_name).id

	  			$scope.custom_sections = [];

	  			angular.forEach($scope.all_sections, function(section, key) {
	  				if(section.classId == class_id) {
	  					this.push({
	  						id: section.id,
	  						name: section.name,
	  						classId: class_id,
	  					})
	  				}
					}, $scope.custom_sections);
  			}
  		}
    }

    $scope.changeDisplayDay = function(day) {
    	$scope.currentDisplayDay = day
    	var current_page_number = 1
    	if($scope.pageNumber != undefined) {
    		current_page_number = $scope.pageNumber
    	}
    	if($scope.searchStatus) {
    		$scope.searchForTeacher();
    	} else {
    		$scope.getAllList(current_page_number, day);
    	}
    }

    $scope.saveAllChanges = function() {
    	showHideLoad();
	    dataFactory.httpRequest('index.phpclassschedule/advanced-timetable/teacherwise/store', 'POST', {}, {
	    	currentDisplayDay: $scope.currentDisplayDay,
	    	timetable: $scope.timetable
	    }).then(function(data) {
	    	response = apiResponse(data, 'success');
        showHideLoad(true);
      });
    }

    $scope.searchForTeacher = function(){
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

    	if($scope.search.teacher_name.length > 0) {
	    	showHideLoad();
		    dataFactory.httpRequest('index.php/classschedule/list-teacherwise/' + day_number, 'GET', {
		    	search_value: $scope.search.teacher_name
		    }).then(function(data) {
		    	// convert teacherId as key to normal obj incremental
					$scope.timetable = Object.entries(data.data);
		    	$scope.searchStatus = true;
	        showHideLoad(true);
	      });
    	}
    }
    $scope.resetSearchStatus = function() {
    	$scope.searchStatus = false;
    	$scope.getAllList($scope.pageNumber, $scope.currentDisplayDay);
    }
});