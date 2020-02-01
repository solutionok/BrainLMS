OraSchool.controller('communicationsFilterController', function(dataFactory,$rootScope,$route,$scope,$location,$routeParams) {
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
	  $scope.targetStudentsFF = {};
	  $scope.targetTeachersFF = {};
	  $scope.targetNTSFF = {};
	  $scope.choosen_students_ff = [];
	  $scope.choosen_teachers_ff = [];
	  $scope.choosen_NTS_ff = [];
	  $scope.searchUsers = false;

	  $scope.changeFilterView = function(view) {
	  	if(view == 'students' || view == 'teachers') {
	  		$scope.getClassesList();
	  	}
	  	if(view == 'non_teaching_staff') {
	  		$scope.getDepartmentsList();
	  	}

	  	$scope.filter_view.students = false;
	    $scope.filter_view.teachers = false;
	    $scope.filter_view.non_teaching_staff = false;
	    $scope.filter_view[view] = true;
	  }
	  $scope.closeFilterView = function(type) {
	  	$scope.filter_view.students = false;
	    $scope.filter_view.teachers = false;
	    $scope.filter_view.non_teaching_staff = false;

	    if(type == 'students') {
	    	$scope.choosen_students_ff = [];
	    } else if(type == 'teachers') {
	    	$scope.choosen_teachers_ff = [];
	    } else if(type == 'nts') {
	    	$scope.choosen_NTS_ff = [];
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
	  	dataFactory.httpRequest('index.php/roles/listAll').then(function(data) {
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
	  $scope.getSubjectsListWithClass = function(class_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest(`index.php/classes/get-subjects-by-class-id/${class_id}`).then(function(data) {
	        $scope.subjects = data.subjects;
	        if(data.subjects.length) {
	        	$scope.noSubjectsWithThatClass = 0;
	        } else {
	        	$scope.noSubjectsWithThatClass = 1;
	        }
	        showHideLoad(true);
	    });
	  }

	  $scope.fetchStudentsByClassId = function(class_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/students/fetch-by-class-id/' + class_id).then(function(data) {
	        $scope.targetStudentsFF = data.jsData
	        showHideLoad(true);
	    });
	  }
	  $scope.fetchStudentsByClassIds = function(class_ids) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/students/fetch-by-class-ids', 'GET', {
	  		class_ids: class_ids
	  	}).then(function(data) {
	        $scope.targetStudentsFF = data.jsData
	        showHideLoad(true);
	    });
	  }
	  $scope.fetchStudentsByClassIdAndSectionId = function(class_id, section_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/students/fetch-by-class-section', 'POST', {}, {
	  		class_id: class_id,
	  		section_id: section_id,
	  	}).then(function(data) {
	  		if(data.jsStatus) {
	      	$scope.targetStudentsFF = data.jsData
	  		} else {
	  			console.log('Error data Send');
	  		}
	      showHideLoad(true);
	    });
	  }
	  $scope.fetchTeachersByClassId = function(class_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/teachers/get-by-class-id/' + class_id).then(function(data) {
	      $scope.targetTeachersFF = data.teachers
	      showHideLoad(true);
	    });
	  }
	  $scope.fetchTeachersByClassIdAndSectionId = function(class_id, section_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/teachers/get-by-class-section', 'POST', {}, {
	  		class_id: class_id,
	  		section_id: section_id,
	  	}).then(function(data) {
	  		if(data.jsStatus) {
	      	$scope.targetTeachersFF = data.teachers
	  		} else {
	  			console.log('Error data Send');
	  		}
	      showHideLoad(true);
	    });
	  }
	  $scope.fetchTeachersByClassIdAndSubjectId = function(class_id, subject_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/teachers/get-by-class-subject', 'POST', {}, {
	  		class_id: class_id,
	  		subject_id: subject_id,
	  	}).then(function(data) {
	  		if(data.jsStatus) {
	      	$scope.targetTeachersFF = data.teachers
	  		} else {
	  			console.log('Error data Send');
	  		}
	      showHideLoad(true);
	    });
	  }
	  $scope.fetchUsersByDepartmentId = function(department_id) {
	  	showHideLoad();
	  	dataFactory.httpRequest('index.php/roles/get-users-by-role-id/' + department_id).then(function(data) {
	      $scope.targetNTSFF = data.users
	      if(data.users.length) {
	      	$scope.noUsersWithThatDepartment = 0;
	      } else {
	      	$scope.noUsersWithThatDepartment = 1;
	      }
	      showHideLoad(true);
	    });
	  }

	  $scope.checkChangeClassFilter = function() {
			if($scope.filter_view.students) {
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
			} else if($scope.filter_view.teachers) {
				if($scope.selectedClassFilterTeacher.length == 1) {
					var class_id = $scope.selectedClassFilterTeacher
					if(class_id > 0) {
		  			$scope.getSectionsListWithClass(class_id);
		  			$scope.getSubjectsListWithClass(class_id);
		  			$scope.fetchTeachersByClassId(class_id);
					} else {
						$scope.sections = {}
					}
				} else if($scope.selectedClassFilterTeacher.length >= 1) {
					var class_ids = JSON.stringify($scope.selectedClassFilterTeacher)
	  			$scope.fetchStudentsByClassIds(class_ids);
					$scope.sections = {}
				}
			}
	  }
	  $scope.checkChangeSectionFilter = function() {
	  	if($scope.filter_view.students) {
	    	var class_id = $scope.selectedClassFilterStudent;
	    	var section_id = $scope.selectedSectionFilterStudent;
	    	if(class_id > 0 && section_id > 0) {
	    		$scope.fetchStudentsByClassIdAndSectionId(class_id, section_id);
	    	} else if(class_id > 0 && section_id == 0) {
	    		$scope.fetchStudentsByClassId(class_id);
	    	}
	  	} else if($scope.filter_view.teachers) {
	  		var class_id = $scope.selectedClassFilterTeacher;
	    	var section_id = $scope.selectedSectionFilterTeacher;
	    	if(class_id > 0 && section_id > 0) {
	    		$scope.fetchTeachersByClassIdAndSectionId(class_id, section_id);
	    	} else if(class_id > 0 && section_id == 0) {
	    		$scope.fetchTeachersByClassId(class_id);
	    	}
	  	}
	  }
	  $scope.checkChangeSubjectFilter = function() {
	  	if($scope.filter_view.teachers) {
	  		var class_id = $scope.selectedClassFilterTeacher;
	    	var subject_id = $scope.selectedSubjectFilterTeacher;
	    	if(class_id > 0 && subject_id > 0) {
	    		$scope.fetchTeachersByClassIdAndSubjectId(class_id, subject_id);
	    	} else if(class_id > 0 && subject_id == 0) {
	    		$scope.fetchTeachersByClassId(class_id);
	    	}
	  	}
	  }
	  $scope.checkChangeDepartmentFilter = function() {
	  	if($scope.filter_view.non_teaching_staff) {
	  		var department_id = $scope.selectedDepartmentFilterNTS;
	    	if(department_id > 0) {
	    		$scope.fetchUsersByDepartmentId(department_id);
	    	}
	  	}
	  }
	  $scope.checkChangeTargetStudents = function() {
	  	if($scope.choosen_students_ff.find(x => x == '0')) {
	  		$scope.choosen_students_ff = [];
	  		angular.forEach($scope.targetStudentsFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_students_ff);
	  	}
	  }
	  $scope.checkChangeTargetTeachers = function() {
	  	if($scope.choosen_teachers_ff.find(x => x == '0')) {
	  		$scope.choosen_teachers_ff = [];
	  		angular.forEach($scope.targetTeachersFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_teachers_ff);
	  	}
	  }
	  $scope.checkChangeTargetNTS = function() {
	  	if($scope.choosen_NTS_ff.find(x => x == '0')) {
	  		$scope.choosen_NTS_ff = [];
	  		angular.forEach($scope.targetNTSFF, function(value, key) {
				  this.push(`${value.id}`);
				}, $scope.choosen_NTS_ff);
	  	}
	  }

	  function collectSelectedRecipients() {
	  	$scope.form.toId = [];

	  	if($scope.choosen_students_ff.length > 0) {
	  		angular.forEach($scope.choosen_students_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.toId);
	  	}

	  	if($scope.choosen_teachers_ff.length > 0) {
	  		angular.forEach($scope.choosen_teachers_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.toId);
	  	}

	  	if($scope.choosen_NTS_ff.length > 0) {
	  		angular.forEach($scope.choosen_NTS_ff, function(item, key) {
				  this.push(parseInt(item));
				}, $scope.form.toId);
	  	}

	  	if(typeof $scope.form.toId2 != 'undefined') {
	    	if($scope.form.toId2.length > 0) {
	    		angular.forEach($scope.form.toId2, function(item, key) {
					  this.push(parseInt(item.id));
					}, $scope.form.toId);
	    	}
	  	}
	  }

	  $scope.linkUser = function(){
	      $scope.modalTitle = $rootScope.phrase.searchUsers;
	      $scope.searchUsers = !$scope.searchUsers;
	  }

	  $scope.searchUserButton = function(){
	      var searchAbout = $('#searchKeyword').val();
	      if(searchAbout.length < 3){
	          alert($rootScope.phrase.minCharLength3);
	          return;
	      }
	      dataFactory.httpRequest('index.php/messages/searchUser/'+searchAbout).then(function(data) {
	          $scope.searchResults = data;
	      });
	  }

	  $scope.linkStudentFinish = function(student){
	      if(typeof $scope.form.toId2 == "undefined"){
	          $scope.form.toId2 = [];
	      }
	      $scope.form.toId2.push(student);
	      $scope.searchUsers = !$scope.searchUsers;
	  }

	  // for messages section
	  $scope.sendMessageNow = function(){
    		collectSelectedRecipients();

    		if($scope.form.toId.length <= 0) {
    			alert('Please select recipients');
    			return;
    		}

    		if($scope.form.toId.length > 1000) {
    			alert('Maximum sending to users is 1000, Please reduce the number and resend to other users.');
    			return;
    		}

    		if(typeof $scope.form.messageText == 'undefined') {
    			alert('Please write message replay');
    			return;
    		}

    		showHideLoad();
        dataFactory.httpRequest('index.php/messages','POST',{},$scope.form).then(function(data) {
            $.toast({
		            heading: 'School Application',
		            text: 'Messages was sent successfully.',
		            position: 'top-right',
		            loaderBg:'#ff6849',
		            icon: 'success',
		            hideAfter: 3000,
		            stack: 6
		        });
            if(data.messageId == "home"){
                $scope.changeView('list');
            }else{
                $location.path('/messages/'+data.messageId);
            }
            showHideLoad(true);
        });
    }

    // for mobile notification
    $scope.saveAdd = function(){
        collectSelectedRecipients();
        $scope.form.userType = 'users';

        if(!Object.keys($scope.form.toId).length) {
    			alert('Please select recipients');
    			return;
    		}

        showHideLoad();
        dataFactory.httpRequest('index.php/mobileNotif','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'remove');
            if(data.status == "success"){
                $scope.messages = data.items;
                $scope.totalItems = data.totalItems;
                $scope.sendNewScope = "success";
            }
            showHideLoad(true);
        });
    }
});