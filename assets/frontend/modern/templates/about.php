<div class="container m-t-20 m-b-30">
	<div id="content">
		<div class="container">
			<section class="bar">
				<div class="row">
					<div class="col-lg-12">
						<div class="heading">
							<h2><?php echo $permalink['page_title']; ?></h2>
						</div>

						<div class="row">
							<div class="<?php if($permalink['page_feat_image'] == ""){ echo "col-sm-12"; }else{ echo "col-sm-8"; } ?>">
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
</div>