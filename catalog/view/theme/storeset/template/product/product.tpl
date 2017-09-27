<?php echo $header; ?>
<div class="content"><?php echo $content_top; ?></div>
<div <?php if($storeset_microdata !='') { ?>itemscope itemtype="http://schema.org/Product"<?php } ?>>
<div id="container">
  <div class="row">
    <ul class="breadcrumb product-crumbs">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    </div>
  <div class="content">
    <?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <article id="content" class="<?php echo $class; ?>">
        <div class="row">
        <div class="product-info">
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } ?>
            <div class="<?php echo $class; ?>">
			<h1><?php echo $heading_title; ?></h1>
            <?php if ($product_stickers) { ?>
    		<div class="sticker-box">
              <?php foreach ($product_stickers as $product_sticker) { ?>
                <span class="stickers" style="color: <?php echo $product_sticker['color']; ?>; background: <?php echo $product_sticker['background']; ?>;">
                  <?php echo $product_sticker['text']; ?>
                </span>
              <?php } ?>
            </div>
            <?php } ?>
                <?php if ($images) { ?>
                    <?php if ($thumb) { ?>
                        <div class="image thumbnails-one">
                            <a href="<?php echo $popup; ?>">
                                <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                            </a>
                        </div>
                    <?php } ?>
                    <?php if (count($images) > 1) { ?>
                        <div class="image-additional" id="Loadphotos">
                            <div class="image-additional-carousel thumbnails">
                                <?php
                                $data_index = 0;
                                foreach ($images as $image) {
                                $data_index++;
                                ?>
                                    <div>
                                        <a href="<?php echo $image['popup']; ?>" class="dataitem" title="<?php echo $heading_title; ?>">
                                            <img src="<?php echo $image['thumb']; ?>" data-index="<?php echo $data_index; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        </a>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } ?>
            <div class="<?php echo $class; ?> product-right">
            <div class="row top-info-product">
              <div class="model-box">
              <?php $rating_data = preg_replace("/[^0-9]/", '', $reviews); ?>
                <div class="review" <?php if($storeset_microdata !='' && $rating_data>0) { ?>itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating"<?php } ?>>
            		<?php if($rating_data>0) { ?>
				    <?php if($storeset_microdata !='') { ?><meta itemprop="reviewCount" content="<?php echo $rating_data; ?>"><?php } ?>
				    <?php if($storeset_microdata !='') { ?><meta itemprop="ratingValue" content="<?php echo $rating; ?>"><?php } ?>
					<?php if($storeset_microdata !='') { ?><meta itemprop="bestRating" content="5" /><?php } } ?>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
				      <?php if ($rating < $i) { ?>
				      <span><i class="fa fa-star-o stars-rev"></i></span>
				      <?php } else { ?>
				      <span><i class="fa fa-star stars-rev"></i></span>
				      <?php } ?>
				    <?php } ?>
                    <div class="clerfix"></div>
                    <a onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('.scrolled').offset().top}, 800);"><?php echo $reviews; ?></a>
                    </div>
                    <?php if(isset($manufacturer_infos['image'])) { ?>
                       <a href="<?php echo $manufacturers; ?>"><img src="image/<?php echo $manufacturer_infos['image']; ?>" class="manufacturer-logo" alt="<?php echo $manufacturer_infos['name']; ?>"></a>
                    <?php } ?>
                </div>
            </div>
            <?php if($storeset_microdata !='') {
            if (!$special) {
				  $microprice = preg_replace('/[^0-9,.]+/','',rtrim($price, "."));
		           } else {
		          $microprice = preg_replace('/[^0-9,.]+/','',rtrim($special, "."));
		          }
             } ?>
            <?php if($storeset_microdata !='') { ?><span class="micro-price" itemprop="name"><?php echo $heading_title; ?></span><?php } ?>
            <?php if ($price) { ?>
              <div class="price" <?php if($storeset_microdata !='') { ?>itemprop="offers" itemscope itemtype="http://schema.org/Offer"<?php } ?>>
              <span itemprop="availability" class="availabil" content="http://schema.org/InStock"><?php echo $stock."\r\n"; ?></span>
              <?php if($storeset_microdata !='') { ?><meta itemprop="priceCurrency" content="<?php echo $currency_code_data; ?>" /><?php } ?>
                <?php if (!$special) { ?>
                <?php if($storeset_microdata !='') { ?><span class="micro-price" itemprop="price"><?php echo str_replace(" ", "", $microprice);  ?></span><?php } ?>
                <span class="price-new"><?php echo $price; ?></span>
                  <?php if (isset($popup_found_cheaper_data['status']) && $popup_found_cheaper_data['status']) { ?>
	            	<a href="javascript: void(0);" onclick="get_popup_found_cheaper(<?php echo $product_id; ?>); return false" class="cheaper"><?php echo $find_cheap; ?></a>
	            <?php } ?>
                <?php } else { ?>
                <?php if($storeset_microdata !='') { ?><span class="micro-price" itemprop="price"><?php echo str_replace(" ", "", $microprice); ?></span><?php } ?>
                <span class="price-new specials"><?php echo $special; ?></span><br /><span class="price-old"><?php echo $price; ?></span>
                <?php if (isset($popup_found_cheaper_data['status']) && $popup_found_cheaper_data['status']) { ?>
	            	<a href="javascript: void(0);" onclick="get_popup_found_cheaper(<?php echo $product_id; ?>); return false" class="cheaper"><?php echo $find_cheap; ?></a>
	            <?php } ?>
                <br /><span class="you-save"><?php echo $you_save_text; ?> <span id="you_save"><?php echo $you_save; ?> (-<?php echo $economy; ?>%)</span></span>
                <?php } ?>
                <?php if ($reward) { ?>
	            	<div class="reward-product"><?php echo $text_reward; ?> <?php echo $reward; ?></div>
	            <?php } ?>
	            <?php if ($tax) { ?>
	            <div class="reward-product"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
	            <?php } ?>
	            <?php if ($points) { ?>
	             <div class="reward-product"><?php echo $text_points; ?> <?php echo $points; ?></div>
	            <?php } ?>
	            <?php if ($discounts) { ?>
		            <?php foreach ($discounts as $discount) { ?>
		             <div class="reward-product"><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></div>
		            <?php } ?>
	            <?php } ?>
              </div>
              <div class="description">
                <?php if ($manufacturer) { ?>
                <span class="marked"><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><span <?php if($storeset_microdata !='') { ?>itemprop="brand"<?php } ?>><?php echo $manufacturer; ?></span></a><br />
                <?php } ?>
                <span class="marked"><?php echo $text_stock; ?></span> <?php echo $stock; ?><br />
                <span class="marked"><?php echo $text_model; ?></span> <span<?php if($storeset_microdata !='') { ?> itemprop="model"<?php } ?>><?php echo $model; ?></span>
            <?php if(isset($storeset_sections) && $show_tabs_status) { ?>
              <div id="size-popup" class="size-popup mfp-hide">
                <ul class="nav nav-tabs">
                  <?php $sect_id = 0; foreach($storeset_sections as $section) { ?>
                    <?php if (isset($section['categories']) && in_array($section_category_id, $section['categories'])) { ?>
          			    <li>
          			    <a href="#tab-size<?php echo $sect_id; ?>" data-toggle="tab"><?php echo $section['title'][$lang_code]; ?></a>
          			    </li>
                    <?php } ?>
          			  <?php $sect_id++; } ?>
          			</ul>
        			   <div class="tab-content">
        	   		 <?php $sect_id = 0; foreach($storeset_sections as $section) { ?>
                    <?php if (isset($section['categories']) && in_array($section_category_id, $section['categories'])) { ?>
        	   		 		<div class="tab-pane" id="tab-size<?php echo $sect_id ?>">
        	   		 			<?php $block_content = str_replace("img", "img class='img-responsive'", $section['block'][$lang_code]); echo html_entity_decode($block_content); ?>
        	   		 		</div>
                    <?php } ?>
        	   		 <?php $sect_id++; } ?>
        		   	</div>
        		</div>
            <script type="text/javascript">
              $(function(){
                $('#size-popup').find('.nav-tabs li:eq(0)').addClass('active');
                $('#size-popup').find('.tab-content div:eq(0)').addClass('active');
              });
            </script>
        		<br /><div class="open-size-link"><span class="marked"><?php echo $tab_sections; ?></span> <a href="#size-popup" class="open-size-link-show"><?php echo $show_tabs; ?></a></div>
    			<?php } ?>
			</div>
			<script>
			$('.open-size-link-show').magnificPopup({
			  type:'inline',
			  midClick: true 			});
			</script>
            <?php if ($options) { ?>
      <div class="options">
                <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
             <div id="option-<?php echo $option['product_option_id']; ?>">
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <?php if ($option_value['quantity_status']) { ?>
                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                    </option>
                  <?php } else { ?>
                    <option value="<?php echo $option_value['product_option_value_id']; ?>" disabled><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                    </option>
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
            </div>
            <?php } ?>
           <?php if ($option['type'] == 'radio') { ?>
                <div id="option-<?php echo $option['product_option_id']; ?>">
                 <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <b class="req-star"><?php echo $option['name']; ?>:</b><br />
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                    <?php if ($option_value['quantity_status']) { ?>
                    	<?php if ($option_value['image']) { ?>
                    		<div class="radio">
	                        <label class="not-selected-img optimid-<?php echo $option['option_id'];?>">
	                          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none"/>
	                          <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" data-trigger="hover" title="<?php echo $option['name']; ?> <?php echo $option_value['name']." "; if ($option_value['price']) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?><?php } ?>"/>
	                        </label>
	                      </div>
                    	<?php } else { ?>
		                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="none" />
	                      <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-toggle="tooltip" data-trigger="hover" title="<?php echo $option['name']; ?> <?php echo $option_value['name']." "; if ($option_value['price']) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?><?php } ?>" class="not-selected optid-<?php echo $option['option_id'];?>"><?php echo $option_value['name']; ?>            
	                      </label>
                    	<?php } ?>
                    <?php } else { ?>
                    	<?php if ($option_value['image']) { ?>
												<div class="radio">
	                        <label class="not-selected-img optimid-<?php echo $option['option_id'];?>">
	                          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" disabled/>
	                          <div class="disable-image-option" data-toggle="tooltip" data-trigger="hover click focus" title="<?php echo $product_na; ?>">
	                          <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" data-toggle="tooltip" data-trigger="hover"  class="img-thumbnail"/>
	                          </div>
	                        </label>
	                      </div>
											<?php } else { ?>
												<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="none" disabled/>
	                      <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-toggle="tooltip" data-trigger="hover" title="<?php echo $product_na; ?>" class="not-selected optid-<?php echo $option['option_id'];?>"><?php echo $option_value['name']; ?>            
	                      </label>
											<?php } ?>
                    <?php } ?>
                  <?php } ?>
                  <div class="clearfix"></div>
                </div>
                </div>
                <script type="text/javascript">
				$(document).ready(function() {
					   $('label.optid-<?php echo $option['option_id'];?>').click(function(){
				       if ($(this).prev().is('input:disabled')) {
				        $('label.selected').removeClass('selected').addClass('not-selected');
				        $(this).css({
				          'opacity': 0.5,
				          'cursor': 'default'
				        });
				       } else {
				        $('label.optid-<?php echo $option['option_id'];?>').removeClass('selected').addClass('not-selected');
				        $(this).removeClass('not-selected').addClass('selected');
				       }
					   });
			    $('label.optimid-<?php echo $option['option_id'];?>').click(function(){
			      if ($(this).find('input').is(':disabled')) {
			        $('label.optimid-<?php echo $option['option_id'];?>').removeClass('selected-img').addClass('not-selected-img');
			      } else {
			        $('label.optimid-<?php echo $option['option_id'];?>').removeClass('selected-img').addClass('not-selected-img');
			        $(this).removeClass('not-selected-img').addClass('selected-img');
			      }
				   });
			}); 
			
				</script>
            <?php } ?>
           <?php if ($option['type'] == 'checkbox') { ?>
                <div id="option-<?php echo $option['product_option_id']; ?>">
                   <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <b class="req-star"><?php echo $option['name']; ?>:</b><br />
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                    <?php if ($option_value['quantity_status']) { ?>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php } else { ?>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" disabled/>
                    <?php } ?>
                  <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                  <br />
                  <?php } ?>
                  </div>
                </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
             <div id="option-<?php echo $option['product_option_id']; ?>">
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	            </div>
	         </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
             <div id="option-<?php echo $option['product_option_id']; ?>">
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
	            </div>
	         </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>">
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label"><?php echo $option['name']; ?></label>
	              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
	              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
	            </div>
	        </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
	            <div id="option-<?php echo $option['product_option_id']; ?>">
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <div class="input-group date">
	                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	                <span class="input-group-btn">
	                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
	                </span></div>
	            </div>
	        </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>">
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <div class="input-group datetime">
	                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	                <span class="input-group-btn">
	                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
	                </span></div>
	            </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>">
	            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
	              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
	              <div class="input-group time">
	                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
	                <span class="input-group-btn">
	                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
	                </span></div>
	            </div>
            </div>
            <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
             <?php if ($minimum > 1) { ?>
            <div>
            	<i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
				<input type="hidden" id="minimumval" value="<?php echo $minimum; ?>">
            </div>
            <?php } ?>
            <div class="cart">
        <div class="number">
          <input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden">
          <div class="frame-change-count">
            <div class="btn-plus">
              <button type="button" id="superplus" onclick="update_prices('<?php echo $product_id; ?>');" class="main-color1">
                <span class="icon-plus"><i class="fa fa-plus"></i></span>
              </button>
            </div>
            <div class="btn-minus">
              <button type="button" id="superminus" onclick="update_prices('<?php echo $product_id; ?>');" class="main-color1">
                <span class="icon-minus"><i class="fa fa-minus"></i></span>
              </button>
            </div>
          </div>
          <input type="text" name="quantity" value="<?php echo $minimum; ?>" maxlength="4" class="plus-minus" onchange="update_prices('<?php echo $product_id; ?>'); return validate(this);" onkeyup="update_prices('<?php echo $product_id; ?>'); return validate(this);">
        </div>
        <div class="btn-group">
                    <button type="button" class="btn btn-default main-color1-text" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
                              <button type="button" class="btn btn-default main-color1-text" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
                  </div>
                  <div class="clearfix"></div>
        <a id="button-cart" class="button"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;<?php echo $button_cart; ?></a>
       <?php if ( isset($popup_purchase_data['status']) && $popup_purchase_data['status'] ) { ?>
         <br/><a href="javascript: void(0);" onclick="get_popup_purchase(<?php echo $product_id; ?>); return false" class="button" id="oneclickbuy"><i class="fa fa-hand-pointer-o"></i>&nbsp;&nbsp;<?php echo $text_one_click_buy; ?></a>
         <?php } ?>
       </div>
       <div class="additional-buttons">
        </div>
        <div class="clearfix"></div>
            <?php } ?>
      <?php if ($tags) { ?>
        <div class="tags"><b><?php echo $text_tags; ?></b>
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
            <?php if ($i < (count($tags) - 1)) { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
            <?php } else { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
            <?php } ?>
            <?php } ?>
        </div>
  <?php } ?>
   <?php if($store_text!='') {
               echo html_entity_decode($store_text);
   } ?>
