var OraSchool = angular.module('newsboardController', []);

OraSchool.controller('newsboardController', function(dataFactory,$routeParams,$sce,$rootScope,$scope) {
    $scope.newsboard = {};
    $scope.newsboardTemp = {};
    $scope.totalItemsTemp = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.userRole ;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Newsboard';
    });

    if($routeParams.newsId){
        showHideLoad();
        dataFactory.httpRequest('index.php/newsboard/'+$routeParams.newsId).then(function(data) {
            $scope.form = data;
            $scope.newsTitle = data.newsTitle;
            $scope.newsText = $sce.trustAsHtml(data.newsText);
            $scope.changeView('read');
            showHideLoad(true);
        });
    }else{
        $scope.totalItems = 0;
        $scope.pageChanged = function(newPage) {
            getResultsPage(newPage);
        };

        getResultsPage(1);
    }

    function getResultsPage(pageNumber) {
        if(! $.isEmptyObject($scope.newsboardTemp)){
            dataFactory.httpRequest('index.php/newsboard/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                angular.forEach(data.newsboard, function (item) {
                    item.newsText = $sce.trustAsHtml(item.newsText);
                });
                $scope.newsboard = data.newsboard;
                $scope.totalItems = data.totalItems;
            });
        }else{
            dataFactory.httpRequest('index.php/newsboard/listAll/'+pageNumber).then(function(data) {
                angular.forEach(data.newsboard, function (item) {
                    item.newsText = $sce.trustAsHtml(item.newsText);
                });
                $scope.newsboard = data.newsboard;
                $scope.userRole = data.userRole;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });
        }
    }

    $scope.searchDB = function(){
        if($scope.searchText.length >= 3){
            if($.isEmptyObject($scope.newsboardTemp)){
                $scope.newsboardTemp = $scope.newsboard ;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.newsboard = {};
            }
            getResultsPage(1);
        }else{
            if(! $.isEmptyObject($scope.newsboardTemp)){
                $scope.newsboard = $scope.newsboardTemp ;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.newsboardTemp = {};
            }
        }
    }

    $scope.saveAdd = function(data){
        showHideLoad();

        response = apiResponse(data,'add');
        if(data.status == "success"){
            response.newsText = $sce.trustAsHtml(response.newsText);
            $scope.newsboard.push(response);
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/newsboard/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.newsboard.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/newsboard/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        showHideLoad();

        response = apiResponse(data,'edit');
        if(data.status == "success"){
            response.newsText = $sce.trustAsHtml(response.newsText);
            $scope.newsboard = apiModifyTable($scope.newsboard,response.id,response);
            $scope.changeView('list');
        }
        showHideLoad(true);
    }

    $scope.fe_status =function(id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/newsboard/fe_active/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.newsboard[$index].fe_active = response.fe_active;
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.newsText = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});