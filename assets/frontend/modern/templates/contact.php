<div class="container m-t-20 m-b-30">

	<?php if(isset($template_vars['page_feat_image']) AND $template_vars['page_feat_image'] != ""){ ?>
        <div class="row m-0">
			<div class="col-sm-12">
				<img alt="" src="uploads/ml_uploads/<?php echo $template_vars['page_feat_image']['file_uploaded_name']; ?>" class="img-fluid">
			</div>
		</div>
	<?php } ?>

    <div class="mini-spacer">

    	<div class="row m-0">
            <div class="col-lg-8">
                <div class="contact-box p-r-40">
                    <h2 class="title" style="margin-top:0px;"><?php echo $permalink['page_title']; ?></h2>
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
                            <div class="col-lg-6">
                                <div class="form-group m-t-15">
                                    <input class="form-control" id="firstname" name="firstname" required type="text" placeholder="<?php echo $template_vars['language']['firstName']; ?>">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group m-t-15">
                                    <input class="form-control" id="lastname" name="lastname" required type="text" placeholder="<?php echo $template_vars['language']['lastName']; ?>">
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="form-group m-t-15">
                                    <input class="form-control" id="email" name="email" required type="email" placeholder="<?php echo $template_vars['language']['email']; ?>">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group m-t-15">
                                    <input class="form-control" id="subject" name="subject" required type="text" placeholder="<?php echo $template_vars['language']['mailSubject']; ?>">
                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="form-group m-t-15">
                                    <textarea class="form-control" id="message" name="message"  rows="3" placeholder="<?php echo $template_vars['language']['mailMessage']; ?>"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-danger-gradiant m-t-20 btn-arrow"><span> <?php echo $template_vars['language']['cmsSendMessage']; ?> <i class="ti-arrow-right"></i></span></button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="detail-box p-40 bg-info" data-aos="fade-right" data-aos-duration="1200">
                    <h2 class="text-white"><?php echo $permalink['page_title']; ?></h2>
                    <p class="text-white m-t-30 op-8">
                    	<?php echo $template_vars['phone_number']; ?>
                        <br>
                        <?php echo $template_vars['mail_address']; ?>
                    </p>
                    <p class="text-white op-8">
                    	<?php echo $template_vars['address_line_1']; ?> 
              			<br><?php echo $template_vars['address_line_2']; ?> 
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>