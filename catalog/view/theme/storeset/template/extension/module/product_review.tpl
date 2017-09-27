<?php if($position == "column_left" OR $position == "column_right") { ?>

<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content module-left">
        <div id="owl-com-column" class="owl-carousel owl-theme nomar">
             
           <?php foreach ($reviews as $review) { ?>
                                    
                                    
            <div class="item">
             
		    <div class="product-thumb transition">
		      <div class="image"><a href="<?php echo $review['href']; ?>"><img src="<?php echo $review['thumb']; ?>" alt="<?php echo $review['name']; ?>" title="<?php echo $review['name']; ?>" class="img-responsive" /></a></div>
		      <div class="caption com-column">
		        <h4 class="comm-st"><a href="<?php echo $review['href']; ?>"><?php echo $review['name']; ?></a></h4>
		        <?php if ($review['rating']) { ?>
		        <div class="rating">
		          <?php for ($i = 1; $i <= 5; $i++) { ?>
		          <?php if ($review['rating'] < $i) { ?>
		          <span><i class="fa fa-star-o stars-rev"></i></span>
		          <?php } else { ?>
		          <span><i class="fa fa-star stars-rev"></i></span>
		          <?php } ?>
		          <?php } ?>
		        </div>
		        <?php } ?>
		        <p class="rcom"><?php echo $review['text']; ?></p>
		      </div>
		    </div>
           
           </div>
       
        <?php } ?>
          
          
        </div>		
    </div>
</div> 
      
    <script>
    $(document).ready(function() {
      $('#owl-com-column').owlCarousel({
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
					<div class="category-slide revcom">
                        
                            <div id="cat-rew" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
                            
                            
                                <?php foreach ($reviews as $review) { ?>
                                    
                                    
                                        <div class="item">
                                         
									    <div class="product-thumb transition">
									      <div class="image"><a href="<?php echo $review['href']; ?>"><img src="<?php echo $review['thumb']; ?>" alt="<?php echo $review['name']; ?>" title="<?php echo $review['name']; ?>" class="img-responsive" /></a></div>
									      <div class="caption">
									        <h4 class="comm-st"><a href="<?php echo $review['href']; ?>"><?php echo $review['name']; ?></a></h4>
									        <?php if ($review['rating']) { ?>
									        <div class="rating">
									          <?php for ($i = 1; $i <= 5; $i++) { ?>
									          <?php if ($review['rating'] < $i) { ?>
									          <span><i class="fa fa-star-o stars-rev"></i></span>
									          <?php } else { ?>
									          <span><i class="fa fa-star stars-rev"></i></span>
									          <?php } ?>
									          <?php } ?>
									        </div>
									        <?php } ?>
									        <p class="rcom"><?php echo $review['text']; ?></p>
									      </div>
									    </div>
                                       
                                       </div>
                                   
                                    <?php } ?>

                                            
                            
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <script>
                        $(document).ready(function() {
                          $('#cat-rew').owlCarousel({
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
