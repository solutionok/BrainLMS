var OraSchool = angular.module('hostelCatController', []);

OraSchool.controller('hostelCatController', function(dataFactory,$rootScope,$scope) {
    $scope.hostelList = {};
    $scope.hostelCat = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Hostel Categories';
    });

    dataFactory.httpRequest('index.php/hostelCat/listAll').then(function(data) {
        $scope.hostelList = data.hostel;
        $scope.hostelCat = data.cat;
        showHideLoad(true);
    });

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostelCat','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.hostelCat.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostelCat/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/hostelCat/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.hostelCat = apiModifyTable($scope.hostelCat,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/hostelCat/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.hostelCat.splice(index,1);
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
        $scope.views[view] = true;
    }
});