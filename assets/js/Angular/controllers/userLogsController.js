var OraSchool = angular.module('userLogsController', []);

OraSchool.controller('userLogsController', function(dataFactory,$rootScope,$scope,$sce) {
    $scope.views = {};
    $scope.views.list = true;
    $scope.user_logs = {};
    $scope.page = 1;
    $scope.totalItems = 0;
    $scope.searchInput = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | User logs';
    });

    $scope.load_data = function(pageNumber) {
        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;
        showHideLoad();
        dataFactory.httpRequest('index.php/user-logs/listAll/' + pageNumber).then(function(data) {
            $scope.user_logs = data.user_logs;
            angular.forEach($scope.user_logs, function (item) {
                item.user_info = $sce.trustAsHtml(item.user_info);
                item.payload = $sce.trustAsHtml(item.payload);
            });
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    $scope.getResultsPage = function(id){
        if (!jQuery.isEmptyObject($scope.searchInput)) {
            $scope.searchDB(id);
        }else{
        		$scope.load_data(id);
        }
    }

    $scope.pageChanged = function(newPage) {
        $scope.getResultsPage(newPage);
    };

    $scope.load_data(1);

    $scope.toggleSearch = function(){
        $('.advSearch').toggleClass('col-0 col-3 hidden',1000);
        $('.listContent').toggleClass('col-12 col-9',1000);
    }

    $scope.resetSearch = function(){
        $scope.searchInput = {};
        $scope.load_data(1);
    }
    $scope.changeView = function(view){
      $scope.views.list = false;
      $scope.views[view] = true;
    }

    $scope.searchDB = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/user-logs/listAll/'+pageNumber,'POST',{},{'searchInput':$scope.searchInput}).then(function(data) {
            $scope.user_logs = data.user_logs;
            angular.forEach($scope.user_logs, function (item) {
                item.user_info = $sce.trustAsHtml(item.user_info);
                item.payload = $sce.trustAsHtml(item.payload);
            });
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }
});