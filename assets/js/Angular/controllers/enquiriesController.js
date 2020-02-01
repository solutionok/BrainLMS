var OraSchool = angular.module('enquiries', []);

OraSchool.controller('enquiries', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.enquiries = {};
    $scope.enq_type = {};
    $scope.enq_source = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Enquiries';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.enquiriesTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/enquiries/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.enquiries = data.enquiries;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/enquiries/listAll/'+pageNumber).then(function(data) {
                $scope.enquiries = data.enquiries;
                if( pageNumber == 1){
                    $scope.enq_type = data.enq_type;
                    $scope.enq_source = data.enq_source;
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
            if($.isEmptyObject($scope.enquiriesTemp)){
                $scope.enquiriesTemp = $scope.enquiries;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.enquiries = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.enquiriesTemp)){
                $scope.enquiries = $scope.enquiriesTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.enquiriesTemp = {};
            }
        }
    }


    $scope.view_details = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/enquiries/view/'+id).then(function(data) {
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
        dataFactory.httpRequest('index.php/enquiries','POST',{},$scope.form,"enq_file,").then(function(data) {
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
            dataFactory.httpRequest('index.php/enquiries/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.enquiries.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/enquiries/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/enquiries/'+$scope.form.id,'POST',{},$scope.form,"enq_file,").then(function(data) {
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
        dataFactory.httpRequest('index.php/enquiries/active/'+id,'POST').then(function(data) {
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
            $scope.enq_desc = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});