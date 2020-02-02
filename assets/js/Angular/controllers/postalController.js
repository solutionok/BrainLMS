var OraSchool = angular.module('postal', []);

OraSchool.controller('postal', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.postal = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Postal';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.postalTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/postal/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.postal = data.postal;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/postal/listAll/'+pageNumber).then(function(data) {
                $scope.postal = data.postal;

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
            if($.isEmptyObject($scope.postalTemp)){
                $scope.postalTemp = $scope.postal;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.postal = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.postalTemp)){
                $scope.postal = $scope.postalTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.postalTemp = {};
            }
        }
    }

    $scope.load_data();

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/postal','POST',{},$scope.form,"attachment,").then(function(data) {
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
            dataFactory.httpRequest('index.php/postal/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.postal.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/postal/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/postal/'+$scope.form.id,'POST',{},$scope.form,"attachment,").then(function(data) {
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
        dataFactory.httpRequest('index.php/postal/active/'+id,'POST').then(function(data) {
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
            $scope.postal_desc = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});