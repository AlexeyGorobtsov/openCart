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
      <h2><i class="fa fa-star"></i><?php echo $heading_title; ?></h1>
      <p><?php echo $text_total; ?> <b><?php echo $total; ?></b>.</p>
      <div class="table-div table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr class="wishlist-tr">
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td class="text-left"><?php echo $column_description; ?></td>
              <td class="text-right"><?php echo $column_points; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($rewards) { ?>
            <?php foreach ($rewards  as $reward) { ?>
            <tr class="wishlist-content-tr">
              <td class="text-left"><?php echo $reward['date_added']; ?></td>
              <td class="text-left"><?php if ($reward['order_id']) { ?>
                <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
                <?php } else { ?>
                <?php echo $reward['description']; ?>
                <?php } ?></td>
              <td class="text-right"><?php echo $reward['points']; ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr class="wishlist-content-tr">
              <td class="text-center" colspan="3"><?php echo $text_empty; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="row table-div">
        <div class="col-sm-6 text-center"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-center"><?php echo $results; ?></div>
      </div>
      <div class="buttons clearfix">
        <div><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
      </div>
      </article>
      </div>
      <div class="clearfix"></div>
  </div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>