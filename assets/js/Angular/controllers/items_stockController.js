var OraSchool = angular.module('items_stock', []);

OraSchool.controller('items_stock', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.items_stock = {};
    $scope.inv_cat = {};
    $scope.items_code = {};
    $scope.items_code_edit = {};
    $scope.stores = {};
    $scope.suppliers = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Items stocks';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.items_stockTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/items_stock/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.items_stock = data.items_stock;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/items_stock/listAll/'+pageNumber).then(function(data) {
                $scope.items_stock = data.items_stock;
                if( pageNumber == 1){
                    $scope.inv_cat = data.inv_cat;
                    $scope.items_code = data.items_code;
                    $scope.stores = data.stores;
                    $scope.suppliers = data.suppliers;
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
            if($.isEmptyObject($scope.items_stockTemp)){
                $scope.items_stockTemp = $scope.items_stock;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.items_stock = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.items_stockTemp)){
                $scope.items_stock = $scope.items_stockTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.items_stockTemp = {};
            }
        }
    }

    $scope.load_data();

    $scope.load_items = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/items_stock/load_items/'+$scope.form.cat_id,'POST').then(function(data) {
            $scope.items_code_edit = data;
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/items_stock','POST',{},$scope.form,"stock_attach,").then(function(data) {
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
            dataFactory.httpRequest('index.php/items_stock/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.items_stock.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/items_stock/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            $scope.load_items();
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/items_stock/'+$scope.form.id,'POST',{},$scope.form,"stock_attach,").then(function(data) {
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
        dataFactory.httpRequest('index.php/items_stock/active/'+id,'POST').then(function(data) {
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