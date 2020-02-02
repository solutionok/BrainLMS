var OraSchool = angular.module('academicYearController', []);

OraSchool.controller('academicYearController', function(dataFactory,$rootScope,$scope) {
    $scope.academicYears = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Academic Years';
    });

    dataFactory.httpRequest('index.php/academic/listAll').then(function(data) {
        $scope.academicYears = data;
        showHideLoad(true);
    });

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/academic/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.academicYears.splice(index,1);
                    $rootScope.dashboardData.academicYear = $scope.academicYears;
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/academic/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/academic/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(response){
                $scope.academicYears = apiModifyTable($scope.academicYears,response.id,response);
                $rootScope.dashboardData.academicYear = $scope.academicYears;
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/academic','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(response){
                if(response.isDefault == 1){
                    angular.forEach($scope.academicYears, function (item) {
                        item.isDefault = 0;
                    });
                }
                $scope.academicYears.push({"id":response.id,"yearTitle":response.yearTitle,"isDefault":response.isDefault});
                $rootScope.dashboardData.academicYear = $scope.academicYears;
                location.reload();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.makeActive = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/academic/active/'+id,'POST',{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(response){
                angular.forEach($scope.academicYears, function (item) {
                    item.isDefault = 0;
                    if(item.id == response.id){
                        item.isDefault = 1;
                    }
                });
                $rootScope.dashboardData.academicYear = $scope.academicYears;
                location.reload();
                $scope.changeView('list');
            }
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
        $scope.views[view] = true;
    }
});