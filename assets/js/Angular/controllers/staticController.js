var OraSchool = angular.module('staticController', []);

OraSchool.controller('staticController', function(dataFactory,$routeParams,$scope,$sce,$rootScope) {
    $scope.staticPages = {};
    $scope.views = {};
    $scope.form = {};
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.pageId = $routeParams.pageId;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content');
    });

    if (typeof $scope.pageId != "undefined" && $scope.pageId != "") {
        showHideLoad();
        dataFactory.httpRequest('index.php/static/'+$scope.pageId).then(function(data) {
            $scope.changeView('show');
            $scope.form.pageTitle = data.pageTitle;
            $scope.pageContent = $sce.trustAsHtml(data.pageContent);
            showHideLoad(true);
        });
    }else{
        dataFactory.httpRequest('index.php/static/listAll').then(function(data) {
            $scope.staticPages = data;
            $scope.changeView('list');
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/static','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.staticPages.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
        $scope.form = {};
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/static/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/static/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.staticPages = apiModifyTable($scope.staticPages,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
        $scope.form = {};
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/static/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.staticPages.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.pageActive = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/static/active/'+id).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                angular.forEach($scope.staticPages, function (item) {
                    if(item.id == response.id){
                        if(item.pageActive == 1){
                            item.pageActive = 0;
                        }else{
                            item.pageActive = 1;
                        }
                    }
                });
            }
            showHideLoad(true);
        });
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.pageContent = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.show = false;
        $scope.views.listSubs = false;
        $scope.views[view] = true;
    }
});