</div>
    <div class="clearfix"></div>
    <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
  <div class="<?php echo $class; ?> tabs-box scrolled">
  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
            <?php if ($product_extra_tabs) { ?>
              <?php $tab_i=0; foreach ($product_extra_tabs as $product_extra_tab) { ?>
                <li><a href="#tab-extra-<?php echo $tab_i; ?>" data-toggle="tab"><?php echo $product_extra_tab['title']; ?></a></li>
              <?php $tab_i++; } ?>
            <?php } ?>
   </ul>
  <div class="tab-content">
  <div id="tab-description" class="tab-pane active">
	   <div itemprop="description">
	   	<?php echo $description; ?>
	   </div>
  </div>
  <?php if ($product_extra_tabs) { ?>
    <?php $tab_i=0; foreach ($product_extra_tabs as $product_extra_tab) { ?>
      <div class="tab-pane" id="tab-extra-<?php echo $tab_i; ?>"><?php echo $product_extra_tab['text']; ?></div>
    <?php $tab_i++; } ?>
  <?php } ?>
   <?php if ($attribute_groups) { ?>
    <div class="tab-pane" id="tab-specification">
      <table class="table table-bordered">
        <?php foreach ($attribute_groups as $attribute_group) { ?>
        <tbody>
          <tr>
            <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
          </tr>
        </tbody>
        <tbody>
          <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
          <tr>
            <td><?php echo $attribute['name']; ?></td>
            <td><?php echo $attribute['text']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
        <?php } ?>
      </table>
    </div>
    <?php } ?>
  <?php if ($review_status) { ?>
  <div class="tab-pane" id="tab-review">
      <div class="rew-form">
	    <div id="review"></div>
	    <?php if ($review_guest) { ?>
	     	<div class="sub">
			    <form id="form-review">
				    <h2 id="review-title"><?php echo $text_write; ?></h2>
				    <div class="reviewfield">
				        <label class="col-sm-3" for="input-name"><?php echo $entry_name; ?></label>
				        <div class="col-sm-9">
				        	<input type="text" id="input-name" name="name" value="" placeholder="<?php echo str_replace(":", "", $entry_name); ?>"/>
				        </div>
						<div class="clearfix"></div>
				    </div>
            <?php if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) { ?>
            <div class="reviewfield">
                <label class="control-label col-sm-3 input-positive_text" for="input-positive_text"><?php echo $entry_positive_text; ?></label>
                <div class="col-sm-9">
                	<textarea name="positive_text" rows="3" id="input-positive_text" placeholder="<?php echo str_replace(":", "", $entry_positive_text); ?>"></textarea>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="reviewfield">
                <label class="control-label col-sm-3 input-negative_text" for="input-negative_text"><?php echo $entry_negative_text; ?></label>
                <div class="col-sm-9">
                	<textarea name="negative_text" rows="3" id="input-negative_text" placeholder="<?php echo str_replace(":", "", $entry_negative_text); ?>"></textarea>
                </div>
                <div class="clearfix"></div>
            </div>
            <input type="hidden" name="where_bought" value="1" />
            <?php } ?>
				    <div class="reviewfield">
				        <label class="col-sm-3" for="input-text"><?php echo $entry_review; ?></label>
				        <div class="col-sm-9">
				        	<textarea id="input-text" name="text" cols="40" rows="8" placeholder="<?php echo str_replace(":", "", $entry_review); ?>"></textarea>
				        </div>
						<div class="clearfix"></div>
				    </div>
				    <div class="reviewfield">
				        <label class="col-sm-3"><?php echo $entry_rating; ?></label>
				        <div class="col-sm-9">
						<select id="ratingme" name="rating">
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
						</select>
						<script type="text/javascript">
						   $(function() {
						      $('#ratingme').barrating({
						        theme: 'fontawesome-stars'
						      });
						   });
						</script>
				        </div>
						<div class="clearfix"></div>
				    </div>
				    <?php if (isset($captcha)) { ?>
				    <div class="reviewfield">
				    	<?php echo $captcha; ?>
						<div class="clearfix"></div>
				    </div>
				    <?php } ?>
                    <?php if ($text_terms) { ?>
                        <div class="reviewfield">
                          <label class="col-sm-3"></label>
                          <div class="col-sm-9">
                            <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" />
                          </div>
                        </div>
                        <br/><br/>
                      <?php } ?>
				    <div class="reviewfield">
				        <div class="buttons col-sm-offset-3 col-sm-9">
				          <div class="left"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
				        </div>
						<div class="clearfix"></div>
				    </div>
				</form>
				</div>
	    </div>
	    <div class="clearfix"></div>
	    <?php } else { ?>
        <div class="rew-disabled"><?php echo $text_login; ?></div>
        <?php } ?>
	</div>
   </div>
   </div>
  <?php } ?>
  </div></div>
  </article>
  </div>
  <div class="clearfix"></div>
  </div>
  </div>
    <?php if ($products) { ?>
		<div class="box-main">
		<div class="news-set center">
		<h4 class="inner"><span><?php echo $text_related; ?></span></h4>
		</div>
		 <div class="category-slide">
                            <div id="cat-latest" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
                            <?php
                            $cnt = count($products);
                            if($cnt > 1) {
	                            $autoplay = "true";
	                        } else {
		                    	$autoplay = "false";
		                    }
                            ?>
                                <?php foreach ($products as $product) { ?>
                                        <div class="item">
                                        	<?php if ($product['product_stickers']) { ?>
									        <div class="sticker-box-cat">
									          <?php foreach ($product['product_stickers'] as $product_sticker) { ?>
									            <span class="stickers-cat" style="color: <?php echo $product_sticker['color']; ?>; background: <?php echo $product_sticker['background']; ?>;">
									              <?php echo $product_sticker['text']; ?>
									            </span>
									          <?php } ?>
									        </div>
									        <?php } ?>
                                            <?php if ($product['thumb']) { ?>
				                                <div class="image">
                                                    <a href="<?php echo $product['href']; ?>">
                                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                                    </a>
                                                </div>
				                            <?php } ?>
                                            <div class="cart">
                                                 <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-cart" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                                 <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                                 <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>" class="compare"><i class="fa fa-exchange" aria-hidden="true"></i></a>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="name">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['price']) { ?>
                                            <div class="price">
                                                <?php if (!$product['special']) { ?>
                                                    <?php echo $product['price']; ?>
                                                <?php } else { ?>
                                                    <span class="price-old"><?php echo $product['price']; ?></span> <?php echo $product['special']; ?>
                                                <?php } ?>
                                            </div>
                                          <?php } ?>
                                          <?php if ($product['rating']) { ?>
									        <div class="rating">
									          <?php for ($i = 1; $i <= 5; $i++) { ?>
									          <?php if ($product['rating'] < $i) { ?>
									          <span><i class="fa fa-star-o stars-rev"></i></span>
									          <?php } else { ?>
									          <span><i class="fa fa-star stars-rev"></i></span>
									          <?php } ?>
									          <?php } ?>
									        </div>
									        <?php } ?>
                                        </div>
                                    <?php } ?>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <script>
                        $(document).ready(function() {
                          $('#cat-latest').owlCarousel({
                            autoplay:<?php echo $autoplay; ?>,
                            autoplaySpeed:1500,
                            autoplayHoverPause:true,
                            nav:true,
                            dots:false,
                            navText:["<",">"],
                            responsiveClass:true,
                            responsive:{
                                0:{
                                    items:1,
                                    nav:true
                                },
                                600:{
                                    items:2,
                                    nav:false
                                },
                                1000:{
                                    items:5,
                                    nav:true,
                                    loop:false
                                }
                            }
                        });
                        });
                        </script>
                        </div>
  <?php } ?>
