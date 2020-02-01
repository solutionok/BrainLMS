var OraSchool = angular.module('teachersController', []);

OraSchool.controller('teachersController', function(dataFactory,$rootScope,$scope,$sce) {
    $scope.teachers = {};
    $scope.roles = {};
    $scope.teachersTemp = {};
    $scope.totalItemsTemp = {};
    $scope.transports = {};
    $scope.transport_vehicles = {};
    $scope.teachersApproval = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.comVia = ["mail","sms","phone"];
    $scope.importType ;
    $scope.importReview = {};
    $scope.searchInput = {};
    $scope.current_page = 1;

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.comVia = ["mail","sms","phone"];
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.approval = false;
        $scope.views.edit = false;
        $scope.views.import = false;
        $scope.views.reviewImport = false;
        $scope.views[view] = true;
    }

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Teachers';
    });

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
        dataFactory.httpRequest('index.php/teachers/reviewImport','POST',{},{'importReview':$scope.importReview}).then(function(data) {
            content = apiResponse(data);
            if(data.status == "failed"){
                $scope.importReview = content;
                $scope.changeView('reviewImport');
            }else{
                $scope.getResultsPage(1);
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
    $scope.teacherProfile = function(id){
        dataFactory.httpRequest('index.php/teachers/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    $scope.totalItems = 0;
    $scope.pageChanged = function(newPage) {
        $scope.current_page = newPage;
        $scope.getResultsPage();
    };

    $scope.listUsers = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/teachers/listAll/'+pageNumber).then(function(data) {
            $scope.teachers = data.teachers;
            $scope.transports = data.transports;
            $scope.transport_vehicles = data.transport_vehicles;
            $scope.roles = data.roles;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.searchDB = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/teachers/listAll/'+pageNumber,'POST',{},{'searchInput':$scope.searchInput}).then(function(data) {
            $scope.teachers = data.teachers;
            $scope.transports = data.transports;
            $scope.transport_vehicles = data.transport_vehicles;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.getResultsPage = function(newpage = ""){
        if(newpage != ""){
            $scope.current_page = newpage;
        }
        if ( !jQuery.isEmptyObject($scope.searchInput) ) {
            $scope.searchDB( $scope.current_page );
        }else{
            $scope.listUsers( $scope.current_page );
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
        dataFactory.httpRequest('index.php/teachers/listAll/1','POST',{},{'sortBy':sortBy}).then(function(data) {
            $scope.teachers = data.teachers;
            $scope.totalItems = data.totalItems;
            $rootScope.dashboardData.sort.teachers = sortBy;
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            // reset form
            $scope.form = {};
            $('[name="photo"]').val('');

            $scope.getResultsPage();
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/teachers/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.teachers.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.account_status = function(user_id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/teachers/account_status/'+user_id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.teachers[$index].account_active = response.account_active;
            }
            showHideLoad(true);
        });
    }

    $scope.removeLeaderBoard = function(id,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/teachers/leaderBoard/delete/'+id,'POST').then(function(data) {
                response = apiResponse(data,'edit');
                $scope.teachers[index].isLeaderBoard = "";
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/teachers/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            // reset form
            $scope.form = {};
            $('[name="photo"]').val('');

            $scope.getResultsPage();
        }
        showHideLoad(true);
    }

    $scope.waitingApproval = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/teachers/waitingApproval').then(function(data) {
            $scope.teachersApproval = data;
            $scope.changeView('approval');
            showHideLoad(true);
        });
    }

    $scope.approve = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/teachers/approveOne/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                for (x in $scope.teachersApproval) {
                    if($scope.teachersApproval[x].id == id){
                        $scope.teachersApproval.splice(x,1);
                    }
                }
            }
            $scope.changeView('approval');
            showHideLoad(true);
        });
    }

    $scope.leaderBoard = function(id,index){
        var isLeaderBoard = prompt($rootScope.phrase.leaderBoardMessage);
        if (isLeaderBoard != null) {
            showHideLoad();
            dataFactory.httpRequest('index.php/teachers/leaderBoard/'+id,'POST',{},{'isLeaderBoard':isLeaderBoard}).then(function(data) {
                response = apiResponse(data,'edit');
                $scope.teachers[index].isLeaderBoard = "x";
                showHideLoad(true);
            });
        }
    }
});