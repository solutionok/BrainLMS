var OraSchool = angular.module('items_code', []);

OraSchool.controller('items_code', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.items_code = {};
    $scope.inv_cat = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Items code';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.items_codeTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/items_code/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.items_code = data.items_code;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/items_code/listAll/'+pageNumber).then(function(data) {
                $scope.items_code = data.items_code;
                if( pageNumber == 1){
                    $scope.inv_cat = data.inv_cat;
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
            if($.isEmptyObject($scope.items_codeTemp)){
                $scope.items_codeTemp = $scope.items_code;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.items_code = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.items_codeTemp)){
                $scope.items_code = $scope.items_codeTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.items_codeTemp = {};
            }
        }
    }

    $scope.load_data();

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/items_code','POST',{},$scope.form).then(function(data) {
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
            dataFactory.httpRequest('index.php/items_code/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.items_code.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/items_code/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/items_code/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
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
        dataFactory.httpRequest('index.php/items_code/active/'+id,'POST').then(function(data) {
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