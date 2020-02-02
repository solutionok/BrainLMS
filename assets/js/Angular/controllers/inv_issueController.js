var OraSchool = angular.module('inv_issue', []);

OraSchool.controller('inv_issue', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.inv_issue = {};
    $scope.inv_cat = {};
    $scope.items_code = {};
    $scope.items_code_edit = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Invoice Issues';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.inv_issueTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/inv_issue/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.inv_issue = data.inv_issue;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/inv_issue/listAll/'+pageNumber).then(function(data) {
                $scope.inv_issue = data.inv_issue;
                if( pageNumber == 1){
                    $scope.inv_cat = data.inv_cat;
                $scope.items_code = data.items_code;
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
            if($.isEmptyObject($scope.inv_issueTemp)){
                $scope.inv_issueTemp = $scope.inv_issue;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.inv_issue = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.inv_issueTemp)){
                $scope.inv_issue = $scope.inv_issueTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.inv_issueTemp = {};
            }
        }
    }

    $scope.load_data();

    $scope.load_items = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/inv_issue/load_items/'+$scope.form.item_cat,'POST').then(function(data) {
            $scope.items_code_edit = data;
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/inv_issue','POST',{},$scope.form,"attachment,").then(function(data) {
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
            dataFactory.httpRequest('index.php/inv_issue/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.inv_issue.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/inv_issue/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/inv_issue/'+$scope.form.id,'POST',{},$scope.form,"attachment,").then(function(data) {
            showHideLoad();

            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.return_item = function(id){
        var confirmRemove = confirm($rootScope.phrase.sureReturn);
        if (confirmRemove == true) {
            dataFactory.httpRequest('index.php/inv_issue/return/'+id,'POST',{},{}).then(function(data) {
                showHideLoad();

                response = apiResponse(data,'edit');
                if(data.status == "success"){
                    $scope.load_data();
                    $scope.changeView('list');
                }
                showHideLoad(true);
            });
        }
    }

    $scope.openSearchModal_issue_tu = function(){
        $scope.modalTitle = $rootScope.phrase.searchUsers;
        $scope.showUsrSearchModal_issue_tu = !$scope.showUsrSearchModal_issue_tu;
    }

    $scope.searchUserButton_issue_tu = function(){
        var searchAbout = $("#searchLink_issue_tu").val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest("index.php/inv_issue/searchUser/"+searchAbout).then(function(data) {
            $scope.searchResults_issue_tu = data;
        });
    }

    $scope.serachUserFinish_issue_tu = function(user){
        $scope.form.issue_tu = [];
        $scope.form.issue_tu.push({"user":user.name,"id": "" + user.id + "" });
        $scope.form.issue_tu_ser = JSON.stringify($scope.form.issue_tu);
        $scope.showUsrSearchModal_issue_tu = !$scope.showUsrSearchModal_issue_tu;
    }

    $scope.removeUserSearch_issue_tu = function(user_id){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.issue_tu) {
                if($scope.form.issue_tu[x].id == user_id){
                    $scope.form.issue_tu.splice(x,1);
                    $scope.form.issue_tu_ser = JSON.stringify($scope.form.issue_tu);
                    break;
                }
            }
        }
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};

        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});