var OraSchool = angular.module('libraryController', []);

OraSchool.controller('libraryController', function(dataFactory,$rootScope,$scope,$route) {
    $scope.library = {};
    $scope.libraryTemp = {};
    $scope.totalItemsTemp = {};
    $scope.views = {};
    $scope.form = {};
    $scope.userRole ;
    $scope.importType;
    $scope.importReview;
    $scope.importSections;
    var methodName = $route.current.methodName;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Library';
    });

    $scope.totalItems = 0;
    $scope.pageChanged = function(newPage) {
        $scope.getResultsPage(newPage);
    };

    $scope.getResultsPage = function(pageNumber) {
        if(! $.isEmptyObject($scope.libraryTemp)){
            dataFactory.httpRequest('index.php/library/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.library = data.bookLibrary;
                $scope.totalItems = data.totalItems;
            });
        }else{
            dataFactory.httpRequest('index.php/library/listAll/'+pageNumber).then(function(data) {
                $scope.library = data.bookLibrary;
                $scope.totalItems = data.totalItems;
                $scope.userRole = data.userRole;
                showHideLoad(true);
            });
        }
    }

    if(methodName == "subscription"){
        $scope.views.subscription = true;
        showHideLoad(true);
    }else{
        $scope.getResultsPage(1);
        $scope.views.list = true;
    }

    $scope.searchDB = function(){
        if($scope.searchText.length >= 3){
            if($.isEmptyObject($scope.libraryTemp)){
                $scope.libraryTemp = $scope.library ;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.library = {};
            }
            $scope.getResultsPage(1);
        }else{
            if(! $.isEmptyObject($scope.libraryTemp)){
                $scope.library = $scope.libraryTemp ;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.libraryTemp = {};
            }
        }
    }

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            $scope.library.push(response);
            $scope.changeView('list');
            showHideLoad(true);
        }
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/library/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.library.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/library/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            $scope.library = apiModifyTable($scope.library,response.id,response);
            $scope.changeView('list');
            showHideLoad(true);
        }
    }


    $scope.search_subscription = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/library/members','POST',{},$scope.form).then(function(data) {
            $scope.subscription_members = data;
            showHideLoad(true);
        });
    }

    $scope.edit_subscription = function(user){
        $scope.user_subscription = user;
        $scope.modalTitle = "Manage Subscription";
        $scope.addSubsModal = !$scope.addSubsModal;
    }

    $scope.saveUsrSubscription = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/library/members_set','POST',{},{'user':$scope.user_subscription.id,'library_id':$scope.form.library_id}).then(function(data) {
            $scope.addSubsModal = !$scope.addSubsModal;
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
        $scope.views.subscription = false;
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
            $scope.importReview = content.dataImport;
            showHideLoad();
            $scope.changeView('reviewImport');
        }
        showHideLoad(true);
    }

    $scope.reviewImportData = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/library/reviewImport','POST',{},{'importReview':$scope.importReview}).then(function(data) {
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
});