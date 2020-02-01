<!DOCTYPE html >
<html <?php if($template_vars['rtl'] == 1){ echo "dir='rtl'"; }?> >
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $template_vars['site_title']; ?> | <?php echo $template_vars['page_title']; ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
    <!-- Bootstrap Select-->
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/vendor/bootstrap-select/css/bootstrap-select.min.css">
    <!-- owl carousel-->
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/css/style.<?php echo $template_vars['theme']; ?>.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/css/custom.css">
    <!-- Favicon and apple touch icons-->
    <?php if($template_vars['favicon'] == "e"){ ?>
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo \URL::asset('assets/images/favicon.png'); ?>">
    <?php } ?>
    <?php if($template_vars['rtl'] == 1){ ?>
      <link rel="stylesheet" href="<?php echo $template_vars['assets_folder']; ?>/css/rtl.css" id="theme-stylesheet">
    <?php } ?>
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div id="all">
      <!-- Top bar-->
      <div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none contact_topbar">
              <p><?php echo $template_vars['language']['contactInfo']; ?> <i style="padding-left:10px;" class="fa fa-phone"></i> <?php echo $template_vars['phone_number']; ?> <i style="padding-left:10px;" class="fa fa-envelope"></i> <?php echo $template_vars['mail_address']; ?></p>
            </div>
            <div class="col-md-6">
              <div class="d-flex justify-content-md-end justify-content-between">
                <ul class="list-inline contact-info d-block d-md-none">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-phone"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>
                <div class="login">
                  <a href="<?php echo \URL::to('/login'); ?>" class="login-btn"><i class="fa fa-sign-in"></i><span class="d-none d-md-inline-block"><?php echo $template_vars['language']['signIn']; ?></span></a>
                  <a href="<?php echo \URL::to('/register'); ?>" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block"><?php echo $template_vars['language']['signUp']; ?></span></a>
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
          </div>
        </div>
      </div>
      <!-- Top bar end-->
      <!-- Navbar Start-->
      <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="index.html" class="navbar-brand home">
            <?php echo $template_vars['site_title']; ?>
          </a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only"><?php echo $template_vars['language']['toggleDropdown']; ?></span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
                <?php foreach ($navbar_links as $value) { ?>
                  <li class="nav-item <?php if($value['page_permalink'] == $permalink['page_permalink']){ echo 'active'; } ?>"><a href="<?php echo \URL::to($value['page_permalink']); ?>"> <?php echo $value['page_title']; ?> </a></li>
                <?php } ?>
              </ul>
            </div>
          </div>
        </div>
      </header>
      <!-- Navbar End-->
      
      <?php if(isset($template_vars['page_slider_images']) && count($template_vars['page_slider_images']) > 0 && $permalink['page_template'] != "gallery"): ?>
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
                 <?php if(isset($value['image_title'])){ echo "<h5>".$value['image_title']."</h5>"; } ?>
                 <?php if(isset($value['image_description'])){ echo "<p>".$value['image_description']."</p>"; } ?>
               </div>
              </div>

            <?php } ?>

          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      <?php else: ?>

        <div id="heading-breadcrumbs">
          <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
              <div class="col-md-7">
                <h1 class="h2"><?php echo $template_vars['page_title']; ?></h1>
              </div>
              <div class="col-md-5">
                <ul class="breadcrumb d-flex justify-content-end">
                  <li class="breadcrumb-item"><a href="<?php echo \URL::to('/'); ?>"><?php echo $template_vars['site_title']; ?></a></li>
                  <li class="breadcrumb-item active"><?php echo $template_vars['page_title']; ?></li>
                </ul>
              </div>
            </div>
          </div>
        </div>

      <?php endif; ?>
      
      <?php echo $template_inner_content; ?>

      <!-- FOOTER -->
      <footer class="main-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-4">
              <h4 class="h6">Latest News</h4>
              <ul class="list-unstyled footer-blog-list">
                <?php foreach ($template_vars['footer_news_list'] as $value) { ?>
                  <li class="d-flex align-items-center">
                    <div class="image"><img src="<?php echo \URL::asset('uploads/news/'.$value['newsImage']); ?>" alt="..." class="img-fluid"></div>
                    <div class="text">
                      <h5 class="mb-0"> <a href="post.html"><?php echo $value['newsTitle']; ?></a></h5>
                    </div>
                  </li>
                <?php } ?>
              </ul>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-4">
              <h4 class="h6">Links</h4>
              <div class="row">
                <?php reset($navbar_links); foreach ($navbar_links as $value) { ?>
                  <div class="col-sm-6">
                    <a style="font-size:12px;padding: 5px;" href="<?php echo \URL::to($value['page_permalink']); ?>"> <?php echo $value['page_title']; ?> </a>
                  </div>
                <?php } ?>
              </div>
            </div>
            <div class="col-lg-4">
              <h4 class="h6">Contact</h4>
              <p class="text-uppercase">
                <strong><?php echo $template_vars['site_title']; ?> </strong>
                <br><?php echo $template_vars['address_line_1']; ?> 
                <br><?php echo $template_vars['address_line_2']; ?> 
                <br><i class="fa fa-phone"></i> <?php echo $template_vars['phone_number']; ?> 
                <br/><i class="fa fa-envelope"></i> <?php echo $template_vars['mail_address']; ?>
              <hr class="d-block d-lg-none">
            </div>
          </div>
        </div>
        <div class="copyrights">
          <div class="container">
            <div class="row">
              <div class="col-lg-4 text-center-md">
                <p><?php echo $template_vars['cms_footer_left']; ?></p>
              </div>
              <div class="col-lg-8 text-right text-center-md">
                <?php echo $template_vars['cms_footer_right']; ?>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- Javascript files-->
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/jquery/jquery.min.js"></script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/js/jquery.parallax-1.1.3.js"></script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="<?php echo $template_vars['assets_folder']; ?>/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
  </body>
</html>