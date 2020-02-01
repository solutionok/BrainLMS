<!DOCTYPE html>
<html lang="en" <?php if($panelInit->isRTL == 1){ ?>dir="rtl"<?php } ?> style="background:none;">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <base href="<?php echo $panelInit->baseURL; ?>" />
    <?php if($panelInit->settingsArray['favicon'] == "e"){ ?>
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo URL::asset('/assets/images/favicon.png'); ?>">
    <?php } ?>
    <title><?php echo $panelInit->settingsArray['siteTitle'] . " | " . $panelInit->language['registerNewAccount']; ?></title>
    <!-- Bootstrap Core CSS -->
    <link href="<?php echo URL::asset('/assets'); ?>/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <?php if($panelInit->isRTL == 1){ ?>
        <link href="<?php echo URL::asset('/assets'); ?>/css/style-rtl.css" rel="stylesheet">
        <link href="<?php echo URL::asset('/assets'); ?>/plugins/bootstrap-rtl-master/dist/css/custom-bootstrap-rtl.css" rel="stylesheet" type="text/css" />
    <?php }else{ ?>
        <link href="<?php echo URL::asset('/assets'); ?>/css/style.css" rel="stylesheet">
    <?php } ?>
    <link href="<?php echo URL::asset('/assets'); ?>/css/custom.css" id="theme" rel="stylesheet">
    <link href="<?php echo URL::asset('/assets'); ?>/css/custom.css" id="theme" rel="stylesheet">
    <link href="<?php echo URL::asset('/assets'); ?>/css/intlTelInput.css" rel="stylesheet">
    <link href="<?php echo URL::asset('/assets'); ?>/plugins/global-calendars/jquery.calendars.picker.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<?php
    $bgStyling = "";
    if($panelInit->settingsArray['authPageImage'] == "1"){
        $bgStyling .= "background-image:url('".URL::asset('assets/images/login-register.jpg')."'); ";
    }
    if($panelInit->settingsArray['authPageColor'] != ""){
        $bgStyling .= "background-color:".$panelInit->settingsArray['authPageColor'].";";
    }
?>

