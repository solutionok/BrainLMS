<div id="content">
	<div class="container">
		<section class="bar">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading">
						<h2><?php echo $permalink['page_title']; ?></h2>
					</div>

					<div class="row">
						<div class="<?php if(!isset($permalink['page_feat_image']) || $permalink['page_feat_image'] == ""){ echo "col-sm-12"; }else{ echo "col-sm-8"; } ?>">
							<p class="lead"><?php echo $permalink['page_content']; ?></p>


							<div class="row portfolio text-center">
	              				<?php foreach ($template_vars['page_slider_images'] as $value) { ?>
									<div class="col-md-4">
										<div class="box-image" data-toggle="modal" data-target="#image_modal_<?php echo $value['id']; ?>" style="cursor: pointer;">
											<div class="image"><img src="<?php echo \URL::asset($value['thumb_image']); ?>" alt="" style="width:100%" class="img-fluid">
												<div class="overlay d-flex align-items-center justify-content-center">
													<div class="content">
														<div class="name">
															<h3 class="color-white"><a href="#" data-toggle="modal" data-target="#image_modal_<?php echo $value['id']; ?>"><?php echo $value['image_title']; ?></a></h3>
														</div>
														<div class="text">
															<p class="d-none d-sm-block"><?php echo $value['image_description']; ?></p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal fade" id="image_modal_<?php echo $value['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="image_modal_<?php echo $value['id']; ?>">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">              
													<div class="modal-body">
														<img src="<?php echo \URL::asset('uploads/ml_uploads/'.$value['file_uploaded_name']); ?>" class="imagepreview" style="width: 100%;" >
													</div>
												</div>
											</div>
										</div>
									</div>
								<?php } ?>
							</div>

						</div>

						<?php if(isset($template_vars['page_feat_image']) AND $template_vars['page_feat_image'] != ""){ ?>
						<div class="col-sm-4">
							<img alt="" src="<?php echo \URL::asset("uploads/ml_uploads/".$template_vars['page_feat_image']['file_uploaded_name']); ?>" class="img-fluid">
						</div>
						<?php } ?>

					</div>

				</div>
			</div>

		</section>
	</div>
</div>
