var OraSchool = angular.module('certificatesController', []);

OraSchool.controller('certificatesController', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.certificates = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Certificates';
    });

    $scope.load_data = function(){
        dataFactory.httpRequest('index.php/certificates/listAll').then(function(data) {
            $scope.certificates = data.certificates;
            showHideLoad(true);
        });
    }

    $scope.load_data();

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/certificates','POST',{},$scope.form,"certificate_image,").then(function(data) {
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
            dataFactory.httpRequest('index.php/certificates/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.certificates.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/certificates/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/certificates/'+$scope.form.id,'POST',{},$scope.form,"certificate_image,").then(function(data) {
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
        dataFactory.httpRequest('index.php/certificates/active/'+id,'POST').then(function(data) {
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
            $scope.header_left = "";$scope.header_right = "";$scope.header_middle = "";$scope.main_title = "";$scope.main_content = "";$scope.footer_left = "";$scope.footer_right = "";$scope.footer_middle = "";
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});