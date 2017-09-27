<div id="popup-subscribe-wrapper" <?php if (!$thumb) { ?>class="only-right-side"<?php } ?>>
  <div class="popup-center">
    <?php if ($thumb) { ?>
    <div class="left">
      <div class="image" style="background-image: url('image/<?php echo $thumb; ?>');"></div>
    </div>
    <?php } ?>
    <div class="right">
      <button class="close" onclick="$.magnificPopup.close();"></button>
      <div class="right-wrapper">
        <div class="promo-text"><?php echo $promo_text; ?></div>
        <form method="post" enctype="multipart/form-data" id="subscribe-form">
          <div class="input-field">
            <input type="text" name="email" value="<?php $email; ?>" placeholder="<?php echo $enter_email; ?>" />
            <a id="popup-subscribe-button"><?php echo $button_subscribe; ?></a>
            <label class="stop"><input type="checkbox" name="stop" value="1" /><?php echo $text_stop; ?></label>
            <?php if ($text_terms) { ?>
              <label><input type="checkbox" name="terms" value="1" style="width: auto;" /> <?php echo $text_terms; ?></label>
            <?php } ?>
          </div>
        </form>
      </div>
    </div>
  </div>
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

  $('#popup-subscribe-wrapper input[name=\'stop\']').on('change', function(){
    if ($(this).is(':checked')) {
      $.ajax({
        type: 'get',
        url:  'index.php?route=extension/module/popup_subscribe/set_cookie&set=365'
      });
    } else {
      $.ajax({
        type: 'get',
        url:  'index.php?route=extension/module/popup_subscribe/set_cookie&set=<?php echo $expire; ?>'
      });
    }
  });

  $('#popup-subscribe-button').on('click', function() {
    masked('#popup-subscribe-wrapper .right', true);
    $.ajax({
      type: 'post',
      url:  'index.php?route=extension/module/popup_subscribe/make_subscribe',
      dataType: 'json',
      data: $('#subscribe-form').serialize(),
      success: function(json) {
        if (json['error']) {
          masked('#popup-subscribe-wrapper .right', false);
          $('#popup-subscribe-wrapper .alert-danger').remove();
          $('#subscribe-form').after('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
        if (json['output']) {
          masked('#popup-subscribe-wrapper .right', false);
          $('#popup-subscribe-wrapper .popup-center .right-wrapper').html('<div class="output-message">'+json['output']+'</div>');
        }
      }
    });
  });
  //--></script>
  <style media="screen">
    #popup-subscribe-wrapper .left .image {
      background-position-x: <?php echo $popup_subscribe_form_data['image_x']; ?>px;
      background-position-y: <?php echo $popup_subscribe_form_data['image_y']; ?>px;
    }
  </style>
</div>
