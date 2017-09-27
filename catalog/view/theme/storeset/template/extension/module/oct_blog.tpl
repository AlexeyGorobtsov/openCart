<?php if($position == "column_left" OR $position == "column_right") { ?>

<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content module-left">
        <div id="owl-news-column" class="owl-carousel owl-theme">
             
            <?php foreach ($blogs as $blog) { ?>
                <div class="item">
                    	<div class="body-news"> 
		                    <h3><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a> </h3>
		                    <a href="<?php echo $blog['href']; ?>" class="img-link image-hover-effect"><img class="img-responsive" src="<?php echo $blog['thumb']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>"></a>
		                    <p><?php echo $blog['description']; ?></p>
		                </div>
		            
               </div> 
             <?php } ?> 
      	  </div>		
    </div>
</div> 
      
    <script>
    $(document).ready(function() {
      $('#owl-news-column').owlCarousel({
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
        <div class="box-main news-style">
            <div class="news-set center">
            			<h4 class="inner"><a href="<?php echo $all_news; ?>"><span><?php echo $heading_title; ?></span></a></h4>
            </div>
          <div id="owl-news-home" class="owl-carousel owl-theme">
          <?php
	        $cnt = count($blogs);
	        if($cnt > 2) { 
	            $autoplay = "true";
	        } else {
	        	$autoplay = "false";
	        }
	        ?>
            <?php foreach ($blogs as $blog) { ?>
		            <div class="item">
		                <div class="body-news"> <a href="<?php echo $blog['href']; ?>" class="img-link image-hover-effect"><img class="img-responsive" src="<?php echo $blog['thumb']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>"></a>
		                    <h3> <span><i class="fa fa-clock-o"></i> <?php echo $blog['date_added']; ?></span> <a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a> </h3>
		                    <p><?php echo $blog['description']; ?></p>
		                </div>
		            </div>
            <?php } ?>
           </div> 
        </div>
<script>
    $(document).ready(function() {
      $('#owl-news-home').owlCarousel({
        loop:true,
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
                nav:false
            },
            600:{
                items:2,
                nav:false
            },
            1000:{
                items:3,
                nav:true,
                loop:true
            }
        }
    });
    });
    </script>
<?php } ?> 