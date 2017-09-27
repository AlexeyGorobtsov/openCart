

<div class="box-main">
<ul class="nav nav-tabs">
    <?php if($latest_products){ ?>
        <li class="active"><a href="#tab-latest-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
    <?php } ?>
    <?php if($featured_products){ ?>
        <li><a href="#tab-featured-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
    <?php } ?>
    <?php if($bestseller_products){ ?>
        <li><a href="#tab-bestseller-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_bestseller; ?></a></li>
    <?php } ?>
    <?php if($special_products){ ?>
        <li><a href="#tab-special-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_special; ?></a></li>
    <?php } ?>
</ul>
<div class="tab-content">


<?php if($latest_products){ ?>

    <div id="tab-latest-<?php echo $module; ?>" class="tab-pane active">
        <div id="owl-example1" class="owl-carousel owl-theme">
          <?php foreach ($latest_products as $product) { ?>
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
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name'] ?>" /></a>
                    </div> 
                <?php } ?>
                <div class="cart">
                 <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-cart" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                 <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                 <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>" class="compare"><i class="fa fa-exchange" aria-hidden="true"></i></a>
                </div>
                <div class="clearfix"></div>   
                  <div class="name">
                    <a href="<?php echo $product['href']; ?>"><?php echo utf8_substr(strip_tags(html_entity_decode($product['name'])), 0, 30)."..." ?></a>
                  </div>  
                  <?php if ($product['price']) { ?>
                    <div class="price">
                        <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?> 
                        <?php } else { ?>
                            <?php echo $product['special']; ?><br/><span class="price-old"><?php echo $product['price']; ?></span>
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
     
<?php } ?> 

<?php if($featured_products){ ?>
    <div id="tab-featured-<?php echo $module; ?>" class="tab-pane">
        <div id="owl-example2" class="owl-carousel owl-theme">
            <?php foreach ($featured_products as $product) { ?>
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
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name'] ?>" /></a>
                        </div> 
                    <?php } ?>
                    <div class="cart">
                     <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-cart" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
	                 <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
	                 <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>" class="compare"><i class="fa fa-exchange" aria-hidden="true"></i></a>
                    </div>
                    <div class="clearfix"></div>   
                      <div class="name">
                        <a href="<?php echo $product['href']; ?>"><?php echo utf8_substr(strip_tags(html_entity_decode($product['name'])), 0, 30)."..." ?></a>
                      </div>  
                      <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?> 
                            <?php } else { ?>
                                <?php echo $product['special']; ?><br/><span class="price-old"><?php echo $product['price']; ?></span>
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
<?php } ?>

<?php if($bestseller_products){ ?>
    <div id="tab-bestseller-<?php echo $module; ?>" class="tab-pane">
        <div id="owl-example3" class="owl-carousel owl-theme">
              <?php foreach ($bestseller_products as $product) { ?>
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
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name'] ?>" /></a>
                        </div> 
                    <?php } ?>
                    <div class="cart">
                      <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-cart" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
					  <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
					  <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>" class="compare"><i class="fa fa-exchange" aria-hidden="true"></i></a>
                    </div>
                    <div class="clearfix"></div>   
                      <div class="name">
                        <a href="<?php echo $product['href']; ?>"><?php echo utf8_substr(strip_tags(html_entity_decode($product['name'])), 0, 30)."..." ?></a>
                      </div>  
                      <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?> 
                            <?php } else { ?>
                                <?php echo $product['special']; ?><br/><span class="price-old"><?php echo $product['price']; ?></span>
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
<?php } ?>

<?php if($special_products){ ?>
    <div id="tab-special-<?php echo $module; ?>" class="tab-pane">
        <div id="owl-example4" class="owl-carousel owl-theme">
              <?php foreach ($special_products as $product) { ?>
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
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name'] ?>" /></a>
                        </div> 
                    <?php } ?>
                    <div class="cart">
                      <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-cart" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
					  <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_wishlist; ?>" class="wishlist"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
					  <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"  title="<?php echo $button_compare; ?>" class="compare"><i class="fa fa-exchange" aria-hidden="true"></i></a>
                    </div>
                    <div class="clearfix"></div>   
                      <div class="name">
                        <a href="<?php echo $product['href']; ?>"><?php echo utf8_substr(strip_tags(html_entity_decode($product['name'])), 0, 30)."..." ?></a>
                      </div>  
                      <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?> 
                            <?php } else { ?>
                                <?php echo $product['special']; ?><br/><span class="price-old"><?php echo $product['price']; ?></span>
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
<?php } ?>
</div>
<script type="text/javascript">
// 4 в 1

function initialize_owl(el) {
    el.owlCarousel({
        margin: 20,
        nav: true,
        navText: ["<",">"],
        autoplay: true,
        autoplayHoverPause: true,
        smartSpeed: 800,
        loop: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: true
            },
            600: {
                items: 2,
                nav: true
            },
            1000: {
                items: 5,
                nav: true
            }
        }
    });
}

function destroy_owl(el) {
    el.trigger("destroy.owl.carousel");
    el.find('.owl-stage-outer').children(':eq(0)').unwrap();

}


$(document).ready(function () {

    initialize_owl($('#owl-example1'));

    $('a[href="#tab-latest-<?php echo $module; ?>"]').on('shown.bs.tab', function () {
        initialize_owl($('#owl-example1'));
    }).on('hide.bs.tab', function () {
        destroy_owl($('#owl-example1'));
    });

    $('a[href="#tab-featured-<?php echo $module; ?>"]').on('shown.bs.tab', function () {
        initialize_owl($('#owl-example2'));
    }).on('hide.bs.tab', function () {
        destroy_owl($('#owl-example2'));
    });

    $('a[href="#tab-bestseller-<?php echo $module; ?>"]').on('shown.bs.tab', function () {
        initialize_owl($('#owl-example3'));
    }).on('hide.bs.tab', function () {
        destroy_owl($('#owl-example3'));
    });

    $('a[href="#tab-special-<?php echo $module; ?>"]').on('shown.bs.tab', function () {
        initialize_owl($('#owl-example4'));
    }).on('hide.bs.tab', function () {
        destroy_owl($('#owl-example4'));
    });
});
</script>
</div>