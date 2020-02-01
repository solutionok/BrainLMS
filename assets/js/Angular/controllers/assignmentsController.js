var OraSchool = angular.module('assignmentsController', []);

OraSchool.controller('assignmentsController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.subject = {};
    $scope.section = {};
    $scope.assignments = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole ;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Assignments';
    });

    dataFactory.httpRequest('index.php/assignments/listAll').then(function(data) {
        $scope.classes = data.classes;
        $scope.subject = data.subject;
        $scope.assignments = data.assignments;
        if(typeof data.assignmentsAnswers != "undefined"){
            $scope.assignmentsAnswers = data.assignmentsAnswers;
        }
        $scope.userRole = data.userRole
        showHideLoad(true);
    });

    $scope.listAnswers = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/assignments/listAnswers/'+id).then(function(data) {
            $scope.answers = data;
            $scope.changeView('answers');
            showHideLoad(true);
        });
    }

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.classId}).then(function(data) {
            $scope.subject = data.subjects;
            $scope.sections = data.sections;
            $scope.form.subject = data.subjects;
            $scope.form.sections = data.sections;
        });
    }

    $scope.upload = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/assignments/checkUpload','POST',{},{'assignmentId':id}).then(function(data) {
            response = apiResponse(data,'add');
            if(data.canApply && data.canApply == "true"){
                $scope.form.assignmentId = id;
                $scope.changeView('upload');
            }
        });
        showHideLoad(true);
    }

    $scope.isSectionSelected = function(arrayData,valueData){
        return arrayData.indexOf(valueData) > -1;
    }

    $scope.saveAnswer = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            $scope.changeView('list');
            showHideLoad(true);
        }
    }

    $scope.numberSelected = function(item){
        var count = $(item + " :selected").length;
        if(count == 0){
            return true;
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/assignments/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            $scope.assignments = apiModifyTable($scope.assignments,response.id,response);
            $scope.changeView('list');
            showHideLoad(true);
        }
        $('#AssignEditFile').val('');
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/assignments/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.assignments.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            $scope.assignments.push(response);
            $scope.changeView('list');
            showHideLoad(true);
        }
        $('#AssignAddFile').val('');
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.upload = false;
        $scope.views.answers = false;
        $scope.views[view] = true;
    }
});