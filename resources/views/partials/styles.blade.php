<link href="{{URL::asset('assets/plugins/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">

<?php if($panelInit->isRTL == 1){ ?>
    <link href="{{URL::asset('assets/css/style-rtl.css')}}" rel="stylesheet">
    <link href="{{URL::asset('assets/plugins/bootstrap-rtl-master/dist/css/custom-bootstrap-rtl.css')}}" rel="stylesheet" type="text/css" />
<?php }else{ ?>
    <link href="{{URL::asset('assets/css/style.css')}}" rel="stylesheet">
<?php } ?>

<link href="{{URL::asset('assets/css/main.css')}}" rel="stylesheet">
<link href="{{URL::asset('assets/css/colors/'.$panelInit->defTheme.'.css')}}" id="theme" rel="stylesheet">
<link href="{{URL::asset('assets/css/custom.css')}}" id="theme" rel="stylesheet">
<link href="{{URL::asset('assets/css/intlTelInput.css')}}" rel="stylesheet">
<link href="{{URL::asset('assets/plugins/global-calendars/jquery.calendars.picker.css')}}" rel="stylesheet" type="text/css" />
<link href="{{URL::asset('assets/css/summernote.css')}}" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<link href="{{URL::asset('assets/plugins/jQuery.ptTimeSelect-0.8/src/jquery.ptTimeSelect.css')}}" rel="stylesheet">