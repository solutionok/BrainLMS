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

							<section>
								<div class="row text-center">
									<div class="col-md-4">
										<div class="box-simple">
											<div class="icon-outlined"><i class="fa fa-map-marker"></i></div>
											<h3 class="h4">Address</h3>
											<p>
												<?php echo $template_vars['address_line_1']; ?> 
              									<br><?php echo $template_vars['address_line_2']; ?> 
											</p>
										</div>
									</div>
									<div class="col-md-4">
										<div class="box-simple">
											<div class="icon-outlined"><i class="fa fa-phone"></i></div>
											<h3 class="h4">Call center</h3>
											<p>Please feel free to contcat us via our call center</p>
											<p><strong><?php echo $template_vars['phone_number']; ?> </strong></p>
										</div>
									</div>
									<div class="col-md-4">
										<div class="box-simple">
											<div class="icon-outlined"><i class="fa fa-envelope"></i></div>
											<h3 class="h4">Electronic support</h3>
											<p>Please feel free to write an email to us</p>
											<ul class="list-unstyled text-sm">
												<li><strong><a href="mailto:<?php echo $template_vars['mail_address']; ?>"><?php echo $template_vars['mail_address']; ?></a></strong></li>
											</ul>
										</div>
									</div>
								</div>
							</section>

							<section class="bar pt-0">
								<div class="row">
									<div class="col-md-12">
										<div class="heading text-center">
											<h2><?php echo $template_vars['language']['cntctForm']; ?></h2>
										</div>
									</div>
									<div class="col-md-8 mx-auto">
										<form action="" method="post">
											<?php if(isset($template_vars['form_errors']) && count($template_vars['form_errors']) > 0){ ?>
												<?php foreach ($template_vars['form_errors'] as $key => $value) { ?>
													<div role="alert" class="alert alert-danger alert-dismissible">
										            	<button type="button" data-dismiss="alert" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button><?php echo $value; ?>
										            </div>
												<?php } ?>
											<?php } ?>
											<?php if(isset($template_vars['form_success'])){ ?>
												<?php foreach ($template_vars['form_success'] as $key => $value) { ?>
													<div role="alert" class="alert alert-success alert-dismissible">
										            	<button type="button" data-dismiss="alert" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button><?php echo $value; ?>
										            </div>
												<?php } ?>											
											<?php } ?>
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<label for="firstname"><?php echo $template_vars['language']['firstName']; ?></label>
														<input id="firstname" name="firstname" type="text" required class="form-control">
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="lastname"><?php echo $template_vars['language']['lastName']; ?></label>
														<input id="lastname" name="lastname" type="text" required class="form-control">
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="email"><?php echo $template_vars['language']['email']; ?></label>
														<input id="email" name="email" type="email" required class="form-control">
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="subject"><?php echo $template_vars['language']['mailSubject']; ?></label>
														<input id="subject" name="subject" type="text" required class="form-control">
													</div>
												</div>
												<div class="col-sm-12">
													<div class="form-group">
														<label for="message"><?php echo $template_vars['language']['mailMessage']; ?></label>
														<textarea id="message" name="message" class="form-control" required></textarea>
													</div>
												</div>
												<div class="col-sm-12 text-center">
													<button type="submit" class="btn btn-template-outlined"><i class="fa fa-envelope-o"></i> <?php echo $template_vars['language']['cmsSendMessage']; ?></button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</section>


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