<!DOCTYPE html>
<html lang="en" style="background:none;">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="{{URL::asset('assets/images/favicon.png')}}">
    <title>OraSchool Installation</title>
    <!-- Bootstrap Core CSS -->
    <link href="{{URL::asset('assets/plugins/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{{URL::asset('assets/css/style.css')}}" rel="stylesheet">
    <link href="{{URL::asset('assets/css/custom.css')}}" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<?php
    $bgStyling = "background-image:url('".URL::asset('assets/images/login-register.jpg')."'); ";
?>

<body class="loginMark" style="<?php echo $bgStyling; ?>;background-attachment:fixed; background-repeat: repeat-y;background-size: cover;" >
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

    <section id="wrapper">
       <div class="login-register"  >
            <div class="login-box card" style="width:400px;">
            <div class="card-block">
                <form action="{{URL::to('/install')}}" method="post">
                    <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                    <div class="body">
                        @if($errors->any())
                           <h4 style='color:red;'>{{$errors->first()}}</h4>
                        @endif

                        @if($currStep == "welcome")
                            <center>Thank you for choosing OraSchool for your school administration.
                            <br/>
                            Please follow the next steps to complete OraSchool installation</center>
                            <br/>
                            <input type="hidden" name="nextStep" value="1">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Start installation</button>
                        @endif
                        @if($currStep == "1")
                            <div class="form-group">
                                <center><b>Database Connection</b></center>
                            </div>

                            <?php
                                if(isset($dbError)){
                                    echo '<div class="form-group" style="color:red;">Database connection failed</div>';
                                }else{
                                    echo '<div class="form-group" style="color:green;">Database connection success</div>';
                                }
                            ?>

                            <div class="form-group">
                                <center><b>Permissions Tests</b> <br/> The following folders needs write permissions</center>
                            </div>

                            <div class="form-group" style="color:green;">
                                <?php
                                    if(isset($success)){
                                        foreach ($success as $key => $value) {
                                            echo $value." : <b>Success</b> <br/>";
                                        }
                                    }
                                ?>
                            </div>
                            <div class="form-group" style="color:red;">
                                <?php
                                    if(isset($perrors)){
                                        foreach ($perrors as $key => $value) {
                                            echo $value." : <b>Failed</b> <br/>";
                                        }
                                    }
                                ?>
                            </div>
                            @if($nextStep == "1")
                                <input type="hidden" name="nextStep" value="1">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Recheck</button>
                            @endif
                            @if($nextStep == "2")
                                <input type="hidden" name="nextStep" value="2">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">Next Step</button>
                            @endif
                        @endif

                        @if($currStep == "2")
                            <div class="form-group">
                                <center><b>Administrator details</b></center>
                            </div>

                            <?php
                            if(isset($installErrors)){
                                echo '<div class="form-group" style="color:red;">';
                                foreach ($installErrors as $key => $value) {
                                    echo $value."<br/>";
                                }
                                echo '</div>';
                            }
                            ?>
                            <div class="form-group">
                                <input type="text" name="fullName" class="form-control" placeholder="Fullname *"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="username" class="form-control" placeholder="Username *"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="email" class="form-control" placeholder="E-mail address *"/>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control" placeholder="Password *"/>
                            </div>
                            <div class="form-group">
                                <input type="password" name="repassword" class="form-control" placeholder="Re Password *"/>
                            </div>

                            <div class="form-group">
                                <center><b>Site settings</b></center>
                            </div>

                            <div class="form-group">
                                <input type="text" name="siteTitle" class="form-control" placeholder="Site Title *"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="systemEmail" class="form-control" placeholder="System e-mail address *"/>
                            </div>

                            <div class="form-group">
                                <center><b>Default academic year</b></center>
                            </div>

                            <div class="form-group">
                                <input type="text" name="yearTitle" class="form-control" placeholder="Deault academic year title *"/>
                            </div>

                            <div class="form-group">
                                <center><b>License</b></center>
                            </div>

                            <div class="form-group">
                                <input type="text" name="cpc" class="form-control" placeholder="Codecanyon Purchase Code *"/>
                            </div>

                            <input type="hidden" name="nextStep" value="3">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Next Step</button>
                        @endif

                        @if($currStep == "3")
                            <div class="form-group">
                                <center><b>Thank You for installing OraSchool</b></center>
                            </div>
                            <a href="<?php echo URL::to('/'); ?>" class="btn bg-olive btn-block">Start using OraSchool</a>
                        @endif
                    </div>
                    <div class="form-group has-feedback">
                        <br/><a href="http://solutionsbricks.com" target="_BLANK" class="btn bg-olive btn-block">Solutions Bricks</a>
                    </div>
                </form>
            </div>
          </div>
        </div>

    </section>
    <script src="{{URL::asset('assets/plugins/jquery/jQuery-2.1.4.min.js')}}"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="{{URL::asset('assets/plugins/bootstrap/js/tether.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/bootstrap/js/bootstrap.min.js')}}"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="{{URL::asset('assets/js/jquery.slimscroll.js')}}"></script>
    <!--Wave Effects -->
    <script src="{{URL::asset('assets/js/waves.js')}}"></script>
    <!--stickey kit -->
    <script src="{{URL::asset('assets/plugins/sticky-kit-master/dist/sticky-kit.min.js')}}"></script>
    <!--Custom JavaScript -->
    <script src="{{URL::asset('assets/js/custom.min.js')}}"></script>
</body>

</html>
