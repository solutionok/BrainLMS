var OraSchool = angular.module('mainController', []);

OraSchool.controller('mainController', function(dataFactory,$rootScope,$route,$scope) {
    $scope.chgAcYearModal = function(){
        $scope.modalTitle = $scope.phrase.chgYear;
        $scope.chgAcYearModalShow = !$scope.chgAcYearModalShow;
    }

    $scope.chgAcYear = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/dashboard/changeAcYear','POST',{},{year:$scope.dashboardData.selectedAcYear}).then(function(data) {
            $scope.chgAcYearModalShow = !$scope.chgAcYearModalShow;
            showHideLoad(true);
            location.reload();
        });
    }

    $scope.savePollVote = function(){
        showHideLoad();
        if($scope.dashboardData.polls.selected === undefined){
            alert($scope.phrase.voteMustSelect);
            showHideLoad(true);
            return;
        }
        dataFactory.httpRequest('index.php/dashboard/polls','POST',{},$scope.dashboardData.polls).then(function(data) {
            data = successOrError(data);
            if(data){
                $scope.dashboardData.polls = data;
            }
            showHideLoad(true);
        });
    }

    $scope.adminHasPerm = function(perm){
        return $rootScope.dashboardData.perms.some(function(s) {
            return s.indexOf(perm) > -1;
        });
    }

    $scope.changeTheme = function(theme){
        $('#theme').attr({href: 'assets/css/colors/'+theme+'.css'})
        $rootScope.dashboardData.baseUser.defTheme = theme;

        var updatePost = {'spec':'defTheme','value':theme};
        dataFactory.httpRequest('index.php/accountSettings/profile','POST',{},updatePost).then(function(data) {
            response = apiResponse(data,'edit');
        });

        $('#themecolors').on('click', 'a', function(){
            $('#themecolors li a').removeClass('working');
            $(this).addClass('working')
        });
    }

    $scope.changeLang = function(theme){
        var updatePost = {'spec':'defLang','value':theme};
        dataFactory.httpRequest('index.php/accountSettings/profile','POST',{},updatePost).then(function(data) {
            response = apiResponse(data,'edit');
        });

        setTimeout(function (){
            location.reload();
        }, 500);
    }

    showHideLoad(true);
});