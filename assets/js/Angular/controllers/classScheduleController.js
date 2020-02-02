var OraSchool = angular.module('classScheduleController', []);

OraSchool.controller('classScheduleController', function(dataFactory,$rootScope,$scope,$sce) {
    $scope.classes = {};
    $scope.subject = {};
    $scope.days = {};
    $scope.classSchedule = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.current_section = {};
    $scope.userRole;
    $scope.selectedDayName = '';

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Class Schedule';
    });

    dataFactory.httpRequest('index.php/classschedule/listAll').then(function(data) {
        $scope.classes = data.classes;
        $scope.subject = data.subject;
        $scope.teachers = data.teachers;
        $scope.sections_collection = data.sections;
        $scope.userRole = data.userRole;
        $scope.days = data.days;

        // force select class & section
        $scope.form._className = data.classes[Object.keys($scope.classes)[0]];
        $scope.getCurrentSection();
        $scope.form.sectionId = $scope.sections_collection[$scope.form._className][0].id;
        $scope.checkChangeSection($scope.form.sectionId);

        showHideLoad(true);
    });

    $scope.getCurrentSection = function() {
    	showHideLoad();
    	$scope.sections = $scope.sections_collection[$scope.form._className]

    	dataFactory.httpRequest('index.php//classes/get-class-id-by-class-name/' + $scope.form._className).then(function(data) {
	        $scope.classId = data.class_id;
	        showHideLoad(true);
	    });
    }

    $scope.checkChangeSection = function(sectionId) {
    	$scope.current_section = $scope.sections.find(section => section.id == sectionId);
    }

    $scope.setDayName = function(dayName) {
    	$scope.selectedDayName = dayName;
    }

    $scope.edit = function(class_id,section_id){
        if(typeof section_id == "undefined"){
            $scope.selected_class = class_id;
            $scope.selected_section = section_id;

            $scope.query_id = class_id;
        }else{
            $scope.selected_class = class_id;
            $scope.selected_section = section_id;

            $scope.query_id = section_id;
        }

        showHideLoad();
        dataFactory.httpRequest('index.php/classschedule/'+$scope.query_id).then(function(data) {
            $scope.classSchedule = data;
            // console.log(data)
            $scope.classId = $scope.query_id;
            $scope.changeView('edit');
            $scope.setDayName('Sunday');
            showHideLoad(true);
        });
    }

    $scope.removeSub = function(id,day){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/classschedule/delete/'+$scope.classId+'/'+id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    for (x in $scope.classSchedule.schedule[day].sub) {
                        if($scope.classSchedule.schedule[day].sub[x].id == id){
                            $scope.classSchedule.schedule[day].sub.splice(x,1);
                        }
                    }
                }
                showHideLoad(true);
            });
        }
    }

    $scope.addSubOne = function(day){
        $scope.form = {};
        $scope.form.dayOfWeek = day;

        $scope.modalTitle = $rootScope.phrase.addSch;
        $scope.scheduleModal = !$scope.scheduleModal;
    }

    $scope.saveAddSub = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/classschedule/'+$scope.classId,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                if(typeof $scope.classSchedule.schedule[response.dayOfWeek].sub == "undefined"){
                    $scope.classSchedule.schedule[response.dayOfWeek].sub = [];
                }
                $scope.classSchedule.schedule[response.dayOfWeek].sub.push({"id":response.id,"classId":response.classId,"subjectId":response.subjectId,"start":response.startTime,"end":response.endTime});
            }
            $scope.scheduleModal = !$scope.scheduleModal;
            showHideLoad(true);
        });
    }

    $scope.editSubOne = function(id,day){
        showHideLoad();
        $scope.form = {};
        dataFactory.httpRequest('index.php/classschedule/sub/'+id).then(function(data) {
            $scope.form = data;
            $scope.oldDay = day;

            $scope.modalTitle = $rootScope.phrase.editSch;
            $scope.scheduleModalEdit = !$scope.scheduleModalEdit;
            showHideLoad(true);
        });
    }

    $scope.saveEditSub = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/classschedule/sub/'+id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                for (x in $scope.classSchedule.schedule[$scope.oldDay].sub) {
                    if($scope.classSchedule.schedule[$scope.oldDay].sub[x].id == id){
                        $scope.classSchedule.schedule[$scope.oldDay].sub.splice(x,1);
                    }
                }
                if(typeof $scope.classSchedule.schedule[response.dayOfWeek].sub == "undefined"){
                    $scope.classSchedule.schedule[response.dayOfWeek].sub = [];
                }
                $scope.classSchedule.schedule[response.dayOfWeek].sub.push({"id":response.id,"classId":response.classId,"subjectId":response.subjectId,"start":response.startTime,"end":response.endTime});
            }
            $scope.scheduleModalEdit = !$scope.scheduleModalEdit;
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.editSub = false;
        $scope.views.addSub = false;
        $scope.views[view] = true;
    }
});