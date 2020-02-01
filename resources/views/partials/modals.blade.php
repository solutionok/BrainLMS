<modal visible="$root.media_manager" data-backdrop="static">
  <form>
      <div>
          <!-- Nav tabs -->
          <ul class="nav nav-tabs tabsItem" role="tablist">
              <li class="nav-item" role="presentation"><a showtab="" ng-show="$root.show_uploader == true" class="nav-link active" href="#mm_upload_tab" aria-controls="mm_upload_tab" role="tab" data-toggle="tab"><?php echo $panelInit->language['Upload']; ?></a></li>
              <li class="nav-item" role="presentation"><a showtab="" ng-show="$root.show_gallery == true" class="nav-link" ng-class="{'active':$root.show_uploader != true}" href="#mm_library" aria-controls="mm_library" role="tab" data-toggle="tab"><?php echo $panelInit->language['fLibrary']; ?></a></li>
          </ul>
          <!-- Tab panes -->
          <div class="tab-content tabcontent-border">
              <div role="tabpanel" class="tab-pane active p-20" id="mm_upload_tab" ng-show="$root.show_uploader == true">
                  <form name="myForm">
                      <div ngf-drop ngf-select ngf-change="$root.mm_upload_selected()" ngf-multiple="$root.allow_multiple" ngf-keep="$root.allow_multiple" ng-model="$root.mm_files" class="drop-box"><?php echo $panelInit->language['selDrop']; ?></div>
                      <ul ng-show="$root.allow_multiple == true" class="ml_uploaded_images">
                          <li ng-repeat="file in $root.mm_files" style="font:smaller">
                              <img ngf-thumbnail="file" ngf-size="{height: 150, quality: 0.9}">
                              <div class="image_progress" ng-show="file.progress">
                                  <div class="image_progress_inner" style="width:@{{file.progress}}%" ng-bind="file.progress + '%'"></div>
                              </div>
                          </li>
                      </ul>
                      <ul ng-show="$root.allow_multiple != true" class="ml_uploaded_images">
                          <li style="font:smaller">
                              <img ngf-thumbnail="$root.mm_files" ngf-size="{height: 150, quality: 0.9}">
                              <div class="image_progress" ng-show="$root.mm_files.progress">
                                  <div class="image_progress_inner" style="width:@{{$root.mm_files.progress}}%" ng-bind="$root.mm_files.progress + '%'"></div>
                              </div>
                          </li>
                      </ul>

                  </form>

              </div>
              <div role="tabpanel" class="tab-pane p-20" id="mm_library" ng-show="$root.show_gallery == true" ng-class="{'active':$root.show_uploader != true}" onshow="alert('ee')">

                  <ul class="ml_uploaded_images">
                      <li ng-repeat="file in gallery_images" style="font:smaller" ng-click="$root.mm_select_image(file,$event)">
                          <img ng-src="@{{file.thumb_image}}" class="ml_gallery_image">
                      </li>
                  </ul>
                  <div ng-click="mm_load_more()" class="mm_load_more">
                      <img class="mm_load_more_loading" src="assets/images/loading.gif"/>
                      <?php echo $panelInit->language['loadMore']; ?>
                  </div>

              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-sm-12">
              <button type="submit" ng-click="$root.mm_cancel()" style="margin: 5px;" class="btn btn-danger waves-effect waves-light pull-right" ><?php echo $panelInit->language['cancel']; ?></button>
              <button type="button" ng-click="$root.mm_select_upload($root.mm_files)" style="margin: 5px;" class="btn btn-info waves-effect waves-light pull-right" ><?php echo $panelInit->language['selUpload']; ?></button>
          </div>
      </div>
  </form>
</modal>