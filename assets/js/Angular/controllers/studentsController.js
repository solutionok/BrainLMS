var OraSchool = angular.module('studentsController', []);

OraSchool.controller('studentsController', function(dataFactory,$rootScope,$scope,$sce,$route,$location) {
    $scope.students = {};
    $scope.studentsTemp = {};
    $scope.totalItemsTemp = {};
    $scope.classes = {};
    $scope.sections = {};
    $scope.transports = {};
    $scope.hostel = {};
    $scope.studentsApproval = {};
    $scope.studentMarksheet = {};
    $scope.studentAttendance = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.form.comVia = ["mail","sms","phone"];
    $scope.userRole ;
    $scope.importType ;
    $scope.importReview;
    $scope.importSections;
    $scope.medViewMode = true;
    $scope.searchInput = {};
    var methodName = $route.current.methodName;
    $scope.current_page = 1;
    $scope.roles = {};
    $scope.add_doc = [];
    $scope.student_categories = [];
    $scope.student_types = [];

    function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, '\\$&');
		    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
		    return decodeURIComponent(results[2].replace(/\+/g, ' '));
		}

		$scope.$on('$viewContentLoaded', function() {
	    if(getParameterByName('_edit') == 1) {
				setTimeout(function(){
					$scope.edit(getParameterByName('student_id'));
				}, 2000);
				setTimeout(function(){
					$('html, body').animate({ scrollTop: $('#guard-acc-section').offset().top - 90 });
				}, 3000);
				setTimeout(function(){
					$('#guard-acc-section > .card').css('box-shadow', '0 0 10px blue');
				}, 3500);
			}
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Students';
		});

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.comVia = ["mail","sms","phone"];
        }

        $scope.views.list = false;
        $scope.views.approval = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.attendance = false;
        $scope.views.marksheet = false;
        $scope.views.import = false;
        $scope.views.reviewImport = false;
        $scope.views.medical = false;
        $scope.views.grad = false;
        $scope.views.admission = false;
        $scope.views.bus_track = false;
        $scope.views[view] = true;
    }

    $scope.listUsers = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/listAll/'+pageNumber).then(function(data) {
            $scope.students = data.students ;
            $scope.classes = data.classes ;
            $scope.sections = data.sections ;
            $scope.transports = data.transports ;
            $scope.hostel = data.hostel ;
            $scope.totalItems = data.totalItems
            $scope.userRole = data.userRole;
            $scope.roles = data.roles;
            $scope.student_categories = data.student_categories;
            $scope.student_types = data.student_types;
            showHideLoad(true);
        });
    }

    $scope.searchDB = function(pageNumber){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/listAll/'+pageNumber,'POST',{},{'searchInput':$scope.searchInput}).then(function(data) {
            $scope.students = data.students ;
            $scope.classes = data.classes ;
            $scope.sections = data.sections ;
            $scope.transports = data.transports ;
            $scope.hostel = data.hostel ;
            $scope.totalItems = data.totalItems
            $scope.userRole = data.userRole;
            $scope.student_categories = data.student_categories;
            $scope.student_types = data.student_types;
            showHideLoad(true);
        });
    }

    $scope.getResultsPage = function(newpage = ""){
        if(newpage != ""){
            $scope.current_page = newpage;
        }
        if ( !jQuery.isEmptyObject($scope.searchInput) ) {
            $scope.searchDB( $scope.current_page );
        }else{
            $scope.listUsers( $scope.current_page );
        }
        $scope.changeView('list');
    }

    $scope.sortItems = function(sortBy){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/listAll/1','POST',{},{'sortBy':sortBy}).then(function(data) {
            $scope.students = data.students ;
            $scope.classes = data.classes ;
            $scope.sections = data.sections ;
            $scope.transports = data.transports ;
            $scope.hostel = data.hostel ;
            $scope.totalItems = data.totalItems
            $scope.userRole = data.userRole;
            $scope.student_categories = data.student_categories;
            $scope.student_types = data.student_types;
            $rootScope.dashboardData.sort.students = sortBy;
            showHideLoad(true);
        });
    }

    if(methodName == "marksheet"){
        showHideLoad();
        $scope.isStudent = true;
        dataFactory.httpRequest('index.php/students/marksheet/0').then(function(content) {
            data = apiResponse(content);

            if(content.status == "failed"){
                $scope.noMarksheet = true;
            }else{
                $scope.studentMarksheet = data;
            }

            $scope.changeView('marksheet');
            showHideLoad(true);
        });
    }else if(methodName == "admission"){
        $scope.add_doc = [];
        showHideLoad();
        dataFactory.httpRequest('index.php/students/preAdmission').then(function(data) {
            $scope.classes = data.classes ;
            $scope.sections = data.sections ;
            $scope.transports = data.transports ;
            $scope.hostel = data.hostel ;
            $scope.roles = data.roles;
            $scope.student_categories = data.student_categories;
            $scope.student_types = data.student_types;
            $scope.form.std_type = data.student_types[0].id;
            $scope.form.parentInfo = [];
            $scope.changeView('admission');
            showHideLoad(true);
        });
    }else{
        $scope.getResultsPage();
    }

    $scope.toggleSearch = function(){
        $('.advSearch').toggleClass('col-0 col-3 hidden',1000);
        $('.listContent').toggleClass('col-12 col-9',1000);
    }

    $scope.resetSearch = function(){
        $scope.searchInput = {};
        $scope.getResultsPage(1);
    }

    $scope.import = function(impType){
        $scope.importType = impType;
        $scope.changeView('import');
    };

    $scope.saveImported = function(content){
        content = uploadSuccessOrError(content);
        if(content){
            $scope.importReview = content.dataImport;
            $scope.importSections = content.sections;
            showHideLoad();
            $scope.changeView('reviewImport');
        }
        showHideLoad(true);
    }

    $scope.reviewImportData = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/reviewImport','POST',{},{'importReview':$scope.importReview}).then(function(data) {
            content = apiResponse(data);
            if(data.status == "failed"){
                $scope.importReview = content;
                $scope.changeView('reviewImport');
            }else{
                $scope.getResultsPage('1');
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.removeImport = function(item,index,importType){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            if(importType == "revise"){
                $scope.importReview.revise.splice(index,1);
            }
            if(importType == "ready"){
                $scope.importReview.ready.splice(index,1);
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

    $scope.totalItems = 0;
    $scope.pageChanged = function(newPage) {
        $scope.getResultsPage(newPage);
    };

    $scope.searchSubjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.searchInput.class}).then(function(data) {
            $scope.sections = data.sections;
        });
    }

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.studentClass}).then(function(data) {
            $scope.sections = data.sections;
        });
    }

    $scope.saveAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){

        		// reset form
            $scope.form = {};
            $('[name="photo"]').val('');

            $location.path( "/students" );
        }
        showHideLoad(true);
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/students/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.students.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.account_status = function(user_id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/account_status/'+user_id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.students[$index].account_active = response.account_active;
            }
            showHideLoad(true);
        });
    }

    $scope.removeStAcYear = function(student,acYear,index){
        var confirmRemoveAcYear = confirm($rootScope.phrase.sureRemove);
        if (confirmRemoveAcYear == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/students/acYear/delete/'+student+'/'+acYear,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.form.studentAcademicYears.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        $scope.add_doc = [];
        showHideLoad();
        dataFactory.httpRequest('index.php/students/'+id).then(function(data) {
            $scope.form = data;
            // console.log(data);
            $scope.changeView('edit');
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
        		// reset form
            $scope.form = {};
            $('[name="photo"]').val('');

            $scope.getResultsPage();
        }
        showHideLoad(true);
    }

    $scope.waitingApproval = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/waitingApproval').then(function(data) {
            $scope.studentsApproval = data;
            $scope.changeView('approval');
            showHideLoad(true);
        });
    }

    $scope.gradStdList = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/gradStdList').then(function(data) {
            $scope.gradStdList = data;
            $scope.changeView('grad');
            showHideLoad(true);
        });
    }

    $scope.approve = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/approveOne/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                for (x in $scope.studentsApproval) {
                    if($scope.studentsApproval[x].id == id){
                        $scope.studentsApproval.splice(x,1);
                    }
                }
            }
            $scope.changeView('approval');
            showHideLoad(true);
        });
    }

    $scope.marksheet = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/marksheet/'+id).then(function(data) {
            data = apiResponse(data);
            if(data){
                $scope.studentMarksheet = data;
                $scope.changeView('marksheet');
            }
            showHideLoad(true);
        });
    }

    $scope.leaderBoard = function(id,index){
        var isLeaderBoard = prompt($rootScope.phrase.leaderBoardMessage);
        if (isLeaderBoard != null) {
            showHideLoad();
            dataFactory.httpRequest('index.php/students/leaderBoard/'+id,'POST',{},{'isLeaderBoard':isLeaderBoard}).then(function(data) {
                apiResponse(data,'edit');
                $scope.students[index].isLeaderBoard = "x";
                showHideLoad(true);
            });
        }
    }

    $scope.removeLeaderBoard = function(id,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/students/leaderBoard/delete/'+id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.students[index].isLeaderBoard = "";
                }
                showHideLoad(true);
            });
        }
    }

    $scope.attendance = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/attendance/'+id).then(function(data) {
            $scope.studentAttendance = data;
            $scope.changeView('attendance');
            showHideLoad(true);
        });
    }

    $scope.medicalRead = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/medical/'+id).then(function(data) {
            $scope.medicalInfo = {};
            $scope.medicalInfo.data = data;
            $scope.medicalInfo.userId = id;
            $scope.changeView('medical');
            showHideLoad(true);
        });
    }

    $scope.medicalToggle = function(){
        $scope.medViewMode = !$scope.medViewMode;
    }

    $scope.saveMedical = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/medical','POST',{},$scope.medicalInfo).then(function(data) {
            response = apiResponse(data,'edit');
            showHideLoad(true);
        });
    }

    /* ----- trackBus ------ */

    $scope.busTrackInfo = {};
    $scope.gps_iframe_link = '';

    $scope.trackBus = function(student_id) {
    	showHideLoad();
      dataFactory.httpRequest('index.php/students/get-bus-track-info/'+student_id).then(function(data) {
          $scope.busTrackInfo = data.data[0];
          if($scope.busTrackInfo.transport_vehicle != null) {
	          // $scope.gps_iframe_link = 'https://gps.cutebrains.com/?stoppages=' + $scope.busTrackInfo.transport.transportTitle
	          $scope.gps_iframe_link = 'https://gps.cutebrains.com/?plate_number=' + $scope.busTrackInfo.transport_vehicle.plate_number + '&stoppages=' + $scope.busTrackInfo.transport.transportTitle
	          $scope.changeView('bus_track');
          }
          showHideLoad(true);
      });
    }

    $scope.trustSrc = function(src) {
		  return $sce.trustAsResourceUrl(src);
		}

    /* ----- trackBus ------ */

    $scope.add_document_row = function(){
        $('.tr_clone').last().clone().insertAfter(".tr_clone:last");
    }

    $scope.add_document_row_edit = function(){
        $scope.add_doc.push({'dd':'dd'});
    }

    $scope.remove_student_docs = function(id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/students/rem_std_docs','POST',{},{'id':id}).then(function(data) {
            response = apiResponse(data,'remove');
            if(data.status == "success"){
                $scope.form.docs.splice($index,1);
            }
            showHideLoad(true);
        });
    }

    $scope.linkParent = function(){
        $scope.modalTitle = $rootScope.phrase.linkStudentParent;
        $scope.showModalLink = !$scope.showModalLink;
    }

    $scope.linkParentButton = function(){
        var searchAbout = $('#searchLink').val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest('index.php/students/search_parent/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.linkParentFinish = function(parent){
        do{
            var relationShip = prompt("Please enter relationship", "");
        }while(relationShip == "");

        if (relationShip != null && relationShip != "") {
            $scope.form.parentInfo.push({"parent":parent.name,"relation":relationShip,"id": "" + parent.id + "" });
            $scope.form.parentInfoSer = JSON.stringify($scope.form.parentInfo);
            $scope.showModalLink = !$scope.showModalLink;
        }
    }

    $scope.removeParent = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.parentInfo) {
                if($scope.form.parentInfo[x].id == index){
                    $scope.form.parentInfo.splice(x,1);
                    $scope.form.parentInfoSer = JSON.stringify($scope.form.parentInfo);
                    break;
                }
            }
        }
    }
});