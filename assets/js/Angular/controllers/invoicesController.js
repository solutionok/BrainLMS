var OraSchool = angular.module('invoicesController', []);

OraSchool.controller('invoicesController', function(dataFactory,$scope,$sce,$rootScope,$route) {
    $scope.invoices = {};
    $scope.student_types = {};
    $scope.paidInvoices = {};
    $scope.students = {};
    $scope.classes = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.importForm = {};
    $scope.invoice = {};
    $scope.payDetails = {};
    $scope.searchInput = {};
    $scope.userRole = $rootScope.dashboardData.role;
    $scope.server_info = JSON.parse($rootScope.dashboardData.server_info);
    $scope.cur_page = 1;
    $scope.payment_fee_type = 'loading...';
    var methodName = $route.current.methodName;
    // ----------------------------
    $scope.selected_invoice_ids = [];
    $scope.selected_invoices = [];
    $scope.selectAll = false;
    $scope.selected_invoices_amount = 0;
    $scope.selected_invoice_ids_jsonstr = '';

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
    	var invoice_type = window.location.href.split("/").pop();
    	if(invoice_type == 'due') {
    		$scope.payment_fee_type = 'Due';
    	} else if(invoice_type == 'current') {
    		$scope.payment_fee_type = 'Current';
    	} else {
    		$scope.payment_fee_type = 'All';
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
        dataFactory.httpRequest('index.php/invoices/listAll/'+pageNumber).then(function(data) {
            $scope.invoices = data.invoices;
            $scope.students = data.students;
            $scope.classes = data.classes;
            $scope.totalItems = data.totalItems;
            $scope.currency_symbol = data.currency_symbol;
            showHideLoad(true);
        });
    }
    $scope.listPaidInvoices = function(pageNumber){
        showHideLoad();
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

    $scope.selectAllInvoices = function(checked_status) {
    	if(checked_status == false) {
    		$scope.selected_invoice_ids = [];
	    	angular.forEach($scope.invoices, function (invoice) {
	  			$scope.selected_invoice_ids.push(invoice.id)
	      });
    	} else {
    		$scope.selected_invoice_ids = [];
    	}
    }
    $scope.multi_pay = function(e, invoice_id) {
    	if(e.target.checked) {
    		// push to array
    		$scope.selected_invoice_ids.push(invoice_id)
    	} else {
    		// pull from array
    		var index = $scope.selected_invoice_ids.indexOf(invoice_id);
				if (index > -1) {
				  $scope.selected_invoice_ids.splice(index, 1);
				}
    	}
    }
    $scope.multiInvoicesPay = function() {
    	if($scope.selected_invoice_ids.length > 0) {
    		$scope.selected_invoices = [];
    		$scope.selected_invoices_amount = 0;
    		angular.forEach($scope.selected_invoice_ids, function (invoice_id) {
    			invoice = $scope.invoices.find(item => item.id == invoice_id);
    			if(invoice.paymentStatus != '1') {
    				invoice = $scope.invoices.find(item => item.id == invoice_id);
    				$scope.selected_invoices_amount += invoice.paymentGross;
          	$scope.selected_invoices.push(invoice);
    			}
        });
        $scope.selected_invoices_amount = Math.round($scope.selected_invoices_amount * 100) / 100;
        if($scope.selected_invoices.length == 0) {
        	alert('Please select un-paid or partially-paid fee');
        } else {
	        // display modal
	        $scope.modalTitle = "Pay multiple fee";
	        $scope.modalClass = "modal-lg";
	        $scope.payMultipleInvoicesModal = true;
        }
    	}
    }
    $scope.payAllSelectedInvoices = function(e) {
    	e.preventDefault();

    	$('#invoicePayAllNowForm [name="invoice_ids_jsonstr"]').val(JSON.stringify($scope.selected_invoice_ids));
    	$('#invoicePayAllNowForm').submit();
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
        } else if (methodName == "currentinvoices") {
        		$scope.listCurrentInvoices(id);
        } else if ( !jQuery.isEmptyObject($scope.searchInput) ) {
            $scope.searchDB(id);
        }else{
        		if(window.location.href.split("/").pop() == 'paid') {
            	$scope.listPaidInvoices(id);
        		} else {
        			$scope.listInvoices(id);
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
        console.log($scope.form.paymentStudent);
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
                $scope.form = {};
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
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        if(view == "add"){
        	showHideLoad();
          dataFactory.httpRequest('index.php/student_types/listAll?sort=ASC').then(function(data) {
            $scope.student_types = data.student_types;
            // $scope.form.feeSchDetailsStudentType = $scope.student_types[0].id; // default selection for 1st element
            $scope.form.feeSchDetailsStudentType = 0; // default selection for 1st element
            showHideLoad(true);
	        });
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.invoice = false;
        $scope.views.details = false;
        $scope.views.init_import = false;
        $scope.views.review_import = false;
        $scope.views[view] = true;
    }

    $scope.invoicePayNow = function(e) {
    	e.preventDefault();
    	if(typeof $scope.invoice.parentInfo[0] == "undefined") {
    		if(confirm('Warning: There is no deteced phone number of student parent\'s. Please confirm the phone number first, confirm now?')) {
    			var base_url = window.location.origin;
    			window.location.href = base_url + "/" + 'index.php/portal#/students?_edit=1&student_id='+$scope.invoice.user.id;
    		}
    	} else {
    		$('#invoicePayNowForm').submit();
    	}
    }

    // Import Fees -------------------------------------
    $scope.initImportFees = function(){
    	$scope.changeView('init_import');

    	$scope.importForm = {};

    	showHideLoad();
      dataFactory.httpRequest('index.php/student_types/listAll?sort=ASC').then(function(data) {
        $scope.student_types = data.student_types;
        $scope.importForm.student_type = $scope.student_types[0].id;
        $scope.importForm.reviewImportStatus = true;
        showHideLoad(true);
      });
    }

    $scope.getSelectedSectionByClassId = function(){
  		var class_id = $scope.importForm.class;
  		showHideLoad();
      dataFactory.httpRequest(`index.php/sections/fetch-with-class/${class_id}`).then(function(data) {
        $scope.sections = data.sections;
        $scope.importForm.section = $scope.sections[0].id;
        showHideLoad(true);
    	});
    }

    $scope.uploadImportedFees = function(content) {
    	if(content.preview_items == true) {
    		$scope.importedItemsPreview = content.previewItems;
    		$scope.changeView('review_import');
    	} else {
	    	content = uploadSuccessOrError(content);
	      if(content){
	          if(content.status == 'success') {
	            $.toast({
	                heading: content.title,
	                text: content.message,
	                position: 'top-right',
	                loaderBg:'#ff6849',
	                icon: 'success',
	                hideAfter: 3000,
	                stack: 6
	            });
	            $scope.changeView('list');
	          } else if(content.status == 'failed') {
	          	$.toast({
	                heading: content.title,
	                text: content.message,
	                position: 'top-right',
	                loaderBg:'#ff6849',
	                icon: 'error',
	                hideAfter: 10000,
	                stack: 6
	            });
	          }
	          showHideLoad();
	      }
	      showHideLoad(true);
    	}
    }

    $scope.publishImportedFees = function() {
    	$scope.importForm.reviewImportStatus = false;
    	$scope.changeView('init_import');
    	setTimeout(function(){
    		$('#publishImportFees').trigger('click');
    	}, 200)
    }
    // end import fees ---------------------------------
});