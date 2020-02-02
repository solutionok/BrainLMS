var OraSchool = angular.module('registeration', []);

OraSchool.controller('registeration', function(dataFactory,$rootScope,$scope) {
    $scope.views = {};
    $scope.classes = {};
    $scope.views.register = true;
    $scope.form = {};
    $scope.form.studentInfo = [];
    $scope.form.role = "teacher" ;


    dataFactory.httpRequest('index.php/register/classes').then(function(data) {
        $scope.classes = data;
        showHideLoad(true);
    });

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/register/sectionsList','POST',{},{"classes":$scope.form.studentClass}).then(function(data) {
            $scope.sections = data;
        });
    }

    $scope.tryRegister = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/register','POST',{},$scope.form).then(function(data) {
            data = successOrError(data);
            if(data){
                $scope.regId = data.id;
                $scope.changeView("thanks");
            }
            showHideLoad(true);
        });
    }

    $scope.linkStudent = function(){
        $scope.modalTitle = "Link Student";
        $scope.showModalLink = !$scope.showModalLink;
    }

    $scope.linkStudentButton = function(){
        var searchAbout = $('#searchLink').val();
        if(searchAbout.length < 3){
            alert("Min Characters is 3");
            return;
        }
        dataFactory.httpRequest('index.php/register/searchStudents/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.linkStudentFinish = function(student){
        if(typeof($scope.form.studentInfo) == "undefined"){
            $scope.form.studentInfo = [];
        }
        do{
            var relationShip = prompt("Please enter relationship", "");
        }while(relationShip == "");
        if (relationShip != null && relationShip != "") {
            $scope.form.studentInfo.push({"student":student.name,"relation":relationShip,"id": "" + student.id + "" });
            $scope.showModalLink = !$scope.showModalLink;
        }
    }

    $scope.removeStudent = function(index){
        var confirmRemove = confirm("Sure remove ?");
        if (confirmRemove == true) {
            for (x in $scope.form.studentInfo) {
                if($scope.form.studentInfo[x].id == index){
                    $scope.form.studentInfo.splice(x,1);
                    $scope.form.studentInfoSer = JSON.stringify($scope.form.studentInfo);
                    break;
                }
            }
        }
    }

    $scope.changeView = function(view){
        if(view == "register" || view == "thanks" || view == "show"){
            $scope.form = {};
        }
        $scope.views.register = false;
        $scope.views.thanks = false;
        $scope.views[view] = true;
    }
});