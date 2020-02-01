<aside class="left-sidebar <?php if($panelInit->settingsArray['leftmenuScroller'] == "e"){ echo "enableSlimScroller"; }else{ echo "menuTraditional"; if($panelInit->isRTL == 1){ echo " menuTraditionalRTL "; } } ?> no-print" style="padding-bottom:60px;">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- User profile -->
        <div class="user-profile">
            <!-- User profile image -->
            <div class="profile-img"> <img src="{{URL::to('/dashboard/profileImage/'.$users['id'])}}" alt="user" width="50" height="50" /> </div>
            <!-- User profile text-->
            <div class="profile-text"> <a href="javascript:void(0)" class="dropdown-toggle link u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">{{$users['fullName']}} <span class="caret"></span></a>
                <div class="dropdown-menu animated flipInY">
                    <?php if($panelInit->can('AccountSettings.myInvoices')){ ?><a href="index.php/portal#/account/invoices" class="dropdown-item"><i class="ti-wallet"></i> <?php echo $panelInit->language['myInvoices']; ?></a><?php } ?>
                    <?php if($panelInit->can('AccountSettings.Messages')){ ?><a href="index.php/portal#/messages" class="dropdown-item"><i class="mdi mdi-message-text-outline"></i> <?php echo $panelInit->language['Messages']; ?></a><?php } ?>
                    <?php if($panelInit->can( array("AccountSettings.ChgProfileData","AccountSettings.chgEmailAddress","AccountSettings.chgPassword") )) { ?><div class="dropdown-divider"></div> <a href="index.php/portal#/account" class="dropdown-item"><i class="ti-settings"></i> <?php echo $panelInit->language['AccountSettings']; ?></a><?php } ?>
                    <div class="dropdown-divider"></div> <a href="{{URL::to('/logout')}}" class="dropdown-item"><i class="fa fa-power-off"></i> <?php echo $panelInit->language['logout']; ?></a>
                </div>
            </div>
        </div>
        <!-- End User profile text-->
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav" <?php if($panelInit->settingsArray['leftmenuScroller'] != "e"){ echo "style='padding-bottom:60px;'"; }?>>
                <?php

                foreach ($panelInit->panelItems as $key => $value) {
                	if($value != '') {
                    if(isset($value['activated']) AND !strpos($panelInit->settingsArray['activatedModules'],$value['activated']) ){ continue;  }
                    if(isset($value['role_perm'])){
                        if($panelInit->can($value['role_perm']) == false){
                            continue;
                        }
                    }

                    echo "<li><a ";
                    if(isset($value['children'])){
                        echo "class='has-arrow'";
                    }else{
                        echo "class='aj scrollTop'";
                    }
                    if(isset($value['url'])){
                        echo " href='".URL::to($value['url'])."'";
                    }
                    echo " aria-expanded='false'>";

                    $style = "style='";
                    if(isset($value['margin-left'])) {
                    	$style .= "margin-left: ".$value['margin-left'].";";
                    }
                    if(isset($value['margin-right'])) {
                    	$style .= "margin-right: ".$value['margin-right'].";";
                    }
                    $style .= "'";

                    echo "<i ". $style ." class='".$value['icon']."'></i><span class='hide-menu'>";
                    if(isset($panelInit->language[$value['title']])){
                        echo $panelInit->language[$value['title']];
                    }else{
                        echo $value['title'];
                    }
                    echo "</span>";
                    echo "</a>";
                    if(isset($value['children'])){
                        echo '<ul aria-expanded="false" class="collapse">';
                        foreach ($value['children'] as $key2 => $value2) {
                            if(isset($value2['activated']) AND !strpos($panelInit->settingsArray['activatedModules'],$value2['activated']) ){ continue;  }
                            if(isset($value2['role_perm'])){
                                if($panelInit->can($value2['role_perm']) == false){
                                    continue;
                                }
                            }

                            echo "<li><a ";
				                    if(isset($value2['children'])){
				                        echo "class='has-arrow'";
				                    }else{
				                        echo "class='aj scrollTop'";
				                    }
				                    if(isset($value2['url'])){
				                        echo " href='".URL::to($value2['url'])."'";
				                    }
				                    echo " aria-expanded='false'>";

				                    $style = "style='";
				                    if(isset($value2['margin-left'])) {
				                    	$style .= "margin-left: ".$value2['margin-left'].";";
				                    }
				                    if(isset($value2['margin-right'])) {
				                    	$style .= "margin-right: ".$value2['margin-right'].";";
				                    }
				                    $style .= "'";

				                    echo "<i ". $style ."'></i><span class='hide-menu'>";
                            if(isset($panelInit->language[$value2['title']])){
                                echo $panelInit->language[$value2['title']];
                            }else{
                                echo $value2['title'];
                            }
                            echo "</span>";
                    				echo "</a>";
                            if(isset($value2['children'])){
				                        echo '<ul aria-expanded="false" class="collapse">';
				                        foreach ($value2['children'] as $key3 => $value3) {
				                            if(isset($value3['activated']) AND !strpos($panelInit->settingsArray['activatedModules'],$value3['activated']) ){ continue;  }
				                            if(isset($value3['role_perm'])){
				                                if($panelInit->can($value3['role_perm']) == false){
				                                    continue;
				                                }
				                            }

				                            echo "<li>";
				                            echo "<a class='aj scrollTop' href='".URL::to($value3['url'])."'>";
				                            if(isset($panelInit->language[$value3['title']])){
				                                echo $panelInit->language[$value3['title']];
				                            }else{
				                                echo $value3['title'];
				                            }
				                            echo "</a>";
				                            echo "</li>";
				                        }
				                        echo "</ul>";
				                    }
                            echo "</li>";
                        }
                        echo "</ul>";
                    }
                    echo "</li>";
                	}
                }
                ?>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
    <!-- Bottom points-->
    <div class="sidebar-footer">
        <!-- item-->
        <a href="{{URL::to('portal#/account')}}" class="link" data-toggle="tooltip" title="<?php echo $panelInit->language['AccountSettings']; ?>"><i class="ti-settings"></i></a>
        <!-- item-->
        <a href="{{URL::to('portal#/messages')}}" class="link" data-toggle="tooltip" title="<?php echo $panelInit->language['Messages']; ?>"><i class="mdi mdi-gmail"></i></a>
        <!-- item-->
        <a href="{{URL::to('/logout')}}" class="link" data-toggle="tooltip" title="<?php echo $panelInit->language['logout']; ?>"><i class="mdi mdi-power"></i></a>
    </div>
    <!-- End Bottom points-->
</aside>