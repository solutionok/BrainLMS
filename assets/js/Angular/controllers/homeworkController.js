var OraSchool = angular.module('homeworkController', []);

OraSchool.controller('homeworkController', function(dataFactory,$rootScope,$scope,$sce) {
    $scope.classes = {};
    $scope.subject = {};
    $scope.section = {};
    $scope.homeworks = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole ;
    $scope.page = 1;
    $scope.totalItems = 0;
    $scope.addProcessingStatus = false;
    $scope.editProcessingStatus = false;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Homework';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.homeworksTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/homeworks/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.classes = data.classes;
                $scope.subject = data.subject;
                $scope.homeworks = data.homeworks;
                $scope.userRole = data.userRole;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/homeworks/listAll/'+pageNumber).then(function(data) {
                $scope.classes = data.classes;
                $scope.subject = data.subject;
                $scope.homeworks = data.homeworks;
                $scope.userRole = data.userRole;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }
    }

    $scope.pageChanged = function(newPage) {
        $scope.load_data(newPage);
    };

    $scope.searchDB = function(){
        if($scope.searchText.length >= 3){
            if($.isEmptyObject($scope.homeworksTemp)){
                $scope.homeworksTemp = $scope.homeworks;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.homeworks = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.homeworksTemp)){
                $scope.homeworks = $scope.homeworksTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.homeworksTemp = {};
            }
        }
    }

    $scope.load_data(1);


    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.classId}).then(function(data) {
            $scope.subject = data.subjects;
            $scope.sections = data.sections;
            $scope.form.subject = data.subjects;
            $scope.form.sections = data.sections;
        });
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
        dataFactory.httpRequest('index.php/homeworks/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.submitEditAction = function() {
    	$scope.editProcessingStatus = true;
    }
    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();
            $scope.load_data();
            $scope.changeView('list');
            $scope.editProcessingStatus = false;
            showHideLoad(true);
        }
        $('#homeworkFile').val('');
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/homeworks/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.homeworks.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.submitAddAction = function() {
    	$scope.addProcessingStatus = true;
    }
    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();
            $scope.load_data();
            $scope.changeView('list');
            $scope.addProcessingStatus = false;
            showHideLoad(true);
        }
        $('#homeworkFile').val('');
    }

    $scope.viewhomework = function(id){

        showHideLoad();
        dataFactory.httpRequest('index.php/homeworks_view/'+id).then(function(data) {
            $scope.viewhomeworkmodal = !$scope.viewhomeworkmodal;
            $scope.modalTitle = data.homeworkTitle;
            $scope.modalClass = "modal-lg";
            $scope.homeworkmodal_data = data;
            $scope.homeworkmodal_data.homeworkDescription = $sce.trustAsHtml($scope.homeworkmodal_data.homeworkDescription);
            showHideLoad(true);
        });
    }

    $scope.homework_apply =function(id,student,status){
        $scope.apply_form = {};
        $scope.apply_form.student = student;
        $scope.apply_form.status = status;

        showHideLoad();
        dataFactory.httpRequest('index.php/homeworks/apply/'+id,'POST',{},$scope.apply_form).then(function(data) {
            response = apiResponse(data,'remove');
            if(data.status == "success"){
                $scope.homeworkmodal_data = response;
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.homeworkDescription = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.upload = false;
        $scope.views.answers = false;
        $scope.views[view] = true;
    }
});