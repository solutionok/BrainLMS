<div class="container m-t-20 m-b-30">

	<?php if(isset($template_vars['page_feat_image']) AND $template_vars['page_feat_image'] != ""){ ?>
        <div class="row m-0">
			<div class="col-sm-12">
				<img alt="" src="uploads/ml_uploads/<?php echo $template_vars['page_feat_image']['file_uploaded_name']; ?>" class="img-fluid">
			</div>
		</div>
	<?php } ?>

	<div class="team2">
        <div class="container">
            <div class="row justify-content-center m-b-30">
                <div class="col-md-7 text-center">
                    <h2 class="title"><?php echo $permalink['page_title']; ?></h2>
                    <h6 class="subtitle"><?php echo $permalink['page_content']; ?></h6>
                </div>
            </div>

            <div class="row m-t-30">
                <!-- column  -->

                <?php foreach ($template_vars['teachers_list'] as $value) { ?>
	                <div class="col-lg-3 m-b-30">
	                        <!-- Row -->
	                        <div class="row no-gutters">
	                            <div class="col-md-12 pro-pic" style="background:url(<?php echo \URL::asset('frontend/profileImage/'.$value['id']); ?>) center center no-repeat / cover">
	                                <div class="card-img-overlay">
	                                    <ul class="list-inline">    
	                                        <li class="list-inline-item"><a href="mailto:<?php echo $value['email']; ?>"><i class="fa fa-envelope"></i></a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="p-t-10">
	                                    <h5 class="title font-medium"><?php echo $value['fullName']; ?></h5>
	                                    <h6 class="subtitle"><?php echo $value['user_position']; ?></h6>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- Row -->
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