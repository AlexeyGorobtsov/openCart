<div id="popup-found-cheaper-wrapper">
  <div class="popup-heading"><?php echo $heading_title; ?></div>
  <div class="popup-center">
    <?php if (isset($heading_title_product)) { ?>
    <div class="popup_product_name text-center"><?php echo $heading_title_product; ?></div>
    <?php } ?>
    <?php if (isset($thumb)) { ?>
    <div class="popup_product_image text-center"><img src="<?php echo $thumb; ?>" /></div>
    <?php } ?>
    <?php if (isset($price) && isset($special)) { ?>
    <div class="popup_product_prices text-center">
      <?php if (!$special) { ?>
      <?php echo $price; ?>
      <?php } else { ?>
      <span style="text-decoration: line-through;"><?php echo $price; ?></span>
      <?php echo $special; ?>
      <?php } ?>
    </div>
    <?php } ?>
    <form method="post" enctype="multipart/form-data" id="found-cheaper-form">
      <div class="payment-info">
        <?php if ($popup_found_cheaper_data['name']) { ?>
        <div>
          <label><?php echo $enter_name; ?><?php if ($popup_found_cheaper_data['name'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="name" value="<?php echo $name;?>" placeholder="<?php echo $enter_name; ?>" />
        </div>
        <?php } ?>
        <?php if ($popup_found_cheaper_data['telephone']) { ?>
        <div>
          <label><?php echo $enter_telephone; ?><?php if ($popup_found_cheaper_data['telephone'] == 2) { ?><span class="required">*</span><?php } ?></label>
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
                $("#popup-found-cheaper-wrapper [name='telephone']").inputmask('<?php echo $mask; ?>');
              }
            </script>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($popup_found_cheaper_data['link']) { ?>
        <div>
          <label><?php echo $enter_link; ?><?php if ($popup_found_cheaper_data['link'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="link" value="<?php echo $link;?>" placeholder="<?php echo $enter_link; ?>" class="datetime" />
        </div>
        <?php } ?>
        <?php if ($popup_found_cheaper_data['comment']) { ?>
        <div>
          <label><?php echo $enter_comment; ?><?php if ($popup_found_cheaper_data['comment'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <textarea name="comment" placeholder="<?php echo $enter_comment; ?>"><?php echo $comment;?></textarea>
        </div>
        <?php } ?>
        <?php if ($text_terms) { ?>
          <div>
            <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" />
          </div>
        <?php } ?>
      </div>
      <input type="hidden" name="pid" value="<?php echo $href; ?>">
      <input type="hidden" name="mid" value="<?php echo $model; ?>">
    </form>
  </div>
  <div class="popup-footer">
    <a id="popup-send-button"><?php echo $button_send; ?></a>
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
$('#popup-send-button').on('click', function() {
  masked('#popup-found-cheaper-wrapper', true);
  $.ajax({
      type: 'post',
      url:  'index.php?route=extension/module/popup_found_cheaper/send',
      dataType: 'json',
      data: $('#found-cheaper-form').serialize(),
      success: function(json) {
        if (json['error']) {
          if (json['error']['field']) {
            masked('#popup-found-cheaper-wrapper', false);
            $('#popup-found-cheaper-wrapper .text-danger').remove();
            $.each(json['error']['field'], function(i, val) {
              $('#popup-found-cheaper-wrapper [name="' + i + '"]').addClass('error_style').after('<div class="text-danger">' + val + '</div>');
            });
          }
        } else {
          if (json['output']) {
            masked('#popup-found-cheaper-wrapper', false);
            $('#popup-found-cheaper-wrapper .popup-footer').remove();
            $('#popup-found-cheaper-wrapper .popup-center').html(json['output']);
          }
        }
      }
  });
});
//--></script>
<style type="text/css">
<?php if ($popup_found_cheaper_data['color_send_button']) { ?>
#popup-found-cheaper-wrapper .popup-footer a {color:<?php echo $popup_found_cheaper_data['color_send_button']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['color_close_button']) { ?>
#popup-found-cheaper-wrapper .popup-footer button {color:<?php echo $popup_found_cheaper_data['color_close_button']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['background_send_button']) { ?>
#popup-found-cheaper-wrapper .popup-footer a {background:<?php echo $popup_found_cheaper_data['background_send_button']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['background_close_button']) { ?>
#popup-found-cheaper-wrapper .popup-footer button {background:<?php echo $popup_found_cheaper_data['background_close_button']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['background_send_button_hover']) { ?>
#popup-found-cheaper-wrapper .popup-footer a:hover {background:<?php echo $popup_found_cheaper_data['background_send_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['background_close_button_hover']) { ?>
#popup-found-cheaper-wrapper .popup-footer button:hover {background:<?php echo $popup_found_cheaper_data['background_close_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['border_send_button']) { ?>
#popup-found-cheaper-wrapper .popup-footer a {border-color:<?php echo $popup_found_cheaper_data['border_send_button']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['border_close_button']) { ?>
#popup-found-cheaper-wrapper .popup-footer button {border-color:<?php echo $popup_found_cheaper_data['border_close_button']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['border_send_button_hover']) { ?>
#popup-found-cheaper-wrapper .popup-footer a:hover {border-color:<?php echo $popup_found_cheaper_data['border_send_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_found_cheaper_data['border_close_button_hover']) { ?>
#popup-found-cheaper-wrapper .popup-footer button:hover {border-color:<?php echo $popup_found_cheaper_data['border_close_button_hover']; ?>; }
<?php } ?>
</style>
</div>
