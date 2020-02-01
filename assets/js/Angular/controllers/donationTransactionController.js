var OraSchool = angular.module('donationTransactionController', []);

OraSchool.controller('donationTransactionController', function(dataFactory,$rootScope,$scope) {
		$scope.views = {};
    $scope.views.list = true;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Donation transaction history';
    });

    $scope.view_donation_transactions = function() {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/payments/donation_transactions','POST').then(function(data) {
    		$scope.donation_transactions = data.donation_transactions;
    		$scope.changeView('list');
        showHideLoad(true);
      });
    }
    $scope.view_donation_transactions();

    $scope.refreshTransaction = function(item_id) {
    	showHideLoad();
    	dataFactory.httpRequest('index.php/payments/get-status/' + item_id, 'POST').then(function(data) {
    		angular.forEach($scope.donation_transactions, function(item, key) {
				  if(item.id == item_id) {
				  	$scope.donation_transactions[key].status = data.status
				  }
				}, $scope.donation_transactions);
        showHideLoad(true);
      });
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views[view] = true;
    }
});