var OraSchool = angular.module('hostelController', []);

OraSchool.controller('hostelController', function(dataFactory,$rootScope,$scope) {
    $scope.hostelList = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.hostelSubList = {};
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Hostel';
    });

    dataFactory.httpRequest('index.php/hostel/listAll').then(function(data) {
        $scope.hostelList = data;
        showHideLoad(true);
    });

    $scope.listSub = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostel/listSubs/'+id).then(function(data) {
            $scope.changeView('listSubs');
            $scope.hostelSubList = data;
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostel','POST',{},$scope.form,"managerPhoto").then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.hostelList.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostel/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostel/'+$scope.form.id,'POST',{},$scope.form,"managerPhoto").then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.hostelList = apiModifyTable($scope.hostelList,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/hostel/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.hostelList.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.listSubs = false;
        $scope.views[view] = true;
    }
});