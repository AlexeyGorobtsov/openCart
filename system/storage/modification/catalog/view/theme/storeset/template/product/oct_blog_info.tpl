<?php echo $header; ?>
<div class="content"><?php echo $content_top; ?></div>
<div id="container">
  <div class="row">
        <ul class="breadcrumb">
            
	<?php foreach ($breadcrumbs as $cnt=> $breadcrumb) { ?>
	<?php if($cnt==0) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } elseif($cnt+1<count($breadcrumbs)) { ?>
		<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a itemprop="url" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
	<?php } else { ?>
		<li><?php echo $breadcrumb['text']; ?></li>
	<?php } ?>
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
      <div class="col-md-12 news-full-desc">
        <?php if ( $image ) { ?><img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" class="img-thumbnail" /><?php } ?>
        <h1 class="news-full-desc-header"><?php echo $heading_title; ?></h1>
      <p><i class="fa fa-clock-o"></i> <?php echo $date_added; ?></p>
        <?php echo str_replace("<img", "<img class=\"img-class img-responsive\"", $description); ?>
        
        
      </div>   
      </div>
      <?php if ( $products ) { ?>
   
   <h3 class="news-featured"><?php echo $heading_products_title; ?></h3>
   
   
   
   
   
   <div class="product-grid row">
    <?php $a = 0; ?>
    <?php foreach ($products as $product) { ?>
    <div class="cols">    
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
                    <?php 
                    if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
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
          <div class="product-buttons">
              <?php if ($product['rating']) { ?>
              <div class="rating"><img src="catalog/view/theme/storeset/images/stars-<?php echo $product['rating']; ?>.png" /></div>
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
  </div>
   
    
   
   
   
      
      <?php } ?>
      
      </article>
      </div>
        <div class="clearfix"></div>
</div>
      <?php echo $content_bottom; ?>
<script>


    
    $('.img-class').each(function(){
	    var $this = $(this); 
	    $this.wrap('<a class="hrefimage" href="' + $this.attr('src') + '"></a>');
	});
	
	$(document).ready(function() {
	
	$('.hrefimage').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		closeBtnInside: false,
		fixedContentPos: true,
		mainClass: 'mfp-no-margins mfp-with-zoom', 
		image: {
			verticalFit: true
		},
		zoom: {
			enabled: true,
			duration: 300 
		}
	});

});

// What a shame bootstrap does not take into account dynamically loaded columns
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
<?php echo $footer; ?>