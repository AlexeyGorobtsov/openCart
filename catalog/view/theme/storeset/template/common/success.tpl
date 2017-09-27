<?php echo $header; ?><?php echo $content_top; ?>
<div id="container">
  <div class="row">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
  </div>
  <div class="content">
	  <article id="content" class="account-content">
      <h2><i class="fa fa-check-square"></i><?php echo $heading_title; ?></h2>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
      </div>
      </article>
      <div class="clearfix"></div>
    </div>
  </div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>