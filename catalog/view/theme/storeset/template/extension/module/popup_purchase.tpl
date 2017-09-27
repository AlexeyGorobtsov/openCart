<div id="popup-purchase-wrapper">
  <div class="popup-heading"><?php echo $heading_title; ?></div>
  <div class="popup-center">
    <?php if ($stock_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $stock_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($minimum > 1) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="left">
      <div class="product-name"><?php echo $product_name; ?></div>
        <?php if ($price) { ?>
          <div class="product-price">
          <?php echo $text_price; ?>
          <?php if (!$special) { ?>
            <b><span id="main-price"><?php echo $price; ?></span></b>
          <?php } else { ?>
            <s><span id="main-price"><?php echo $price; ?></span></s>
            <b><span id="special-price"><?php echo $special; ?></span></b>
          <?php } ?>
          </div>
          <?php if ($tax) { ?>
            <?php echo $text_tax; ?> <span id="main-tax"><?php echo $tax; ?></span><br/>
          <?php } ?>
          <?php if ($points) { ?>
            <?php echo $text_points; ?> <?php echo $points; ?><br/>
          <?php } ?>
          <?php if ($discounts) { ?>
            <?php foreach ($discounts as $discount) { ?>
              <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?><br/>
            <?php } ?>
          <?php } ?>
        <?php } ?>
      <?php if ($popup_purchase_data['description']) { ?>
      <div class="product-description"><?php echo $description?></div>
      <?php } ?>
    </div>
    <?php if ($popup_purchase_data['image']) { ?>
    <div class="right">
      <?php if ($thumb) { ?>
      <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
      <?php } ?>
      <?php if ($images) { ?>
      <div class="sub-images" >
        <span>
          <input type="radio" name="sub_images" value="<?php echo $thumb; ?>" id="sub-image-0" checked="checked" />
          <label title="<?php echo $heading_title; ?>" for="sub-image-0"></label>
        </span>
        <?php $img_key = 1; foreach ($images as $image) { ?>
          <span>
            <input type="radio" name="sub_images" value="<?php echo $image['thumb']; ?>" id="sub-image-<?php echo $img_key; ?>" />
            <label title="<?php echo $heading_title; ?>" for="sub-image-<?php echo $img_key; ?>"></label>
          </span>
        <?php $img_key++; } ?>
      </div>
      <?php } ?>
    </div>
    <script type="text/javascript">
    $(document).on('change', 'input[name=\'sub_images\']', function() {
      $('input[name=sub_images]:checked').parent().parent().prev().attr('src',$('input[name=sub_images]:checked').val());
    });
    </script>
    <?php } ?>
    <?php if (!$stock_warning) { ?>
    <form method="post" enctype="multipart/form-data" id="purchase-form">
	    <input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden" />
      <div class="payment-info">
        <?php if ($popup_purchase_data['firstname']) { ?>
        <div>
          <label><?php echo $enter_firstname; ?><?php if ($popup_purchase_data['firstname'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="firstname" value="<?php echo $firstname;?>" placeholder="<?php echo $enter_firstname; ?>" />
        </div>
        <?php } ?>
        <?php if ($popup_purchase_data['telephone']) { ?>
        <div>
          <label><?php echo $enter_telephone; ?><?php if ($popup_purchase_data['telephone'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="telephone" value="<?php echo $telephone;?>" placeholder="<?php echo $enter_telephone; ?>" />
          <?php if ($mask) { ?>
            <script type="text/javascript" src="catalog/view/theme/storeset/js/input-mask.js"></script>
            <script type="text/javascript">
              var isMobile = {
                Android: function() {
                  return navigator.userAgent.match(/Android/i);
                },
                BlackBerry: function() {
                  return navigator.userAgent.match(/BlackBerry/i);
                },
                iOS: function() {
                  return navigator.userAgent.match(/iPhone|iPad|iPod/i);
                },
                Opera: function() {
                  return navigator.userAgent.match(/Opera Mini/i);
                },
                Windows: function() {
                  return navigator.userAgent.match(/IEMobile/i);
                },
                Chrome: function() {
                  return navigator.userAgent.match(/Chrome/i);
                }
              };
           
              if (!isMobile.Android()) {
                $("#popup-purchase-wrapper [name='telephone']").inputmask('<?php echo $mask; ?>');
              }
            </script>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($popup_purchase_data['email']) { ?>
        <div>
          <label><?php echo $enter_email; ?><?php if ($popup_purchase_data['email'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="email" value="<?php echo $email;?>" placeholder="<?php echo $enter_email; ?>" />
        </div>
        <?php } ?>
        <?php if ($popup_purchase_data['comment']) { ?>
        <div>
          <label><?php echo $enter_comment; ?><?php if ($popup_purchase_data['comment'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <textarea name="comment" placeholder="<?php echo $enter_comment; ?>"><?php echo $comment;?></textarea>
        </div>
        <?php } ?>
        <?php if ($text_terms) { ?>
          <div>
            <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" />
          </div>
          <br/><br/>
        <?php } ?>
      </div>
      <?php if ($options) { ?>
        <div class="info-heading-2"><?php echo $text_option; ?></div>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" onchange="update_prices('<?php echo $product_id; ?>');">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
              <label>
                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" onchange="update_prices('<?php echo $product_id; ?>');"/>
                <?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="checkbox">
              <label>
                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" onchange="update_prices('<?php echo $product_id; ?>');"/>
                <?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
              <label>
                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" onchange="update_prices('<?php echo $product_id; ?>');"/>
                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <div class="input-group date">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            <span class="input-group-btn">
            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
            </span></div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <div class="input-group datetime">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            <span class="input-group-btn">
            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
            </span></div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <div class="input-group time">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            <span class="input-group-btn">
            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
            </span></div>
        </div>
        <?php } ?>
        <?php } ?>
      <?php } ?>
      <?php if ($recurrings) { ?>
        <div class="info-heading-2"><?php echo $text_payment_recurring ?></div>
        <div class="form-group required">
          <select name="recurring_id" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($recurrings as $recurring) { ?>
            <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
            <?php } ?>
          </select>
          <div class="help-block" id="recurring-description"></div>
        </div>
      <?php } ?>
      <?php if ($popup_purchase_data['quantity']) { ?>
      <div class="payment-quantity">
        <label><?php echo $entry_quantity; ?></label>
        <div class="number">

          <div class="frame-change-count">
            <div class="btn-plus">
              <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update_prices('<?php echo $product_id; ?>');">
                <span class="icon-plus"></span>
              </button>
            </div>
            <div class="btn-minus">
              <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update_prices('<?php echo $product_id; ?>');">
                <span class="icon-minus"></span>
              </button>
            </div>
          </div>
          <input type="text" name="quantity" value="<?php echo $minimum; ?>" maxlength="3" class="plus-minus" onchange="update_prices( '<?php echo $product_id; ?>' ); return validate(this);" keypress="update_prices( '<?php echo $product_id; ?>' ); return validate(this);" />
        </div>
      </div>
      <?php } else { ?>
      <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" />
      <?php } ?>
    </form>
    <?php } ?>
  </div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
    <?php if (!$stock_warning) { ?>
    <a id="popup-checkout-button"><?php echo $button_checkout; ?></a>
    <?php } ?>
  </div>
<?php if (!$stock_warning) { ?>
<?php if ($options) { ?>
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"><!--
$('#popup-purchase-wrapper .date').datetimepicker({
  pickTime: false,
});

$('#popup-purchase-wrapper .datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('#popup-purchase-wrapper .time').datetimepicker({
  pickDate: false,
});

$(document).on('click', '#popup-purchase-wrapper button[id^=\'button-upload\']', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('#popup-purchase-wrapper .text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<?php } ?>
<script type="text/javascript"><!--
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

<?php if ($popup_purchase_data['quantity']) { ?>
function validate( input ) {
  input.value = input.value.replace( /[^\d,]/g, '' );
}
<?php } ?>

$('#popup-checkout-button').on('click', function() {
  masked('#popup-purchase-wrapper', true);
  $.ajax({
      type: 'post',
      url:  'index.php?route=extension/module/popup_purchase/make_order',
      dataType: 'json',
      data: $('#purchase-form').serialize(),
      success: function(json) {
        if (json['error']) {
          masked('#popup-purchase-wrapper', false);
          
          if (json['error']['field']) {
            $('#popup-purchase-wrapper .text-danger').remove();
            $.each(json['error']['field'], function(i, val) {
              $('#popup-purchase-wrapper [name="' + i + '"]').addClass('error_style').after('<div class="text-danger">' + val + '</div>');
            });
          }

          if (json['error']['option']) {
            for (i in json['error']['option']) {
              var element = $('#popup-purchase-wrapper #input-option' + i.replace('_', '-'));
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }

          if (json['error']['recurring']) {
            $('#popup-purchase-wrapper select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }
        } else {
          if (json['output']) {
            masked('#popup-purchase-wrapper', false);
            $('#popup-checkout-button').remove();
            $('#popup-purchase-wrapper .popup-center').html(json['output']);
          }
        }
      }
  });
});

<?php if ($popup_purchase_data['quantity']) { ?>
function update_prices(product_id) {
  masked('#popup-purchase-wrapper', true);
  var input_val = $('#purchase-form').find('input[name=quantity]').val();
  var quantity = parseInt(input_val);

  <?php if ($minimum > 1) { ?>
    if (quantity < <?php echo $minimum; ?>) {
      quantity = $('#purchase-form').find('input[name=quantity]').val(<?php echo $minimum; ?>);
      masked('#popup-purchase-wrapper', false);
      return;
    }
  <?php } else { ?>
    if (quantity == 0) {
      quantity = $('#purchase-form').find('input[name=quantity]').val(1);
      masked('#popup-purchase-wrapper', false);
      return;
    }
  <?php } ?>

  $.ajax({
    url: 'index.php?route=extension/module/popup_purchase/update_prices&product_id=' + product_id + '&quantity=' + quantity,
    type: 'post',
    dataType: 'json',
    data: $('#purchase-form').serialize(),
    success: function(json) {
      $('#popup-purchase-wrapper #main-price').html(json['price']);
      $('#popup-purchase-wrapper #special-price').html(json['special']);
      $('#popup-purchase-wrapper #main-tax').html(json['tax']);
      masked('#popup-purchase-wrapper', false);
    }
  });
}
<?php } ?>

$('#popup-purchase-wrapper select[name=\'recurring_id\'], #popup-purchase-wrapper input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('#purchase-form input[name=\'product_id\'], #purchase-form input[name=\'quantity\'], #purchase-form select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#popup-purchase-wrapper #recurring-description').html('');
    },
    success: function(json) {
      $('#popup-purchase-wrapper .alert, #popup-purchase-wrapper .text-danger').remove();

      if (json['success']) {
        $('#popup-purchase-wrapper #recurring-description').html(json['success']);
      }
    }
  });
});
//--></script>
<?php } ?>
<style type="text/css">
<?php if ($popup_purchase_data['color_h1']) { ?>
#popup-purchase-wrapper .product-name {color:<?php echo $popup_purchase_data['color_h1']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['color_price']) { ?>
#popup-purchase-wrapper #main-price {color:<?php echo $popup_purchase_data['color_price']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['color_special_price']) { ?>
#popup-purchase-wrapper #special-price {color:<?php echo $popup_purchase_data['color_special_price']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['color_description']) { ?>
#popup-purchase-wrapper .product-description {color:<?php echo $popup_purchase_data['color_description']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['color_checkout_button']) { ?>
#popup-purchase-wrapper .popup-footer a {color:<?php echo $popup_purchase_data['color_checkout_button']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['color_close_button']) { ?>
#popup-purchase-wrapper .popup-footer button {color:<?php echo $popup_purchase_data['color_close_button']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['background_checkout_button']) { ?>
#popup-purchase-wrapper .popup-footer a {background:<?php echo $popup_purchase_data['background_checkout_button']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['background_close_button']) { ?>
#popup-purchase-wrapper .popup-footer button {background:<?php echo $popup_purchase_data['background_close_button']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['background_checkout_button_hover']) { ?>
#popup-purchase-wrapper .popup-footer a:hover {background:<?php echo $popup_purchase_data['background_checkout_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['background_close_button_hover']) { ?>
#popup-purchase-wrapper .popup-footer button:hover {background:<?php echo $popup_purchase_data['background_close_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['border_checkout_button']) { ?>
#popup-purchase-wrapper .popup-footer a {border-color:<?php echo $popup_purchase_data['border_checkout_button']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['border_close_button']) { ?>
#popup-purchase-wrapper .popup-footer button {border-color:<?php echo $popup_purchase_data['border_close_button']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['border_checkout_button_hover']) { ?>
#popup-purchase-wrapper .popup-footer a:hover {border-color:<?php echo $popup_purchase_data['border_checkout_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_purchase_data['border_close_button_hover']) { ?>
#popup-purchase-wrapper .popup-footer button:hover {border-color:<?php echo $popup_purchase_data['border_close_button_hover']; ?>; }
<?php } ?>
</style>
</div>
