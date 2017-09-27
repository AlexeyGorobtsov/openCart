<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product_stickers" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form method="post" enctype="multipart/form-data" id="form-product_stickers" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#bulk_addition" data-toggle="tab"><?php echo $tab_bulk_addition; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="product_stickers_data[status]" id="input-status" class="form-control">
                    <?php if ($product_stickers_data['status']) { ?>
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
                <label class="col-sm-2 control-label"><?php echo $entry_filters; ?></label>
                <div class="col-xs-10 col-sm-10 col-md-8">
                  <div class="table-responsive">
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <td><?php echo $text_col_name; ?></td>
                          <td class="text-center"><?php echo $text_col_allow; ?></td>
                          <td><?php echo $text_col_value; ?></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><?php echo $entry_date_status; ?></td>
                          <td class="text-center">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-info">
                                <input type="radio" name="date_status" value="1" autocomplete="off" style="display: none;" /><?php echo $text_yes; ?>
                              </label>
                              <label class="btn btn-info active">
                                <input type="radio" name="date_status" value="0" autocomplete="off" style="display: none;" checked="checked" /><?php echo $text_no; ?>
                              </label>
                            </div>
                          </td>
                          <td>
                            <div class="input-group date">
                              <input type="text" name="date" value="<?php echo $date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                              <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                              </span>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_quantity_status; ?></td>
                          <td class="text-center">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-info">
                                <input type="radio" name="quantity_status" value="1" autocomplete="off" style="display: none;" /><?php echo $text_yes; ?>
                              </label>
                              <label class="btn btn-info active">
                                <input type="radio" name="quantity_status" value="0" autocomplete="off" style="display: none;" checked="checked" /><?php echo $text_no; ?>
                              </label>
                            </div>
                          </td>
                          <td>
                            <input type="text" name="quantity" value="1" class="form-control" />
                          </td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_viewed_status; ?></td>
                          <td class="text-center">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-info">
                                <input type="radio" name="viewed_status" value="1" autocomplete="off" style="display: none;" /><?php echo $text_yes; ?>
                              </label>
                              <label class="btn btn-info active">
                                <input type="radio" name="viewed_status" value="0" autocomplete="off" style="display: none;" checked="checked" /><?php echo $text_no; ?>
                              </label>
                            </div>
                          </td>
                          <td>
                            <input type="text" name="viewed" value="1" class="form-control" />
                          </td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_sell_status; ?></td>
                          <td class="text-center">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-info">
                                <input type="radio" name="sell_status" value="1" autocomplete="off" style="display: none;" /><?php echo $text_yes; ?>
                              </label>
                              <label class="btn btn-info active">
                                <input type="radio" name="sell_status" value="0" autocomplete="off" style="display: none;" checked="checked" /><?php echo $text_no; ?>
                              </label>
                            </div>
                          </td>
                          <td>
                            <input type="text" name="sell" value="1" class="form-control" />
                          </td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_special_status; ?></td>
                          <td class="text-center">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-info">
                                <input type="radio" name="special_status" value="1" autocomplete="off" style="display: none;" /><?php echo $text_yes; ?>
                              </label>
                              <label class="btn btn-info active">
                                <input type="radio" name="special_status" value="0" autocomplete="off" style="display: none;" checked="checked" /><?php echo $text_no; ?>
                              </label>
                            </div>
                          </td>
                          <td></td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_discount_status; ?></td>
                          <td class="text-center">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-info">
                                <input type="radio" name="discount_status" value="1" autocomplete="off" style="display: none;" /><?php echo $text_yes; ?>
                              </label>
                              <label class="btn btn-info active">
                                <input type="radio" name="discount_status" value="0" autocomplete="off" style="display: none;" checked="checked" /><?php echo $text_no; ?>
                              </label>
                            </div>
                          </td>
                          <td></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_stickers; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($stickers as $sticker) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="module_stickers[<?php echo $sticker['product_sticker_id']; ?>]" value="<?php echo $sticker['product_sticker_id']; ?>" /> <?php echo $sticker['title']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <button type="button" class="btn btn-success" onclick="action_sticker();"><?php echo $button_add_stickers; ?></button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});
//--></script>
<script type="text/javascript">
function action_sticker() {
  $.ajax({
    url:  'index.php?route=extension/module/product_stickers/add_stickers&token=<?php echo $token; ?>',
    type: 'post',
    data: $('#bulk_addition input[type=\'checkbox\']:checked, #bulk_addition input[type=\'radio\']:checked, #bulk_addition select, #bulk_addition input[type=\'text\']'),
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
