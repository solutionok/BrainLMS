<div class="container m-t-20 m-b-30">

	<?php if(isset($template_vars['page_feat_image']) AND $template_vars['page_feat_image'] != ""){ ?>
        <div class="row m-0">
			<div class="col-sm-12">
				<img alt="" src="uploads/ml_uploads/<?php echo $template_vars['page_feat_image']['file_uploaded_name']; ?>" class="img-fluid">
			</div>
		</div>
	<?php } ?>


	<div class="blog-home2">
        <div class="container">
            <!-- Row  -->
            <div class="row justify-content-center m-b-30">
                <div class="col-md-7 text-center">
                    <h2 class="title"><?php echo $permalink['page_title']; ?></h2>
                    <h6 class="subtitle"><?php echo $permalink['page_content']; ?></h6>
                </div>
            </div>
            <div class="row m-t-40">
                <!-- Column -->
				<?php 
					if(!isset($template_vars['events_list'])){
						$template_vars['events_list'] = array();
					}
					foreach ($template_vars['events_list'] as $value) { ?>
	                <div class="col-md-4">
	                    <div class="card" data-aos="flip-left" data-aos-duration="1200">
	                    	<a href="#" data-toggle="modal" data-target="#event_modal_<?php echo $value['id']; ?>"><img src="<?php echo \URL::asset('uploads/events/'.$value['eventImage']); ?>" alt="<?php echo $value['eventTitle']; ?>" class="img-fluid"></a>
	                        <div class="date-pos bg-info-gradiant"><?php echo date("F j, Y",$value['eventDate']); ?></div>
	                        <h5 class="font-medium m-t-30"><a href="#" class="link"><a href="#" data-toggle="modal" data-target="#event_modal_<?php echo $value['id']; ?>"><?php echo $value['eventTitle']; ?></a></a></h5>
	                        <p class="m-t-20"><?php echo $value['eventDescriptionTruncated']; ?></p>    
	                        <a href="#" data-toggle="modal" data-target="#event_modal_<?php echo $value['id']; ?>" href="#" class="linking text-themecolor m-t-10"><?php echo $template_vars['language']['readDetails']; ?> <i class="ti-arrow-right"></i></a>
	                    </div>
	                </div>


	                <div id="event_modal_<?php echo $value['id']; ?>" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="event_modal_<?php echo $value['id']; ?>" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myLargeModalLabel"><?php echo $value['eventTitle']; ?></h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
	                    			<img src="<?php echo \URL::asset('uploads/events/'.$value['eventImage']); ?>" alt="<?php echo $value['eventTitle']; ?>" class="img-fluid">
                                    <p>
                                    	<?php 
											echo $value['eventDescription'];
										?>
									</p>
                                </div>
                                <div class="modal-footer">
                                	<span style="padding: 10px;"><i class="fa fa-calendar-o"></i> <?php echo date("F j, Y",$value['eventDate']); ?></span>
									<span style="padding: 10px;"><i class="fa fa-map-pin"></i> <?php echo $value['enentPlace']; ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
				<?php } ?>
            </div>

            <div class="row m-t-30">
            	<div class="col-md-12">
            		<nav aria-label="Page navigation">
		                <ul class="pagination float-right">
		                    <?php if( isset($template_vars['prev_page']) ){ ?><li class="page-item"><a class="page-link" href="<?php echo $template_vars['prev_page']; ?>">← <?php echo $template_vars['language']['prev']; ?></a></li><?php } ?>
		                    <?php if( isset($template_vars['next_page']) ){ ?><li class="page-item"><a class="page-link" href="<?php echo $template_vars['next_page']; ?>"><?php echo $template_vars['language']['next']; ?> →</a></li><?php } ?>
		                </ul>
		            </nav>
            	</div>
	        </div>

        </div>
    </div>

</div>