var OraSchool = angular.module('languagesController', []);

OraSchool.controller('languagesController', function(dataFactory,$rootScope,$scope) {
    $scope.languages = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Languages';
    });

    $scope.translate = function(){
        $(".phraseList label").each(function(i, current){
            var str = $(current).text();
            if($(current).children('input').val() == ""){
                var str2 = $(current).children('input').val(str);
                $(current).children('input').trigger('input');
            }

        });
        return;
    }

    $scope.highlight = function(){
        $(".phraseList label").each(function(i, current){
            if($(current).children('input').val() == ""){
                $(current).children('input').css('border','10px solid');
            }

        });
        return;
    }

    dataFactory.httpRequest('index.php/languages/listAll').then(function(data) {
        $scope.languages = data;
        showHideLoad(true);
    });

    $scope.addLang = function(){
        $scope.form = {};
        $scope.form.languagePhrases = {};
        $scope.changeView('edit');
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/languages/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        if(typeof $scope.form.id == "undefined"){
            showHideLoad();
            dataFactory.httpRequest('index.php/languages','POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'add');
                if(data.status == "success"){
                    $scope.languages.push(response);
                    $scope.changeView('list');
                }
                showHideLoad(true);
            });
        }else{
            showHideLoad();
            dataFactory.httpRequest('index.php/languages/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'edit');
                if(data.status == "success"){
                    $scope.languages = apiModifyTable($scope.languages,response.id,response);
                    $scope.changeView('list');
                }
                showHideLoad(true);
            });
        }
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/languages/delete/'+item.id,'POST',{},$scope.form).then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.languages.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){

    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views[view] = true;
    }
});