<?php echo $header; ?><?php echo $content_top; ?>
<div id="container">
  <div class="row">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
  </div>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="content">
	  <article id="content" class="account-content">
      <h2><i class="fa fa-clock-o"></i><?php echo $heading_title; ?></h2>
      <div class="table-div wishlist-table">
	      <table class="table table-bordered table-hover">
	        <thead>
	          <tr class="wishlist-tr">
	            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
	          </tr>
	        </thead>
	        <tbody>
	          <tr class="wishlist-content-tr">
	            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
	              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
	              <?php } ?>
	              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
	              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
	            <td class="text-left"><?php if ($payment_method) { ?>
	              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
	              <?php } ?>
	              <?php if ($shipping_method) { ?>
	              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
	              <?php } ?></td>
	          </tr>
	        </tbody>
	      </table>
      </div>
      <div class="table-div wishlist-table">
	      <table class="table table-bordered table-hover">
	        <thead>
	          <tr class="wishlist-tr">
	            <td class="text-left" style="width: 50%;"><?php echo $text_payment_address; ?></td>
	            <?php if ($shipping_address) { ?>
	            <td class="text-left"><?php echo $text_shipping_address; ?></td>
	            <?php } ?>
	          </tr>
	        </thead>
	        <tbody>
	          <tr class="wishlist-content-tr">
	            <td class="text-left"><?php echo $payment_address; ?></td>
	            <?php if ($shipping_address) { ?>
	            <td class="text-left"><?php echo $shipping_address; ?></td>
	            <?php } ?>
	          </tr>
	        </tbody>
	      </table>
      </div>
      <div class="table-div table-responsive wishlist-table">
        <table class="table table-hover">
          <thead>
            <tr class="wishlist-tr">
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr class="wishlist-content-tr">
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr class="wishlist-content-tr">
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr class="wishlist-tr">
            <td class="text-left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr class="wishlist-content-tr">
            <td class="text-left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
      <h2><i class="fa fa-clock-o"></i><?php echo $text_history; ?></h2>
      <div class="table-div table-responsive wishlist-table">
	      <table class="table table-bordered table-hover">
	        <thead>
	          <tr class="wishlist-tr">
	            <td class="text-left"><?php echo $column_date_added; ?></td>
	            <td class="text-left"><?php echo $column_status; ?></td>
	            <td class="text-left"><?php echo $column_comment; ?></td>
	          </tr>
	        </thead>
	        <tbody>
	          <?php foreach ($histories as $history) { ?>
	          <tr class="wishlist-content-tr">
	            <td class="text-left"><?php echo $history['date_added']; ?></td>
	            <td class="text-left"><?php echo $history['status']; ?></td>
	            <td class="text-left"><?php echo $history['comment']; ?></td>
	          </tr>
	          <?php } ?>
	        </tbody>
	      </table>
      </div>
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