<?php echo $content_bottom; ?>
<script>
if ("ontouchstart" in window || navigator.msMaxTouchPoints)
{
    isTouch = true;
} else {
    isTouch = false;
}
$(document).ready(function() {
  $('.image-additional').delay(240).css({ 'opacity': '1'});
});
$('[data-toggle="tooltip"]').tooltip({trigger: isTouch ? "click" : "hover"});
$('[data-toggle="tooltip"]').on('show.bs.tooltip', function() {
	$('[data-toggle="tooltip"]').not(this).tooltip('hide');
});
</script>
<script type="text/javascript"><!--
    var elm = $('#htop');
    function spin( vl ) {
    elm.val( parseInt( elm.val(), 10 ) + vl );
      }
$('#superminus').click( function() {
	var cols = $(".plus-minus").val();
	if (cols > 1 ){$(".plus-minus").val(cols - 1)};
});
$('#superplus').click( function() {
	var num = +$(".plus-minus").val() + 1;
	$(".plus-minus").val(num);
});
//--></script>
<?php if(count($images) > 4) { ?>
<script type="text/javascript">
	$(document).ready(function(){
	  $('.image-additional-carousel').owlCarousel({
		loop:false,
        autoplay:false,
        dots:false,
        navText:["<",">"],
        margin: 10,
        responsiveClass:true,
        responsive:{
            0:{
                items:2,
                nav:true
            },
            600:{
                items:2,
                nav:true
            },
            1000:{
                items:4,
                nav:true
            }
        }
	});
});
</script>
<?php } else { ?>
<script type="text/javascript">
	$(document).ready(function(){
	  $('.image-additional-carousel').owlCarousel({
		loop:false,
        autoplay:false,
        dots:false,
        nav:false,
        responsiveClass:true,
        responsive:{
            0:{
                items:2,
                nav:false
            },
            600:{
                items:2,
                nav:false
            },
            1000:{
                items:4,
                nav:false
            }
        }
	});
});
</script>
<?php } ?>
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).append('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			}
		if (json['success']) {
				$('#partcont').html('<div class="mcartdiv"><div class="mcartok">' + json['text_ok'] + '</div><div class="mcarti"><div class="imagesd"><div class="iconer ' + json['lang'] + '"></div><img class="mcartimage" src="' + json['image'] + '"><br /><div class="mcartproductname">' + json['name'] + '</div></div></div><div class="mcartright">' + json['cart_text1'] + ' <br /><br /><a class="testbutton" href="' + json['checkoutlink'] + '">' + json['cart_button1'] + '</a> <div class="mcarthr">&nbsp;</div> ' + json['cart_text2'] + ' <br/><br/><button class="testbutton" id="cls">' + json['cart_button2'] + '</button></div><div class="clearfix"></div></div>');
				$('#part').fadeIn('slow');
				$('#cart-total').html(json['total']);
				getCartMobile();
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
$('.time').datetimepicker({
	pickDate: false
});
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	$('#form-upload').remove();
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	$('#form-upload input[name=\'file\']').trigger('click');
	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					if (json['success']) {
						alert(json['success']);
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
    $('#review').fadeOut('slow');
    $('#review').load(this.href);
    $('#review').fadeIn('slow');
});
$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                $('#form-review').slideUp();
			}
		}
	});
});
$('.thumbnails').each(function() {
  var $container = $(this);
  var $imageLinks = $container.find('.dataitem');
  var items =	 [
       <?php
       $aka = 1;
       foreach ($images as $image) {
        $zap = ",";
        if($aka  == count($images)) {$zap = "";}
        ?>
       {
        src: '<?php echo $image['popup']; ?>'
      }<?php
      $aka++;
      echo $zap;
      } ?>];
  $imageLinks.magnificPopup({
    mainClass: 'mfp-fade',
    items: items,
    gallery:{
        enabled:true
    },
    type: 'image',
    callbacks: {
      beforeOpen: function() {
        var index = $imageLinks.index(this.st.el);
        if (-1 !== index) {
          this.goTo(index);
        }
      }
    }
  });
});
$(document).ready(function() {
	$('.thumbnails-one').magnificPopup({
	items: [
       <?php
		       $aka = 1;
		       foreach ($images as $image) {
		        $zap = ",";
		        if($aka  == count($images)) {$zap = "";}
		        ?>
		       {
		        src: '<?php echo $image['popup']; ?>'
		      }<?php
		      		$aka++;
			  			echo $zap;
		      } ?>
      ],
	type:'image',
	callbacks: {
      open: function() {
        $('.magnify-lens').hide();
      }
    },
	gallery: {
		enabled:true
	}
});
});
//--></script>
<?php if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) { ?>
<script type="text/javascript">
  function review_reputation(review_id, reputation_type) {
    $.ajax({
      url: 'index.php?route=product/product/oct_review_reputation&review_id='+review_id+'&reputation_type='+reputation_type,
      type: 'post',
      dataType: 'json',
      success: function(json) {
        $('.rew-form .alert-success, .rew-form .alert-danger').remove();
        if (json['error']) {
          alert(json['error']);
        }
        if (json['success']) {
          alert(json['success']);
          $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
        }
      }
    });
  }
</script>
<?php } ?>
<?php echo $footer; ?>
