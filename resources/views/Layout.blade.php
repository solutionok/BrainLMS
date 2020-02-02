<!DOCTYPE html>
<html lang="en" <?php if($panelInit->isRTL == 1){ ?>dir="rtl"<?php } ?>>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="CuteBrains">
	    <base href="<?php echo $panelInit->baseURL; ?>" />
	    <meta name="site_title" content="{{ $panelInit->settingsArray['siteTitle'] }}">
	    <?php if($panelInit->settingsArray['favicon'] == "e"){ ?>
	        <link rel="icon" type="image/png" sizes="16x16" href="{{URL::asset('assets/images/favicon.png')}}">
	    <?php } ?>
	    <title><?php echo $panelInit->settingsArray['siteTitle']; ?></title>
	    @include('partials.styles')
	    @yield('styles')
	</head>
	<body class="fix-header <?php if($panelInit->settingsArray['leftmenuScroller'] == "e"){ echo "fix-sidebar"; } ?> card-no-border" ng-app="OraSchool" ng-controller="mainController">
	    <div class="preloader">
	        <svg class="circular" viewBox="25 25 50 50">
	            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
	        </svg>
	    </div>
	    <div class="preloader" id="overlay" style="opacity:0.9;">
	        <svg class="circular" viewBox="25 25 50 50">
	            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
	        </svg>
	    </div>
	    <div id="main-wrapper">
	    		@include('partials.header')
	    		@include('partials.sidebar')
	    		@include('partials.wrapper')
	    		@include('partials.modals')
	    </div>
	    <a id="back-to-top" data-ripple></a>
	    <input type="hidden" id="rooturl" value="{{URL::asset('/')}}"/>
	    <input type="hidden" id="utilsScript" value="{{URL::asset('assets/js/utils.js')}}"/>
	    @include('partials.scripts')
	    @yield('scripts')
	</body>
</html>
