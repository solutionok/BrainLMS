<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <div id='parentDBArea' ng-view></div>

        <div class="right-sidebar">
            <div class="slimscrollright">
                <div class="rpanel-title"> <?php echo $panelInit->language['servicePanel']; ?> <span><i class="ti-close right-side-toggle"></i></span> </div>
                <div class="r-panel-body">
                    <?php if( $panelInit->settingsArray['layoutColorUserChange'] == "1" ){ ?>
                        <ul id="themecolors" class="m-t-20">
                            <li><b><?php echo $panelInit->language['lightSidebar']; ?></b></li>
                            <li><a ng-click="changeTheme('default')" href="javascript:void(0)" data-theme="default" class="default-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'default'}">1</a></li>
                            <li><a ng-click="changeTheme('green')" href="javascript:void(0)" data-theme="green" class="green-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'green'}">2</a></li>
                            <li><a ng-click="changeTheme('red')" href="javascript:void(0)" data-theme="red" class="red-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'red'}">3</a></li>
                            <li><a ng-click="changeTheme('blue')" href="javascript:void(0)" data-theme="blue" class="blue-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'blue'}">4</a></li>
                            <li><a ng-click="changeTheme('purple')" href="javascript:void(0)" data-theme="purple" class="purple-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'purple'}">5</a></li>
                            <li><a ng-click="changeTheme('megna')" href="javascript:void(0)" data-theme="megna" class="megna-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'megna'}">6</a></li>
                            <li class="d-block m-t-30"><b><?php echo $panelInit->language['darkSidebar']; ?></b></li>
                            <li><a ng-click="changeTheme('default-dark')" href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'default-dark'}">7</a></li>
                            <li><a ng-click="changeTheme('green-dark')" href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'green-dark'}">8</a></li>
                            <li><a ng-click="changeTheme('red-dark')" href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'red-dark'}">9</a></li>
                            <li><a ng-click="changeTheme('blue-dark')" href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'blue-dark'}">10</a></li>
                            <li><a ng-click="changeTheme('purple-dark')" href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'purple-dark'}">11</a></li>
                            <li><a ng-click="changeTheme('megna-dark')" href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme" ng-class="{'working':$root.dashboardData.baseUser.defTheme == 'megna-dark'}">12</a></li>
                        </ul>
                    <?php } ?>
                    <br/>
                    <?php if($role == "admin"){ ?>
                        <span class="d-block"><?php echo $panelInit->language['chgAcademicyears']; ?></span>
                        <form class="form">
                            <div class="form-group m-t-10 row">
                                <div class="col-12">
                                    <select class="form-control" id="selectedAcYear" ng-model="dashboardData.selectedAcYear">
                                        <option ng-selected="year.id == '<?php echo $panelInit->selectAcYear; ?>'" ng-repeat="year in $root.dashboardData.academicYear" value="@{{year.id}}" ng-if="year.isDefault == '0'">@{{year.yearTitle}}</option>
                                        <option ng-selected="year.id == '<?php echo $panelInit->selectAcYear; ?>'" ng-repeat="year in $root.dashboardData.academicYear" value="@{{year.id}}" ng-if="year.isDefault == '1'">@{{year.yearTitle}} - <?php echo $panelInit->language['defAcademicYears']; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group m-b-0">
                                <div class="col-sm-12">
                                    <button class="btn btn-success btn-flat pull-right ng-binding" ng-click="chgAcYear()"><?php echo $panelInit->language['chgYear']; ?></button>
                                </div>
                            </div>
                        </form>
                    <?php } ?>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Right sidebar -->
        <!-- ============================================================== -->
    </div>
    <footer class="footer" <?php if($panelInit->settingsArray['leftmenuScroller'] != "e"){ ?> style='position:fixed !important;' <?php } ?>>
        <?php echo $panelInit->settingsArray['footer']; ?> -  <a target="_BLANK" href="{{URL::to('/terms')}}"><?php echo $panelInit->language['schoolTerms']; ?></a>
    </footer>
</div>