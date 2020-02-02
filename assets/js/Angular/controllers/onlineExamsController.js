var OraSchool = angular.module('onlineExamsController', []);

OraSchool.controller('onlineExamsController', function(dataFactory,$rootScope,$scope,$sce) {
    $scope.classes = {};
    $scope.subject = {};
    $scope.onlineexams = {};
    $scope.views = {};
    $scope.views.list = true;
    $scope.form = {};
    $scope.marksExam ;
    $scope.marks = {};
    $scope.takeData = {};
    $scope.form.examQuestion = [];
    $scope.subject_list;
    $scope.userRole ;

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Online Exams';
    });

    $scope.showModal = false;
    $scope.studentProfile = function(id){
        dataFactory.httpRequest('index.php/students/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    dataFactory.httpRequest('index.php/onlineExams/listAll').then(function(data) {
        $scope.classes = data.classes;
        $scope.subject = data.subjects;
        $scope.onlineexams = data.onlineExams;
        $scope.userRole = data.userRole;
        $scope.subject_list = data.subject_list;
        showHideLoad(true);
    });

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.examClass}).then(function(data) {
            $scope.subject = data.subjects;
            $scope.sections = data.sections;
        });
    }

    $scope.isSectionSelected = function(arrayData,valueData){
        if(arrayData.indexOf(valueData.toString()) > -1 || arrayData.indexOf(parseInt(valueData)) > -1){
            return true;
        }
    }

    $scope.remove = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/onlineExams/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.onlineexams.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.saveAdd = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/onlineExams','POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'add');
            if(data.status == "success"){
                $scope.onlineexams.push(response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.edit = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/onlineExams/'+id).then(function(data) {
            $scope.changeView('edit');
            $scope.form = data;
            $scope.subject = $scope.form.subject;
            $scope.sections = data.sections;
            showHideLoad(true);
        });
    }

    $scope.saveEdit = function(){
        showHideLoad();
        console.log($scope.form);
        dataFactory.httpRequest('index.php/onlineExams/'+$scope.form.id,'POST',{},$scope.form).then(function(data) {
            response = apiResponse(data,'edit');
            if(data.status == "success"){
                $scope.onlineexams = apiModifyTable($scope.onlineexams,response.id,response);
                $scope.changeView('list');
            }
            showHideLoad(true);
        });
    }

    $scope.addQuestion = function(){
        var hasTrueAnswer = false;
        if (typeof $scope.examTitle === "undefined" || $scope.examTitle == "") {
            alert("Question Title undefined");
            return ;
        }

        var questionData = {};
        questionData.title = $scope.examTitle;
        questionData.type = $scope.examQType;

        if (typeof $scope.ans1 != "undefined" && $scope.ans1 != "") {
            questionData.ans1 = $scope.ans1;
            if(questionData.type == "text"){
                hasTrueAnswer = true;
            }
        }
        if (typeof $scope.ans2 != "undefined" && $scope.ans2 != "") {
            questionData.ans2 = $scope.ans2;
        }
        if (typeof $scope.ans3 != "undefined" && $scope.ans3 != "") {
            questionData.ans3 = $scope.ans3;
        }
        if (typeof $scope.ans4 != "undefined" && $scope.ans4 != "") {
            questionData.ans4 = $scope.ans4;
        }
        if (typeof $scope.Tans != "undefined" && $scope.Tans != "") {
            questionData.Tans = $scope.Tans;
            hasTrueAnswer = true;
        }
        if (typeof $scope.Tans1 != "undefined" && $scope.Tans1 != "") {
            questionData.Tans1 = $scope.Tans1;
            hasTrueAnswer = true;
        }
        if (typeof $scope.Tans2 != "undefined" && $scope.Tans2 != "") {
            questionData.Tans2 = $scope.Tans2;
            hasTrueAnswer = true;
        }
        if (typeof $scope.Tans3 != "undefined" && $scope.Tans3 != "") {
            questionData.Tans3 = $scope.Tans3;
            hasTrueAnswer = true;
        }
        if (typeof $scope.Tans4 != "undefined" && $scope.Tans4 != "") {
            questionData.Tans4 = $scope.Tans4;
            hasTrueAnswer = true;
        }
        if( hasTrueAnswer == false){
            alert("You must select the true answer");
            return;
        }

        if (typeof $scope.questionMark != "undefined" && $scope.questionMark != "") {
            questionData.questionMark = $scope.questionMark;
        }

        $scope.form.examQuestion.push(questionData);
        console.log($scope.form.examQuestion);

        $scope.examTitle = "";
        $scope.questionMark = "";
        $scope.ans1 = "";
        $scope.ans2 = "";
        $scope.ans3 = "";
        $scope.ans4 = "";
        $scope.Tans = "";
        $scope.Tans1 = "";
        $scope.Tans2 = "";
        $scope.Tans3 = "";
        $scope.Tans4 = "";
    }

    $scope.removeQuestion = function(index){
        $scope.form.examQuestion.splice(index,1);
    }

    $scope.take = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/onlineExams/take/'+id,'POST',{},{}).then(function(data) {
            response = apiResponse(data,'add');
            if(response){
                $scope.changeView('take');
                $scope.takeData = data;
                $scope.examQuestions = data.examQuestions;

                angular.forEach($scope.examQuestions, function(value, key) {
                    $scope.examQuestions[key]['question_text'] = $sce.trustAsHtml($scope.examQuestions[key]['question_text']);
                });

                document.getElementById('onlineExamTimer').start();
                if(data.timeLeft != 0){
                    $scope.$broadcast('timer-set-countdown', data.timeLeft);
                }
            }
        });
        showHideLoad(true);
    }

    $scope.finishExam = function(){
        $scope.submitExam();
        alert($rootScope.phrase.examTimedOut);
    }

    $scope.submitExam = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/onlineExams/took/'+$scope.takeData.id,'POST',{},{'answers':$scope.examQuestions}).then(function(data) {
            if (typeof data.grade != "undefined") {
                alert($rootScope.phrase.examYourGrade+data.grade);
            }else{
                alert($rootScope.phrase.examSubmitionSaved);
            }
            $scope.changeView('list');
            showHideLoad(true);
        });
    }

    $scope.marksData = function(id){
        showHideLoad();
        dataFactory.httpRequest('index.php/onlineExams/marks/'+id).then(function(data) {
            $scope.marks = data.grade;
            $scope.examDegreeSuccess = data.examDegreeSuccess;

            $scope.marksExam = id;
            $scope.changeView('marks');
            showHideLoad(true);
        });
    }

    $scope.isSuccess = function(pass,grade){
        if(typeof grade == null){
            return ;
        }
        if(parseInt(grade) >= parseInt(pass)){
            return 'success';
        }
        if(parseInt(grade) < parseInt(pass)){
            return 'failed';
        }
    }

    $scope.uploadQimage = function($index,question){
        $scope.modalTitle = "Upload Image for question";
        $scope.uploadQimageModal = !$scope.uploadQimageModal;
        $scope.uploadImageQ = {};
        $scope.uploadImageQ.id = $index;
        $scope.uploadImageQ.question = question;
    }

    $scope.saveUploadImage = function(content){
        $scope.uploadQimageModal = !$scope.uploadQimageModal;
        $scope.form.examQuestion[$scope.uploadImageQ.id].image = content;
    }

    $scope.showStdMarks = function(studentAnswers){
        $scope.modalTitle = "Student's answers";
        $scope.modalClass = "modal-lg";
        $scope.studentAnswers = studentAnswers;
        $scope.showstdAnswerModal = !$scope.showstdAnswerModal;
    }

    $scope.questionsArch = function(){
        showHideLoad();
        dataFactory.httpRequest('onlineExams/questions').then(function(data) {
            $scope.questionsList = data;
            $scope.changeView('questions');
            showHideLoad(true);
        });
    }

    $scope.addNewQuestion = function(){
        $scope.form = {};
        $scope.form.answersList = [""];
        $scope.changeView('addQuestion');
    }

    $scope.addAnswer = function(){
        $scope.form.answersList.push("");
    }

    $scope.delAnswer = function($index){
        $scope.form.answersList.splice($index,1);
    }

    $scope.saveQuestionAdd = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            $scope.questionsList.push(response);
            $scope.changeView('questions');
            showHideLoad(true);
        }
    }

    $scope.editQuestionF = function(id){
        showHideLoad();
        dataFactory.httpRequest('onlineExams/questions/'+id).then(function(data) {
            $scope.changeView('editQuestion');
            $scope.form = data;
            showHideLoad(true);
        });
    }

    $scope.saveQuestionEdit = function(content){
        response = apiResponse(content,'edit');
        if(content.status == "success"){
            $scope.questionsList = apiModifyTable($scope.questionsList,response.id,response);
            $scope.changeView('questions');
            showHideLoad(true);
        }
    }

    $scope.removeQuestionArch = function(item,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('onlineExams/questions/delete/'+item.id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.questionsList.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.addQuestionToExam = function(){
        $scope.modalTitle = "Import Questions";
        $scope.formQ = {};
        $scope.formQ.answersList = [""];
        $scope.modalClass = "modal-lg";
        $scope.addQuestionModal = !$scope.addQuestionModal;
    }

    $scope.addAnswerOM = function(){
        $scope.formQ.answersList.push("");
    }

    $scope.delAnswerOM = function(index){
        $scope.formQ.answersList.splice(index,1);
    }

    $scope.removeQuestion = function(index){
        $scope.form.examQuestion.splice(index,1);
    }

    $scope.searchQuestion = function(){
        var searchAbout = $('#searchQuestion').val();
        if(searchAbout.length < 3){
            alert($rootScope.phrase.minCharLength3);
            return;
        }
        dataFactory.httpRequest('onlineExams/searchQuestion/'+searchAbout).then(function(data) {
            $scope.searchResults = data;
        });
    }

    $scope.addQuestion2List = function(question){
        var discard_add = false;
        angular.forEach($scope.form.examQuestion, function(value, key) {
            if(value.id == question.id){
                discard_add = true;
            }
        });
        if(discard_add == false){
            $scope.form.examQuestion.push({"id":question.id,"question_text":question.question_text,"question_type":question.question_type});
        }
    }

    $scope.saveQuestionModalAdd = function(content){
        response = apiResponse(content,'add');
        if(content.status == "success"){
            $scope.form.examQuestion.push({"id":response.id,"question_text":response.question_text,"question_type":response.question_type});
            $scope.addQuestionModal = !$scope.addQuestionModal;
        }
    }

    $scope.closeAnswerOM = function(){
        $scope.addQuestionModal = !$scope.addQuestionModal;
    }

    $scope.removeExamQuestion = function(question,index){
        $scope.form.examQuestion.splice(index,1);
    }

    $scope.changeView = function(view){
        if(view == "add" || view == "list" || view == "show"){
            $scope.form = {};
            $scope.form.examQuestion = [];
        }
        $scope.views.list = false;
        $scope.views.add = false;
        $scope.views.edit = false;
        $scope.views.take = false;
        $scope.views.marks = false;
        $scope.views.questions = false;
        $scope.views.addQuestion = false;
        $scope.views.editQuestion = false;
        $scope.views[view] = true;
    }
});