<body class="loginMark" ng-app="OraSchool" ng-controller="registeration" style="<?php echo $bgStyling; ?>;background-attachment:fixed; background-repeat: repeat-y;background-size: cover;">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <?php
        $bgStyling = "";
        if($panelInit->settingsArray['authPageImage'] == "1"){
            $bgStyling .= "background-image:url('".URL::asset('assets/images/login-register.jpg')."'); ";
        }
        if($panelInit->settingsArray['authPageColor'] != ""){
            $bgStyling .= "background-color:".$panelInit->settingsArray['authPageColor'].";";
        }
    ?>

    <section id="wrapper" <?php if($panelInit->settingsArray['registerPageStyle'] == "r"){ echo 'class="login-register login-sidebar" '; } ?>>
        <div <?php if($panelInit->settingsArray['registerPageStyle'] == "r"){ echo 'class="login-box card" style="height: unset !important;"'; }else{ echo 'class="login-register"; '; } ?> >
            <?php if($panelInit->settingsArray['registerPageStyle'] == "c"){ ?><div class="login-box card"><?php } ?>
            <div class="card-block">
                    <a href="javascript:void(0)" class="text-center db logo-text-login">
                        <?php
                        if($panelInit->settingsArray['siteLogo'] == "siteName"){
                            echo $panelInit->settingsArray['siteTitle'];
                        }elseif($panelInit->settingsArray['siteLogo'] == "text"){
                            echo $panelInit->settingsArray['siteLogoAdditional'];
                        }elseif($panelInit->settingsArray['siteLogo'] == "image"){
                            ?><img src="<?php echo URL::asset('assets/images/logo-light.png'); ?>"  /><?php
                        }
                        ?>
                    </a>

                    <h3 class="box-title m-b-20"><?php echo $panelInit->language['registerNewAccount']; ?></h3>

                    <div ng-show="views.register" class="registerationForm">
                        <form class="form-horizontal form-material" id="loginform" ng-submit="tryRegister()" method="post" role="form" name="registerationForm">

                            <?php
                            if($errors->any()){
                               ?>
                               <span style='color:red;'>{{$errors->first()}}</span><br/>
                               <?php
                            }
                            ?>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-md-4"><label><input type="radio" style="margin-right:0px !important" name="role" value="teacher" ng-model="form.role" /> <?php echo $panelInit->language['teacher']; ?> </label></div>
                                        <div class="col-md-4"><label><input type="radio" style="margin-right:0px !important" name="role" value="student" ng-model="form.role"/> <?php echo $panelInit->language['student']; ?> </label></div>
                                        <div class="col-md-4"><label><input type="radio" style="margin-right:0px !important" name="role" value="parent" ng-model="form.role"/> <?php echo $panelInit->language['parent']; ?> </label></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12" ng-class="{'has-error': registerationForm.username.$invalid}">
                                    <input type="text" name="username" class="form-control" ng-model="form.username" required placeholder="<?php echo $panelInit->language['username']; ?>"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12" ng-class="{'has-error': registerationForm.email.$invalid && registerationForm.email.$dirty}">
                                    <input type="text" name="email" class="form-control" placeholder="<?php echo $panelInit->language['email']; ?>" ng-model="form.email" ng-required="form.role != 'student' || ( form.role == 'student' && <?php if($panelInit->settingsArray['emailIsMandatory'] == true){ echo 'true'; }else{ echo 'false'; } ; ?>)" ng-pattern="/^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12" ng-class="{'has-error': registerationForm.password.$invalid}">
                                    <input type="password" name="password" class="form-control" required placeholder="<?php echo $panelInit->language['password']; ?>" ng-model="form.password" required/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12" ng-class="{'has-error': registerationForm.fullName.$invalid}">
                                    <input type="text" name="fullName" class="form-control" required placeholder="<?php echo $panelInit->language['FullName']; ?>" ng-model="form.fullName"/>
                                </div>
                            </div>

                            <div class="form-group" ng-show="form.role == 'parent'">
                                <div class="col-xs-12">
                                    <input type="text" name="parentProfession" class="form-control" placeholder="<?php echo $panelInit->language['Profession']; ?>" ng-model="form.parentProfession"/>
                                </div>
                            </div>

                            <div class="form-group" ng-show="form.role == 'student'">
                                <div class="col-xs-12">
                                    <input type="text" name="studentRollId" class="form-control" placeholder="<?php echo $panelInit->language['rollid']; ?>" ng-model="form.studentRollId"/>
                                </div>
                            </div>

                            <div class="form-group" ng-show="form.role == 'student'">
                                <div class="col-xs-12">
                                    <select class="form-control" name="studentClass" ng-model="form.studentClass" ng-required="form.role == 'student'" ng-change="subjectList()">
                                        <option ng-repeat="class in classes" value="{{class.id}}">{{class.className}}</option>
                                    </select>
                                </div>
                            </div>

                            <?php if($panelInit->settingsArray['enableSections'] == true){ ?>
                                <div class="form-group" ng-show="form.role == 'student'">
                                    <div class="col-xs-12">
                                        <select class="form-control" name="studentSection" ng-required="form.role == 'student'" ng-model="form.studentSection" >
                                            <option ng-repeat="section in sections" value="{{section.id}}"> {{section.sectionName}} - {{section.sectionTitle}}</option>
                                        </select>
                                    </div>
                                </div>
                            <?php } ?>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input date-picker type="text" name="birthday" readonly id="datemask" class="form-control datemask" placeholder="<?php echo $panelInit->language['Birthday']; ?>" ng-model="form.birthday"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12" ng-class="{'has-error': registerationForm.gender.$invalid}">
                                    <div class="col-md-4"><input type="radio" name="gender" required value="male" ng-model="form.gender"/> <?php echo $panelInit->language['Male']; ?> </div>
                                    <div class="col-md-4"><input type="radio" name="gender" required value="female" ng-model="form.gender"/> <?php echo $panelInit->language['Female']; ?> </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input type="text" name="address" class="form-control" placeholder="<?php echo $panelInit->language['Address']; ?>" ng-model="form.address"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input type="text" name="phoneNo" class="form-control" placeholder="<?php echo $panelInit->language['phoneNo']; ?>" ng-model="form.phoneNo"/>
                                </div>
                            </div>

                            <div class="form-group" style="overflow:unset;">
                                <div class="col-xs-12" ng-class="{'has-error': registerationForm.mobileNo.$invalid}">
                                    <input type="text" mobile-number name="mobileNo" class="form-control" placeholder="<?php echo $panelInit->language['mobileNo']; ?>" ng-model="form.mobileNo"/>
                                </div>
                            </div>

                            <div class="form-group" ng-show="form.role == 'parent'">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <label for="inputPassword3" class="col-sm-6"><?php echo $panelInit->language['studentDetails']; ?></label>
                                        <div class="col-sm-6">
                                            <button type="button" ng-click="linkStudent()" class="btn btn-primary">Link Student</button>
                                        </div>
                                    </div>
                                    <div class="row" ng-repeat="studentOne in form.studentInfo track by $index" style="padding-top:5px;">
                                        <div class="col-xs-4"><input type="text" class="form-control" disabled="disabled" ng-model="studentOne.student"></div>
                                        <div class="col-xs-4"><input type="text" class="form-control" ng-model="studentOne.relation" placeholder="{{phrase.Relation}}"></div>
                                        <button type="button" ng-click="removeStudent(studentOne.id)" class="btn btn-danger btn-circle"><i class="fa fa-trash-o"></i></button></li>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group text-center m-t-20">
                                <div class="col-xs-12">
                                    <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                                    <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" ng-disabled="registerationForm.$invalid" type="submit"><?php echo $panelInit->language['registerNewAccount']; ?></button>
                                </div>
                            </div>

                            <div class="form-group m-b-0">
                                <div class="col-sm-12 text-center">
                                    <p><a href="<?php echo URL::to('/forgetpwd'); ?>" class="text-info m-l-5"><b><?php echo $panelInit->language['restorePwd']; ?></b></a></p>
                                </div>
                            </div>
                        </form>

                    </div>

                    <div ng-show="views.thanks">
                        <?php echo $panelInit->language['thankReg']; ?> : <span ng-bind="regId"></span><br/>
                        <a href="<?php echo URL::to('/login'); ?>"><?php echo $panelInit->language['signIn']; ?></a>
                    </div>

            </div>
          <?php if($panelInit->settingsArray['registerPageStyle'] == "c"){ ?></div><?php }?>
        </div>

    </section>

    <modal visible="showModalLink" style="color:#000;">
        <div class="row">
            <div class="col-md-9">
                <input type="text" class="form-control" id="searchLink" placeholder="Type student name / username / E-mail address">
            </div>
            <div class="col-md-2">
                <button type="button" ng-click="linkStudentButton()" class="btn btn-danger btn-flat">Search</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="padding-top:10px;">
                <div class="box-body table-responsive">
                    <table class="table table-bordered">
                        <tbody>
                            <tr ng-repeat="studentOne in searchResults">
                                <td>{{studentOne.name}}</td>
                                <td>{{studentOne.email}}</td>
                                <td class="no-print">
                                    <button type="button" ng-click="linkStudentFinish(studentOne)" class="btn btn-primary">Link</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </modal>
    <input type="hidden" id="dateformatVal" value="<?php echo $panelInit->settingsArray['dateformat']; ?>">
    <input type="hidden" id="gcalendarVal" value="<?php echo $panelInit->settingsArray['gcalendar']; ?>">
    <input type="hidden" id="countryVal" value="<?php echo $panelInit->settingsArray['country']; ?>">
    <input type="hidden" id="utilsScript" value="<?php echo URL::asset('assets/js/utils.js'); ?>"/>

    <script src="<?php echo URL::asset('/assets'); ?>/plugins/jquery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/bootstrap/js/tether.min.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/bootstrap/js/popper.min.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<?php echo URL::asset('/assets'); ?>/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="<?php echo URL::asset('/assets'); ?>/js/waves.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="<?php echo URL::asset('/assets'); ?>/js/custom.min.js"></script>

    <script src="<?php echo URL::asset('/assets'); ?>/js/OraSchool.js" type="text/javascript"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/toast-master/js/jquery.toast.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/moment.min.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/plugins/humanize-duration/humanize-duration.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/intlTelInput.min.js"></script>

    <script type="text/javascript" src="<?php echo URL::asset('/assets'); ?>/plugins/global-calendars/jquery.plugin.min.js"></script>
    <script type="text/javascript" src="<?php echo URL::asset('/assets'); ?>/plugins/global-calendars/jquery.calendars.all.js"></script>
    <?php if($panelInit->settingsArray['gcalendar'] != "gregorian"){ ?>
        <?php
        $gcalendar = $panelInit->settingsArray['gcalendar'];
        if($gcalendar == "ethiopic"){
            $gcalendar = "ethiopian";
        }

        ?>
        <script type="text/javascript" src="<?php echo URL::asset('/assets'); ?>/plugins/global-calendars/jquery.calendars.<?php echo $gcalendar; ?>.min.js"></script>
    <?php } ?>

    <script src="<?php echo URL::asset('/assets'); ?>/js/Angular/angular.min.js" type="text/javascript"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/Angular/ng-file-upload/ng-file-upload-shim.min.js" type="text/javascript"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/Angular/ng-file-upload/ng-file-upload.min.js" type="text/javascript"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/Angular/AngularModules.js" type="text/javascript"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/Angular/app.js"></script>
    <script src="<?php echo URL::asset('/assets'); ?>/js/Angular/routes.js" type="text/javascript"></script>
    <?php if( isset($panelInit->settingsArray['gTrackId']) AND $panelInit->settingsArray['gTrackId'] != "" ): ?>
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', '<?php echo $panelInit->settingsArray['gTrackId']; ?>', 'auto');
            ga('send', 'pageview');
        </script>
    <?php endif; ?>
</body>

</html>
