var OraSchool = angular.module('mailsmsController', []);

OraSchool.controller('mailsmsController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.views = {};
    $scope.messages = {};
    $scope.views.send = true;
    $scope.form = {};
    $scope.form.selectedUsers = [];
    $scope.formS = {};
    $scope.sendNewScope = "form";

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Mail SMS';
    });

    $scope.getSents = function(page){
        showHideLoad();
        if(typeof page == undefined){
            var request = 'index.php/mailsms/listAll';
        }else{
            var request = 'index.php/mailsms/listAll/'+page;
        }
        dataFactory.httpRequest(request).then(function(data) {
            $scope.messages = data.items;
            $scope.totalItems = data.totalItems;
            showHideLoad(true);
        });
    }

    dataFactory.httpRequest('index.php/classes/listAll').then(function(data) {
        $scope.classes = data.classes;
        showHideLoad(true);
    });
    $scope.getSents(1);

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/mailsms/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.messages.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.classId}).then(function(data) {
            $scope.sections = data.sections;
        });
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/mailsms','POST',{},$scope.form).then(function(data) {
            $.toast({
                heading: $rootScope.phrase.mailsms,
                text: $rootScope.phrase.mailSentSuccessfully,
                position: 'top-right',
                loaderBg:'#ff6849',
                icon: 'success',
                hideAfter: 3000,
                stack: 6
            });
            $scope.messages = data.items;
            $scope.totalItems = data.totalItems;
            $scope.sendNewScope = "success";
            showHideLoad(true);
        });
    }

    $scope.linkUsers = function(usersType){
        $scope.modalTitle = $rootScope.phrase.specificUsers;
        $scope.showModalLink = !$scope.showModalLink;
        $scope.usersType = usersType;
    }

    $scope.linkStudentButton = function(){
        var searchAbout = $('#searchLink').val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.sureRemove);
            return;
        }
        dataFactory.httpRequest('index.php/register/searchUsers/'+$scope.usersType+'/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.linkStudentFinish = function(userS){
        if(typeof($scope.form.selectedUsers) == "undefined"){
            $scope.form.selectedUsers = [];
        }

        $scope.form.selectedUsers.push({"student":userS.name,"role":userS.role,"id": "" + userS.id + "" });
    }

    $scope.removeUser = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.selectedUsers) {
                if($scope.form.selectedUsers[x].id == index){
                    $scope.form.selectedUsers.splice(x,1);
                    break;
                }
            }
        }
    }

    $scope.loadTemplate = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/mailsms/templates').then(function(data) {
            $scope.templateList = data;
            $scope.modalTitle = $rootScope.phrase.loadFromTemplate;
            $scope.showModalLoad = !$scope.showModalLoad;
            showHideLoad(true);
        });
    }

    $scope.loadTemplateContent = function(){
        if($('#selectedTemplate').val() != ""){
            $scope.form.messageContentMail = $scope.templateList[$('#selectedTemplate').val()].templateMail;
            $scope.form.messageContentSms = $scope.templateList[$('#selectedTemplate').val()].templateSMS;
            $scope.showModalLoad = !$scope.showModalLoad;
        }
    }

    $scope.changeView = function(view){
        if(view == "send"){
            $scope.form = {};
            $scope.form.userType = 'teachers';
            $scope.form.sendForm = 'email';
        }
        $scope.views.send = false;
        $scope.views.list = false;
        $scope.views.settings = false;
        $scope.views[view] = true;
    }
});