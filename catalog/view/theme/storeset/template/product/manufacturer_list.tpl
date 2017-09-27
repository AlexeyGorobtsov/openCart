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
  <?php echo $column_left; ?><?php echo $column_right; ?>
   <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
  <article id="content" class="<?php echo $class; ?>">
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($categories) { ?>
  <p><b><?php echo $text_index; ?></b>
    <?php foreach ($categories as $category) { ?>
    &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
    <?php } ?>
  </p>
  <div class="content">
  <?php foreach ($categories as $category) { ?>
  <div class="manufacturer-list">
    <div class="manufacturer-heading"><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></div>
    <div class="manufacturer-content">
      <?php if ($category['manufacturer']) { ?>
      <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
      <ul>
        <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
        <?php for (; $i < $j; $i++) { ?>
        <?php if (isset($category['manufacturer'][$i])) { ?>
        <li><a title="<?php echo $category['manufacturer'][$i]['name']; ?>" href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php if($showlogos == 1) { ?><img src="<?php echo $category['manufacturer'][$i]['img']; ?>" border="0" class="man-list-logo"><br /><?php } else { ?><?php echo $category['manufacturer'][$i]['name']; ?><?php } ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
      <?php } ?>
    </div>
      <div class="clearfix"></div>
  </div>
  <?php } ?>
  </div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  
  <div class="clearfix"></div>
  </article>
  <div class="clearfix"></div>
  </div>
  <?php echo $content_bottom; ?>
<?php echo $footer; ?>