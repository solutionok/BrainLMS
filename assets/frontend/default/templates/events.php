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

							<div id="blog-listing-medium" >

								<?php 
								if(!isset($template_vars['events_list'])){
									$template_vars['events_list'] = array();
								}
								foreach ($template_vars['events_list'] as $value) { ?>
									<section class="post">
										<div class="row">
											<div class="col-md-4">
												<div class="image"><a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><img src="<?php echo \URL::asset('uploads/events/'.$value['eventImage']); ?>" alt="<?php echo $value['eventTitle']; ?>" class="img-fluid"></a></div>
											</div>
											<div class="col-md-8">
												<h2 class="h3 mt-0"><a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><?php echo $value['eventTitle']; ?></a></h2>
												<div class="d-flex flex-wrap justify-content-between text-xs">
													<p class="date-comments">
														<a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><i class="fa fa-calendar-o"></i> <?php echo date("F j, Y",$value['eventDate']); ?></a>
														<a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><i class="fa fa-map-pin"></i> <?php echo $value['enentPlace']; ?></a>
													</p>
												</div>
												<p class="intro"><?php echo $value['eventDescriptionTruncated']; ?></p>
												<p class="read-more text-right"><a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>" class="btn btn-template-outlined"><?php echo $template_vars['language']['readDetails']; ?></a></p>
											</div>
										</div>
									</section>

									<div class="modal fade" id="events_modal_<?php echo $value['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="events_modal_<?php echo $value['id']; ?>">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel"><?php echo $value['eventTitle']; ?></h4>
												</div>
												<div class="modal-body">

													<div class="row">
														<div class="col-md-12">
															<h2 class="h3 mt-0"><a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><?php echo $value['eventTitle']; ?></a></h2>
															<div class="d-flex flex-wrap justify-content-between text-xs">
																<p class="date-comments">
																	<a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><i class="fa fa-calendar-o"></i> <?php echo date("F j, Y",$value['eventDate']); ?></a>
																	<a href="#" data-toggle="modal" data-target="#events_modal_<?php echo $value['id']; ?>"><i class="fa fa-map-pin"></i> <?php echo $value['enentPlace']; ?></a>
																</p>
															</div>
															<p class="intro">
																<?php 
																	echo $value['eventDescription'];
																?>
															</p>
														</div>
													</div>

												</div>
											</div>
										</div>
									</div>
								<?php } ?>

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
