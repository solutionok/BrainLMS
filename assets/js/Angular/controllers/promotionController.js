var OraSchool = angular.module('promotionController', []);

OraSchool.controller('promotionController', function(dataFactory,$rootScope,$scope) {
    $scope.classes = {};
    $scope.students = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.sections ={};
    $scope.classesArray = [];
    $scope.form.studentInfo = [];

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Promotions';
    });

    showHideLoad(true);
    $scope.classesList = function(){
        dataFactory.httpRequest('index.php/dashboard/classesList','POST',{},{"academicYear":$scope.form.acYear}).then(function(data) {
            $scope.classes = data.classes;
            $scope.subjects = data.subjects;
        });
    }

    $scope.classesPromoteList = function(key){
        dataFactory.httpRequest('index.php/dashboard/classesList','POST',{},{"academicYear":$scope.studentsList.students[key].acYear}).then(function(data) {
            $scope.classesArray[key] = data;
            $scope.sections = data.sections;
        });
    }


    $scope.listStudents = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/promotion/listStudents','POST',{},$scope.form).then(function(data) {
            $scope.promoType = $scope.form.promoType;
            $scope.studentsList = data;
            $scope.sections = data.classes.sections;

            angular.forEach(data.students, function(value, key) {
                $scope.classesArray[key] = data.classes;
            });

            $scope.changeView('studentPromote');
            showHideLoad(true);
        });
    }

    $scope.removePromoStudent = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (key in $scope.studentsList.students) {
                if($scope.studentsList.students[key].id == index){
                    delete $scope.studentsList.students[key];
                    break;
                }
            }
        }
    }

    $scope.promoteNow = function(){
        showHideLoad();
        if($scope.promoType == 'graduate'){
            angular.forEach($scope.studentsList.students, function(value, key) {
                $scope.studentsList.students[key]['acYear'] = 0;
            });
        }
        dataFactory.httpRequest('index.php/promotion','POST',{},{'promote':$scope.studentsList.students,'promoType':$scope.promoType}).then(function(data) {
            if(data){
                $scope.studentsPromoted = data;
                $scope.changeView('studentsPromoted');
            }
            showHideLoad(true);
        });
    }

    $scope.linkStudent = function(){
        $scope.modalTitle = $rootScope.phrase.promoteStudents;
        $scope.showModalLink = !$scope.showModalLink;
    }

    $scope.linkStudentButton = function(){
        var searchAbout = $('#searchLink').val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest('index.php/promotion/search/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.linkStudentFinish = function(student){
        $scope.form.studentInfo.push({"student":student.name,"id": "" + student.id + "" });
    }

    $scope.removeStudent = function(index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            for (x in $scope.form.studentInfo) {
                if($scope.form.studentInfo[x].id == index){
                    $scope.form.studentInfo.splice(x,1);
                    break;
                }
            }
        }
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
        }
        $scope.views.list = false;
        $scope.views.studentsPromoted = false;
        $scope.views.studentPromote = false;
        $scope.views[view] = true;
    }
});