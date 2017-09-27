<!-- ********** Slideshow ********** -->
<div class="slideshow-box oct-slideshow">
            <div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
              <?php foreach ($banners_plus as $banner) { ?>
              <div class="item">
                  <div class="col-sm-6 col-xs-6 element-animation-fi">
                      <h2><?php echo $banner['title']; ?></h2>
                      <p><?php echo $banner['description']; ?></p>
	                  <a class="slideshow-plus-link button-more" href="<?php echo $banner['link']; ?>" ><?php echo $banner['button']; ?></a>
                  </div>
                  <div class="col-sm-6 col-xs-6 element-animation-bi">
                      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="" class="img-responsive" /></a>
                  </div>
              </div>
              <?php } ?>
            </div>
</div>
<!-- ********** End of slideshow ********** -->