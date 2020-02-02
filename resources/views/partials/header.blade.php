<style type="text/css">
	.topbar ul.dropdown-user {
		width: auto;
	}
	.topbar .profile-pic {
	    width: 40px;
	    height: 40px;
	    border-radius: 100%;
	    background: #FFF;
	    padding: 2px;
	    margin-top: 3px
	}
	.topbar .top-navbar {
		/*background-color: #555;*/
		background: #1a2a6c;
		background: -webkit-linear-gradient(to right, #fdbb2d, #b21f1f, #1a2a6c);
		background: linear-gradient(to right, #fdbb2d, #b21f1f, #1a2a6c);
	}
	.navbar-header {
		border-radius: 50%;
		margin: 4px;
		margin-left: 9px;
		margin-top: 3px;
		width: 55px !important;
		height: 47px;
	}
	.topbar .navbar-header {
		background-color: inherit;
		box-shadow: inherit;
	}
</style>

<header class="topbar <?php if($panelInit->settingsArray['leftmenuScroller'] == "e"){ echo "topbarSticky"; } ?> no-print">
  <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
      <div class="nav-item dropdown" style="margin-right: -15px;">
          <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="{{URL::to('/dashboard/profileImage/'.$users['id'])}}" alt="user" class="profile-pic" /></a>
          <div class="dropdown-menu dropdown-menu-right" style="position: fixed; top: 60px; left: 0">
              <ul class="dropdown-user" style="margin-bottom: 0">
                  <li>
                      <div class="dw-user-box" style="padding: 3px 15px">
                          <div class="u-img" style="display: inline-grid; vertical-align: inherit;">
                          	<img src="{{URL::to('/dashboard/profileImage/'.$users['id'])}}" alt="user"
                          		style="
                          			border: 1px solid #DDD;
														    padding: 5px;
														    border-radius: 50%;
                          		">
                          </div>
                          <div class="u-text" style="
                          	border-left: 1px solid #EEE;
    												margin-left: 7px;"
    												>
                              <h4 class="text-primary">{{$users['fullName']}}</h4>
                              @if($users['email'])
                              	<p class="text-muted">{{$users['email']}}</p>
                              @endif
                            	<p class="text-muted">
                            		Role: {{$users['role']}} - ID: {{$users['id']}}
                            	</p>
                           </div>
                      </div>
                  </li>
                  <div class="dropdown-divider"></div>
                  <a href="portal#/user-profile" class="dropdown-item">
                  	<i class="fa fa-user"></i> My Profile
                  </a>
                  @if($panelInit->can( array("AccountSettings.ChgProfileData","AccountSettings.chgEmailAddress","AccountSettings.chgPassword") ))
                  	<div class="dropdown-divider"></div>
                  	<a href="portal#/account" class="dropdown-item">
	                  	<i class="ti-settings"></i>
	                  	<?php echo $panelInit->language['AccountSettings']; ?>
	                  </a>
                  @endif
                  <div class="dropdown-divider"></div>
                  <a href="{{URL::to('/logout')}}" class="dropdown-item logoutBtn">
                  	<i class="fa fa-power-off"></i> <?php echo $panelInit->language['logout']; ?>
                  </a>
              </ul>
          </div>
      </div>
      <div class="navbar-header navbar-nav" style="">
          <a class="navbar-brand" data-ripple="rgba(45,45,45,.5)" style="padding-right: 6px" href="/portal#">
          		<i class="mdi mdi-home" style="
	          		display: block;
						    font-size: 32px;
						    margin-top: -4px;
						    color: #FAFAFA;
						    text-shadow: 1px 1px 3px #AAA;
						    margin-left: 3px;"></i>
              {{-- <img class="icon-logo" src="{{ asset('assets/images/cutebrains_sm_logo.png') }}" style="margin-top: -8px; margin-left: 2px"> --}}
           </a>
          <a href="/" id="refreshApp" data-ripple="rgba(45,45,45,.5)">
					  <i class="mdi mdi-refresh" style="
	        		display: block;
					    font-size: 31px;
					    margin-top: -4px;
					    color: #FAFAFA;
					    text-shadow: 1px 1px 3px #AAA;
					    margin-left: 10px;"></i>
				  </a>
      </div>
      <div class="navbar-collapse">
          <ul class="navbar-nav mr-auto mt-md-0 ">
              {{-- <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)" style="margin-top: 8px;">
              	<i class="ti-menu" style="color: #FAFAFA; font-size: 28px;"></i></a>
              </li>
              <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="icon-arrow-left-circle"></i></a> </li> --}}
          </ul>
          <ul class="navbar-nav my-lg-0" style="margin-right: -8px">
          		@if(Auth::user()->role != 'parent')
	              <li class="nav-item dropdown" style="width:45px;">
	                  <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" id="searchBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-top: 8px;">
	                  	<i class="fa fa-search" style="color: #FAFAFA; font-size: 25px;"></i>
	                  </a>
	                  <div class="dropdown-menu dropdown-menu-right search-input-section" style="padding: 10px">
	                    <div class="input-group">
		                    <input type="text" class="form-control" name="search_value" placeholder="Type parent, teacher, student or employee" aria-describedby="button-addon2">
											  <div class="input-group-append">
											    <a class="btn btn-primary" href="portal#/global-search" id="button-addon2" style="font-size: 18px; border-radius: 0 5px 5px 0;">
											    	<i class="fa fa-search"></i>
											    </a>
											  </div>
										  </div>
	                  </div>
	              </li>
              @endif
              @include('partials.header-notification-icon')
          </ul>
      </div>
  </nav>
</header>

@section('scripts')
	<script type="text/javascript">
		$(document).ready(function(){
			var logout = function(){
    		setTimeout(function(){
    			current_firebase_token = '';
    			if (typeof Android !== 'undefined') {
    				current_firebase_token = '?current_firebase_token=' + Android.getFireToken();
    			}
		    	window.location.href = "{{ URL::to('/logout') }}" + current_firebase_token;
    		}, 250);
			};

			$('.logoutBtn').click(function(e){
				e.preventDefault();
				$.fallr.show({
				  buttons : {
				    button1 : {text: 'Yes', danger: true, onclick: logout},
				    button2 : {text: 'Cancel'}
				  },
				  content : '<p>Are you sure to logout?</p>',
				  icon    : 'key'
				});
			});

			$('#searchBtn').click(function(){
				$('.search-input-section input').attr('autofocus', 'true');
			});

			$('#refreshApp').click(function(){
				showHideLoad();
			});
		});
	</script>
@append