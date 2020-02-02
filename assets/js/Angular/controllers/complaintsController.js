var OraSchool = angular.module('complaints', []);

OraSchool.controller('complaints', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.complaints = {};
    $scope.comp_type = {};
    $scope.comp_source = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Complaints';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.complaintsTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/complaints/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.complaints = data.complaints;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/complaints/listAll/'+pageNumber).then(function(data) {
                $scope.complaints = data.complaints;
                if( pageNumber == 1){
                    $scope.comp_type = data.comp_type;
                    $scope.comp_source = data.comp_source;
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
            if($.isEmptyObject($scope.complaintsTemp)){
                $scope.complaintsTemp = $scope.complaints;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.complaints = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.complaintsTemp)){
                $scope.complaints = $scope.complaintsTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.complaintsTemp = {};
            }
        }
    }


    $scope.view_details = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/complaints/view/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('view');
            showHideLoad(true);
        });
    }

    if($routeParams.viewId){
        $scope.view_details($routeParams.viewId);
    }else{
        $scope.load_data();
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/complaints','POST',{},$scope.form,"enq_file,").then(function(data) {
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
            dataFactory.httpRequest('index.php/complaints/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.complaints.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/complaints/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/complaints/'+$scope.form.id,'POST',{},$scope.form,"enq_file,").then(function(data) {
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
        dataFactory.httpRequest('index.php/complaints/active/'+id,'POST').then(function(data) {
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
            $scope.comp_desc = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});