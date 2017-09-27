<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-feedback" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $blog_list; ?>" data-toggle="tooltip" title="<?php echo $text_blog_list; ?>" class="btn btn-info"><i class="fa fa-link"></i> <?php echo $text_blog_list; ?></a>
        <a href="<?php echo $blog_setting; ?>" data-toggle="tooltip" title="<?php echo $text_blog_setting; ?>" class="btn btn-info"><i class="fa fa-link"></i> <?php echo $text_blog_setting; ?></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ( $breadcrumbs as $breadcrumb ) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ( $error_warning ) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bestseller" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-blog"><?php echo $entry_blog; ?></label>
            <div class="col-sm-10">
              <input type="text" name="blog" value="" placeholder="<?php echo $entry_blog; ?>" id="input-blog" class="form-control" />
              <div id="featured-blog" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($blogs as $blog) { ?>
                <div id="featured-blog<?php echo $blog['blog_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $blog['title']; ?>
                  <input type="hidden" name="blog[]" value="<?php echo $blog['blog_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-desc-limit"><?php echo $entry_desc_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="desc_limit" value="<?php echo $desc_limit; ?>" placeholder="<?php echo $entry_desc_limit; ?>" id="input-desc-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'blog\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/oct_blog_setting/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['title'],
            value: item['blog_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'blog\']').val('');
    
    $('#featured-blog' + item['value']).remove();
    
    $('#featured-blog').append('<div id="featured-blog' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="blog[]" value="' + item['value'] + '" /></div>');  
  }
});
  
$('#featured-blog').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script>
<?php echo $footer; ?>