<?php $module_id = rand(0,50000); ?>
<?php if($position == "column_left" OR $position == "column_right") { ?>

<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content module-left">
        <div id="owl-featured-column-<?php echo $module_id; ?>" class="owl-carousel owl-theme">
             
            <?php 
                $col = 0;
                $all = 1;
                $allproducts = count($products);
                foreach ($products as $product) {   
                $col++;   
              if($col == 1) echo "<div class=\"item\">";
            ?>
                <div class="product-box-item">
                    <div class="swiper-slide">
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
                            <a class="img-box" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                        <?php } ?>
                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                        <?php if ($product['price']) { ?>
                        
                          <?php if (!$product['special']) { ?>
                           <span class="price-new"><?php echo $product['price']; ?></span>
                          <?php } else { ?>
                          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                          <?php } ?>
                        
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
               </div> 
             <?php 
             if($col == 2) echo "</div>";
             if($allproducts == $all && $col == 1) echo  "</div>";
             if($col == 2) $col = 0;
             $all++;
             } ?> 
      	  </div>		
    </div>
</div> 
      
    <script>
    $(document).ready(function() {
      $('#owl-featured-column-<?php echo $module_id; ?>').owlCarousel({
        loop:true,
        autoplay:true,
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
                items:1,
                nav:false
            },
            1000:{
                items:1,
                nav:true,
                loop:true
            }
        }
    });
    });
    </script>

<?php } else { ?>

                    <div class="box-main">
						<div class="news-set center">
						<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
						</div>
					<div class="category-slide">
                        
                            <div id="cat-feautured-<?php echo $module_id; ?>" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
                            
                            
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
                          $('#cat-feautured-<?php echo $module_id; ?>').owlCarousel({
                            loop:true,
                            autoplay:true,
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