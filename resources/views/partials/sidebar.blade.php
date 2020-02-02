<style type="text/css">
	#sidebarnav {
		padding-bottom: 65px;
	}
	.left-sidebar {
		width: 180px !important;
		padding-bottom: 2px !important;
	}
	.topbar .top-navbar {
		min-height: 50px !important;
	}
	.topbar .top-navbar .navbar-nav>.nav-item>.nav-link {
		line-height: 38px !important;
	}
	.navbar-header {
		line-height: 55px !important;
	}
	ul.navbar-nav {
		margin-right: -12px;
	}
</style>

<aside
	class="left-sidebar <?php if($panelInit->settingsArray['leftmenuScroller'] == "e"){ echo "enableSlimScroller"; }
	else{ echo "menuTraditional"; if($panelInit->isRTL == 1){ echo " menuTraditionalRTL "; } } ?> no-print"
	style="padding-bottom:60px; visibility: hidden;">
  <div class="scroll-sidebar" style="padding-top: 10px">
      <!-- Sidebar navigation-->
      <nav class="sidebar-nav">
          <ul id="sidebarnav" <?php if($panelInit->settingsArray['leftmenuScroller'] != "e"){ echo "style='padding-bottom:60px;'"; }?>>
              <?php

              foreach ($panelInit->panelItems as $key => $value) {
                  if(isset($value['activated']) AND !strpos($panelInit->settingsArray['activatedModules'],$value['activated']) ){ continue;  }
                  if(isset($value['role_perm'])){
                      if($panelInit->can($value['role_perm']) == false){
                          continue;
                      }
                  }

                  echo "<li><a style='margin-top: -5px; margin-bottom: -5px;'";
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

                          echo "<li>";
                          echo "<a style='margin-top: -5px; margin-bottom: -5px;' class='aj scrollTop' href='".URL::to($value2['url'])."'>";
                          if(isset($panelInit->language[$value2['title']])){
                              echo $panelInit->language[$value2['title']];
                          }else{
                              echo $value2['title'];
                          }
                          echo "</a>";
                          echo "</li>";
                      }
                      echo "</ul>";
                  }
                  echo "</li>";
              }
              ?>
          </ul>
      </nav>
      <!-- End Sidebar navigation -->
  </div>
</aside>