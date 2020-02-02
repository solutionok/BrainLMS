var OraSchool = angular.module('parentsController', []);

OraSchool.controller('parentsController', function(dataFactory,$scope,$sce,$rootScope) {
    $scope.stparents = {};
    $scope.stparentsTemp = {};
    $scope.totalItemsTemp = {};
    $scope.stparentsApproval = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.comVia = ["mail","sms","phone"];
    $scope.form.studentInfo = {};
    $scope.importType ;
    $scope.searchResults = {};
    $scope.searchInput = {};
    $scope.roles = {};
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.current_page = 1;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Parents';
    });

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.comVia = ["mail","sms","phone"];
            $scope.form.studentInfo = [];
        }
        $scope.views.list = false;
        $scope.views.approval = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.import = false;
        $scope.views.reviewImport = false;
        $scope.views[view] = true;
    }

    $scope.import = function(impType){
        $scope.importType = impType;
        $scope.changeView('import');
    };

    $scope.saveImported = function(content){
        content = uploadSuccessOrError(content);
        if(content){
            $scope.importReview = content;
            showHideLoad();
            $scope.changeView('reviewImport');
        }
        showHideLoad(true);
    }

    $scope.reviewImportData = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/reviewImport','POST',{},{'importReview':$scope.importReview}).then(function(data) {
            content = apiResponse(data);
            if(data.status == "failed"){
                $scope.importReview = content;
                $scope.changeView('reviewImport');
            }else{
                $scope.getResultsPage('1');
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.removeImport = function(item,index,importType){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            if(importType == "revise"){
                $scope.importReview.revise.splice(index,1);
            }
            if(importType == "ready"){
                $scope.importReview.ready.splice(index,1);
            }
        }
    }

    $scope.showModal = false;
    $scope.parentProfile = function(id){
        dataFactory.httpRequest('index.php/parents/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    $scope.listUsers = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/listAll/'+pageNumber).then(function(data) {
            $scope.stparents = data.parents;
            $scope.roles = data.roles;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.searchDB = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/listAll/'+pageNumber,'POST',{},{'searchInput':$scope.searchInput}).then(function(data) {
            $scope.stparents = data.parents;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.getResultsPage = function(newpage = ""){
        if(newpage != ""){
            $scope.current_page = newpage;
        }
        if ( !jQuery.isEmptyObject($scope.searchInput) ) {
            $scope.searchDB($scope.current_page);
        }else{
            $scope.listUsers($scope.current_page);
        }
        $scope.changeView('list');
    }

    $scope.getResultsPage();

    $scope.toggleSearch = function(){
        $('.advSearch').toggleClass('col-0 col-3 hidden',1000);
        $('.listContent').toggleClass('col-12 col-9',1000);
    }

    $scope.resetSearch = function(){
        $scope.searchInput = {};
        $scope.getResultsPage(1);
    }

    $scope.sortItems = function(sortBy){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/listAll/1','POST',{},{'sortBy':sortBy}).then(function(data) {
            $scope.stparents = data.parents;
            $scope.totalItems = data.totalItems;
            $rootScope.dashboardData.sort.teachers = sortBy;
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        response = apiResponse(data,'add');
        if(data.status == "success"){
            $scope.stparents.push(response);
            $scope.getResultsPage();
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/parents/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.stparents.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.account_status = function(user_id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/account_status/'+user_id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.stparents[$index].account_active = response.account_active;
            }
            showHideLoad(true);
        });
    }

    $scope.removeStudent = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.studentInfo) {
                if($scope.form.studentInfo[x].id == index){
                    $scope.form.studentInfo.splice(x,1);
                    $scope.form.studentInfoSer = JSON.stringify($scope.form.studentInfo);
                    break;
                }
            }
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/'+id).then(function(data) {
            $scope.form = data;
            if(data.parentOf == null || data.parentOf == ''){
                $scope.form.studentInfo = [];
            }else{
                $scope.form.studentInfo = data.parentOf;
            }
            $scope.form.studentInfoSer = JSON.stringify($scope.form.studentInfo);
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.monitorParentChange = function(){
        $scope.form.studentInfoSer = JSON.stringify($scope.form.studentInfo);
    }

    $scope.saveEdit = function(data){
        showHideLoad();
        response = apiResponse(data,'add');
        if(data.status == "success"){
            $scope.getResultsPage();
        }
        showHideLoad(true);
    }

    $scope.waitingApproval = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/waitingApproval').then(function(data) {
            $scope.stparentsApproval = data;
            $scope.changeView('approval');
            showHideLoad(true);
        });
    }

    $scope.approve = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/parents/approveOne/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                for (x in $scope.stparentsApproval) {
                    if($scope.stparentsApproval[x].id == id){
                        $scope.stparentsApproval.splice(x,1);
                    }
                }
            }
            $scope.changeView('approval');
            showHideLoad(true);
        });
    }

    $scope.linkStudent = function(){
        $scope.modalTitle = $rootScope.phrase.linkStudentParent;
        $scope.showModalLink = !$scope.showModalLink;
    }

    $scope.linkStudentButton = function(){
        var searchAbout = $('#searchLink').val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest('index.php/parents/search/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.linkStudentFinish = function(student){
        do{
            var relationShip = prompt("Please enter relationship", "");
        }while(relationShip == "");
        if (relationShip != null && relationShip != "") {
            $scope.form.studentInfo.push({"student":student.name,"relation":relationShip,"id": "" + student.id + "" });
            $scope.form.studentInfoSer = JSON.stringify($scope.form.studentInfo);
            $scope.showModalLink = !$scope.showModalLink;
        }
    }
});