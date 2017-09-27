<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-fastorder" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-fastorder" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li style="display:none;"><a href="#display-tab" data-toggle="tab"><?php echo $tab_display; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[status]" id="input-status" class="form-control">
                    <?php if ($oct_fastorder_data['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[lastname]" id="input-lastname" class="form-control">
                    <?php if ($oct_fastorder_data['lastname'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer_groups"><?php echo $entry_customer_groups; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[customer_groups]" id="input-customer_groups" class="form-control">
                    <?php if ($oct_fastorder_data['customer_groups'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[fax]" id="input-fax" class="form-control">
                    <?php if ($oct_fastorder_data['fax'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[company]" id="input-company" class="form-control">
                    <?php if ($oct_fastorder_data['company'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-address_1"><?php echo $entry_address_1; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[address_1]" id="input-address_1" class="form-control">
                    <?php if ($oct_fastorder_data['address_1'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-address_2"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[address_2]" id="input-address_2" class="form-control">
                    <?php if ($oct_fastorder_data['address_2'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[postcode]" id="input-postcode" class="form-control">
                    <?php if ($oct_fastorder_data['postcode'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[comment]" id="input-comment" class="form-control">
                    <?php if ($oct_fastorder_data['comment'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[city]" id="input-city" class="form-control">
                    <?php if ($oct_fastorder_data['city'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country_and_region"><?php echo $entry_country_and_region; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[country_and_region]" id="input-country_and_region" class="form-control">
                    <?php if ($oct_fastorder_data['country_and_region'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-registration"><?php echo $entry_registration; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[registration]" id="input-registration" class="form-control">
                    <?php if ($oct_fastorder_data['registration'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-cart_position"><?php echo $entry_cart_position; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[cart_position]" id="input-cart_position" class="form-control">
                    <?php if ($oct_fastorder_data['cart_position'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $entry_cart_position_1; ?></option>
                    <option value="2"><?php echo $entry_cart_position_2; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $entry_cart_position_1; ?></option>
                    <option value="2" selected="selected"><?php echo $entry_cart_position_2; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_default_country; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[default_country]" id="input-country" class="form-control">
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $oct_fastorder_data['default_country']) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                  <?php if ($error_default_country) { ?>
                  <div class="text-danger"><?php echo $error_default_country; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-region"><?php echo $entry_default_region; ?></label>
                <div class="col-sm-10">
                  <select name="oct_fastorder_data[default_region]" id="input-region" class="form-control">
                  </select>
                  <?php if ($error_default_region) { ?>
                  <div class="text-danger"><?php echo $error_default_region; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_default_city; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[default_city]" value="<?php echo $oct_fastorder_data['default_city']; ?>" placeholder="<?php echo $entry_default_city; ?>" id="input-city" class="form-control" />
                  <?php if ($error_default_city) { ?>
                  <div class="text-danger"><?php echo $error_default_city; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mask"><?php echo $entry_mask; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[mask]" value="<?php echo $oct_fastorder_data['mask']; ?>" placeholder="<?php echo $entry_mask_info; ?>" id="input-mask" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="display-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_block_border"><?php echo $entry_backgorund_color_block_border; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[backgorund_color_block_border]" value="<?php echo $oct_fastorder_data['backgorund_color_block_border']; ?>" placeholder="<?php echo $entry_backgorund_color_block_border; ?>" id="input-backgorund_color_block_border" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_block_heading"><?php echo $entry_backgorund_color_block_heading; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[backgorund_color_block_heading]" value="<?php echo $oct_fastorder_data['backgorund_color_block_heading']; ?>" placeholder="<?php echo $entry_backgorund_color_block_heading; ?>" id="input-backgorund_color_block_heading" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_block_heading"><?php echo $entry_text_color_block_heading; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[text_color_block_heading]" value="<?php echo $oct_fastorder_data['text_color_block_heading']; ?>" placeholder="<?php echo $entry_text_color_block_heading; ?>" id="input-text_color_block_heading" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_block_body"><?php echo $entry_backgorund_color_block_body; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[backgorund_color_block_body]" value="<?php echo $oct_fastorder_data['backgorund_color_block_body']; ?>" placeholder="<?php echo $entry_backgorund_color_block_body; ?>" id="input-backgorund_color_block_body" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_block_body"><?php echo $entry_text_color_block_body; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[text_color_block_body]" value="<?php echo $oct_fastorder_data['text_color_block_body']; ?>" placeholder="<?php echo $entry_text_color_block_body; ?>" id="input-text_color_block_body" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_remove_button"><?php echo $entry_backgorund_color_remove_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[backgorund_color_remove_button]" value="<?php echo $oct_fastorder_data['backgorund_color_remove_button']; ?>" placeholder="<?php echo $entry_backgorund_color_remove_button; ?>" id="input-backgorund_color_remove_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_remove_button"><?php echo $entry_text_color_remove_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[text_color_remove_button]" value="<?php echo $oct_fastorder_data['text_color_remove_button']; ?>" placeholder="<?php echo $entry_text_color_remove_button; ?>" id="input-text_color_remove_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_quantity_button"><?php echo $entry_backgorund_color_quantity_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[backgorund_color_quantity_button]" value="<?php echo $oct_fastorder_data['backgorund_color_quantity_button']; ?>" placeholder="<?php echo $entry_backgorund_color_quantity_button; ?>" id="input-backgorund_color_quantity_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_quantity_button"><?php echo $entry_text_color_quantity_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[text_color_quantity_button]" value="<?php echo $oct_fastorder_data['text_color_quantity_button']; ?>" placeholder="<?php echo $entry_text_color_quantity_button; ?>" id="input-text_color_quantity_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_checkout_button"><?php echo $entry_backgorund_color_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[backgorund_color_checkout_button]" value="<?php echo $oct_fastorder_data['backgorund_color_checkout_button']; ?>" placeholder="<?php echo $entry_backgorund_color_checkout_button; ?>" id="input-backgorund_color_checkout_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_checkout_button"><?php echo $entry_text_color_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_fastorder_data[text_color_checkout_button]" value="<?php echo $oct_fastorder_data['text_color_checkout_button']; ?>" placeholder="<?php echo $entry_text_color_checkout_button; ?>" id="input-text_color_checkout_button" class="form-control color" />
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(function(){
    $('input.color').minicolors();
  });
</script>
<script type="text/javascript"><!--
$('select[name*=\'default_country\']').on('change', function() {
  $.ajax({
    url: 'index.php?route=extension/module/oct_fastorder/country&token=<?php echo $token; ?>&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('select[name*=\'default_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {
      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
                html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == "<?php echo $oct_fastorder_data['default_region']; ?>") {
                  html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('select[name*=\'default_region\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name*=\'default_country\']').trigger('change');
//--></script>
<?php echo $footer; ?>