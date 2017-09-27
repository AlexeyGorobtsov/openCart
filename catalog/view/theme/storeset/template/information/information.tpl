<?php echo $header; ?>
<?php echo $content_top; ?>
    <div id="container">
        <div class="row">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
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
          <div class="content info-page">
          	<h1><?php echo $heading_title; ?></h1>
		  	<?php echo $description; ?>
          </div>
          <div class="buttons info-buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
          </div>
          <div class="clearfix"></div>
        </article>
        
          <div class="clearfix"></div>
        </div>
          <div class="clearfix"></div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>