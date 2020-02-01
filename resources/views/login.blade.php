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
    <?php if($panelInit->settingsArray['favicon'] == "e"){ ?>
        <link rel="icon" type="image/png" sizes="16x16" href="{{URL::asset('assets/images/favicon.png')}}">
    <?php } ?>
    <title><?php echo $panelInit->settingsArray['siteTitle'] . " | " . $panelInit->language['signIn']; ?></title>
    <!-- Bootstrap Core CSS -->
    <link href="{{URL::asset('assets/plugins/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
    <!-- Custom CSS -->
    <?php if($panelInit->isRTL == 1){ ?>
        <link href="{{URL::asset('assets/css/style-rtl.css')}}" rel="stylesheet">
        <link href="{{URL::asset('assets/plugins/bootstrap-rtl-master/dist/css/custom-bootstrap-rtl.css')}}" rel="stylesheet" type="text/css" />
    <?php }else{ ?>
        <link href="{{URL::asset('assets/css/style.css')}}" rel="stylesheet">
    <?php } ?>
    <link href="{{URL::asset('assets/css/custom.css')}}" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		    <!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">

		@if(get_server_info()['server_type'] == 'demo' || get_server_info()['server_type'] == 'sxd')
			.login-register {
				margin-top: -110px;
			}
			@media screen and (min-width: 992px) {
				.login-box {
					position: absolute;
					right: 40px;
					/*box-shadow: 0 0 2px #EEE;*/
					background: floralwhite;
				}
				.loginMark {
					background-size: contain !important;
					background-color: #FFF !important;
				}
			}
		@else
			.login-register {
				margin-top: -70px;
			}
		@endif

		@if(get_server_info()['server_type'] == 'sxd')
			.custom-main-title {
				margin-top: 10px !important;
				display: inline-block !important;
			}
		@endif

		@media screen and (max-width: 992px) {
			.login-register {
				margin-top: 65px !important;
			}
		}
	</style>
</head>

<?php
    $bgStyling = "";
    if($panelInit->settingsArray['authPageImage'] == "1"){
    	if(get_server_info()['server_type'] != 'demo' && get_server_info()['server_type'] != 'sxd')
        $bgStyling .= "background-image:url('".URL::asset('assets/images/login-register.jpg')."'); ";
      else {
      	$bgStyling .= "background-image:url('".URL::asset('assets/images/login-register-demo.jpg')."?v60'); ";
      }
    }
    if($panelInit->settingsArray['authPageColor'] != ""){
        $bgStyling .= "background-color:".$panelInit->settingsArray['authPageColor'].";";
    }
?>

<?php
  if(get_server_info()['server_type'] != 'demo') {
  	$username_placeholder = 'registered mobile number';
  	$password_placeholder = 'last 4 digit of mobile number';
  } else {
  	$username_placeholder = 'Username';
  	$password_placeholder = 'Password';
  }
?>

