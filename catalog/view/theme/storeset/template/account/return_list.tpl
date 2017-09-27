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
      <h2><i class="fa fa-reply"></i><?php echo $heading_title; ?></h1>
      <?php if ($returns) { ?>
      <div class="table-div wishlist-table">
	      <table class="table table-hover">
	        <thead>
	          <tr class="wishlist-tr">
	            <td class="text-right"><?php echo $column_return_id; ?></td>
	            <td class="text-left"><?php echo $column_status; ?></td>
	            <td class="text-left"><?php echo $column_date_added; ?></td>
	            <td class="text-right"><?php echo $column_order_id; ?></td>
	            <td class="text-left"><?php echo $column_customer; ?></td>
	            <td></td>
	          </tr>
	        </thead>
	        <tbody>
	          <?php foreach ($returns as $return) { ?>
	          <tr class="wishlist-content-tr">
	            <td class="text-center">#<?php echo $return['return_id']; ?></td>
	            <td class="text-left"><?php echo $return['status']; ?></td>
	            <td class="text-left"><?php echo $return['date_added']; ?></td>
	            <td class="text-right"><?php echo $return['order_id']; ?></td>
	            <td class="text-left"><?php echo $return['name']; ?></td>
	            <td><a href="<?php echo $return['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
	          </tr>
	          <?php } ?>
	        </tbody>
	      </table>
      </div>
      <div class="text-right"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
      </div>
      </article>
      </div>
      <div class="clearfix"></div>
  </div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>