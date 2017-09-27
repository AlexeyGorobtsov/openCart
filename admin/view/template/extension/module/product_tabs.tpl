<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-oct-product-tabs" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
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
        <form method="post" enctype="multipart/form-data" id="form-oct-product-tabs" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#bulk_addition" data-toggle="tab"><?php echo $tab_bulk_addition; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="product_tabs_data[status]" id="input-status" class="form-control">
                    <?php if ($product_tabs_data['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="bulk_addition">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-categoriers"><?php echo $entry_categoriers; ?></label>
                <div class="col-sm-10">
                  <select name="module_categories" id="input-categoriers" class="form-control">
                    <option value="0"><?php echo $text_all_categories; ?></option>
                    <?php foreach ($categories as $category) { ?>
                      <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="extra_tab_description_div">
                    <?php foreach ($languages as $language) { ?>
                    <li><a href="#extra_tab_description<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                    <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="extra_tab_description<?php echo $language['language_id']; ?>">
                      <textarea name="tab_description[<?php echo $language['language_id']; ?>][text]" id="extra_tab_description_textarea<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_text; ?>" class="form-control summernote"></textarea>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>  
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tabs"><?php echo $entry_tabs; ?></label>
                <div class="col-sm-10">
                  <select name="module_tab" id="input-tabs" class="form-control">
                    <option value="0"><?php echo $text_select; ?></option>
                    <?php foreach ($tabs as $tab) { ?>
                      <option value="<?php echo $tab['extra_tab_id']; ?>"><?php echo $tab['title']; ?></option>
                    <?php } ?>
                  </select>
                  <br/>
                  <button type="button" class="btn btn-success" onclick="action_tab('add');"><?php echo $button_add_tab; ?></button>
                  <button type="button" class="btn btn-danger" onclick="action_tab('remove');"><?php echo $button_remove_tab; ?></button>
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
$('#extra_tab_description_div a:first').tab('show');
$('.summernote').summernote({height: 100});
$('.note-editable').on('keyup', function() {
  $(this).closest('.tab-pane').find('textarea[name^=\'tab_description\']').html($(this).html());
});

function action_tab(type) {
  $.ajax({
    url:  'index.php?route=extension/module/product_tabs/tap_processing&token=<?php echo $token; ?>'+'&type='+type,
    type: 'post',
    data: $('#bulk_addition input[type=\'checkbox\']:checked, #bulk_addition select, #bulk_addition textarea[name^=\'tab_description\']'),
    dataType: 'json',
    success: function(json) {
      $('#bulk_addition .alert').remove();

      if (json['success']) {
        $('#bulk_addition').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> '+json['success']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }

      if (json['error']) {
        $('#bulk_addition').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+json['error']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
    }
  });
}
</script>
<?php echo $footer; ?>
