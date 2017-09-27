<div class="clearfix"></div>
   </div>
      </div>
        <footer>
	    <?php if($storeset_f1_enable == "on") { ?> 
			<div class="footer-top">
                <div class="container">
                    <div class="row">
        				<div class="col-sm-6 col-md-4 about">
        					<h3 class="top-f"><?php echo $text_aboutus; ?></h3>
                            <p><?php echo $footer_text; ?></p>
                            <div class="socials-box">
                                <?php if($storeset_facebook_id != '') { ?>
            					<a href="<?php echo $storeset_facebook_id; ?>" target="_blank">
         					      <i class=" fa fa-facebook"> &nbsp; </i>
                                </a>
            					<?php } ?>
                                <?php if($storeset_vk_id != '') { ?>
            						<a href="<?php echo $storeset_vk_id; ?>" target="_blank">
            						  <i class="fa fa-vk"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_gplus_id != '') { ?>
            						<a href="<?php echo $storeset_gplus_id; ?>" target="_blank">
            						  <i class="fa fa-google-plus"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_odnoklass_id != '') { ?>
            						<a href="<?php echo $storeset_odnoklass_id; ?>" target="_blank">
            						  <i class="fa fa-odnoklassniki"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_rss_id != '') { ?>
            						<a href="<?php echo $storeset_rss_id; ?>" target="_blank">
            						  <i class="fa fa-instagram"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_twitter_id != '') { ?>
            						<a href="<?php echo $storeset_twitter_id; ?>" target="_blank">
            						  <i class="fa fa-twitter"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_vimeo_id != '') { ?>
            						<a href="<?php echo $storeset_vimeo_id; ?>" target="_blank">
            						  <i class="fa fa-vimeo"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_pinterest_id != '') { ?>
            						<a href="<?php echo $storeset_pinterest_id; ?>" target="_blank">
            						  <i class="fa fa-pinterest"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_dribbble_id != '') { ?>
            						<a href="<?php echo $storeset_dribbble_id; ?>" target="_blank">
            						  <i class="fa fa-dribbble"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_flick_id != '') { ?>
            						<a href="<?php echo $storeset_flick_id; ?>" target="_blank">
            						  <i class="fa fa-flickr"> &nbsp; </i>
                                    </a>
            					<?php } ?>                    
                                <?php if($storeset_linkedin_id != '') { ?>
            						<a href="<?php echo $storeset_linkedin_id; ?>" target="_blank">
            						  <i class="fa fa-linkedin"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                                <?php if($storeset_youtube_id != '') { ?>
            						<a href="<?php echo $storeset_youtube_id; ?>" target="_blank">
            						  <i class="fa fa-youtube"> &nbsp; </i>
                                    </a>
            					<?php } ?>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 contacts">
                            <h3 class="top-f"><?php echo $text_contactus; ?></h3>
                            <?php if ( isset($popup_subscribe_form_data) && $popup_subscribe_form_data == "on") { ?>
                            <p class="subscribe"><?php echo $text_subscribe; ?></p>
                            <div class="subscribe-content" id="static-subscribe-wrapper-footer">
                            <form id="static-subscribe-form-footer">
                                <div class="input-box">
                                    <input id="newsletter" class="input-text required-entry validate-email" title="<?php echo $text_subscribe_ok; ?>" type="text" name="email">
                                </div>
                                <div class="actions">
                                    <button class="button" id="static-subscribe-button-footer" title="<?php echo $text_subscribe_ok; ?>" type="submit"><i class="fa fa-angle-right"></i></button>
                                </div>
                                <?php if ($text_terms) { ?>
                                  <div class="terms-footer-block">
                                    <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" />
                                  </div>
                                <?php } ?>
                            </form> 
                            <script type="text/javascript">
							function masked(element, status) {
							  if (status == true) {
							    $('<div/>')
							    .attr({ 'class':'masked' })
							    .prependTo(element);
							    $('<div class="masked_loading" />').insertAfter($('.masked'));
							  } else {
							    $('.masked').remove();
							    $('.masked_loading').remove();
							  }
							}
							$('#static-subscribe-button-footer').on('click', function(e) {
								e.preventDefault();
							  
							  masked('#static-subscribe-wrapper-footer', true);
							  
							  $.ajax({
							    type: 'post',
							    url:  'index.php?route=extension/module/static_subscribe/make_subscribe',
							    dataType: 'json',
							    data: $('#static-subscribe-form-footer').serialize(),
							    success: function(json) {
							      if (json['error']) {
							        masked('#static-subscribe-wrapper-footer', false);
							        $('#static-subscribe-wrapper-footer .alert-danger').remove();
							        $('#static-subscribe-form-footer').after('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
							      }
							      if (json['output']) {
							        masked('#static-subscribe-wrapper-footer', false);
							        $('#static-subscribe-wrapper-footer').html('<div class="output-message" style="color: #fff;">'+json['output']+'</div>');
							      }
							    }
							  });
							 return false;
							});
							</script>
                            </div>
                            <?php } ?>
                            <ul>
                                <?php if($storeset_cont_address != '') { ?>
                                    <li><span class="ti-location-pin"></span><?php echo $storeset_cont_address; ?></li>
                                <?php } ?>
                                <?php if($storeset_cont_email != '') { ?>
                                    <li><span class="ti-email"></span><a href="mailto:<?php echo $storeset_cont_email; ?>"><?php echo $storeset_cont_email; ?></a></li>
                                <?php } ?>
                                <?php if($storeset_cont_phone1 != '') { ?>
                                    <li><span class="ti-mobile"></span><a href="javascript:void(0);" onclick="window.location.href='tel:+<?php echo preg_replace('/\D/', '', $storeset_cont_phone1)?>';"><?php echo $storeset_cont_phone1; ?></a></li>
                                <?php } ?>
                                <?php if($storeset_cont_phone2 != '') { ?>
                                    <li><span class="ti-mobile"></span><a href="javascript:void(0);" onclick="window.location.href='tel:+<?php echo preg_replace('/\D/', '', $storeset_cont_phone2)?>';"><?php echo $storeset_cont_phone2; ?></a></li>
                                <?php } ?>
                                <?php if($storeset_cont_clock != '') { ?>
                                    <li><span class="ti-time"></span><?php echo strip_tags(html_entity_decode($storeset_cont_clock)); ?></li>
                                <?php } ?>
                                <?php if($storeset_cont_skype != '') { ?>
                                    <li><span class="ti-skype"></span><a href="skype:<?php echo $storeset_cont_skype; ?>"><?php echo $storeset_cont_skype; ?></a></li>
                                <?php } ?>
        					</ul>
                        </div>
                        <div class="hidden-sm col-md-4 socials">
                            <?php if($storeset_cont_vidget != '') { ?>
                                <?php echo html_entity_decode($storeset_cont_vidget); ?>
                            <?php } ?>
                        </div>
                        </div>
                  </div>  				
			</div>
			<?php } ?>
			<?php if($storeset_f2_enable == "on") { ?> 	
            <div class="footer-middle">
            <div class="container">
                <div class="row">
                    <?php if ($informations) { ?>
        				<div class="col-sm-3 col-md-3">
                            <h3><?php echo $text_information; ?></h3>
                            <ul>
                              <?php foreach ($informations as $information) { ?>
                                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                              <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                    <div class="col-sm-3 col-md-3">
                        <h3><?php echo $text_service; ?></h3>
                        <ul>
                          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3 col-md-3">
                        <h3><?php echo $text_extra; ?></h3>
                        <ul>
                          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3 col-md-3">
                        <h3><?php echo $text_account; ?></h3>
                        <ul>
                          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                        </ul>
                    </div>		
                </div>
             </div>				
			</div>
			<?php } ?>
			<?php if($storeset_f3_enable == "on") { ?> 	
			<div id="powered">
				<div class="container">
                    <div class="row">
    					<div class="col-sm-12 col-md-8">
    						<div class="payment">
                                <?php if($storeset_google == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/g-wallet.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_master == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/mastercard.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_visa == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/visa.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_american == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/american.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_discover == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/discover.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_moneybookers == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/moneybookers.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_paypal == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/paypal.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_yamoney == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/yamoney.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_qiwi == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/qiwi.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_privat == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/privat.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_sberbank == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/sberbank.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_liqpay == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/liqpay.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_webmoney == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/webmoney.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_robokassa == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/robokassa.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_2checkout == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/2checkout.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_electron == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/visa-electron.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_maestro == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/maestro.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_switch == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/switch.png" alt="" />
                                <?php } ?>
                                <?php if($storeset_solo == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/solo.png" alt="" />
                                <?php } ?>
                                 <?php if($storeset_skrill == "on") { ?> 
                                    <img src="catalog/view/theme/storeset/images/pay/skrill.png" alt="" />
                                <?php } ?>
                            </div>
    					</div>
    					<div class="col-sm-12 col-md-4 right">
    						<div class="copyright">
    							<?php if($copy_text != '') { 
    							echo html_entity_decode($copy_text); 
    							 } ?>
    						</div>
    					</div>
					</div>
				</div>
			</div>
			<?php } ?>
		</footer>
		<div id="part">
            <div id="partcont"> 
                <div id="loading-mask">
                </div>
            </div>
        </div>
        <p id="back-top">
	       <a href="#top"><span class="main-color1"></span></a>
        </p>
        <script type="text/javascript">
    	$(document).ready(function(){
    		$("#back-top").hide();
    		$(function () {
    			$(window).scroll(function () {
    				if ($(this).scrollTop() > 450) {
    					$('#back-top').fadeIn();
    				} else {
    					$('#back-top').fadeOut();
    				}
    			});
    			$('#back-top a').click(function () {
    				$('body,html').animate({
    					scrollTop: 0
    				}, 800);
    				return false;
    			});
    		});
    	});
        </script>
    </body>
 </html>