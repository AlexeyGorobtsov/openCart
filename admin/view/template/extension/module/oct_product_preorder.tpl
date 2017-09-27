<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#list-tab" data-toggle="tab"><?php echo $tab_list; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="oct_product_preorder_data[status]" id="input-status" class="form-control">
                    <?php if ($oct_product_preorder_data['status']) { ?>
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
                  <select name="oct_product_preorder_data[notify_status]" id="input-notify_status" class="form-control">
                    <?php if ($oct_product_preorder_data['notify_status']) { ?>
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
                  <input type="text" name="oct_product_preorder_data[notify_email]" value="<?php echo $oct_product_preorder_data['notify_email']; ?>" id="input-notify_email" class="form-control" />
                  <?php if ($error_notify_email) { ?>
                    <div class="text-danger"><?php echo $error_notify_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <select name="oct_product_preorder_data[name]" id="input-name" class="form-control">
                    <?php if ($oct_product_preorder_data['name'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($oct_product_preorder_data['name'] == 2) { ?>
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
                  <select name="oct_product_preorder_data[telephone]" id="input-telephone" class="form-control">
                    <?php if ($oct_product_preorder_data['telephone'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($oct_product_preorder_data['telephone'] == 2) { ?>
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
                  <select name="oct_product_preorder_data[comment]" id="input-comment" class="form-control">
                    <?php if ($oct_product_preorder_data['comment'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($oct_product_preorder_data['comment'] == 2) { ?>
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
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <select name="oct_product_preorder_data[email]" id="input-email" class="form-control">
                    <?php if ($oct_product_preorder_data['email'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($oct_product_preorder_data['email'] == 2) { ?>
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
                <label class="col-sm-2 control-label"><?php echo $entry_stock_status; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <div class="checkbox">
                      <label>
                        <input 
                          type="checkbox" 
                          name="oct_product_preorder_data[stock_statuses][<?php echo $stock_status['stock_status_id']; ?>]" 
                          value="<?php echo $stock_status['stock_status_id']; ?>" <?php echo (!empty($oct_product_preorder_data['stock_statuses'][$stock_status['stock_status_id']])) ? 'checked' : ''; ?> 
                        /> <?php echo $stock_status['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                	</div>
              	</div>
							</div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mask"><?php echo $entry_mask; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="oct_product_preorder_data[mask]" value="<?php echo (isset($oct_product_preorder_data['mask'])) ? (!empty($oct_product_preorder_data['mask']) ? $oct_product_preorder_data['mask'] : '') : ''; ?>" placeholder="<?php echo $entry_mask_info; ?>" id="input-mask" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label"><?php echo $entry_call_button; ?></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="call_button">
                    <?php foreach ($languages as $language) { ?>
                      <li>
                        <a href="#tab-call_button-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                      </li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="tab-call_button-language<?php echo $language['language_id']; ?>">
                      <input
                        type="text"
                        name="oct_product_preorder_text[<?php echo $language['code']; ?>][call_button]"
                        value="<?php echo (!empty($oct_product_preorder_text[$language['code']]['call_button'])) ? $oct_product_preorder_text[$language['code']]['call_button'] : ''; ?>"
                        class="form-control"
                      />
                      <?php if (isset($error_call_button[$language['code']])) { ?>
                        <div class="text-danger"><?php echo $error_call_button[$language['code']]; ?></div>
                      <?php } ?>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label"><?php echo $entry_promo; ?></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="promo">
                    <?php foreach ($languages as $language) { ?>
                      <li>
                        <a href="#tab-promo-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                      </li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="tab-promo-language<?php echo $language['language_id']; ?>">
                      <textarea
                        id="promo-language<?php echo $language['language_id']; ?>" 
                        class="form-control summernote"
                        style="height:auto;resize:vertical;"
                        rows="3"
                        name="oct_product_preorder_text[<?php echo $language['code']; ?>][promo]"><?php echo (!empty($oct_product_preorder_text[$language['code']]['promo'])) ? $oct_product_preorder_text[$language['code']]['promo'] : '';?></textarea>
                        <?php if (isset($error_promo[$language['code']])) { ?>
                          <div class="text-danger"><?php echo $error_promo[$language['code']]; ?></div>
                        <?php } ?>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="list-tab">
              <div id="history"></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php if ($ckeditor) { ?>
  <?php foreach ($languages as $language) { ?>
    ckeditorInit('promo-language<?php echo $language['language_id']; ?>', getURLVar('token'));
  <?php } ?>
<?php } ?>
//--></script>
<script type="text/javascript">
$('#call_button a:first').tab('show');
$('#promo a:first').tab('show');

$('#history').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#history').load(this.href);
});
$('#history').load('index.php?route=extension/module/oct_product_preorder/history&token=<?php echo $token; ?>');
function delete_selected(request_id) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/oct_product_preorder/delete_selected&token=<?php echo $token; ?>&delete=' + request_id,
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/oct_product_preorder/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all() {
  $.ajax({
    type: 'get',
    url:  'index.php?route=extension/module/oct_product_preorder/delete_all&token=<?php echo $token; ?>',
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/oct_product_preorder/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all_selected() {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/oct_product_preorder/delete_all_selected&token=<?php echo $token; ?>',
    data: $('#history input[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/oct_product_preorder/history&token=<?php echo $token; ?>');
    }
  });
}
function update_note(request_id, note) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/oct_product_preorder/update_note&token=<?php echo $token; ?>&request_id=' + request_id + '&note=' + note,
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/oct_product_preorder/history&token=<?php echo $token; ?>');
    }
  });
}
</script>
<?php echo $footer; ?>