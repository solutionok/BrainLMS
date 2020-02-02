var OraSchool = angular.module('reportsController', []);

OraSchool.controller('reportsController', function(dataFactory,$rootScope,$scope,$http,$sce) {
    $scope.views = {};
    $scope.form = {};
    $scope.views.list = true;
    $scope.stats = {};

    $scope.$on('$viewContentLoaded', function() {
    	document.title = $('meta[name="site_title"]').attr('content') + ' | Reports';
    });

    showHideLoad(true);
    $scope.usersStats = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'usersStats'}).then(function(data) {
            $scope.stats = data;
            $scope.changeView('usersStats');
            showHideLoad(true);
        });
    }

    $scope.showModal = false;
    $scope.studentProfile = function(id){
        dataFactory.httpRequest('index.php/students/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    $scope.teacherProfile = function(id){
        dataFactory.httpRequest('index.php/teachers/profile/'+id).then(function(data) {
            $scope.modalTitle = data.title;
            $scope.modalContent = $sce.trustAsHtml(data.content);
            $scope.showModal = !$scope.showModal;
        });
    };

    $scope.subjectList = function(){
        dataFactory.httpRequest('index.php/dashboard/sectionsSubjectsList','POST',{},{"classes":$scope.form.classId}).then(function(data) {
            $scope.subjects = data.subjects;
            $scope.sections = data.sections;
        });
    }

    $scope.stdAttendance = function(){
        dataFactory.httpRequest('index.php/attendance/stats').then(function(data) {
            $scope.attendanceStats = data;
            $scope.changeView('stdAttendance');
            showHideLoad(true);
        });
    }

    $scope.statsAttendance = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'stdAttendance','data':$scope.form}).then(function(data) {
            if(data){
                $scope.attendanceData = data;
                $scope.changeView('stdAttendanceReport');
            }
            showHideLoad(true);
        });
    }

    $scope.statsAttendanceExport = function(exportType){
        showHideLoad();
        $scope.form.exportType = exportType;
        $http.post('index.php/reports', {'stats':'stdAttendance','data':$scope.form},{responseType: 'arraybuffer'}).success(function(data) {

            if(exportType == "excel"){
                var file = new Blob([ data ], {type : 'application/excel'});
                var fileURL = URL.createObjectURL(file);
                var a         = document.createElement('a');
                a.href        = fileURL;
                a.target      = '_blank';
                a.download    = 'StudentsAttendance.xls';
                document.body.appendChild(a);
                a.click();
            }

            if(exportType == "pdf"){
                var file = new Blob([data], {type : 'application/pdf'});
                var fileURL = URL.createObjectURL(file);
                window.open(fileURL);
            }

            showHideLoad(true);
        });
    }

    $scope.staffAttendance = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'stfAttendance','data':$scope.form}).then(function(data) {
            if(data){
                $scope.attendanceData = data;
                $scope.changeView('stfAttendanceReport');
            }
            showHideLoad(true);
        });
    }

    $scope.staffAttendanceExport = function(exportType){
        showHideLoad();
        $scope.form.exportType = exportType;
        $http.post('index.php/reports', {'stats':'stfAttendance','data':$scope.form},{responseType: 'arraybuffer'}).success(function(data) {

            if(exportType == "excel"){
                var file = new Blob([ data ], {type : 'application/excel'});
                var fileURL = URL.createObjectURL(file);
                var a         = document.createElement('a');
                a.href        = fileURL;
                a.target      = '_blank';
                a.download    = 'StaffAttendance.xls';
                document.body.appendChild(a);
                a.click();
            }

            if(exportType == "pdf"){
                var file = new Blob([data], {type : 'application/pdf'});
                var fileURL = URL.createObjectURL(file);
                window.open(fileURL);
            }

            showHideLoad(true);
        });
    }

    $scope.getVacation = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'stdVacation','data':$scope.form}).then(function(data) {
            if(data){
                $scope.vacationData = data;
                $scope.changeView('vacationList');
            }
            showHideLoad(true);
        });
    }

    $scope.removeVacation = function(id,index){
        var confirmRemove = confirm($rootScope.phrase.sureRemove);
        if (confirmRemove == true) {
            showHideLoad();
            dataFactory.httpRequest('index.php/vacation/delete/'+id,'POST').then(function(data) {
                response = apiResponse(data,'remove');
                if(data.status == "success"){
                    $scope.vacationData.splice(index,1);
                }
                showHideLoad(true);
            });
        }
    }

    $scope.gettVacation = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'stfVacation','data':$scope.form}).then(function(data) {
            if(data){
                $scope.vacationData = data;
                $scope.changeView('vacationList');
            }
            showHideLoad(true);
        });
    }

    $scope.getPayments = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'payments','data':$scope.form}).then(function(data) {
            if(data){
                $scope.payments = data;
                $scope.changeView('paymentsResult');
            }
            showHideLoad(true);
        });
    }

    $scope.getExpenses = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'expenses','data':$scope.form}).then(function(data) {
            if(data){
                $scope.expenses = data;
                $scope.changeView('expensesReportsResults');
            }
            showHideLoad(true);
        });
    }

    $scope.getIncome = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'income','data':$scope.form}).then(function(data) {
            if(data){
                $scope.incomes = data;
                $scope.changeView('incomeReportsResults');
            }
            showHideLoad(true);
        });
    }

    $scope.marksheetGenerationPrepare = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'marksheetGenerationPrepare','data':$scope.form}).then(function(data) {
            if(data){
                $scope.classes = data.classes;
                $scope.exams = data.exams;
                $scope.changeView('marksheetGeneration');
            }
            showHideLoad(true);
        });
    }

    $scope.biometricUsers = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'biometric_users'}).then(function(data) {
            if(data){
                $scope.biometric_users = data;
                $scope.changeView('biometric_users_table');
            }
            showHideLoad(true);
        });
    }

    $scope.getPayroll = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'payroll','data':$scope.form}).then(function(data) {
            if(data){
                $scope.payrollPayment_list = data;
                $scope.changeView('payRollReportsResults');
            }
            showHideLoad(true);
        });
    }

    $scope.genCertPrep = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports/preCert').then(function(data) {
            $scope.classes = data.classes;
            $scope.certs = data.certs;
            $scope.changeView('gen_cert');
            showHideLoad(true);
        });
    }

    $scope.certGetStdList = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports/certGetStdList','POST',{},$scope.form).then(function(data) {
            if(data){
                $scope.certUsersList = data;
            }
            if($scope.certUsersList.length == 0){
                alert($rootScope.phrase.noMatches);
            }
            showHideLoad(true);
        });
    }

    $scope.printCertificate = function(){
        showHideLoad();
        dataFactory.httpRequest('index.php/reports','POST',{},{'stats':'certPrint','data':$scope.form}).then(function(data) {
            if(data){
                $scope.printCertInfo = data;

                setTimeout(function() {

                    var mywindow = window.open('', 'new div', 'height=800,width=1200');
                    mywindow.document.write('<html><head><title>Print Certificates</title>');
                    mywindow.document.write('<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" type="text/css" /><style> @media print { .no-print, .no-print * { display: none !important; } }</style>');
                    mywindow.document.write('</head><body ><center><div class="no-print" style="padding:10px"><button type="button" onClick="window.print();">Print Certificates</button></style></center>');
                    mywindow.document.write($('#printableArea').html());
                    mywindow.document.write('</body></html>');
                    return true;

                }, 500);

            }
            showHideLoad(true);
        });
    }

    $scope.processvars = function(template,userData){
        template = template.replace("[user_name]", userData.user_name);
        template = template.replace("[full_name]", userData.full_name);
        template = template.replace("[email]", userData.email);
        template = template.replace("[date_of_birth]", userData.date_of_birth);
        template = template.replace("[gender]", userData.gender);
        template = template.replace("[religion]", userData.religion);
        template = template.replace("[phone_number]", userData.phone_number);
        template = template.replace("[mobile_number]", userData.mobile_number);
        template = template.replace("[address]", userData.address);
        template = template.replace("[admission_number]", userData.admission_number);
        template = template.replace("[admission_date]", userData.admission_date);
        template = template.replace("[roll_id]", userData.roll_id);
        template = template.replace("[student_category]", userData.student_category);
        template = template.replace("[class_name]", userData.class_name);
        template = template.replace("[section_name]", userData.section_name);
        template = template.replace("[father_name]", userData.father_name);
        template = template.replace("[mother_name]", userData.mother_name);

        return $sce.trustAsHtml(template);
    }

    $scope.changeView = function(view){
        $scope.views.list = false;
        $scope.views.lists = false;
        $scope.views.usersStats = false;
        $scope.views.stdAttendance = false;
        $scope.views.stdAttendanceReport = false;
        $scope.views.stfAttendance = false;
        $scope.views.stfAttendanceReport = false;
        $scope.views.stVacation = false;
        $scope.views.teacherVacation = false;
        $scope.views.vacationList = false;
        $scope.views.paymentsReports = false;
        $scope.views.paymentsResult = false;
        $scope.views.marksheetGeneration = false;
        $scope.views.expensesReports = false;
        $scope.views.expensesReportsResults = false;
        $scope.views.incomeReports = false;
        $scope.views.incomeReportsResults = false;
        $scope.views.biometric_users_table = false;
        $scope.views.payRollReports = false;
        $scope.views.payRollReportsResults = false;
        $scope.views.gen_cert = false;
        $scope.views[view] = true;
    }
});