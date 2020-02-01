var OraSchool = angular.module('teacherPresenceController', []);

OraSchool.controller('teacherPresenceController', function(dataFactory,$rootScope,$scope,$sce) {
	$scope.main_title = 'loading...';
	$scope.views = {};
  $scope.views.list = true;
  $scope.presences = {};
  $scope.page = 1;
  $scope.totalItems = 0;
  $scope.filtered_sections = [];
  $scope.searchInput = {};
  $scope.searchInput.date = getDate();
  $scope.searchInput.time_slot = 0;
  $scope.searchInput.class = 0;
  $scope.searchInput.section = 0;
  $scope.searchInput.subject = 0;
  $loading = true;

  function changeTimezone(date, ianatz) {
	  // suppose the date is 12:00 UTC
	  var invdate = new Date(date.toLocaleString('en-US', {
	    timeZone: ianatz
	  }));

	  // then invdate will be 07:00 in Toronto
	  // and the diff is 5 hours
	  var diff = invdate.getTime() - date.getTime();

	  // so 12:00 in Toronto is 17:00 UTC
	  return new Date(date.getTime() + diff);
	}
  function getDate() {
		var current = new Date();
		var there = changeTimezone(current, "Asia/Kolkata");

		var date = there.getDate();
		var month = there.getMonth() + 1;
		var year = there.getFullYear();
		var current_date = date + '/' + month + '/' + year;
		return current_date;
  }

	$scope.$on('$viewContentLoaded', function() {
  	document.title = $('meta[name="site_title"]').attr('content') + ' | Teacher presence';
  });

  $scope.load_data = function(pageNumber) {
    if(typeof pageNumber == "undefined"){
        pageNumber = $scope.pageNumber;
    }
    $scope.pageNumber = pageNumber;

    showHideLoad();
    dataFactory.httpRequest('index.php/classschedule/teacher-presence/' + pageNumber).then(function(data) {
        $scope.presences = data.presences;
        angular.forEach($scope.presences, function (item) {
            item.teacher_info = $sce.trustAsHtml(item.teacher_info);
        });
        $scope.totalItems = data.totalItems;
        $scope.main_title = data.main_title;
        $scope.time_slots = data.time_slots;
        $scope.classes = data.classes;
        $scope.sections = data.sections;
        $scope.subjects = data.subjects;
        $scope.loading = false;
        showHideLoad(true);
    });
  }
  $scope.load_data(1);

  $scope.getResultsPage = function(id){
      if (!jQuery.isEmptyObject($scope.searchInput)) {
          $scope.searchDB(id);
      }else{
      		$scope.load_data(id);
      }
  }

  $scope.pageChanged = function(newPage) {
      $scope.getResultsPage(newPage);
  };

  $scope.updateSelectedClass = function() {
  	var class_id = $scope.searchInput.class;
  	$scope.filtered_sections = [];

  	if(class_id > 0) {
  		// update filtered sections
  		angular.forEach($scope.sections, function(section, key) {
  			if(section.classId == class_id) {
  				$scope.filtered_sections.push({
  					id: section.id,
  					name: section.sectionName
  				})
  			}
			});
  	}

  	$scope.searchInput.section = 0;
  }

  $scope.searchDB = function(pageNumber){
   	showHideLoad();
    dataFactory.httpRequest('index.php/classschedule/teacher-presence/' + pageNumber, 'GET', {
    	'filter_date': $scope.searchInput.date,
    	'filter_timeslot': $scope.searchInput.time_slot,
    	'filter_class': $scope.searchInput.class,
    	'filter_section': $scope.searchInput.section,
    	'filter_subject': $scope.searchInput.subject
    }).then(function(data) {
        $scope.presences = data.presences;
        angular.forEach($scope.presences, function (item) {
            item.teacher_info = $sce.trustAsHtml(item.teacher_info);
        });
        $scope.totalItems = data.totalItems;
        $scope.main_title = data.main_title;
        $scope.loading = false;
        showHideLoad(true);
    });
  }
});