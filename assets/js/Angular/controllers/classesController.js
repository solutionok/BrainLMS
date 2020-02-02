var OraSchool = angular.module('classesController', []);

OraSchool.controller('classesController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.teachers = {};
    // $scope.dormitory = {};
    $scope.subject = {};
    $scope.subject_array = {};
    $scope.subject_ids = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.feeTypes = {};
    $scope.form = {};
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.filter_classes_input_class = '0';
    $scope.filter_classes_input_subject = '0';

    $scope.allClasses = {};
    $scope.mainSubjectIds = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Classes';
    });

    dataFactory.httpRequest('index.php/classes/listAll').then(function(data) {
        $scope.classes = data.classes;
        $scope.teachers = data.teachers;
        // $scope.dormitory = data.dormitory;
        $scope.subject = data.subject;
        $scope.subject_array = data.subject_array;
        $scope.subject_ids = data.subject_ids;
        showHideLoad(true);

        if(Object.keys($scope.allClasses).length <= 0) {
        	$scope.allClasses = data.classes;
        }
        if(Object.keys($scope.mainSubjectIds).length <= 0) {
        	$scope.mainSubjectIds = data.subject_ids;
        }
    });

    $scope.addClass = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/feeTypes/listAll').then(function(data) {
            $scope.feeTypes = data;
            $scope.changeView('add');
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        $scope.form.allocationValues = $scope.feeTypes;
        dataFactory.httpRequest('index.php/classes','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.classes.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/classes/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.classes.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/classes/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/classes/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.classes = apiModifyTable($scope.classes,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.filterClassesByClassAndSubject = function() {
    		showHideLoad();
    		var input_class = $scope.filter_classes_input_class;
    		var input_subject = $scope.filter_classes_input_subject;

    		if($scope.filter_classes_input_class != null && $scope.filter_classes_input_class != '0') {
    			input_class = [$scope.filter_classes_input_class];
    		} else {
    			input_class = '';
    		}
    		if($scope.filter_classes_input_subject != null && $scope.filter_classes_input_subject != '0') {
    			input_subject = [$scope.filter_classes_input_subject];
    		} else {
    			input_subject = '';
    		}
    		if(
    			($scope.filter_classes_input_class != null && $scope.filter_classes_input_class != '0')
    			||
    			($scope.filter_classes_input_subject != null && $scope.filter_classes_input_subject != '0')
    		) {
    			send_data = {
	    			searchInput: {
	    				'class': input_class,
		        	'subject': input_subject,
	    			}
    			}
    		} else {
    			send_data = {};
    		}

        dataFactory.httpRequest('index.php/classes/listAll', 'GET', send_data).then(function(data) {
            $scope.classes = data.classes;
            showHideLoad(true);
        });
    }

    $scope.getCurrentSubjects = function(){
      $scope.mainSubjectIds = $scope.allClasses.find(item => item.id === parseInt($scope.filter_classes_input_class)).classSubjects;
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