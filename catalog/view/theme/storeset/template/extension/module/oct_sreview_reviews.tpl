<?php if($position == "column_left" OR $position == "column_right") { ?>



<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content module-left">
        <div id="owl-latest-sreview" class="owl-carousel owl-theme">
             
            <?php 
                $col = 0;
                $all = 1;
                $allproducts = count($reviews);
                foreach ($reviews as $review) {   
                $col++;   
              if($col == 1) echo "<div class=\"item\">";
            ?>
                <div class="product-box-item">
                    <div class="swiper-slide">
                         <p class="sreview-author"><?php echo $review['author']; ?></p>
                         <p class="sreview-date"><?php echo $review['date_added']; ?></p>
						 <p class="sreview-text"><?php echo $review['text']; ?></p>
                         <?php if ($review['avg_rating']) { ?>
				        <div class="rating">
				          <?php for ($i = 1; $i <= 5; $i++) { ?>
				          <?php if ($review['avg_rating'] < $i) { ?>
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
      	  <div class="button-all-sreview">
      	  <a href="<?php echo $reviews_link; ?>" class="button"><?php echo $text_reviews_link; ?></a>	
      	  </div>
    </div>
</div> 
      
    <script>
    $(document).ready(function() {
      $('#owl-latest-sreview').owlCarousel({
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
						<h4 class="inner"><span><a href="<?php echo $reviews_link; ?>"><?php echo $heading_title; ?></a></h4>
						</div>
						<div class="category-slide">
                            <div id="latest-sreview" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
                                <?php foreach ($reviews as $review) { ?>
                                        <div class="item">
											 <p class="sreview-author"><?php echo $review['author']; ?></p>
					                         <p class="sreview-date"><?php echo $review['date_added']; ?></p>
											 <p class="sreview-text"><?php echo $review['text']; ?></p>

                                          <?php if ($review['avg_rating']) { ?>
									        <div class="rating">
									          <?php for ($i = 1; $i <= 5; $i++) { ?>
									          <?php if ($review['avg_rating'] < $i) { ?>
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
                          $('#latest-sreview').owlCarousel({
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