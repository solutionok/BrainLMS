var OraSchool = angular.module('globalSearchController', []);

OraSchool.controller('globalSearchController', function(dataFactory,$scope) {
    showHideLoad(true);

    $scope.search_value = '';
    $scope.searched_users = {};

    $scope.getSearchData = function() {
    	showHideLoad();
    	$scope.search_value = $('.search-input-section input[name="search_value"]').val();

    	if($scope.search_value.length > 0) {
    		dataFactory.httpRequest('index.php/global-search/get-users-data', 'POST', {}, {
    			search_value: $scope.search_value
    		}).then(function(data) {
    			if(data.status) {
    				$scope.searched_users = data.items;
    			} else {
    				console.log('Error');
    			}
	        showHideLoad(true);
		    });
    	} else {
    		showHideLoad(true);
    	}
    }

    $scope.getSearchData();
});