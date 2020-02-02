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
                if(!isset($template_vars['page_slider_images'])){
                	$template_vars['page_slider_images'] = array();
                }
                foreach ($template_vars['page_slider_images'] as $value) { ?>
                	<div class="col-md-4">
                		<div class="card card-shadow" data-aos="flip-left" data-aos-duration="1200">
                            <a class="gallery" title="<?php echo $value['image_title']; ?>" href="<?php echo \URL::asset('uploads/ml_uploads/'.$value['file_uploaded_name']); ?>">
                            	<img class="card-img-top" src="<?php echo \URL::asset($value['thumb_image']); ?>" alt="<?php echo $value['image_title']; ?>" />
                            </a>
                            <div class="card-body">
                                <h5 class="font-medium m-b-0"><?php echo $value['image_title']; ?></h5>
                                <p class="m-b-0 font-14"><?php echo $value['image_description']; ?></p>
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