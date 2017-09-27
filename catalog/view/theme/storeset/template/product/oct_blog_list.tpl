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
    <div class="top-menu">
        <div class="display">
            <h1 style="margin: 0;"><?php echo $heading_title; ?></h1>
        </div>
        <div class="show-items"><?php echo $text_limit; ?>
          <select id="input-limit" onchange="location = this.value;">
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
          <select id="input-sort"onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
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
      
      <?php if ($blogs) { ?>
          <div class="row">
            <?php foreach ($blogs as $blog) { ?>
                <div class="cols"> 
                    <div class="blog-layout blog-list">
                      <div class="blog-thumb">
                        <div class="image"><a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['thumb']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" class="img-responsive" /></a></div>
                        <div>
                          <div class="blog-caption">
                            <h4><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h4>
                            <p class="date"><i class="fa fa-clock-o"></i> <?php echo $blog['date_added']; ?></p>
                            <p class="text"><?php echo $blog['description']; ?></p>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
            <?php } ?>
          </div>
          <div class="pagination"><?php echo $pagination; ?></div> 
          <?php } ?>
          <?php if (!$blogs) { ?>
              <p><?php echo $text_empty; ?></p>
              <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
              </div>
          <?php } ?>
      </article>
      
      <div class="clearfix"></div>
    </div>
</div>
<?php echo $content_bottom; ?>
<script>

// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .cols').attr('class', 'col-lg-6 col-md-6 col-sm-6 col-xs-6');
		} else if (cols == 1) {
			$('#content .cols').attr('class', 'col-lg-4 col-md-4 col-sm-6 col-xs-6');
		} else {
			$('#content .cols').attr('class', 'col-lg-3 col-md-3 col-sm-6 col-xs-6');
		}
        
        cols1 = $('#column-right, #column-left').length;
	
    	if (cols1 == 2) {
    		$('#content > div:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
    	} else if (cols1 == 1) {
    		$('#content > div:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
    	} else {
    		$('#content > div:nth-child(4n+4)').after('<div class="clearfix"></div>');
    	}

</script>
<?php echo $footer; ?>