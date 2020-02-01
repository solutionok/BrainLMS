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

							<div id="blog-listing-medium" >

								<div class="row text-center">
									<?php foreach ($template_vars['teachers_list'] as $value) { ?>
										<div class="col-md-3">
											<div data-animate="fadeInUp" class="team-member">
												<div class="image"><img src="<?php echo \URL::asset('frontend/profileImage/'.$value['id']); ?>" alt="" style="width:128px;height:128px;" class="img-fluid rounded-circle"></div>
												<h3><?php echo $value['fullName']; ?></h3>
												<p class="role"><?php echo $value['user_position']; ?></p>
												<ul class="social list-inline teacher_social_link">
													<li class="list-inline-item"><a href="mailto:<?php echo $value['email']; ?>" class="email"><i class="fa fa-envelope"></i></a></li>
												</ul>
											</div>
										</div>
									<?php } ?>	
								</div>

								<ul class="pager d-flex align-items-center justify-content-between list-unstyled">
									<?php if( isset($template_vars['prev_page']) ){ ?><li class="previous"><a href="<?php echo $template_vars['prev_page']; ?>" class="btn btn-template-outlined">← <?php echo $template_vars['language']['prev']; ?></a></li><?php } ?>
									<?php if( isset($template_vars['next_page']) ){ ?><li class="next"><a href="<?php echo $template_vars['next_page']; ?>" class="btn btn-template-outlined"><?php echo $template_vars['language']['next']; ?> →</a></li><?php } ?>
								</ul>
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
