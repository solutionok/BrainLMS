<header class="topbar <?php if($panelInit->settingsArray['leftmenuScroller'] == "e"){ echo "topbarSticky"; } ?> no-print">
    <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
        <!-- ============================================================== -->
        <!-- Logo -->
        <!-- ============================================================== -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/portal#/">
                <?php
                $panelInit->settingsArray['siteLogo'] = "siteName";
                if($panelInit->settingsArray['siteLogo'] == "siteName"){
                    ?>
                    <span>
                        <span class="dark-logo" ng-show="$root.dashboardData.baseUser.defTheme.indexOf('dark') == -1"><?php echo $panelInit->settingsArray['siteTitle']; ?></span>
                        <span class="light-logo" ng-show="$root.dashboardData.baseUser.defTheme.indexOf('dark') !== -1"><?php echo $panelInit->settingsArray['siteTitle']; ?></span>
                    </span>
                    <?php
                }elseif($panelInit->settingsArray['siteLogo'] == "text"){
                    ?>
                    <span>
                        <span class="dark-logo" ng-show="$root.dashboardData.baseUser.defTheme.indexOf('dark') == -1"><?php echo $panelInit->settingsArray['siteLogoAdditional']; ?></span>
                        <span class="light-logo" ng-show="$root.dashboardData.baseUser.defTheme.indexOf('dark') !== -1"><?php echo $panelInit->settingsArray['siteLogoAdditional']; ?></span>
                    </span>
                    <?php
                }elseif($panelInit->settingsArray['siteLogo'] == "image"){
                    ?>
                    <span>
                        <img src="<?php echo URL::asset('assets/images/logo-dark.png'); ?>" alt="homepage" class="dark-logo" />
                        <img src="<?php echo URL::asset('assets/images/logo-light.png'); ?>" class="light-logo" alt="homepage" />
                    </span>
                    <?php
                }
                ?>
                <img class="icon-logo" src="{{ asset('favicon.ico') }}" width="26px">
             </a>
        </div>
        <!-- ============================================================== -->
        <!-- End Logo -->
        <!-- ============================================================== -->
        <div class="navbar-collapse">
            <!-- ============================================================== -->
            <!-- toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav mr-auto mt-md-0 ">
                <!-- This is  -->
                <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="icon-arrow-left-circle"></i></a> </li>
            </ul>
            <!-- ============================================================== -->
            <!-- User profile and search -->
            <!-- ============================================================== -->
            <ul class="navbar-nav my-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="{{URL::to('/dashboard/profileImage/'.$users['id'])}}" alt="user" class="profile-pic" /></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <ul class="dropdown-user">
                            <li>
                                <div class="dw-user-box">
                                    <div class="u-img"><img src="{{URL::to('/dashboard/profileImage/'.$users['id'])}}" alt="user"></div>
                                    <div class="u-text">
                                        <h4>{{$users['fullName']}}</h4>
                                        <p class="text-muted">{{$users['email']}}</p></div>
                                </div>
                            </li>
                            <li role="separator" class="divider"></li>
                            <?php if($panelInit->can('AccountSettings.myInvoices')){ ?><a href="index.php/portal#/account/invoices" class="dropdown-item"><i class="ti-wallet"></i> <?php echo $panelInit->language['myInvoices']; ?></a><?php } ?>
                            <?php if($panelInit->can('AccountSettings.Messages')){ ?><a href="index.php/portal#/messages" class="dropdown-item"><i class="mdi mdi-message-text-outline"></i> <?php echo $panelInit->language['Messages']; ?></a><?php } ?>
                            <?php if($panelInit->can( array("AccountSettings.ChgProfileData","AccountSettings.chgEmailAddress","AccountSettings.chgPassword") )) { ?><div class="dropdown-divider"></div> <a href="portal#/account" class="dropdown-item"><i class="ti-settings"></i> <?php echo $panelInit->language['AccountSettings']; ?></a><?php } ?>
                            <div class="dropdown-divider"></div>
                            <a href="{{URL::to('/logout')}}" class="dropdown-item logoutBtn">
                            	<i class="fa fa-power-off"></i> <?php echo $panelInit->language['logout']; ?>
                            </a>
                        </ul>
                    </div>
                </li>

                {{-- <li class="nav-item dropdown" style="width:45px;">
                    <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="/portal#/mobileNotif" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	<i class="fa fa-bell"></i>
                    </a>
                </li> --}}

                <?php if( $panelInit->settingsArray['languageAllow'] == "1" ){ ?>
                    <li class="nav-item dropdown" style="width:45px;">
                        <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-language"></i></a>
                        <div class="dropdown-menu  dropdown-menu-right">
                            <?php foreach ($languagesList as $value) { ?>
                                <a class="dropdown-item <?php if($value->id == $users['defLang']){ echo "active"; } ?>" ng-click="changeLang('<?php echo $value->id; ?>')"><?php echo $value->languageTitle; ?></a>
                            <?php } ?>
                        </div>
                    </li>
                <?php } ?>

                <li class="nav-item dropdown" style="width:45px;">
                    <a href="{{URL::to('/logout')}}" class="nav-link text-muted waves-effect waves-dark logoutBtn">
                    	<i class="fa fa-power-off"></i>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="right-side-toggle text-muted nav-link " href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-view-grid"></i></a>
                </li>

            </ul>
        </div>
    </nav>
</header>

@section('scripts')
	<script type="text/javascript">
		$(document).ready(function(){
			$('.logoutBtn').click(function(e){
				e.preventDefault();
				if(confirm('Are you sure to logout?')) {
					window.location.href = "{{ URL::to('/logout') }}";
				}
			});
		});
	</script>
@append