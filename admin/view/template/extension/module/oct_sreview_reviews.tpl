<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-reviews" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $blog_setting; ?>" data-toggle="tooltip" title="<?php echo $text_blog_setting; ?>" class="btn btn-info"><i class="fa fa-link"></i> <?php echo $text_blog_setting; ?></a>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-reviews" class="form-horizontal">
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
            <label class="col-sm-2 control-label" for="input-sort_order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <select name="sort_order" id="input-sort_order" class="form-control">
                <?php if ($sort_order == "date_added_asc") { ?>
                <option value="date_added_asc" selected="selected"><?php echo $text_sort_order_1; ?></option>
                <option value="date_added_desc"><?php echo $text_sort_order_2; ?></option>
                <option value="author_asc"><?php echo $text_sort_order_3; ?></option>
                <option value="author_desc"><?php echo $text_sort_order_4; ?></option>
                <?php } elseif ($sort_order == "date_added_desc") { ?>
                <option value="date_added_asc"><?php echo $text_sort_order_1; ?></option>
                <option value="date_added_desc" selected="selected"><?php echo $text_sort_order_2; ?></option>
                <option value="author_asc" ><?php echo $text_sort_order_3; ?></option>
                <option value="author_desc"><?php echo $text_sort_order_4; ?></option>
                <?php } elseif ($sort_order == "author_asc") { ?>
                <option value="date_added_asc"><?php echo $text_sort_order_1; ?></option>
                <option value="date_added_desc"><?php echo $text_sort_order_2; ?></option>
                <option value="author_asc" selected="selected"><?php echo $text_sort_order_3; ?></option>
                <option value="author_desc"><?php echo $text_sort_order_4; ?></option>
                <?php } else { ?>
                <option value="date_added_asc"><?php echo $text_sort_order_1; ?></option>
                <option value="date_added_desc"><?php echo $text_sort_order_2; ?></option>
                <option value="author_asc"><?php echo $text_sort_order_3; ?></option>
                <option value="author_desc" selected="selected"><?php echo $text_sort_order_4; ?></option>
                <?php } ?>
              </select>
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
<?php echo $footer; ?>