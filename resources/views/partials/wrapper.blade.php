<style type="text/css">
	.page-wrapper {
		margin-bottom: 61px;
		padding-bottom: 0 !important;
	}
	.main-grid-0 {
		position: fixed;
		bottom: 0;
		z-index: 999;
		width: 100%;
		left: 0;
	}
	@if(env('PRODUCTION_TYPE') == 'sxd')
		@if(Auth::user()->role == 'student')
			.main-grid-0 .nav-item {
				width: 25%;
				text-align: center;
			}
		@else
			.main-grid-0 .nav-item {
				width: 20%;
				text-align: center;
			}
		@endif
	@else
		.main-grid-0 .nav-item {
			width: 25%;
			text-align: center;
		}
	@endif
	.main-grid-0 .nav-item a {
    border-radius: 0px;
		font-size: 22px;
		cursor: pointer;
		color: #FFF;
    border-left: 5px solid #302b6d;
    cursor: pointer;
    background-color: #443f84;
    position: relative;
    padding: 12px 1px;
    text-align: center;
	}
	.main-grid-0 .nav-item:first-child a {
    border-left: 0px solid #555;
	}
	.main-grid-0 .nav-item a i {
	 	margin-top: -4px;
    display: block;
    margin-bottom: 12px;
	}
	.main-grid-0 .nav-item a small {
		font-size: 13px;
    display: block;
    margin-top: -8px;
    margin-bottom: -8px;
	}
	.main-grid-0 .nav-link:focus,
	.main-grid-0 .nav-link:hover {
		border-color: #302b6d !important;
		background-color: #302b6d;
	}

	@media(max-width: 430px) {
		.main-grid-0 .nav-item.vision_2020 a {
			padding-top: 5px;
		}
		.main-grid-0 .nav-item.vision_2020 i {
			margin-bottom: 10px;
		}
		.main-grid-0 .nav-item.vision_2020 small {
			line-height: 14px;
		}
	}
</style>

<div class="page-wrapper">
  <div class="container-fluid" style="padding: 7px 20px !important">
      <div id='parentDBArea' ng-view></div>
  </div>
  @include('partials.footer')

  @if(Auth::user()->role == 'admin')
	  <div class="main-grid-0" style="display: none;">
			<ul class="nav nav-tabs">
				<li class="nav-item">
			    <a class="nav-link" data-ripple data-type="teachers" href="portal#/teachers">
			    	<i class="fa fa-users"></i>
			    	<small>Teachers</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="materials" href="portal#/materials">
			    	<i class="fa fa-address-book"></i>
			    	<small>Syllabus</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="messages" href="portal#/messages">
			    	<i class="fa fa-comments"></i>
			    	<small>Messages</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="newsboard" href="portal#/newsboard" style="padding-top: 4px">
			    	<i class="mdi mdi-bullhorn" style="font-size: 25px; margin-bottom: 4px;"></i>
			    	<small>Notice</small>
			    </a>
			  </li>
			  @if(env('PRODUCTION_TYPE') == 'sxd')
				  <li class="nav-item vision_2020">
				    <a class="nav-link" data-ripple data-type="vision_2020" href="portal#/vision_2020">
				    	<i class="fa fa-eye"></i>
				    	<small>Vision 2020</small>
				    </a>
				  </li>
			  @endif
			</ul>
		</div>
	@elseif(Auth::user()->role == 'parent')
		<div class="main-grid-0" style="display: none;">
			<ul class="nav nav-tabs">
				<li class="nav-item">
			    <a class="nav-link" data-ripple data-type="subjects" href="portal#/subjects">
			    	<i class="fa fa-book"></i>
			    	<small>Subjects</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="classes" href="portal#/classes">
			    	<i class="fa fa-graduation-cap"></i>
			    	<small>Classes</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="materials" href="portal#/materials">
			    	<i class="fa fa-address-book"></i>
			    	<small>Syllabus</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="messages" href="portal#/messages">
			    	<i class="fa fa-comments"></i>
			    	<small>Messages</small>
			    </a>
			  </li>
			  @if(env('PRODUCTION_TYPE') == 'sxd')
				  <li class="nav-item">
				    <a class="nav-link" data-ripple data-type="vision_2020" href="portal#/vision_2020" style="padding-top: 5px">
				    	<i class="fa fa-eye" style="margin-bottom: 10px"></i>
				    	<small style="line-height: 14px">Vision 2020</small>
				    </a>
				  </li>
			  @endif
			</ul>
		</div>
	@elseif(Auth::user()->role == 'teacher')
		<div class="main-grid-0" style="display: none;">
			<ul class="nav nav-tabs">
				<li class="nav-item">
			    <a class="nav-link" data-ripple data-type="subjects" href="portal#/subjects">
			    	<i class="fa fa-book"></i>
			    	<small>Subjects</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="classes" href="portal#/classes">
			    	<i class="fa fa-graduation-cap"></i>
			    	<small>Classes</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="materials" href="portal#/materials">
			    	<i class="fa fa-address-book"></i>
			    	<small>Syllabus</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="messages" href="portal#/messages">
			    	<i class="fa fa-comments"></i>
			    	<small>Messages</small>
			    </a>
			  </li>
			  @if(env('PRODUCTION_TYPE') == 'sxd')
				  <li class="nav-item">
				    <a class="nav-link" data-ripple data-type="vision_2020" href="portal#/vision_2020" style="padding-top: 5px">
				    	<i class="fa fa-eye" style="margin-bottom: 10px"></i>
				    	<small style="line-height: 14px">Vision 2020</small>
				    </a>
				  </li>
			  @endif
			</ul>
		</div>
	@elseif(Auth::user()->role == 'student')
		<div class="main-grid-0" style="display: none;">
			<ul class="nav nav-tabs">
				<li class="nav-item">
			    <a class="nav-link" data-ripple data-type="subjects" href="portal#/subjects">
			    	<i class="fa fa-book"></i>
			    	<small>Subjects</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="classes" href="portal#/classes">
			    	<i class="fa fa-graduation-cap"></i>
			    	<small>Classes</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="materials" href="portal#/materials">
			    	<i class="fa fa-address-book"></i>
			    	<small>Syllabus</small>
			    </a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-ripple data-type="messages" href="portal#/messages">
			    	<i class="fa fa-comments"></i>
			    	<small>Messages</small>
			    </a>
			  </li>
			  @if(env('PRODUCTION_TYPE') == 'sxd')
				  <li class="nav-item">
				    <a class="nav-link" data-ripple data-type="vision_2020" href="portal#/vision_2020">
				    	<i class="fa fa-eye"></i>
				    	<small>Vision 2020</small>
				    </a>
				  </li>
			  @endif
			</ul>
		</div>
	@endif
</div>