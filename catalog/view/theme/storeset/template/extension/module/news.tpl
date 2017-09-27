
<?php if ($news) { ?>
    <div class="news-box">
      <h3>
        <?php if ($customtitle) { ?>
          <?php echo $customtitle; ?>
        <?php } ?>
      </h3>
      <div class="category-slide">
        <div id="news-slider" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
        <?php foreach ($news as $news_story) { ?>
          <div class="item">
            <?php if ($news_story['image']) { ?>
                <a href="<?php echo $news_story['href']; ?>" class="news-image"><img src="<?php echo $news_story['image']; ?>" alt="<?php echo $news_story['title']; ?>" /></a> 
            <?php } ?>
                <div class="news-desc">
                    <?php if ($show_headline) { ?>
                      <div class="news-header"><a href="<?php echo $news_story['href']; ?>"><?php echo $news_story['title']; ?></a></div>
                    <?php } ?>
                    <p><?php echo $news_story['description']; ?></p>
                    <p><a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a></p>
                </div>
                <div class="clearfix"></div>
          </div>
        <?php } ?>
        </div>
      </div>
    </div>
  <div class="clearfix"></div>
  <script>
    $(document).ready(function() {
      $("#news-slider").owlCarousel({
        itemsCustom : [[0, 1], [461, 1], [750, 2], [1000, 2], [1200, 2]],
        slideSpeed : 500,
        paginationSpeed : 800,
        rewindSpeed : 1000,
        autoPlay : false,
        stopOnHover : true,
        navigation : true,
        rewindNav : false,
        scrollPerPage : true,
        pagination: false,
        rewindNav: true                
      });
    });
    </script>
<?php } ?>