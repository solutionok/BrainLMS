var OraSchool = angular.module('suppliers', []);

OraSchool.controller('suppliers', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.suppliers = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Suppliers';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.suppliersTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/suppliers/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.suppliers = data.suppliers;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/suppliers/listAll/'+pageNumber).then(function(data) {
                $scope.suppliers = data.suppliers;

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
            if($.isEmptyObject($scope.suppliersTemp)){
                $scope.suppliersTemp = $scope.suppliers;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.suppliers = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.suppliersTemp)){
                $scope.suppliers = $scope.suppliersTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.suppliersTemp = {};
            }
        }
    }

    $scope.load_data();

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/suppliers','POST',{},$scope.form).then(function(data) {
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
            dataFactory.httpRequest('index.php/suppliers/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.suppliers.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/suppliers/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/suppliers/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
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
        dataFactory.httpRequest('index.php/suppliers/active/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
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
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});