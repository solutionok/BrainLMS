var OraSchool = angular.module('frontend_pagesController', []);

OraSchool.controller('frontend_pagesController', function(dataFactory,$rootScope,$scope,$window) {
    $scope.pages = {};
    $scope.templates = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.frontend_baseurl = "";

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Frontend pages';
    });

    dataFactory.httpRequest('index.php/frontend/listAll').then(function(data) {
        $scope.pages = data.pages;
        $scope.templates =  data.templates;
        $scope.frontend_baseurl = data.frontend_baseurl;
        $scope.changeView('list');
        showHideLoad(true);
    });

    $scope.saveAdd = function(content){
        showHideLoad();
        dataFactory.httpRequest('index.php/frontend','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.pages.push(response);
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/frontend/delete/'+item.id,'POST',{},{}).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.pages.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/frontend/'+id).then(function(data) {
            $scope.form = data;
            $scope.form.show_page_permalink = true;
            $scope.chg_permalink_status = 1;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        showHideLoad();
        dataFactory.httpRequest('index.php/frontend/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.pages = apiModifyTable($scope.pages,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.save_draft = function(){
        $scope.form.page_status = "draft";
        if($scope.views.add){
            $scope.saveAdd();
        }else{
            $scope.saveEdit();
        }
        $scope.changeView('list');
    }

    $scope.save_publish = function(){
        $scope.form.page_status = "publish";
        if($scope.views.add){
            $scope.saveAdd();
        }else{
            $scope.saveEdit();
        }
        $scope.changeView('list');
    }

    $scope.save_preview = function(){
        if($scope.views.add){
            $scope.saveAdd();
        }else{
            $scope.saveEdit();
        }
        setTimeout(function (){
            $window.open($scope.frontend_baseurl + $scope.form.page_permalink, '_blank');
        }, 500);

    }

    $scope.generate_permalink = function(){
        if($scope.form.page_title != "" && ($scope.form.page_permalink == "" || typeof $scope.form.page_permalink == "undefined") ){
            dataFactory.httpRequest('index.php/frontend/gen_permalink','POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'edit');
                if(data.status == "success"){
                    $scope.form.page_permalink = response.page_permalink;
                    $scope.form.show_page_permalink = true;
                }
            });
        }
    }

    $scope.show_permalink_form = function(){
        $scope.chg_permalink_status = 2;
        $scope.new_page_permalink = $scope.form.page_permalink;
    }

    $scope.check_permalink = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/frontend/check_permalink/'+$scope.form.id,'POST',{},{'new_permalink':$scope.new_page_permalink}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.form.page_permalink = response.page_permalink;
                $scope.form.show_page_permalink = true;
                $scope.chg_permalink_status = 1;
            }
            showHideLoad(true);
        });
    }

    $scope.select_featured_image = function(){
        $rootScope.selected_images = [];
        $rootScope.gallery_return_scope = $scope.selected_featured_image;
        $rootScope.modalClass = "modal-lg";
        $rootScope.modalTitle = "Media Manager";
        $rootScope.allow_multiple = false;
        $rootScope.show_gallery = true;
        $rootScope.show_uploader = true;
        $rootScope.mm_open();
    }

    $scope.selected_featured_image = function(){
        if(typeof $scope.form == "undefined"){
            $scope.form = {};
        }
        $scope.form.page_feat_image = $rootScope.selected_images[0];
        console.log($rootScope.selected_images);
    }

    $scope.select_slider_image = function(){
        $rootScope.selected_images = [];
        $rootScope.gallery_return_scope = $scope.selected_slider_images;
        $rootScope.modalClass = "modal-lg";
        $rootScope.modalTitle = "Media Manager";
        $rootScope.allow_multiple = true;
        $rootScope.show_gallery = true;
        $rootScope.show_uploader = true;
        $rootScope.mm_open();
    }

    $scope.selected_slider_images = function(){
        if(typeof $scope.form == "undefined"){
            $scope.form = {};
        }
        $scope.form.page_slider_images = $rootScope.selected_images;
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list"){
            $scope.form = {};
            $scope.form.page_content = "";
            $scope.chg_permalink_status = 1;
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});