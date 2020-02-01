var OraSchool = angular.module('library_issues', []);

OraSchool.controller('library_issues', function(dataFactory,$sce,$rootScope,$scope,$routeParams,$route) {
    $scope.library_issue = {};
    $scope.books = {};
    $scope.views = {};
    $scope.pageNumber = 1;
    $scope.form = {};
    var methodName = $route.current.methodName;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Library issues';
    });

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};

        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.view = false;
        $scope.views.list_issued = false;
        $scope.views[view] = true;
    }

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.library_issueTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/library_issues/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.library_issue = data.library_issue;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/library_issues/listAll/'+pageNumber).then(function(data) {
                $scope.library_issue = data.library_issue;
                if( pageNumber == 1){
                    $scope.books = data.books;
                }
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
            if($.isEmptyObject($scope.library_issueTemp)){
                $scope.library_issueTemp = $scope.library_issue;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.library_issue = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.library_issueTemp)){
                $scope.library_issue = $scope.library_issueTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.library_issueTemp = {};
            }
        }
    }

    $scope.load_issued_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.library_issueTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/library_issues/searchIssued/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.library_issue = data.library_issue;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/library_issues/listIssued/'+pageNumber).then(function(data) {
                $scope.library_issue = data.library_issue;
                if( pageNumber == 1){
                    $scope.books = data.books;
                }
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }
    }

    $scope.issuedPageChanged = function(newPage) {
        $scope.load_issued_data(newPage);
    };

    $scope.searchIssuedDB = function(){
        if($scope.searchText.length >= 3){
            if($.isEmptyObject($scope.library_issueTemp)){
                $scope.library_issueTemp = $scope.library_issue;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.library_issue = {};
            }
            $scope.load_issued_data(1);
        }else{
            if(! $.isEmptyObject($scope.library_issueTemp)){
                $scope.library_issue = $scope.library_issueTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.library_issueTemp = {};
            }
        }
    }

    if(methodName == "library_return"){
        $scope.changeView('list_issued');
        $scope.load_issued_data();
    }else{
        $scope.changeView('list');
        $scope.load_data();
    }

    $scope.library_return = function(id){
        $scope.book_id = id;
        $scope.modalTitle = $rootScope.phrase.book_return;
        $scope.show_return_modal = !$scope.show_return_modal;
    }

    $scope.library_return_now = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/library_issues/return/'+$scope.book_id,'POST',{},{'id':$scope.book_id,'ret_date':$scope.form.ret_date}).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.show_return_modal = !$scope.show_return_modal;
                $scope.load_issued_data();
                $scope.changeView('list_issued');
            }
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/library_issues','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/library_issues/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.library_issue.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/library_issues/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/library_issues/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            showHideLoad();

            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.status =function(id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/library_issues/active/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
            }
            showHideLoad(true);
        });
    }

    $scope.openSearchModal_user_id = function(){
        $scope.modalTitle = $rootScope.phrase.searchUsers;
        $scope.modalClass = "modal-lg";
        $scope.showUsrSearchModal_user_id = !$scope.showUsrSearchModal_user_id;
    }

    $scope.searchUserButton_user_id = function(){
        var searchAbout = $("#searchLink_user_id").val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest("index.php/library_issues/searchUser/"+searchAbout).then(function(data) {
            $scope.searchResults_user_id = data;
        });
    }

    $scope.serachUserFinish_user_id = function(user){
        $scope.form.user_id = [];
        $scope.form.user_id.push({"user":user.name,"id": "" + user.id + "" });
        $scope.form.user_id_ser = JSON.stringify($scope.form.user_id);
        $scope.showUsrSearchModal_user_id = !$scope.showUsrSearchModal_user_id;
    }

    $scope.removeUserSearch_user_id = function(user_id){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.user_id) {
                if($scope.form.user_id[x].id == user_id){
                    $scope.form.user_id.splice(x,1);
                    $scope.form.user_id_ser = JSON.stringify($scope.form.user_id);
                    break;
                }
            }
        }
    }
});