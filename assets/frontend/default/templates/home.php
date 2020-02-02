<div id="content">
	<div class="container">
		<section class="bar">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading">
						<h2><?php echo $permalink['page_title']; ?></h2>
					</div>

					<div class="row">
						<div class="<?php if(!isset($template_vars['page_feat_image']) || $permalink['page_feat_image'] == ""){ echo "col-sm-12"; }else{ echo "col-sm-8"; } ?>">
							<p class="lead"><?php echo $permalink['page_content']; ?></p>
						</div>
						<?php if(isset($template_vars['page_feat_image']) AND $template_vars['page_feat_image'] != ""){ ?>
							<div class="col-sm-4">
								<img alt="" src="uploads/ml_uploads/<?php echo $template_vars['page_feat_image']['file_uploaded_name']; ?>" class="img-fluid">
							</div>
						<?php } ?>
					</div>

				</div>
			</div>

		</section>
	</div>
</div>

<div class="get-it">
	<div class="container">
	  <div class="row">
	    <div class="col-lg-8 text-center p-3">
	      <h3><?php echo $template_vars['language']['logToMgmtSys']; ?></h3>
	    </div>
	    <div class="col-lg-4 text-center p-3">   <a href="<?php echo \URL::to('/login'); ?>" class="btn btn-template-outlined-white"><?php echo $template_vars['language']['signIn']; ?></a></div>
	  </div>
	</div>
</div>