var OraSchool = angular.module('invoicesController', []);

OraSchool.controller('invoicesController', function(dataFactory,$scope,$sce,$rootScope,$route) {
    $scope.invoices = {};
    $scope.paidInvoices = {};
    $scope.students = {};
    $scope.classes = {};
    $scope.views = {};
    $scope.views.init = true;
    $scope.form = {};
    $scope.invoice = {};
    $scope.payDetails = {};
    $scope.searchInput = {};
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.cur_page = 1;
    $scope.payment_fee_type = 'loading...';
    var methodName = $route.current.methodName;
    $scope.random_value = Math.random();

    function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, '\\$&');
		    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
		    return decodeURIComponent(results[2].replace(/\+/g, ' '));
		}

    // payment fee type
    $scope.$on('$viewContentLoaded', function() {
    	var checked = window.location.href.split("/").pop();
    	if(checked == 'due') {
    		$scope.payment_fee_type = 'Due';
    	} else {
    		$scope.payment_fee_type = 'Current';
    	}
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Invoices';
    	if(getParameterByName('inv')) {
  			$scope.seeInvoice(getParameterByName('inv'));
    	} else {
    		$scope.getResultsPage(1);
    	}
    });

    $scope.listInvoices = function(pageNumber){
        showHideLoad();
        $scope.searchInput.dueInv = false;
        dataFactory.httpRequest('index.php/invoices/listAll/'+pageNumber).then(function(data) {
            $scope.invoices = data.invoices;
            $scope.students = data.students;
            $scope.classes = data.classes;
            $scope.totalItems = data.totalItems;
            $scope.currency_symbol = data.currency_symbol;
            showHideLoad(true);
        });
    }
    $scope.listPendingInvoices = function(pageNumber){
    		$scope.searchInput.dueInv = true;
        $scope.searchDB(1);
    }
    $scope.listPaidInvoices = function(pageNumber){
        showHideLoad();
        $scope.searchInput.dueInv = false;
        dataFactory.httpRequest('index.php/invoices/list-paid/'+pageNumber).then(function(data) {
            $scope.paidInvoices = data.invoices;
            $scope.students = data.students;
            $scope.classes = data.classes;
            $scope.totalItems = data.totalItems;
            $scope.currency_symbol = data.currency_symbol;
            showHideLoad(true);
        });
    }
    $scope.listCurrentInvoices = function(pageNumber) {
    		showHideLoad();
        dataFactory.httpRequest('index.php/invoices/current-listAll/'+pageNumber).then(function(data) {
            $scope.invoices = data.invoices;
            $scope.students = data.students;
            $scope.classes = data.classes;
            $scope.totalItems = data.totalItems;
            $scope.currency_symbol = data.currency_symbol;
            showHideLoad(true);
        });
    }

		$scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.feeSchDetailsClass}).then(function(data) {
            $scope.sections = data.sections;
        });
    }

    $scope.isSectionSelected = function(arrayData,valueData){
        return arrayData.indexOf(valueData) > -1;
    }

    $scope.searchDB = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/listAll/'+pageNumber,'POST',{},{'searchInput':$scope.searchInput}).then(function(data) {
            $scope.invoices = data.invoices;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    if(methodName == "dueinvoices"){
        $scope.searchInput.dueInv = true;
    }

    $scope.getResultsPage = function(id){
        if(typeof id == "undefined"){
            id = $scope.cur_page;
        }
        $scope.cur_page = id;
        if(methodName == "dueinvoices"){
            $scope.searchDB(id);
        }else if ( !jQuery.isEmptyObject($scope.searchInput) ) {
            $scope.searchDB(id);
        }else{
      		if($scope.views.list_current_fee) {
	        	$scope.listCurrentInvoices(id);
	        }
	        if($scope.views.list_pending_fee) {
	        	$scope.listPendingInvoices(id);
	        }
	        if($scope.views.list_paid) {
	        	$scope.listPaidInvoices(id);
	        }
        }
    }

    $scope.showModal = false;
    $scope.studentProfile = function(id){
        dataFactory.httpRequest('index.php/students/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    $scope.toggleSearch = function(){
        $('.advSearch').toggleClass('col-0 col-3 hidden',1000);
        $('.listContent').toggleClass('col-12 col-9',1000);
    }

    $scope.resetSearch = function(){
        $scope.searchInput = {};
        $scope.getResultsPage(1);
    }

    $scope.linkStudent = function(){
        $scope.modalTitle = $rootScope.phrase.selectStudents;
        $scope.showModalLink = !$scope.showModalLink;
    }

    $scope.linkStudentButton = function(){
        var searchAbout = $('#searchLink').val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest('index.php/invoices/searchUsers/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.linkStudentFinish = function(student){
        if(!$scope.form.paymentStudent){
            $scope.form.paymentStudent = [];
        }
        $scope.form.paymentStudent.push({'id':student.id,'name':student.name});
        $scope.showModalLink = !$scope.showModalLink;
    }

    $scope.removeStudent = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            $scope.form.paymentStudent.splice(index,1);
        }
    }

    $scope.totalItems = 0;
    $scope.pageChanged = function(newPage) {
        $scope.getResultsPage(newPage);
    };

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/invoices/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.invoices.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.getResultsPage(1);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.getResultsPage();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.seeInvoice = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/invoice/'+id).then(function(data) {
            $scope.invoice = data;
            $scope.changeView('invoice');
            showHideLoad(true);
        });
    }

    $scope.alertPaidData = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/details/'+id).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.payDetails = response.data;
                $scope.changeView('details');
            }
            showHideLoad(true);
        });
    }

    $scope.addPaymentRow = function(){
        if(typeof($scope.form.paymentRows) == "undefined"){
            $scope.form.paymentRows = [];
        }
        $scope.form.paymentRows.push({'title':'','amount':''});
    }

    $scope.recalcTotalAmount = function(){
        $scope.form.paymentAmount = 0;
        angular.forEach($scope.form.paymentRows, function(value, key) {
            $scope.form.paymentAmount = parseInt($scope.form.paymentAmount) + parseInt(value.amount);
        });
    }

    $scope.removeRow = function(row,index){
        $scope.form.paymentRows.splice(index,1);
        $scope.recalcTotalAmount();
    }

    $scope.collect = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/invoice/'+id).then(function(data) {
            $scope.invoice = data;
            $scope.modalTitle = "Collect Fees";
            $scope.modalClass = "modal-lg";
            $scope.collectInvoice = !$scope.collectInvoice;
            showHideLoad(true);
        });
    }

    $scope.collectInvoiceNow = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/collect/'+id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.collectInvoice = !$scope.collectInvoice;
                if($scope.views.invoice){
                    $scope.seeInvoice(id);
                }else {
                    $scope.getResultsPage();
                }
            }
            showHideLoad(true);
        });
    }

    $scope.revert = function(collection){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/invoices/revert/'+collection,'POST',{},{}).then(function(data) {
                response = apiResponse(data,'edit');
                if(data.status == "success"){
                    $scope.seeInvoice($scope.invoice.payment.id);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.payOnline = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/invoices/invoice/'+id).then(function(data) {
            $scope.invoice = data;
            $scope.modalTitle = "Pay Fees Online";
            $scope.payOnlineModal = !$scope.payOnlineModal;
            showHideLoad(true);
        });
    }

    $scope.payOnlineNow = function(id){
        $scope.form.invoice = id;
    }

    $scope.changeView = function(view){
    		$scope.cur_page = 1;
        if(view == "add" || view == "show" || view == "list_paid" || view == "list_current_fee" || view == "list_pending_fee"){
            $scope.form = {};
        }
        if(view == 'list_current_fee') {
        	$scope.listCurrentInvoices(1);
        }
        if(view == 'list_pending_fee') {
        	$scope.listPendingInvoices(1);
        }
        if(view == 'list_paid') {
        	$scope.listPaidInvoices(1);
        }
        $scope.views.init = false;
        $scope.views.list_current_fee = false;
        $scope.views.list_pending_fee = false;
        $scope.views.list_paid = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.invoice = false;
        $scope.views.details = false;
        $scope.views[view] = true;
    }

    $scope.invoicePayNowSub = function(e, invoice_id, outter_request = true) {
    	e.preventDefault();

    	if(Object.keys($scope.invoice).length <= 0 || outter_request) {
    		showHideLoad();
        dataFactory.httpRequest('index.php/invoices/invoice/'+invoice_id).then(function(data) {
            $scope.invoice = data;
            showHideLoad(true);
            $scope.invoicePayNowSub(e, invoice_id, false)
        });
    	} else {
	    	if(typeof $scope.invoice.parentInfo[0] == "undefined") {
	    		$.toast({
              heading: 'Error',
              text: 'Warning: There is no deteced phone number of student parent\'s. Please confirm the phone number first.',
              position: 'top-right',
              loaderBg:'#ff6849',
              icon: 'error',
              hideAfter: 3000,
              stack: 6
          });
	    	} else {
	    		e.target.submit();
	    	}
    	}
    }

    $scope.invoicePayNowMain = function(e) {
    	e.preventDefault();
    	if(typeof $scope.invoice.parentInfo[0] == "undefined") {
    		$.toast({
            heading: 'Error',
            text: 'Warning: There is no deteced phone number of student parent\'s. Please confirm the phone number first.',
            position: 'top-right',
            loaderBg:'#ff6849',
            icon: 'error',
            hideAfter: 3000,
            stack: 6
        });
    	} else {
    		$('#invoicePayNowFormMain').submit();
    	}
    }
});

// OraSchool.controller('invoicePayNowFormController', function(dataFactory,$rootScope,$route,$scope,$location,$routeParams) {
// 	  $scope.filter_view = {};
// });