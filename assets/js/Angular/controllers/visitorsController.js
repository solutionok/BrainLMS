var OraSchool = angular.module('visitors', []);

OraSchool.controller('visitors', function(dataFactory,$sce,$rootScope,$scope,$routeParams) {
    $scope.visitors = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.pageNumber = 1;
    $scope.form = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Visitors';
    });

    $scope.load_data = function(pageNumber) {

        if(typeof pageNumber == "undefined"){
            pageNumber = $scope.pageNumber;
        }
        $scope.pageNumber = pageNumber;

        if(! $.isEmptyObject($scope.visitorsTemp)){

            showHideLoad();
            dataFactory.httpRequest('index.php/visitors/search/'+$scope.searchText+'/'+pageNumber).then(function(data) {
                $scope.visitors = data.visitors;
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }else{

            showHideLoad();
            dataFactory.httpRequest('index.php/visitors/listAll/'+pageNumber).then(function(data) {
                $scope.visitors = data.visitors;
                if( pageNumber == 1){
                    $scope.wel_office = data.wel_office;
                }
                $scope.totalItems = data.totalItems;
                showHideLoad(true);
            });

        }
    }

    $scope.pageChanged = function(newPage) {
        $scope.load_data(newPage);
    };

    $scope.searchDB = function(){
        if($scope.searchText.length >= 3){
            if($.isEmptyObject($scope.visitorsTemp)){
                $scope.visitorsTemp = $scope.visitors;
                $scope.totalItemsTemp = $scope.totalItems;
                $scope.visitors = {};
            }
            $scope.load_data(1);
        }else{
            if(! $.isEmptyObject($scope.visitorsTemp)){
                $scope.visitors = $scope.visitorsTemp;
                $scope.totalItems = $scope.totalItemsTemp;
                $scope.visitorsTemp = {};
            }
        }
    }


    $scope.view_details = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/visitors/view/'+id).then(function(data) {
            $scope.form = data;
            $scope.changeView('view');
            showHideLoad(true);
        });
    }

    if($routeParams.viewId){
        $scope.view_details($routeParams.viewId);
    }else{
        $scope.load_data();
    }

    $scope.saveAdd = function(data){
        showHideLoad();
        dataFactory.httpRequest('index.php/visitors','POST',{},$scope.form,"docs,").then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/visitors/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.visitors.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/visitors/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(data){
        dataFactory.httpRequest('index.php/visitors/'+$scope.form.id,'POST',{},$scope.form,"docs,").then(function(data) {
            showHideLoad();

            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.status =function(id,$index){
        showHideLoad();
        dataFactory.httpRequest('index.php/visitors/active/'+id,'POST').then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
            }
            showHideLoad(true);
        });
    }

    $scope.openSearchModal_student = function(){
        $scope.modalTitle = $rootScope.phrase.searchUsers;
        $scope.showUsrSearchModal_student = !$scope.showUsrSearchModal_student;
    }

    $scope.searchUserButton_student = function(){
        var searchAbout = $("#searchLink_student").val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest("index.php/visitors/searchUser/"+searchAbout).then(function(data) {
            $scope.searchResults_student = data;
        });
    }

    $scope.serachUserFinish_student = function(user){
        if(typeof $scope.form.student == "undefined"){
            $scope.form.student = [];
        }
        $scope.form.student.push({"user":user.name,"id": "" + user.id + "" });
        $scope.form.student_ser = JSON.stringify($scope.form.student);
        $scope.showUsrSearchModal_student = !$scope.showUsrSearchModal_student;
    }

    $scope.removeUserSearch_student = function(user_id){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.student) {
                if($scope.form.student[x].id == user_id){
                    $scope.form.student.splice(x,1);
                    $scope.form.student_ser = JSON.stringify($scope.form.student);
                    break;
                }
            }
        }
    }

    $scope.openSearchModal_to_meet = function(){
        $scope.modalTitle = $rootScope.phrase.searchUsers;
        $scope.showUsrSearchModal_to_meet = !$scope.showUsrSearchModal_to_meet;
    }

    $scope.searchUserButton_to_meet = function(){
        var searchAbout = $("#searchLink_to_meet").val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest("index.php/visitors/searchUser/"+searchAbout).then(function(data) {
            $scope.searchResults_to_meet = data;
        });
    }

    $scope.serachUserFinish_to_meet = function(user){
        if(typeof $scope.form.to_meet == "undefined"){
            $scope.form.to_meet = [];
        }
        $scope.form.to_meet.push({"user":user.name,"id": "" + user.id + "" });
        $scope.form.to_meet_ser = JSON.stringify($scope.form.to_meet);
        $scope.showUsrSearchModal_to_meet = !$scope.showUsrSearchModal_to_meet;
    }

    $scope.removeUserSearch_to_meet = function(user_id){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.to_meet) {
                if($scope.form.to_meet[x].id == user_id){
                    $scope.form.to_meet.splice(x,1);
                    $scope.form.to_meet_ser = JSON.stringify($scope.form.to_meet);
                    break;
                }
            }
        }
    }

    $scope.check_out = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/visitors/'+id).then(function(data) {
            $scope.modalTitle = $rootScope.phrase.chkout;
            $scope.chkout_modal = !$scope.chkout_modal;
            $scope.modalClass = "modal-lg";
            $scope.form = data;
            $scope.form.check_out = {};
            showHideLoad(true);
        });
    }

    $scope.check_out_apply = function(){
        dataFactory.httpRequest('index.php/visitors/checkout/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            showHideLoad();

            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.load_data();
                $scope.chkout_modal = !$scope.chkout_modal;
                $scope.changeView('list');
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
        $scope.views.view = false;
        $scope.views[view] = true;
    }
});