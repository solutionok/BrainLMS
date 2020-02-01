var OraSchool = angular.module('examsListController', []);

OraSchool.controller('examsListController', function(dataFactory,$rootScope,$scope,$sce) {
    $scope.examsList = {};
    $scope.classes = {};
    $scope.subjects = {};
    $scope.userRole ;
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.examSchedule = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Exams';
    });

    $scope.showModal = false;
    $scope.studentProfile = function(id){
        dataFactory.httpRequest('index.php/students/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    dataFactory.httpRequest('index.php/examsList/listAll').then(function(data) {
        $scope.examsList = data.exams;
        $scope.classes = data.classes;
        $scope.subjectsList = data.subjects;
        $scope.userRole = data.userRole;
        showHideLoad(true);
    });

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.classId}).then(function(data) {
            $scope.subjects = data.subjects;
            $scope.sections = data.sections;
        });
    }

    $scope.notify = function(id){
        var confirmNotify = confirm($rootScope.phrase.sureMarks);
        if (confirmNotify == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/examsList/notify/'+id,'POST',{},$scope.form).then(function(data) {
                apiResponse(data,'add');
                showHideLoad(true);
            });
        }
    }

    $scope.addMSCol = function(){
        var colTitle = prompt("Please enter column title");
        if (colTitle != null) {
            if(typeof $scope.form.examMarksheetColumns == "undefined"){
                $scope.form.examMarksheetColumns = [];
            }

            $i = 1;
            angular.forEach($scope.form.examMarksheetColumns, function(value, key) {
                if($i <= parseInt(value.id)){
                    $i = parseInt(value.id) + 1;
                }
            });

            $scope.form.examMarksheetColumns.push({'id':$i,'title':colTitle});
        }
    }

    $scope.removeMSCol = function(col,$index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            $scope.form.examMarksheetColumns.splice($index,1);
        }
    }

    $scope.addScheduleRow = function(){
        if(typeof $scope.form.examSchedule == "undefined"){
            $scope.form.examSchedule = [];
        }
        $scope.form.examSchedule.push( {'subject':'','stDate':''} );
    }

    $scope.removeRow = function(row,index){
        $scope.form.examSchedule.splice(index,1);
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/examsList','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.examsList.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/examsList/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/examsList/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.examsList = apiModifyTable($scope.examsList,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/examsList/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.examsList.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.marks = function(exam){
        $scope.form.exam = exam.id;
        $scope.markClasses = [];

        try{
            exam.examClasses = JSON.parse(exam.examClasses);
        }catch(e){ }

        angular.forEach($scope.classes, function(value, key) {
            angular.forEach(exam.examClasses, function(value_) {
                if(parseInt(value.id) == parseInt(value_)){
                    $scope.markClasses.push(value);
                }
            });
        });
        $scope.changeView('premarks');
    }

    $scope.startAddMarks = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/examsList/getMarks','POST',{},$scope.form).then(function(data) {
            $scope.form.respExam = data.exam;
            $scope.form.respClass = data.class;
            $scope.form.respSubject = data.subject;
            $scope.form.respStudents = data.students;

            $scope.changeView('marks');
            showHideLoad(true);
        });
    }

    $scope.saveNewMarks = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/examsList/saveMarks/'+$scope.form.exam+"/"+$scope.form.classId+"/"+$scope.form.subjectId,'POST',{},$scope.form).then(function(data) {
            apiResponse(data,'add');
            $scope.changeView('list');
            showHideLoad(true);
        });
    }

    $scope.examDetails = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/examsList/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('examDetails');
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.premarks = false;
        $scope.views.marks = false;
        $scope.views.examDetails = false;
        $scope.views[view] = true;
    }
});