<body class="loginMark" style="<?php echo $bgStyling; ?>;background-attachment:fixed; background-repeat: repeat-y;background-size: cover;" >
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>

    <section id="wrapper" <?php if($panelInit->settingsArray['loginPageStyle'] == "r"){ echo 'class="login-register login-sidebar" style="'.$bgStyling.'"'; } ?>>
        <div <?php if($panelInit->settingsArray['loginPageStyle'] == "r"){ echo 'class="login-box card"'; }else{ echo 'class="login-register" '; } ?> >
            <?php if($panelInit->settingsArray['loginPageStyle'] == "c"){ ?><div class="login-box card"><?php } ?>
            <div class="card-block">
                <form class="form-horizontal form-material" id="loginform" action="{{URL::to('/login')}}" method="post">
                    @if(get_server_info()['server_type'] == 'sxd')
                    	<img src="<?php echo URL::asset('assets/images/logo-light-sxd.png'); ?>" style="display: inline-block; width: 80px; margin-top: -10px">
                    @endif
                    <a href="javascript:void(0)" class="custom-main-title text-center db logo-text-login" style="font-size: 24px !important; font-weight: 400">
                        <?php
                        $panelInit->settingsArray['siteLogo'] = "siteName";
                        if($panelInit->settingsArray['siteLogo'] == "siteName"){
                            echo $panelInit->settingsArray['siteTitle'];
                        }elseif($panelInit->settingsArray['siteLogo'] == "text"){
                            echo $panelInit->settingsArray['siteLogoAdditional'];
                        }elseif($panelInit->settingsArray['siteLogo'] == "image"){
                            ?><?php
                        }
                        ?>
                    </a>
                   	<hr>
                    <h3 class="box-title m-b-20"><?php echo $panelInit->language['signIn']; ?></h3>

                    @if($errors->any())
                        <span style='color:red;'>{{$errors->first()}}</span><br/><br/>
                    @endif
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" name="email" required="" placeholder="{{ $username_placeholder }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
	                            <input class="form-control" type="password" name="password" required data-toggle="password" placeholder="{{ $password_placeholder }}">
	                        		<div class="input-group-append text-dark" style="
	                        			position: absolute;
														    right: 0;
														    top: 5px;
														    padding: 0px 6px;
														    font-size: 19px;
														    z-index: 99;
														    border-left: 1px solid #CCC;">
														    <span class="input-group-text"><i class="fa fa-eye"></i></span>
														  </div>
														</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                          <div class="checkbox checkbox-primary pull-left p-t-0">
                              <input id="checkbox-signup" name="remember_me" type="checkbox">
                              <label for="checkbox-signup"> <?php echo $panelInit->language['rememberMe']; ?> </label>
                          </div>
                          <a href="{{URL::to('/forgetpwd')}}" class="text-dark pull-right">
                          	<i class="fa fa-lock m-r-5"></i> <?php echo $panelInit->language['restorePwd']; ?>
                          </a>
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit"><?php echo $panelInit->language['signIn']; ?></button>
                        </div>
                    </div>

                    @if(get_server_info()['server_type'] != 'demo')
	                    @if(get_server_info()['server_type'] == 'dev')
		                    <?php if(isset($panelInit->settingsArray['allowPublicReg']) AND $panelInit->settingsArray['allowPublicReg'] == "1"){ ?>
		                        <div class="form-group m-b-0">
		                            <div class="col-sm-12 text-center">
		                                <p><a href="{{URL::to('/register')}}" class="text-info m-l-5"><b><?php echo $panelInit->language['registerNewAccount']; ?></b></a></p>
		                            </div>
		                        </div>
		                    <?php } ?>
	                    @endif
	                    <div class="form-group m-b-0">
	                        <div class="col-sm-12 text-center">
	                            <a href="{{URL::to('/terms')}}" class="text-info m-l-5"><b><?php echo $panelInit->language['schoolTerms']; ?></b></a>
	                        </div>
	                    </div>
	                    <hr>
											<div style="text-align: left; display: inline-block;">
												Powered by <a href="https://www.virtu.co/">virtu.co</a>
											</div>
											<div style="text-align: right; display: inline-block; float: right;">
												<a href="https://www.virtu.co/">
													<img src="{{ asset('assets/images/logo_VirtuIT-180.png') }}" width="80px">
												</a>
											</div>
	                  @else
	                  	<hr>
	                  	<div class="mb-2"><b>Admin Login</b> - virtu / admin123</div>
											<div class="mb-2"><b>Parent Login</b> - parent / parent123</div>
											<div><b>Teacher Login</b> - teacher / teacher123</div>
											<hr>
											<div style="text-align: left; display: inline-block;">
												Powered by <a href="https://www.virtu.co/">virtu.co</a>
											</div>
											<div style="text-align: right; display: inline-block; float: right;">
												<a href="https://www.virtu.co/">
													<img src="{{ asset('assets/images/logo_VirtuIT-180.png') }}" width="80px">
												</a>
											</div>
                    @endif

                    <input type="hidden" name="hash_value">
                </form>
            </div>
          <?php if($panelInit->settingsArray['loginPageStyle'] == "c"){ ?></div><?php }?>
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

    <script type="text/javascript" src="{{ asset('assets/js/bootstrap-show-password.min.js') }}"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('input[name="hash_value"]').val(window.location.hash);
    		if ( typeof Android == 'function' ) {
    			Android.removeToken();
    		}
    	});
    </script>
</body>

</html>
