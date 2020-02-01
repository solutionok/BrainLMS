var OraSchool = angular.module('pollsController', []);

OraSchool.controller('pollsController', function(dataFactory,$scope,$rootScope) {
    $scope.polls = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Polls';
    });

    dataFactory.httpRequest('index.php/polls/listAll').then(function(data) {
        $scope.polls = data;
        showHideLoad(true);
    });

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/polls/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.polls.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.addPollOption = function(item){
        var optionTitle = prompt($rootScope.phrase.voteOptionTitle);
        if (optionTitle != null) {
            if (typeof $scope.form.pollOptions === "undefined" || $scope.form.pollOptions == "") {
                $scope.form.pollOptions = [];
            }
            var newOption = {'title':optionTitle};
            $scope.form.pollOptions.push(newOption);
        }
    }

    $scope.removePollOption = function(item,index){
        $scope.form.pollOptions.splice(index,1);
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/polls/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/polls/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.polls = apiModifyTable($scope.polls,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/polls','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.polls.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.makeActive = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/polls/active/'+id,'POST',{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                angular.forEach($scope.polls, function (item) {
                    item.pollStatus = 0;
                    if(item.id == response.id){
                        item.pollStatus = 1;
                    }
                });
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
        $scope.views[view] = true;
    }
});