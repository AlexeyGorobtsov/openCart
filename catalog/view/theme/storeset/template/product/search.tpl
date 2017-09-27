<?php echo $header; ?>
<div class="content"><?php echo $content_top; ?></div>
    <div id="container">
        <div class="row">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
      <div class="content">
        
                  
        <?php if ($products) { ?>
            <div class="top-menu">
                <div class="display">                    
                    <h1 class="category-header"><?php echo $heading_title; ?></h1>
                </div>
                <div class="show-items"><?php echo $text_limit; ?>
                    <select onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                            <?php if ($limits['value'] == $limit) { ?>
                                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>            
                </div>           
                <div class="sort"><?php echo $text_sort; ?>
                    <select onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>              
                </div>
         <?php } ?>
         </div>
         <div class="clearfix"></div>
         <?php echo $column_left; ?><?php echo $column_right; ?>
       <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
      <article id="content" class="<?php echo $class; ?>">
          <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
          <div class="row">
            <div class="col-sm-4">
              <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
            </div>
            <div class="col-sm-3">
              <select name="category_id" class="form-control">
                <option value="0"><?php echo $text_category; ?></option>
                <?php foreach ($categories as $category_1) { ?>
                <?php if ($category_1['category_id'] == $category_id) { ?>
                <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                <?php } ?>
                <?php foreach ($category_1['children'] as $category_2) { ?>
                <?php if ($category_2['category_id'] == $category_id) { ?>
                <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                <?php } ?>
                <?php foreach ($category_2['children'] as $category_3) { ?>
                <?php if ($category_3['category_id'] == $category_id) { ?>
                <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                <?php } ?>
                <?php } ?>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="col-sm-5">
              <label class="checkbox-inline">
                <?php if ($sub_category) { ?>
                <input type="checkbox" name="sub_category" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="sub_category" value="1" />
                <?php } ?>
                <?php echo $text_sub_category; ?></label>
                 <p>
	            <label class="checkbox-inline">
	              <?php if ($description) { ?>
	              <input type="checkbox" name="description" value="1" id="description" checked="checked" />
	              <?php } else { ?>
	              <input type="checkbox" name="description" value="1" id="description" />
	              <?php } ?>
	              <?php echo $entry_description; ?></label>
	          </p>
            </div>
          </div>
          
          <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" />
      <h2 class="search-box"><?php echo $text_search; ?></h2>
              
              
              <?php if ($products) { ?>  
      <div class="product-grid row">
        <?php $a = 0; ?>
        <?php foreach ($products as $product) { ?>
        <div class="cols col-lg-4 col-md-4 col-sm-4 col-xs-4">    
        <div class="product">
            <?php if ($product['product_stickers']) { ?>
	        <div class="sticker-box-cat">
	          <?php foreach ($product['product_stickers'] as $product_sticker) { ?>
	            <span class="stickers-cat" style="color: <?php echo $product_sticker['color']; ?>; background: <?php echo $product_sticker['background']; ?>;">
	              <?php echo $product_sticker['text']; ?>
	            </span>
	          <?php } ?>
	        </div>
	        <?php } ?>   
            <?php if ($product['economy']) { ?>
                <div class="sticker">-<?php echo $product['economy']; ?>%</div>
            <?php } ?>
         
            <?php if ($product['thumb']) { ?>
                <div class="image">
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                         <?php if ($product['dop_img']) { ?>
                            <a class="hover-image" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['dop_img']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                        <?php } ?>
                         <?php  if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
                    <a href='javascript:void(0);' class='popup_view_button' onclick='get_popup_view("<?php echo $product['product_id']; ?>");'><?php echo $popup_view_text['button_popup_view']; ?></a>
                    <?php } ?>
                </div>
            <?php } ?>
            <div class="product-about">
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <div class="description"><?php echo $product['description']; ?></div>
                <?php if ($product['price']) { ?>
                   <div class="price">
                   <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                <?php } else { ?>
                   <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if (isset($product['oct_options']) && $product['oct_options']) { ?>
            <div class="cat-options">
              <?php foreach ($product['oct_options'] as $option) { ?>
                <?php if ($option['type'] == 'radio') { ?>
                  <div class="form-group">
                    <label class="control-label"><?php echo $option['name']; ?>: </label>
                    <?php if ($option['product_option_value']) { ?>
                      <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
                        <?php if ($product_option_value['image']) { ?>
                          <div class="radio">
                            <label>
                              <img src="<?php echo $product_option_value['image']; ?>" alt="<?php echo $product_option_value['name']; ?>" class="img-responsive" title="<?php echo $product_option_value['name']; ?>" />
                            </label>
                          </div>
                        <?php } else { ?>
                          <div class="radio">
                            <label><?php echo $product_option_value['name']; ?></label>
                          </div>
                        <?php } ?> 
                      <?php } ?>
                    <?php } ?>
                  </div>
                <?php } else { ?>
                  <div class="form-group size-box">
                    <label class="control-label"><?php echo $option['name']; ?>: </label>
                    <?php if ($option['product_option_value']) { ?>
                      <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
                        <div class="radio">
                          <label><?php echo $product_option_value['name']; ?></label>
                        </div>
                      <?php } ?>
                    <?php } ?>
                  </div>
                <?php } ?>
              <?php } ?>
            </div>
          <?php } ?>
              <div class="product-buttons">
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
                  <a class="cart" title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');">
	                <i class="fa fa-shopping-cart" aria-hidden="true"></i><?php echo $button_cart; ?>
	              </a>
	              <div class="additional">
	                  <a class="wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
	                  <a class="compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange" aria-hidden="true"></i></a>
	              </div>
              </div>
            </div>
        </div> </div> 
          
        <?php } ?>
        <div class="clearfix"></div>
        <div class="pagination"><?php echo $pagination; ?></div>  
              </div>
             </div> 
      <?php } else { ?>
          <p><?php echo $text_empty; ?></p>
          <?php } ?>
         
        
    </article>
    <div class="clearfix"></div>
    </div>
    <?php echo $content_bottom; ?>
<script>

	    var portraitWidth = $(window).width();
	    if (portraitWidth <= '768'){
	        $("#content").removeClass("col-sm-9");
	        $("#content").addClass("col-sm-12");
	    }
	    
	    $(window).resize(function() {
	    	var portraitWidth = $(window).width();
	        
	        if (portraitWidth <= '1024' && portraitWidth > '768'){
	            $("#content").removeClass("col-sm-12");
	            $("#content").addClass("col-sm-9");
	        } else if (portraitWidth <= '768'){
	            $("#content").removeClass("col-sm-9");
	            $("#content").addClass("col-sm-12");
	        }
		
	    }, false);
	    
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-grid .cols').attr('class', 'col-lg-6 col-md-6 col-sm-6 col-xs-6');
		} else if (cols == 1) {
			$('#content .product-grid .cols').attr('class', 'col-lg-4 col-md-4 col-sm-6 col-xs-6');
		} else {
			$('#content .product-grid .cols').attr('class', 'col-lg-3 col-md-3 col-sm-6 col-xs-6');
		}
        
        cols1 = $('#column-right, #column-left').length;
	
    	if (cols1 == 2) {
    		$('#content .product-grid > div:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
    	} else if (cols1 == 1) {
    		$('#content .product-grid > div:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
    	} else {
    		$('#content .product-grid > div:nth-child(4n+4)').after('<div class="clearfix"></div>');
    	}

</script>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>