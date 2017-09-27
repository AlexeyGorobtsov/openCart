<div  class="box">
        <div class="box-content">
            <div class="banner">

                <div id="banner<?php echo $module; ?>" class="banner" class="owl-carousel">
                  <?php foreach ($banners as $banner) { ?>
                  <?php if ($banner['link']) { ?>
                  <div><a href="<?php echo $banner['link']; ?>" class="image-hover-effect"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
                  <?php } else { ?>
                  <div class="image-hover-effect"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
                  <?php } ?>
                  <?php } ?>
                </div>

            </div>
        </div>
</div>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 1,
	autoplay: <?php if(count($banners) > 1) { echo "true"; } else { echo "false"; } ?>,
    autoplaySpeed:1500,
    autoplayHoverPause:true,
    nav:true,
    dots:false,
    navText:["<",">"],
    responsiveClass:true,
	loop: <?php if(count($banners) > 1) { echo "true"; } else { echo "false"; } ?>
});
--></script>    
    
