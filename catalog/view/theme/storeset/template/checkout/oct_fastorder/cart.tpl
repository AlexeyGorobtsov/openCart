<div class="panel panel-default fastorder-panel-default">
  <div class="panel-heading">
    <h4 class="panel-title"><?php echo $heading_cart_block; ?><?php if ($weight) { ?>&nbsp;(<?php echo $weight; ?>)<?php } ?></h4>
  </div>
  <div class="panel-collapse">
    <div class="panel-body">
      <?php if ($attention) { ?>
      <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <script type="text/javascript">$(function(){$('#checkout-order').addClass('disabled');});</script>
      <?php } ?>
      <div class="table-responsive">
        <table id="cart_table" class="table table-bordered fastorder-table-bordered">
          <thead>
            <tr>
              <td class="text-center"><?php echo $column_image; ?></td>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-left"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td class="text-center"><?php echo $column_remove; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-center"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                <?php } ?></td>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock']) { ?>
                <span class="text-danger">***</span>
                <?php } ?>
                <?php if ($product['option']) { ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?>
                <?php } ?>
                <?php if ($product['reward']) { ?>
                <br />
                <small><?php echo $product['reward']; ?></small>
                <?php } ?>
                <?php if ($product['recurring']) { ?>
                <br />
                <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-left">

                <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" type="hidden" />
                <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />

                <div class="input-group btn-block" style="max-width: 50px;">

                  <span class="input-group-btn order-prev-span">
                  <a onclick="$(this).parent().next().val(~~$(this).parent().next().val()-1); update( this, 'update' );" class="btn btn-primary order-prev"><i class="fa fa-arrow-left"></i></a>
                  </span>

                  <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" size="1" class="form-control order-quantity" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" keypress="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />

                  <span class="input-group-btn order-next-span">
                  <a onclick="$(this).parent().prev().val(~~$(this).parent().prev().val()+1); update( this, 'update' );" class="btn btn-primary order-next"><i class="fa fa-arrow-right"></i></a>
                  </span>

                </div>
              </td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-center"><a onclick="update( this, 'remove' );" class="btn btn-primary remove-btn"><i class="fa fa-times-circle"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td></td>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                  <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                  <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="remove_voucher('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
			<?php if ($modules) { ?>
			<h2><?php echo $text_next; ?></h2>
			<p><?php echo $text_next_choice; ?></p>
			<div class="panel-group fastorder-panel-group" id="accordion">
				<?php foreach ($modules as $module) { ?>
				<?php echo $module; ?>
				<?php } ?>
			</div>
			<?php } ?>
      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered fastorder-table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>