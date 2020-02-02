<script src="{{URL::asset('assets/plugins/jquery/jQuery-2.1.4.min.js')}}"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="{{URL::asset('assets/plugins/bootstrap/js/tether.min.js')}}"></script>
<script src="{{URL::asset('assets/plugins/bootstrap/js/popper.min.js')}}" crossorigin="anonymous"></script>
<script src="{{URL::asset('assets/plugins/bootstrap/js/bootstrap.min.js')}}"></script>

<!-- slimscrollbar scrollbar JavaScript -->
<script src="{{URL::asset('assets/js/jquery.slimscroll.js')}}"></script>
<!--Wave Effects -->
<script src="{{URL::asset('assets/js/waves.js')}}"></script>
<!--Menu sidebar -->
<script src="{{URL::asset('assets/js/sidebarmenu.js')}}"></script>
<!--stickey kit -->
<script src="{{URL::asset('assets/plugins/sticky-kit-master/dist/sticky-kit.min.js')}}"></script>
<!--Custom JavaScript -->
<script src="{{URL::asset('assets/plugins/echarts/echarts-all.js')}}"></script>

<script src="{{URL::asset('assets/js/custom.js?v=' . mt_rand(10000, 99999) )}}"></script>
<!-- ============================================================== -->
<!-- Style switcher -->
<!-- ============================================================== -->
<script src="{{URL::asset('assets/js/OraSchool.js')}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/intlTelInput.min.js')}}"></script>
<script src="{{URL::asset('assets/plugins/ckeditor/ckeditor.js')}}"></script>
<script src="{{URL::asset('assets/js/summernote.js')}}"></script>
<script src="{{URL::asset('assets/plugins/toast-master/js/jquery.toast.js')}}"></script>
<script src="{{URL::asset('assets/plugins/datepicker/bootstrap-datepicker.js')}}"></script>
<script src="{{URL::asset('assets/js/jquery.colorbox-min.js')}}"></script>
<script src="{{URL::asset('assets/js/moment.min.js')}}"></script>
<script src="{{URL::asset('assets/plugins/humanize-duration/humanize-duration.js')}}"></script>

<script type="text/javascript" src="{{URL::asset('assets/plugins/global-calendars/jquery.plugin.min.js')}}"></script>
<script type="text/javascript" src="{{URL::asset('assets/plugins/global-calendars/jquery.calendars.all.js')}}"></script>
<?php if($panelInit->settingsArray['gcalendar'] != "gregorian"){ ?>
    <?php
    $gcalendar = $panelInit->settingsArray['gcalendar'];
    if($gcalendar == "ethiopic"){
        $gcalendar = "ethiopian";
    }
    ?>
    <script type="text/javascript" src="{{URL::asset('assets/plugins/global-calendars/jquery.calendars.'.$gcalendar.'.min.js')}}"></script>
<?php } ?>

<script src="{{URL::asset('assets/js/Angular/angular.min.js')}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/ng-file-upload/ng-file-upload-shim.min.js')}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/ng-file-upload/ng-file-upload.min.js')}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/AngularModules.js')}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/js/Angular/app.js?id=565556523&v=' . mt_rand(10000, 99999) )}}"></script>
<script src="{{URL::asset('assets/js/Angular/routes.js?id=54564564&v=' . mt_rand(10000, 99999) )}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/plugins/Dialog-Modal-Popup-Plugin-jQuery-Fallr/src/js/jquery-fallr-2.0.1.min.js' )}}" type="text/javascript"></script>

@include('partials.angular_controllers')
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

{{-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --}}

<script>
	function hideModal() {
		showHideLoad(true);
		$('.modal-backdrop').fadeOut(500).remove();
		$('body').removeClass('modal-open');
	}
	$(document).ready(function(){
		$('.main-grid-0').show();
		setTimeout(function(){
			var hash = window.location.hash
			var target_btn = hash.split('#/').pop().split('/')[0];
			$('.main-grid-0 .nav-link[data-type="'+target_btn+'"]').css('background-color', '#302b6d');
			$('.main-grid-0 .nav-link').click(function(){
				setTimeout(function(){
					hideModal();
				}, 1000);
				$('.main-grid-0 .nav-link').css('background-color', '#443f84');
				$(this).css('background-color', '#302b6d');
			})
		}, 300);
		$(window).on('hashchange', function(e){
			hideModal();
		});
	})
</script>

{{-- Android functionality --}}
<script type="text/javascript">
	$(document).ready(function(){
		if (typeof Android !== 'undefined') {
			Android.setToken("{{ \App\Models2\User::getUserAuhtToken() }}");
		}
	});
</script>

{{-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --}}

{{-- // MAD-RIPPLE // (jQ+CSS) --}}
<script type="text/javascript" src="{{URL::asset('assets/js/ripples-effect.js')}}"></script>

<!-- lightGallery scripts -->
<script src="https://f.vimeocdn.com/js/froogaloop2.min.js" type="text/javascript"></script>
<script src="{{URL::asset('assets/plugins/lightGallery/dist/js/lightgallery-all.min.js')}}" type="text/javascript"></script>
<script src="{{URL::asset('assets/plugins/lightGallery/lib/jquery.mousewheel.min.js')}}" type="text/javascript"></script>

{{-- Back to top --}}
<script type="text/javascript">
	var btn = $('#back-to-top');

	$(window).scroll(function() {
	  if ($(window).scrollTop() > 300) {
	    btn.addClass('show');
	  } else {
	    btn.removeClass('show');
	  }
	});

	btn.on('click', function(e) {
	  e.preventDefault();
	  $('html, body').animate({scrollTop:0}, '300');
	});
</script>