<div class="panel panel-default box">
	<div class="box-content">
	  <div class="box-heading"><?php echo $heading_title; ?></div>
	  <div class="panel-body" id="static-subscribe-wrapper">
	    <div class="promo-text"><?php echo $promo_text; ?></div>
	    <br/>
	    <form method="post" enctype="multipart/form-data" id="static-subscribe-form">
	      <div class="form-group">
	        <label class="control-label" for="static-input-email"><?php echo $enter_email; ?></label>
	        <input type="text" name="email" value="<?php $email; ?>" placeholder="<?php echo $enter_email; ?>" class="form-control" id="static-input-email" />
	      </div>
        <?php if ($text_terms) { ?>
          <div>
            <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" />
          </div>
        <?php } ?>
	    </form>
	  </div>
	  <div class="panel-footer text-left">
	    <a id="static-subscribe-button" class="button"><?php echo $button_subscribe; ?></a>
	  </div>
 	</div>
</div>
<script type="text/javascript">
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
$('#static-subscribe-button').on('click', function() {
  masked('#static-subscribe-wrapper', true);
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/static_subscribe/make_subscribe',
    dataType: 'json',
    data: $('#static-subscribe-form').serialize(),
    success: function(json) {
      if (json['error']) {
        masked('#static-subscribe-wrapper', false);
        $('#static-subscribe-wrapper .alert-danger').remove();
        $('#static-subscribe-form').after('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
      if (json['output']) {
        masked('#static-subscribe-wrapper', false);
        $('#static-subscribe-wrapper').html('<div class="output-message">'+json['output']+'</div>');
        $('#static-subscribe-wrapper').next().hide();
      }
    }
  });
});
</script>
