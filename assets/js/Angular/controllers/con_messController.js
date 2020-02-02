var OraSchool = angular.module('con_mess', []);

OraSchool.controller('con_mess', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.contact_messages = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Con mass';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.contact_messagesTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/con_mess/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.contact_messages = data.contact_messages;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/con_mess/listAll/'+pageNumber).then(function(data) {
                $scope.contact_messages = data.contact_messages;

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
            if($.isEmptyObject($scope.contact_messagesTemp)){
                $scope.contact_messagesTemp = $scope.contact_messages;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.contact_messages = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.contact_messagesTemp)){
                $scope.contact_messages = $scope.contact_messagesTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.contact_messagesTemp = {};
            }
        }
    }


    $scope.view_details = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/con_mess/view/'+id).then(function(data) {
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
        dataFactory.httpRequest('index.php/con_mess','POST',{},$scope.form).then(function(data) {
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
            dataFactory.httpRequest('index.php/con_mess/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.contact_messages.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/con_mess/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/con_mess/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
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
        dataFactory.httpRequest('index.php/con_mess/active/'+id,'POST').then(function(data) {
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