<!DOCTYPE html>
<html lang="en" <?php if($template_vars['rtl'] == 1){ echo "dir='rtl'"; }?>>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title><?php echo $template_vars['site_title']; ?> | <?php echo $template_vars['page_title']; ?></title>
	<!-- Bootstrap Core CSS -->
	<link href="<?php echo $template_vars['assets_folder']; ?>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- This page CSS -->
	<!-- Custom CSS -->
	<link href="<?php echo $template_vars['assets_folder']; ?>/css/style.css" rel="stylesheet">
	<link href="<?php echo $template_vars['assets_folder']; ?>/css/index-landingpage/landing-page.css" rel="stylesheet">
	<link href="<?php echo $template_vars['assets_folder']; ?>/css/colorbox.css" rel="stylesheet">
    <link href="<?php echo $template_vars['assets_folder']; ?>/node_modules/font-awesome/css/font-awesome.min.css" rel="stylesheet" >
	<?php if($template_vars['favicon'] == "e"){ ?>
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo \URL::asset('assets/images/favicon.png'); ?>">
    <?php } ?>
    <?php if($template_vars['rtl'] == 1){ ?>
      <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/css/rtl.css" id="theme-stylesheet">
    <?php } ?>
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/css/colors/style.<?php echo $template_vars['theme']; ?>.css" id="theme-stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="">

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Top header  -->
		<!-- ============================================================== -->
		<div class="header1 po-relative">
			<div class="container">
				<!-- Header 1 code -->
				<nav class="contact-bar row">
					<div class="col-md-7 d-md-block contact_topbar">
						<?php echo $template_vars['language']['contactInfo']; ?> <i style="padding:5px;" class="fa fa-phone"></i> <?php echo $template_vars['phone_number']; ?> <i style="padding:5px;" class="fa fa-envelope"></i> <?php echo $template_vars['mail_address']; ?>
					</div>
					<div class="col-md-5 d-none d-md-inline-block contact_topbar_icons">
						<div class="d-flex justify-content-md-end justify-content-between">
							<div class="contact_topbar_icons_login">
								<a href="<?php echo \URL::to('/login'); ?>" class="login-btn"><i class="fa fa-sign-in"></i><span><?php echo $template_vars['language']['signIn']; ?></span></a>
								<a href="<?php echo \URL::to('/register'); ?>" class="signup-btn"><i class="fa fa-user"></i><span><?php echo $template_vars['language']['signUp']; ?></span></a>
							</div>
							<ul class="social-custom list-inline">
								<?php if(isset($template_vars['social_facebook']) AND $template_vars['social_facebook'] != ""){ ?>
								<li class="list-inline-item"><a href="<?php echo $template_vars['social_facebook']; ?>" target="_BLANK"><i class="fa fa-facebook"></i></a></li>
								<?php } ?>

								<?php if(isset($template_vars['social_google']) AND $template_vars['social_google'] != ""){ ?>
								<li class="list-inline-item"><a href="<?php echo $template_vars['social_google']; ?>" target="_BLANK"><i class="fa fa-google-plus"></i></a></li>
								<?php } ?>

								<?php if(isset($template_vars['social_twitter']) AND $template_vars['social_twitter'] != ""){ ?>
								<li class="list-inline-item"><a href="<?php echo $template_vars['social_twitter']; ?>" target="_BLANK"><i class="fa fa-twitter"></i></a></li>
								<?php } ?>

							</ul>
						</div>
					</div>
				</nav>
				<!-- End Header 1 code -->
			</div>
		</div>    
		<div class="header1 po-relative bg-dark">
			<div class="container">
				<!-- Header 2 code -->
				<nav class="navbar navbar-expand-lg h2-nav">
					<a class="navbar-brand nav-link" href="<?php echo \URL::to('/'); ?>">
						<?php echo $template_vars['site_title']; ?>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#header1" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
						<span class="ti-menu"></span>
					</button>

					<div class="collapse navbar-collapse" id="header1">
						<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
							<?php foreach ($navbar_links as $value) { ?>
			                  <li class="nav-item <?php if($value['page_permalink'] == $permalink['page_permalink']){ echo 'active'; } ?>"><a class="nav-link" href="<?php echo \URL::to($value['page_permalink']); ?>"> <?php echo $value['page_title']; ?> </a></li>
			                <?php } ?>
						</ul>
					</div>
				</nav>
				<!-- End Header 1 code -->
			</div>
		</div>    
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Static Slider 10  -->
				<!-- ============================================================== -->
				<?php if(isset($template_vars['page_slider_images']) && count($template_vars['page_slider_images']) > 0 && $permalink['page_template'] != "gallery"): ?>
					<div>
						<div class="">
							<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			                    <ol class="carousel-indicators">
									<?php reset($template_vars['page_slider_images']); foreach ($template_vars['page_slider_images'] as $key => $value) { ?>
									  <li data-target="#carouselExampleIndicators" data-slide-to="<?php echo $key; ?>" class="<?php if($key == 0) { ?> active <?php } ?>"></li>
									<?php } ?>
								</ol>
								<div class="carousel-inner">
									<?php reset($template_vars['page_slider_images']); foreach ($template_vars['page_slider_images'] as $key => $value) { ?>

									<div class="carousel-item <?php if($key == 0) { ?> active <?php } ?>">
										<img class="d-block w-100" src="<?php echo \URL::asset('uploads/ml_uploads/'.$value['file_uploaded_name']); ?>" alt="<?php if(isset($value['image_title'])){ echo $value['image_title']; } ?>">
										<div class="carousel-caption d-none d-md-block">
											<?php if(isset($value['image_title'])){ echo "<h5>".$value['image_title']."</h5><div class='clearfix'></div>"; } ?>
											<?php if(isset($value['image_description'])){ echo "<p>".$value['image_description']."</p>"; } ?>
										</div>
									</div>

									<?php } ?>
								</div>
			                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
			                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
			                </div>
						</div>
					</div>
				<?php endif; ?>

				<?php if($permalink['page_permalink'] != "home"){ ?>
					<div class="container">
	                    <div class="row m-0">
	                        <div class="col-md-12">
	                            <ol class="breadcrumb m-t-20">
	                                <li class="breadcrumb-item"><a href="<?php echo \URL::to('/'); ?>"><?php echo $template_vars['site_title']; ?></a></li>
	                                <li class="breadcrumb-item active"><?php echo $template_vars['page_title']; ?></li>
	                            </ol>
	                        </div>
	                    </div>
	                </div>
				<?php } ?>

 			    <?php echo $template_inner_content; ?>

				<!-- ============================================================== -->
				<!-- footer -->
				<!-- ============================================================== -->
				<div class="footer4 b-t mini-spacer">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-6 m-b-30">
								<h5 class="m-b-20">Address</h5>
								<p><?php echo $template_vars['address_line_1']; ?> 
              					<br><?php echo $template_vars['address_line_2']; ?> </p>
							</div>
							<div class="col-lg-3 col-md-6 m-b-30">
								<h5 class="m-b-20">Phone</h5>
								<p><?php echo $template_vars['phone_number']; ?></p>
							</div>
							<div class="col-lg-3 col-md-6 m-b-30">
								<h5 class="m-b-20">Email</h5>
								<p><?php echo $template_vars['mail_address']; ?></p>
							</div>
							<div class="col-lg-3 col-md-6">
								<h5 class="m-b-20">Social</h5>
								<div class="round-social light">
									<?php if(isset($template_vars['social_facebook']) AND $template_vars['social_facebook'] != ""){ ?>
										<a href="<?php echo $template_vars['social_facebook']; ?>" class="link"><i class="fa fa-facebook"></i></a>
									<?php } ?>
									<?php if(isset($template_vars['social_twitter']) AND $template_vars['social_twitter'] != ""){ ?>
										<a href="<?php echo $template_vars['social_twitter']; ?>" class="link"><i class="fa fa-twitter"></i></a>
									<?php } ?>
									<?php if(isset($template_vars['social_google']) AND $template_vars['social_google'] != ""){ ?>
										<a href="<?php echo $template_vars['social_google']; ?>" class="link"><i class="fa fa-google-plus"></i></a>
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="f4-bottom-bar">
							<div class="row">
								<div class="col-md-12">
									<div class="d-flex font-14">
										<div class="m-t-10 m-b-10 copyright"><?php echo $template_vars['cms_footer_left']; ?></div>
										<div class="links ml-auto m-t-10 m-b-10"><?php echo $template_vars['cms_footer_right']; ?></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End footer -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Wrapper -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- All Jquery -->
			<!-- ============================================================== -->
			<script src="<?php echo $template_vars['assets_folder']; ?>/node_modules/jquery/dist/jquery.min.js"></script>
			<!-- Bootstrap popper Core JavaScript -->
			<script src="<?php echo $template_vars['assets_folder']; ?>/node_modules/popper/dist/popper.min.js"></script>
			<script src="<?php echo $template_vars['assets_folder']; ?>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
			<script src="<?php echo $template_vars['assets_folder']; ?>/js/jquery.colorbox-min.js"></script>
			<!--Custom JavaScript -->
			<script src="<?php echo $template_vars['assets_folder']; ?>/js/custom.js"></script>
			<!-- ============================================================== -->
			<!-- This page plugins -->
			<!-- ============================================================== -->
			<script type="text/javascript">

				$('a').on('click', function (event) {
					var $anchor = $(this);
					$('html, body').stop().animate({
						scrollTop: $($anchor.attr('href')).offset().top - 90
					}, 1000);
					event.preventDefault();
            // code 
            
        });
    </script>
</body>