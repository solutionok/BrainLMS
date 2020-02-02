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
    $scope.loading = true;
    $scope.uploads_provider = '';
    $scope.current_shown_item = {};

    function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, '\\$&');
		    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
		    return decodeURIComponent(results[2].replace(/\+/g, ' '));
		}

    $scope.$on('$viewContentLoaded', function() {
    	if(getParameterByName('homework_id')) {
    		setTimeout(function(){
    			$scope.viewhomework(getParameterByName('homework_id'))
				}, 1500);
    	}
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
                $scope.loading = false;
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
                $scope.loading = false;
                showHideLoad(true);
            });
        }
    }

    $scope.getUploadsConfig = function() {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/uploads-config', 'POST').then(function(data) {
          $scope.uploads_provider = data.uploads_provider;
          showHideLoad(true);
      });
    }
    $scope.getUploadsConfig();

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

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            $scope.load_data();
            $scope.changeView('list');
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

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            $scope.load_data();
            $scope.changeView('list');
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
            // $scope.homeworkmodal_data.homeworkDescription = $sce.trustAsHtml($scope.homeworkmodal_data.homeworkDescription);
            showHideLoad(true);
        });
    }

    $scope.showHomework = function(item) {
    	$scope.current_shown_item = item;
    	$scope.changeView('upload_file');
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
        $scope.views.upload_file = false;
        $scope.views[view] = true;
    }
});