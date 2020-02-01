OraSchool.controller('disciplinesFilterController', function(dataFactory,$rootScope,$route,$scope,$location,$routeParams) {
	  $scope.filter_view = {};
	  $scope.classes = {};
	  $scope.sections = {};
	  $scope.subjects = {};
	  $scope.departments = {};
	  $scope.selectedClassFilterStudent = 0;
	  $scope.selectedSectionFilterStudent = 0;
	  $scope.selectedClassFilterTeacher = 0;
	  $scope.selectedSectionFilterTeacher = 0;
	  $scope.selectedSubjectFilterTeacher = 0;
	  $scope.selectedDepartmentFilterNTS = 0;
	  $scope.noSectionsWithThatClass = 0;
	  $scope.noSubjectsWithThatClass = 0;
	  $scope.noUsersWithThatDepartment = 0;

	  $scope.targetComplainedByFF = {};
	  $scope.targetComplainedAgainstFF = {};
	  $scope.targetResponsibleOfficialsFF = {};

	  $scope.choosen_complained_by_ff = [];
	  $scope.choosen_complained_against_ff = [];
	  $scope.choosen_jury_ff = [];
	  $scope.choosen_responsible_officials_ff = [];

	  $scope.selectedWordComplainedBy = '';
	  $scope.selectedWordJury = '';
	  $scope.selectedWordResponsibleOfficial = '';

	  $scope.changeFilterView = function(view) {
	  	if(view == 'complained_against') {
	  		$scope.getClassesList();
	  	}

	  	$scope.filter_view.complained_by = false;
	    $scope.filter_view.complained_against = false;
	    $scope.filter_view.jury = false;
	    $scope.filter_view.responsible_officials = false;
	    $scope.filter_view[view] = true;
	  }
	  $scope.closeFilterView = function(type) {
	  	$scope.filter_view.complained_by = false;
	    $scope.filter_view.complained_against = false;
	  	$scope.filter_view.jury = false;
	    $scope.filter_view.responsible_officials = false;

	    if(type == 'complained_by') {
	    	$scope.choosen_complained_by_ff = [];
	    } else if(type == 'complained_against') {
	    	$scope.choosen_complained_against_ff = [];
	    } else if(type == 'jury') {
	    	$scope.choosen_jury_ff = [];
	    } else if(type == 'responsible_officials') {
	    	$scope.choosen_responsible_officials_ff = [];
	    }
	  }

	  $scope.getClassesList = function() {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/classes/listAll').then(function(data) {
	      	$scope.classes = data.classes;
	        showHideLoad(true);
	    });
	  }
	  $scope.getDepartmentsList = function() {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/roles/listCustom1').then(function(data) {
	      	$scope.departments = data.roles;
	        showHideLoad(true);
	    });
	  }

	  $scope.getSectionsListWithClass = function(class_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest(`index.php/sections/fetch-with-class/${class_id}`).then(function(data) {
	        $scope.sections = data.sections;
	        if(data.sections.length) {
	        	$scope.noSectionsWithThatClass = 0;
	        } else {
	        	$scope.noSectionsWithThatClass = 1;
	        }
	        showHideLoad(true);
	    });
	  }

	  $scope.fetchStudentsByClassId = function(class_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/students/fetch-by-class-id/' + class_id).then(function(data) {
	        $scope.targetComplainedAgainstFF = data.jsData
	        showHideLoad(true);
	    });
	  }
	  $scope.fetchComplainedByUsersByWord = function(event) {
	  	var word = $scope.selectedWordComplainedBy;
	  	var code = event.keyCode || event.which;
	  	if(word.length >= 2 && code != 17) {
	  		setTimeout(function(){
			  	showHideLoad();
			  	dataFactory.httpRequest('index.php/disciplines/fetch-by-word-complained-by/' + word).then(function(data) {
			        $scope.targetComplainedByFF = data.jsData
			        showHideLoad(true);
			    });
	  		}, 500)
	  	}
	  }
	  $scope.fetchJuryUsersByWord = function(event) {
	  	var word = $scope.selectedWordJury;
	  	var code = event.keyCode || event.which;
	  	if(word.length >= 2 && code != 17) {
	  		setTimeout(function(){
			  	showHideLoad();
			  	dataFactory.httpRequest('index.php/disciplines/fetch-by-word-jury/' + word).then(function(data) {
			        $scope.targetJuryFF = data.jsData
			        showHideLoad(true);
			    });
	  		}, 500)
	  	}
	  }
	  $scope.fetchResponsibleOfficialsUsersByWord = function(event) {
	  	var word = $scope.selectedWordResponsibleOfficial;
	  	var code = event.keyCode || event.which;
	  	if(word.length >= 2 && code != 17) {
	  		setTimeout(function(){
			  	showHideLoad();
			  	dataFactory.httpRequest('index.php/disciplines/fetch-by-word-responsible-officials/' + word).then(function(data) {
			        $scope.targetResponsibleOfficialsFF = data.jsData
			        showHideLoad(true);
			    });
	  		}, 500)
	  	}
	  }
	  $scope.fetchStudentsByClassIdAndSectionId = function(class_id, section_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/students/fetch-by-class-section', 'POST', {}, {
	  		class_id: class_id,
	  		section_id: section_id,
	  	}).then(function(data) {
	  		if(data.jsStatus) {
	      	$scope.targetComplainedAgainstFF = data.jsData
	  		} else {
	  			console.log('Error data Send');
	  		}
	      showHideLoad(true);
	    });
	  }
	  $scope.fetchUsersByDepartmentId = function(department_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/roles/get-users-by-role-id/' + department_id).then(function(data) {
	      $scope.targetResponsibleOfficialsFF = data.users
	      if(data.users.length) {
	      	$scope.noUsersWithThatDepartment = 0;
	      } else {
	      	$scope.noUsersWithThatDepartment = 1;
	      }
	      showHideLoad(true);
	    });
	  }

	  $scope.checkChangeClassFilter = function() {
			if($scope.filter_view.complained_against) {
				if($scope.selectedClassFilterStudent.length == 1) {
					var class_id = $scope.selectedClassFilterStudent
					if(class_id > 0) {
		  			$scope.getSectionsListWithClass(class_id);
		  			$scope.fetchStudentsByClassId(class_id);
					} else {
						$scope.sections = {}
					}
				} else if($scope.selectedClassFilterStudent.length >= 1) {
					var class_ids = JSON.stringify($scope.selectedClassFilterStudent)
	  			$scope.fetchStudentsByClassIds(class_ids);
					$scope.sections = {}
				}
			}
	  }
	  $scope.checkChangeSectionFilter = function() {
	  	if($scope.filter_view.complained_against) {
	    	var class_id = $scope.selectedClassFilterStudent;
	    	var section_id = $scope.selectedSectionFilterStudent;
	    	if(class_id > 0 && section_id > 0) {
	    		$scope.fetchStudentsByClassIdAndSectionId(class_id, section_id);
	    	} else if(class_id > 0 && section_id == 0) {
	    		$scope.fetchStudentsByClassId(class_id);
	    	}
	  	}
	  }
	  $scope.checkChangeTargetStudents = function() {
	  	if($scope.choosen_complained_by_ff.find(x => x == '0')) {
	  		$scope.choosen_complained_by_ff = [];
	  		angular.forEach($scope.targetComplainedByFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_complained_by_ff);
	  	}
	  }
	  $scope.checkChangeTargetTeachers = function() {
	  	if($scope.choosen_complained_against_ff.find(x => x == '0')) {
	  		$scope.choosen_complained_against_ff = [];
	  		angular.forEach($scope.targetTeachersFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_complained_against_ff);
	  	}
	  }
	  $scope.checkChangeTargetJury = function() {
	  	if($scope.choosen_jury_ff.find(x => x == '0')) {
	  		$scope.choosen_jury_ff = [];
	  		angular.forEach($scope.targetJuryFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_jury_ff);
	  	}
	  }
	  $scope.checkChangeTargetNTS = function() {
	  	if($scope.choosen_responsible_officials_ff.find(x => x == '0')) {
	  		$scope.choosen_responsible_officials_ff = [];
	  		angular.forEach($scope.targetResponsibleOfficialsFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_responsible_officials_ff);
	  	}
	  }

	  function collectSelectedRecipients() {
	  	$scope.form.complained_by = [];
	  	$scope.form.complained_against = [];
	  	$scope.form.jury = [];
	  	$scope.form.responsible_officials = [];

	  	if($scope.choosen_complained_by_ff.length > 0) {
	  		angular.forEach($scope.choosen_complained_by_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.complained_by);
	  	}

	  	if($scope.choosen_complained_against_ff.length > 0) {
	  		angular.forEach($scope.choosen_complained_against_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.complained_against);
	  	}

	  	if($scope.choosen_jury_ff.length > 0) {
	  		angular.forEach($scope.choosen_jury_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.jury);
	  	}

	  	if($scope.choosen_responsible_officials_ff.length > 0) {
	  		angular.forEach($scope.choosen_responsible_officials_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.responsible_officials);
	  	}
	  }

	  function resetForm() {
	  	$scope.form = {};
	  	$scope.targetComplainedByFF = {};
		  $scope.targetComplainedAgainstFF = {};
		  $scope.targetResponsibleOfficialsFF = {};

		  $scope.choosen_complained_by_ff = [];
		  $scope.choosen_complained_against_ff = [];
		  $scope.choosen_jury_ff = [];
		  $scope.choosen_responsible_officials_ff = [];

		  $scope.selectedWordComplainedBy = '';
		  $scope.selectedWordJury = '';
		  $scope.selectedWordResponsibleOfficial = '';

		  $scope.filter_view.complained_by = false;
	    $scope.filter_view.complained_against = false;
	  	$scope.filter_view.jury = false;
	    $scope.filter_view.responsible_officials = false;
	  }

	  $scope.saveAdd = function(content){
	  		collectSelectedRecipients();
        response = apiResponse(content,'add');

        if(content.status == "success"){
            showHideLoad();
            $scope.listAllData(1);
            resetForm();
            $scope.changeView('list');
            showHideLoad(true);
        }
        $('#disciplineFile').val('');
    }
});