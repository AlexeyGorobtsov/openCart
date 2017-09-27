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
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#display-tab" data-toggle="tab"><?php echo $tab_display; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[status]" id="input-status" class="form-control">
                    <?php if ($popup_view_data['status']) { ?>
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
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[quantity]" id="input-quantity" class="form-control">
                    <?php if ($popup_view_data['quantity']) { ?>
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
                <label class="col-sm-2 control-label" for="input-specification"><?php echo $entry_specification_tab; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[specification]" id="input-specification" class="form-control">
                    <?php if ($popup_view_data['specification']) { ?>
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
                <label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review_tab; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[review]" id="input-review" class="form-control">
                    <?php if ($popup_view_data['review']) { ?>
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
                <label class="col-sm-2 control-label" for="input-wishlist"><?php echo $entry_wishlist; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[wishlist]" id="input-wishlist" class="form-control">
                    <?php if ($popup_view_data['wishlist']) { ?>
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
                <label class="col-sm-2 control-label" for="input-compare"><?php echo $entry_compare; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[compare]" id="input-compare" class="form-control">
                    <?php if ($popup_view_data['compare']) { ?>
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
                <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description_tab; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[description]" id="input-description" class="form-control">
                    <?php if ($popup_view_data['description']) { ?>
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
                <label class="col-sm-2 control-label" for="input-description_max"><?php echo $entry_description_max; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[description_max]" value="<?php echo $popup_view_data['description_max']; ?>" id="input-description_max" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[image]" id="input-image" class="form-control">
                    <?php if ($popup_view_data['image']) { ?>
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
                <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[image_width]" value="<?php echo $popup_view_data['image_width']; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[image_height]" value="<?php echo $popup_view_data['image_height']; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-additional_image"><?php echo $entry_additional_image; ?></label>
                <div class="col-sm-10">
                  <select name="popup_view_data[additional_image]" id="input-additional_image" class="form-control">
                    <?php if ($popup_view_data['additional_image']) { ?>
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
                <label class="col-sm-2 control-label" for="input-additional_width"><?php echo $entry_additional_width; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[image_additional_width]" value="<?php echo $popup_view_data['image_additional_width']; ?>" placeholder="<?php echo $entry_additional_width; ?>" id="input-additional_width" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-additional_height"><?php echo $entry_additional_height; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[image_additional_height]" value="<?php echo $popup_view_data['image_additional_height']; ?>" placeholder="<?php echo $entry_additional_height; ?>" id="input-additional_height" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="display-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_h1; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_h1]" value="<?php echo $popup_view_data['color_h1']; ?>" placeholder="<?php echo $entry_color_h1; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_price]" value="<?php echo $popup_view_data['color_price']; ?>" placeholder="<?php echo $entry_color_price; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_special_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_special_price]" value="<?php echo $popup_view_data['color_special_price']; ?>" placeholder="<?php echo $entry_color_special_price; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_description; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_description]" value="<?php echo $popup_view_data['color_description']; ?>" placeholder="<?php echo $entry_color_description; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_checkout_button]" value="<?php echo $popup_view_data['color_checkout_button']; ?>" placeholder="<?php echo $entry_color_checkout_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_close_button]" value="<?php echo $popup_view_data['color_close_button']; ?>" placeholder="<?php echo $entry_color_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_checkout_button]" value="<?php echo $popup_view_data['background_checkout_button']; ?>" placeholder="<?php echo $entry_background_checkout_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_close_button]" value="<?php echo $popup_view_data['background_close_button']; ?>" placeholder="<?php echo $entry_background_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_checkout_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_checkout_button_hover]" value="<?php echo $popup_view_data['background_checkout_button_hover']; ?>" placeholder="<?php echo $entry_background_checkout_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_close_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_close_button_hover]" value="<?php echo $popup_view_data['background_close_button_hover']; ?>" placeholder="<?php echo $entry_background_close_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_checkout_button]" value="<?php echo $popup_view_data['border_checkout_button']; ?>" placeholder="<?php echo $entry_border_checkout_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_close_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_close_button]" value="<?php echo $popup_view_data['border_close_button']; ?>" placeholder="<?php echo $entry_border_close_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_checkout_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_checkout_button_hover]" value="<?php echo $popup_view_data['border_checkout_button_hover']; ?>" placeholder="<?php echo $entry_border_checkout_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_close_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_close_button_hover]" value="<?php echo $popup_view_data['border_close_button_hover']; ?>" placeholder="<?php echo $entry_border_close_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_tocart_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_tocart_button]" value="<?php echo $popup_view_data['color_tocart_button']; ?>" placeholder="<?php echo $entry_color_tocart_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_tocart_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_tocart_button]" value="<?php echo $popup_view_data['background_tocart_button']; ?>" placeholder="<?php echo $entry_background_tocart_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_tocart_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_tocart_button_hover]" value="<?php echo $popup_view_data['background_tocart_button_hover']; ?>" placeholder="<?php echo $entry_background_tocart_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_tocart_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_tocart_button]" value="<?php echo $popup_view_data['border_tocart_button']; ?>" placeholder="<?php echo $entry_border_tocart_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_tocart_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_tocart_button_hover]" value="<?php echo $popup_view_data['border_tocart_button_hover']; ?>" placeholder="<?php echo $entry_border_tocart_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_wishlist_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_wishlist_button]" value="<?php echo $popup_view_data['color_wishlist_button']; ?>" placeholder="<?php echo $entry_color_wishlist_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_wishlist_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_wishlist_button]" value="<?php echo $popup_view_data['background_wishlist_button']; ?>" placeholder="<?php echo $entry_background_wishlist_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_wishlist_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_wishlist_button_hover]" value="<?php echo $popup_view_data['background_wishlist_button_hover']; ?>" placeholder="<?php echo $entry_background_wishlist_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_wishlist_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_wishlist_button]" value="<?php echo $popup_view_data['border_wishlist_button']; ?>" placeholder="<?php echo $entry_border_wishlist_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_wishlist_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_wishlist_button_hover]" value="<?php echo $popup_view_data['border_wishlist_button_hover']; ?>" placeholder="<?php echo $entry_border_wishlist_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_compare_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_compare_button]" value="<?php echo $popup_view_data['color_compare_button']; ?>" placeholder="<?php echo $entry_color_compare_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_compare_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_compare_button]" value="<?php echo $popup_view_data['background_compare_button']; ?>" placeholder="<?php echo $entry_background_compare_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_compare_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_compare_button_hover]" value="<?php echo $popup_view_data['background_compare_button_hover']; ?>" placeholder="<?php echo $entry_background_compare_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_compare_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_compare_button]" value="<?php echo $popup_view_data['border_compare_button']; ?>" placeholder="<?php echo $entry_border_compare_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_compare_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_compare_button_hover]" value="<?php echo $popup_view_data['border_compare_button_hover']; ?>" placeholder="<?php echo $entry_border_compare_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_quickview_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_quickview_button]" value="<?php echo $popup_view_data['color_quickview_button']; ?>" placeholder="<?php echo $entry_color_quickview_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_quickview_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_quickview_button]" value="<?php echo $popup_view_data['background_quickview_button']; ?>" placeholder="<?php echo $entry_background_quickview_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_quickview_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_quickview_button_hover]" value="<?php echo $popup_view_data['background_quickview_button_hover']; ?>" placeholder="<?php echo $entry_background_quickview_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_quickview_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_quickview_button]" value="<?php echo $popup_view_data['border_quickview_button']; ?>" placeholder="<?php echo $entry_border_quickview_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_border_quickview_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[border_quickview_button_hover]" value="<?php echo $popup_view_data['border_quickview_button_hover']; ?>" placeholder="<?php echo $entry_border_quickview_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_tabs_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_tabs_button]" value="<?php echo $popup_view_data['color_tabs_button']; ?>" placeholder="<?php echo $entry_color_tabs_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_tabs_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_tabs_button]" value="<?php echo $popup_view_data['background_tabs_button']; ?>" placeholder="<?php echo $entry_background_tabs_button; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_color_tabs_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[color_tabs_button_hover]" value="<?php echo $popup_view_data['color_tabs_button_hover']; ?>" placeholder="<?php echo $entry_color_tabs_button_hover; ?>" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_background_tabs_button_hover; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="popup_view_data[background_tabs_button_hover]" value="<?php echo $popup_view_data['background_tabs_button_hover']; ?>" placeholder="<?php echo $entry_background_tabs_button_hover; ?>" class="form-control color" />
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
<?php echo $footer; ?>