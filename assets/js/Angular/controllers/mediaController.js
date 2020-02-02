var OraSchool = angular.module('mediaController', []);

OraSchool.controller('mediaController', function($rootScope,dataFactory,$scope,Upload,$timeout) {
    $scope.albums = {};
    $scope.media = {};
    $scope.dirParent = -1;
    $scope.dirNow = 0;
    $scope.current = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.mu_files_list = {};
    $scope.form = {};
    $scope.uploads_provider = '';
    $scope.loading = true;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Media';
    });

    $scope.preparGalleryView = function() {
    	$(document).ready(function(){
        $('#lightgallery').lightGallery({
        	'fullScreen': false,
        	'actualSize': false,
        	'download': false,
        	'share': false
        });
      });
    }

    $scope.changeView = function(view){
        if(view == "addMedia" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.mu_files_list = {};
        }
        $scope.views.list = false;
        $scope.views.addAlbum = false;
        $scope.views.editAlbum = false;
        $scope.views.addMedia = false;
        $scope.views.editMedia = false;
        $scope.views[view] = true;
    }

    $scope.getUploadsConfig = function() {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/uploads-config', 'POST').then(function(data) {
          $scope.uploads_provider = data.uploads_provider;
          showHideLoad(true);
      });
    }
    $scope.getUploadsConfig();

    $scope.loadAlbum = function(id){
        showHideLoad();
        if(typeof id == "undefined" || id == 0){
            var reqUrl = 'index.php/media/listAll';
        }else{
            var reqUrl = 'index.php/media/listAll/'+id;
        }
        dataFactory.httpRequest(reqUrl).then(function(data) {
            $scope.albums = data.albums;
            $scope.media = data.media;
            if(data.current){
                $scope.current = data.current;
                $scope.dirParent = data.current.albumParent;
                $scope.dirNow = id;
            }else{
                $scope.current = {};
                $scope.dirParent = -1;
                $scope.dirNow = 0;
            }
            $scope.changeView('list');
            setTimeout(function(){
            	$scope.preparGalleryView();
            }, 250)
          	$scope.loading = false;
            showHideLoad(true);
        });
    }

    $scope.loadAlbum();

    $scope.saveAlbum = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            $scope.albums.push(response);
            $scope.loadAlbum($scope.dirNow);
        }
        showHideLoad(true);
    }

    $scope.removeAlbum = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.removeAlbum);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/media/album/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.albums.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.editAlbumData = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/media/editAlbum/'+id).then(function(data) {
            $scope.changeView('editAlbum');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEditAlbum = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            $scope.albums = apiModifyTable($scope.albums,response.id,response);
            $scope.loadAlbum($scope.dirNow);
        }
        showHideLoad(true);
    }

    $scope.saveMedia = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            showHideLoad();

            $scope.media.push(response);
            $scope.loadAlbum($scope.dirNow);
        }
        showHideLoad(true);
    }

    $scope.upload_images = function(mu_files_list,errFiles){
        $scope.errFiles = errFiles;
        $scope.mm_files_count = 0;
        angular.forEach(mu_files_list, function(file) {
            if(typeof file.name == "undefined"){
                $scope.mm_files_count ++;
                if(mu_files_list.length == $scope.mm_files_count){
                    $scope.loadAlbum($scope.dirNow);
                    $scope.changeView('list');
                    showHideLoad(true);
                }
            }else{
                if(typeof file.uploaded == "undefined"){
                    showHideLoad();

                    file.upload = Upload.upload({
                        url: 'index.php/media',
                        data: {
                            mediaURL: file,
                            albumId: $scope.dirNow,
                            mediaTitle: $scope.form.mediaTitle,
                            mediaDescription: $scope.form.mediaDescription,
                            mediaType: $scope.form.mediaType
                        }
                    });

                    file.upload.then(function (response) {
                        $timeout(function () {
                            apiResponse(response,'edit');
                            $scope.mm_files_count ++;
                            file.result = response.data;
                            if(mu_files_list.length == $scope.mm_files_count){
                                $scope.loadAlbum($scope.dirNow);
                                $scope.changeView('list');
                                showHideLoad(true);
                            }
                        });
                    }, function (response) {
                        if (response.status > 0)
                            $scope.errorMsg = response.status + ': ' + response.data;
                    }, function (evt) {
                        file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
                    });
                }
            }

        });
    }

    $scope.addMediaServer = function(){
        $scope.form.albumId = $scope.dirNow;
        if($scope.form.mediaType == 0){
            $scope.upload_images($scope.mu_files_list);
        }else{
            showHideLoad();
            dataFactory.httpRequest('index.php/media','POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'edit');
                if(data.status == "success"){
                    $scope.loadAlbum($scope.dirNow);
                    $scope.changeView('list');
                }
                showHideLoad(true);
            });
        }

    }

    $scope.editItem = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/media/'+id).then(function(data) {
            $scope.changeView('editMedia');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEditItem = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            showHideLoad();

            $scope.media = apiModifyTable($scope.media,response.id,response);
            $scope.loadAlbum($scope.dirNow);
        }
        showHideLoad(true);
    }

    $scope.removeItem = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/media/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.media.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }
});