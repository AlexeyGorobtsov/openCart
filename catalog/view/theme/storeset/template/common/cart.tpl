<div id="cart">
  <div class="heading">
    <a><span id="cart-total"><?php echo $text_items; ?></span></a></div>
    <div style="clear: both;"></div>
  <div class="content">
    <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
         <td class="remove"><img src="catalog/view/theme/storeset/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="cartremove('<?php if(VERSION > "2.0.3.1") { echo $product['cart_id']; } else { echo $product['key']; } ?>');" /></td>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    
      <div>
        <div class="row cart-total-row">
                      <?php foreach ($totals as $total) { ?>
                        <div class="col-sm-9 col-xs-8"><strong><?php echo $total['title']; ?>:</strong></div>
                        <div class="col-sm-3 col-xs-4 price-cart"><?php echo $total['text']; ?></div>
                      <?php } ?>
       </div>
      </div>
        <p class="text-center"><a href="<?php echo $cart; ?>" class="button"><?php echo $text_cart; ?></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>" class="button"><?php echo $text_checkout; ?></a></p>
    
   
    <?php } else { ?>
    
      <p class="text-center"><?php echo $text_empty; ?></p>
    
    <?php } ?>
 </div> 
</div>
