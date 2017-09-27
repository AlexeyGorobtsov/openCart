<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-purchase" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-purchase" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li class="active"><a href="#list-tab" data-toggle="tab"><?php echo $tab_list; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="popup_call_phone_data[status]" id="input-status" class="form-control">
                    <?php if ($popup_call_phone_data['status']) { ?>
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
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_notify_status; ?></label>
                <div class="col-sm-10">
                  <select name="popup_call_phone_data[notify_status]" id="input-notify_status" class="form-control">
                    <?php if ($popup_call_phone_data['notify_status']) { ?>
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
                <label class="col-sm-2 control-label" for="input-notify_email"><?php echo $entry_notify_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[notify_email]" value="<?php echo $popup_call_phone_data['notify_email']; ?>" id="input-notify_email" class="form-control" />
                  <?php if ($error_notify_email) { ?>
                    <div class="text-danger"><?php echo $error_notify_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <select name="popup_call_phone_data[name]" id="input-name" class="form-control">
                    <?php if ($popup_call_phone_data['name'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_call_phone_data['name'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <select name="popup_call_phone_data[telephone]" id="input-telephone" class="form-control">
                    <?php if ($popup_call_phone_data['telephone'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_call_phone_data['telephone'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <div class="col-sm-10">
                  <select name="popup_call_phone_data[comment]" id="input-comment" class="form-control">
                    <?php if ($popup_call_phone_data['comment'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_call_phone_data['comment'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-time"><?php echo $entry_time; ?></label>
                <div class="col-sm-10">
                  <select name="popup_call_phone_data[time]" id="input-time" class="form-control">
                    <?php if ($popup_call_phone_data['time'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($popup_call_phone_data['time'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mask"><?php echo $entry_mask; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[mask]" value="<?php echo (isset($popup_call_phone_data['mask'])) ? (!empty($popup_call_phone_data['mask']) ? $popup_call_phone_data['mask'] : '') : ''; ?>" placeholder="<?php echo $entry_mask_info; ?>" id="input-mask" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="display-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_send_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[color_send_button]" value="<?php echo $popup_call_phone_data['color_send_button']; ?>" placeholder="<?php echo $entry_color_send_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[color_close_button]" value="<?php echo $popup_call_phone_data['color_close_button']; ?>" placeholder="<?php echo $entry_color_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_send_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[background_send_button]" value="<?php echo $popup_call_phone_data['background_send_button']; ?>" placeholder="<?php echo $entry_background_send_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[background_close_button]" value="<?php echo $popup_call_phone_data['background_close_button']; ?>" placeholder="<?php echo $entry_background_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_send_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[background_send_button_hover]" value="<?php echo $popup_call_phone_data['background_send_button_hover']; ?>" placeholder="<?php echo $entry_background_send_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_close_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[background_close_button_hover]" value="<?php echo $popup_call_phone_data['background_close_button_hover']; ?>" placeholder="<?php echo $entry_background_close_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_send_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[border_send_button]" value="<?php echo $popup_call_phone_data['border_send_button']; ?>" placeholder="<?php echo $entry_border_send_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[border_close_button]" value="<?php echo $popup_call_phone_data['border_close_button']; ?>" placeholder="<?php echo $entry_border_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_send_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[border_send_button_hover]" value="<?php echo $popup_call_phone_data['border_send_button_hover']; ?>" placeholder="<?php echo $entry_border_send_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_close_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_call_phone_data[border_close_button_hover]" value="<?php echo $popup_call_phone_data['border_close_button_hover']; ?>" placeholder="<?php echo $entry_border_close_button_hover; ?>" class="form-control color" />
                </div>
              </div>
            </div>
            <div class="tab-pane active" id="list-tab">
              <div id="history"></div>
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

$('#history').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#history').load(this.href);
});
$('#history').load('index.php?route=extension/module/popup_call_phone/history&token=<?php echo $token; ?>');

function delete_selected(request_id) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/popup_call_phone/delete_selected&token=<?php echo $token; ?>&delete=' + request_id,
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/popup_call_phone/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all() {
  $.ajax({
    type: 'get',
    url:  'index.php?route=extension/module/popup_call_phone/delete_all&token=<?php echo $token; ?>',
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/popup_call_phone/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all_selected() {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/popup_call_phone/delete_all_selected&token=<?php echo $token; ?>',
    data: $('#history input[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/popup_call_phone/history&token=<?php echo $token; ?>');
    }
  });
}
</script>
<?php echo $footer; ?>