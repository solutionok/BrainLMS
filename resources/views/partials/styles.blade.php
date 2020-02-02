<link href="{{URL::asset('assets/plugins/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">

<?php if($panelInit->isRTL == 1){ ?>
    <link href="{{URL::asset('assets/css/style-rtl.css')}}" rel="stylesheet">
    <link href="{{URL::asset('assets/plugins/bootstrap-rtl-master/dist/css/custom-bootstrap-rtl.css')}}" rel="stylesheet" type="text/css" />
<?php }else{ ?>
    <link href="{{URL::asset('assets/css/style.css')}}" rel="stylesheet">
<?php } ?>

<link href="{{URL::asset('assets/css/colors/'.$panelInit->defTheme.'.css')}}" id="theme" rel="stylesheet">
<link href="{{URL::asset('assets/css/custom.css')}}" id="theme" rel="stylesheet">
<link href="{{URL::asset('assets/css/intlTelInput.css')}}" rel="stylesheet">
<link href="{{URL::asset('assets/plugins/global-calendars/jquery.calendars.picker.css')}}" rel="stylesheet" type="text/css" />
<link href="{{URL::asset('assets/css/summernote.css')}}" rel="stylesheet">
<link href="{{URL::asset('assets/css/main.css?v=' . mt_rand(10000, 99999) )}}" rel="stylesheet">
<link href="{{URL::asset('assets/plugins/Dialog-Modal-Popup-Plugin-jQuery-Fallr/src/css/jquery-fallr-2.0.1.css') }}" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

{{-- for pdf images views --}}
{{-- <link rel="stylesheet" type="text/css" href="{{URL::asset('assets/css/image-gallery-style.css')}}"> --}}

<!-- LightGallery Styles -->
<link rel="stylesheet" type="text/css" href="{{URL::asset('assets/plugins/lightGallery/dist/css/lightgallery.css')}}">