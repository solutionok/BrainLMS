var OraSchool = angular.module('userProfileController', []);

OraSchool.controller('userProfileController', function(dataFactory,$rootScope,$route,$scope,$location,$routeParams) {
    $scope.profile_data = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | My profile';
    });

    $scope.getProfileData = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/accountSettings/get-user-profile-data').then(function(data) {
            $scope.profile_data = data.profile_data;
            showHideLoad(true);
        });
    }

    $scope.getProfileData();
});