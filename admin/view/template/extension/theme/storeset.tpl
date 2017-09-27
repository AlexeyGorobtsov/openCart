<?php echo $header; ?>
<style type="text/css">

.ios7-switch {
    display: inline-block;
    position: relative;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-tap-highlight-color: transparent;
    tap-highlight-color: transparent;
    font-size: 32px;
}

.nav-tabs i{
	font-size: 18px;
	color: #41c6ff;
}

.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
	color: #5eb2e3;
	font-weight: normal;
}

.ios7-switch input {
    opacity: 0;
    position: absolute;
}

.ios7-switch input + span {
    position: relative;
    display: inline-block;
    width: 1.65em;
    height: 1em;
    background: white;
    box-shadow: inset 0 0 0 0.0625em #e9e9e9;
    border-radius: 0.5em;
    vertical-align: -0.15em;
    transition: all 0.40s cubic-bezier(.17,.67,.43,.98);
}

.ios7-switch:active input + span,
.ios7-switch input + span:active {
    box-shadow: inset 0 0 0 0.73em #e9e9e9;
}

.ios7-switch input + span:after {
    position: absolute;
    display: block;
    content: '';
    width: 0.875em;
    height: 0.875em;
    border-radius: 0.4375em;
    top: 0.0625em;
    left: 0.0625em;
    background: white;
    box-shadow: inset 0 0 0 0.03em rgba(0,0,0,0.1),
                0 0 0.05em rgba(0,0,0,0.05),
                0 0.1em 0.2em rgba(0,0,0,0.2);
    transition: all 0.25s ease-out;
}

.ios7-switch:active input + span:after,
.ios7-switch input + span:active:after {
    width: 1.15em;
}

.ios7-switch input:checked + span {
    box-shadow: inset 0 0 0 0.73em #00A3D9;
}

.ios7-switch input:checked + span:after {
    left: 0.7125em;
}

.ios7-switch:active input:checked + span:after,
.ios7-switch input:checked + span:active:after {
    left: 0.4375em;
}

/* accessibility styles */
.ios7-switch input:focus + span:after {
    box-shadow: inset 0 0 0 0.03em rgba(0,0,0,0.15),
                0 0 0.05em rgba(0,0,0,0.08),
                0 0.1em 0.2em rgba(0,0,0,0.3);
    background: #fff;
}

.ios7-switch input:focus + span {
    box-shadow: inset 0 0 0 0.0625em #dadada;
}

.ios7-switch input:focus:checked + span {
    box-shadow: inset 0 0 0 0.73em #00A3D9;
}

/* reset accessibility style on hover */
.ios7-switch:hover input:focus + span:after {
    box-shadow: inset 0 0 0 0.03em rgba(0,0,0,0.1),
                0 0 0.05em rgba(0,0,0,0.05),
                0 0.1em 0.2em rgba(0,0,0,0.2);
    background: #fff;
}

.ios7-switch:hover input:focus + span {
    box-shadow: inset 0 0 0 0.0625em #e9e9e9;
}

.ios7-switch:hover input:focus:checked + span {
    box-shadow: inset 0 0 0 0.73em #00A3D9;
}

input[type="text"] {
  display: block;
  margin: 0;
  min-width: 100px;
  font-family: sans-serif;
  font-size: 18px;
  appearance: none;
  box-shadow: none;
  border-radius: 3px;
  border: 1px solid #f0f0f0;
  padding: 4px;
}


.customhelp { 
	   color: #000; 
       font-size:0.9em; 
}
.color {
    border:1px solid #AAA;
}
.boxpattern div{
    display:inline-block; 
    overflow:hidden; 
    width:80px; 
    height:80px;
}
.titletd{   background: #F4F4F4;
  padding: 5px;
  color: #8C8C8C!important;
     line-height: 30px;
}
.box > .content h2 {
    margin-bottom: 0;
}
select, input, textarea{
    background-color:#ffffff; 
    padding:3px;
}
.htabs a.selected {
    padding: 12px;
    background: #ff8400;
    border-radius: 2px 2px 0 0;
    color: #fff;
    border: 0;
}
.htabs a {
    padding: 12px;
    background: #000;
    color: #f0f0f0;
    border-radius: 2px 2px 0 0;
    border: 0;
}
.htabs {
    border: 0;
}
table.form > tbody > tr > td {
    padding: 14px;
    color: #000;
    border-bottom: 1px solid #f0f0f0;
    font-size: 12px;
}
.content {
    padding: 38px!important;
    background: #f0f0f0;
    border: 0;
}

.box > .content {
    background: url('view/image/theme-bg.png') repeat;
    border: none!important;
}

td{
    background: #fff;
    font-size: 14px!important;
    font-weight: bold!important;
}

td:first-child {
    width: 32%;
}

table.form {
    margin: 0; 
    width: 100%;  
}

.pay-methods {
    float: left;
    margin: 15px 40px 0 0;
    padding: 8px;
    text-align: center;
    border: 1px solid #f6f6f6;
}

.pay-methods:hover {
    border: 1px solid #86a7e0;
}

.pay-methods IMG{
    margin-bottom: 7px;
    cursor: pointer;
    width: 60px;
}

.pay-methods input{
    cursor: pointer;
}

.ok {
    color: #4CBB59;
    font-size: 20px;
    line-height: 34px;
    margin-bottom: 21px;
    padding: 8px;
    background: #fff;
}

.boxed {
	float: left; 
	width: 150px;
	padding: 10px;
	text-align: center;
	font-weight: bold;
	background: #f0f0f0;
	border: 1px solid #ccc;
	line-height: 22px;
	margin-right: 10px;
	height: 110px;
}

.boxed label {
	cursor: pointer;
}

.boxed:hover{
	background-color: #f9f9f9;
}

.selected-box {
	background: #8FBB6C;
}

.boxed:hover {
	background: #8FBB6C;
}

.form-group.required {
    height: 65px;
}

.panel-body label {
    text-align: right;
    padding-top: 8px;
}

</style>

<?php echo $column_left; ?>

<?php 

if(empty($storeset_backgr_color)) $storeset_backgr_color ="f5f5f5";



if(empty($storeset_1_links_color)) $storeset_1_links_color ="DBF3FF";
if(empty($storeset_1_hover)) $storeset_1_hover ="FFF";
if(empty($storeset_1_background)) $storeset_1_background ="141414";
if(empty($storeset_2_phonecolor)) $storeset_2_phonecolor ="424242";
if(empty($storeset_2_timecolor)) $storeset_2_timecolor ="424242";
if(empty($storeset_2_backcart)) $storeset_2_backcart ="ff5100";
if(empty($storeset_2_colorcart)) $storeset_2_colorcart ="fff";
if(empty($storeset_main1)) $storeset_main1 ="141414";
if(empty($storeset_main2)) $storeset_main2 ="FF5100";

if(empty($storeset_3_linkcolor)) $storeset_3_linkcolor ="dbf3ff";
if(empty($storeset_3_hover)) $storeset_3_hover ="FFFAFA";
if(empty($storeset_3_backround)) $storeset_3_backround ="141414";
if(empty($storeset_3_childback)) $storeset_3_childback ="fff";
if(empty($storeset_3_childcolor)) $storeset_3_childcolor ="252525";
if(empty($storeset_3_backsearch)) $storeset_3_backsearch ="FFFFFF";


if(empty($storeset_f1_backround)) $storeset_f1_backround ="141414";
if(empty($storeset_f1_linkcolor)) $storeset_f1_linkcolor ="CCCCCC";
if(empty($storeset_f1_h1color)) $storeset_f1_h1color ="B0B0B0";
if(empty($storeset_f1_textcolor)) $storeset_f1_textcolor ="969696";


if(empty($storeset_f2_background)) $storeset_f2_background ="0C0C0C";
if(empty($storeset_f2_h1color)) $storeset_f2_h1color ="6C6C6C";
if(empty($storeset_f2_linkcolor)) $storeset_f2_linkcolor ="969696";


if(empty($storeset_f3_background)) $storeset_f3_background ="141414";
if(empty($storeset_f3_copytextcolor)) $storeset_f3_copytextcolor ="969696";
if(empty($storeset_f3_copylinkcolor)) $storeset_f3_copylinkcolor ="DBF3FF";

if(empty($storeset_left_backround)) $storeset_left_backround ="141414";
if(empty($storeset_left_fontcolor)) $storeset_left_fontcolor ="dbf3ff";
if(empty($storeset_left_linkcolor)) $storeset_left_linkcolor ="454343";


if(empty($storeset_category_butcolor)) $storeset_category_butcolor ="000";
if(empty($storeset_category_oldprice)) $storeset_category_oldprice ="848484";
if(empty($storeset_category_newprice)) $storeset_category_newprice ="FF5100";

if(empty($storeset_good_pricecolor)) $storeset_good_pricecolor ="ff5100";
if(empty($storeset_good_buttonback)) $storeset_good_buttonback ="000";
if(empty($storeset_good_buttontextcolore)) $storeset_good_buttontextcolore ="FFF";

if(empty($storeset_mobile_head)) $storeset_mobile_head ="FFF";
if(empty($storeset_mobile_foot)) $storeset_mobile_foot ="FFF";


if(empty($storeset_mobile_head_back)) $storeset_mobile_head_back ="000";
if(empty($storeset_mobile_sidebar_back)) $storeset_mobile_sidebar_back ="000";
if(empty($storeset_mobile_sidebar_linkcolor)) $storeset_mobile_sidebar_linkcolor ="FFF";
if(empty($storeset_mobile_foot_back)) $storeset_mobile_foot_back ="000";

if(empty($storeset_mobile_head_buttonback)) $storeset_mobile_head_buttonback ="ccc";


if(empty($storeset_custom_icon1)) $storeset_custom_icon1 ="phone";
if(empty($storeset_custom_icon2)) $storeset_custom_icon2 ="clock-o";
if(empty($storeset_custom_icon3)) $storeset_custom_icon3 ="shopping-cart";


if(empty($storeset_button_text_color)) $storeset_button_text_color ="666";

if(empty($storeset_left_menubg)) $storeset_left_menubg = "05080a";
if(empty($storeset_left_menucolsapsebg)) $storeset_left_menucolsapsebg = "535e6b";
if(empty($storeset_left_menulinkcolor)) $storeset_left_menulinkcolor = "ffffff"; 
if(empty($storeset_left_menulinkcolorhover)) $storeset_left_menulinkcolorhover = "d8f3f0";
if(empty($storeset_left_collinkcoloractive)) $storeset_left_collinkcoloractive = "f8ff74";
if(empty($storeset_left_collinkcolor)) $storeset_left_collinkcolor = "dddddd";
if(empty($storeset_left_collinkcolorhover)) $storeset_left_collinkcolorhover = "ffffff";

if(!isset($storeset_status)) {
	$storeset_f1_enable = "on";
	$storeset_f2_enable = "on";
	$storeset_f3_enable = "on";
	$storeset_subscribe_footer = "on";
}
?>




<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
	      
        <button onclick="$('#form').submit();" type="submit" form="form-carousel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a class="btn btn-warning" onclick="$('#actionstay').val('1');$('#form').submit();"><i class="fa fa-external-link-square"></i> <?php echo $text_stay_in_module; ?></a>

        <a href="<?php echo $cache; ?>" data-toggle="tooltip" title="<?php echo $button_cache; ?>" class="btn btn-warning"><i class="fa fa-trash-o"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-success"><i class="fa fa-reply"></i></a></div>
     
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>



<?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3> 
	      <div style="font-size: 22px; color: #ff0000;">v 6.1</div>
      </div>
      <div class="panel-body">




	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

	<?php if(isset($_SESSION['success'])) { echo "<div class='ok'>".$_SESSION['success']."</div>"; } ?>
		
	<input type="hidden" id="actionstay" name="actionstay" value="0">

        
        <ul class="nav nav-tabs">
            <li class="active"><a href="#mainset" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_1; ?></a></li>
            <li><a href="#mobile" data-toggle="tab"><i class="fa fa-laptop"></i> <?php echo $tab_mobile; ?></a></li>
            <li><a href="#soc" data-toggle="tab"><i class="fa fa-users"></i> <?php echo $tab_2; ?></a></li>
            <li><a href="#contactstatic" data-toggle="tab"><i class="fa fa-list-alt"></i> <?php echo $tab_3; ?></a></li>
            <li><a href="#paymethodts" data-toggle="tab"><i class="fa fa-credit-card"></i> <?php echo $tab_4; ?></a></li>
            <li><a href="#size" data-toggle="tab"><i class="fa fa-th"></i> <?php echo $entry_size_link; ?></a></li>
            <li><a href="#customcss" data-toggle="tab"><i class="fa fa-code"></i> <?php echo $entry_customcss; ?></a></li>
            <li><a href="#tab-limit-and-image" data-toggle="tab"><i class="fa fa-picture-o"></i> <?php echo $tab_limit_and_image; ?></a></li>
            <li><a href="#license-tab" data-toggle="tab"><i class="fa fa-key"></i> License key</a></li>
          </ul>

        <div class="tab-content">


            <div id="tab-limit-and-image" class="tab-pane">
	             <div class="panel panel-default">
			      <div class="panel-heading">
			        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $tab_limit_and_image; ?></h3>
			      </div>
			      <div class="panel-body">
              <fieldset>
                <legend><?php echo $text_product; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="storeset_product_limit" value="<?php echo $storeset_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
                    <?php if ($error_product_limit) { ?>
                    <div class="text-danger"><?php echo $error_product_limit; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="storeset_product_description_length" value="<?php echo $storeset_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-description-limit" class="form-control" />
                    <?php if ($error_product_description_length) { ?>
                    <div class="text-danger"><?php echo $error_product_description_length; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_image; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-category-width"><?php echo $entry_image_category; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_category_width" value="<?php echo $storeset_image_category_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-category-width" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_category_height" value="<?php echo $storeset_image_category_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_category) { ?>
                    <div class="text-danger"><?php echo $error_image_category; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_thumb_width" value="<?php echo $storeset_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_thumb_height" value="<?php echo $storeset_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_thumb) { ?>
                    <div class="text-danger"><?php echo $error_image_thumb; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_image_popup; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_popup_width" value="<?php echo $storeset_image_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_popup_height" value="<?php echo $storeset_image_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_popup) { ?>
                    <div class="text-danger"><?php echo $error_image_popup; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-product-width"><?php echo $entry_image_product; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_product_width" value="<?php echo $storeset_image_product_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-product-width" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_product_height" value="<?php echo $storeset_image_product_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_product) { ?>
                    <div class="text-danger"><?php echo $error_image_product; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-additional-width"><?php echo $entry_image_additional; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_additional_width" value="<?php echo $storeset_image_additional_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-additional-width" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_additional_height" value="<?php echo $storeset_image_additional_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_additional) { ?>
                    <div class="text-danger"><?php echo $error_image_additional; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-related"><?php echo $entry_image_related; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_related_width" value="<?php echo $storeset_image_related_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-related" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_related_height" value="<?php echo $storeset_image_related_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_related) { ?>
                    <div class="text-danger"><?php echo $error_image_related; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-compare"><?php echo $entry_image_compare; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_compare_width" value="<?php echo $storeset_image_compare_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-compare" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_compare_height" value="<?php echo $storeset_image_compare_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_compare) { ?>
                    <div class="text-danger"><?php echo $error_image_compare; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-wishlist"><?php echo $entry_image_wishlist; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_wishlist_width" value="<?php echo $storeset_image_wishlist_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-wishlist" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_wishlist_height" value="<?php echo $storeset_image_wishlist_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_wishlist) { ?>
                    <div class="text-danger"><?php echo $error_image_wishlist; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-cart"><?php echo $entry_image_cart; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_cart_width" value="<?php echo $storeset_image_cart_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-cart" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_cart_height" value="<?php echo $storeset_image_cart_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_cart) { ?>
                    <div class="text-danger"><?php echo $error_image_cart; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-image-location"><?php echo $entry_image_location; ?></label>
                  <div class="col-sm-10">
                    <div class="row">
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_location_width" value="<?php echo $storeset_image_location_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-location" class="form-control" />
                      </div>
                      <div class="col-sm-6">
                        <input type="text" name="storeset_image_location_height" value="<?php echo $storeset_image_location_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                      </div>
                    </div>
                    <?php if ($error_image_location) { ?>
                    <div class="text-danger"><?php echo $error_image_location; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
            </div> </div> </div>

          <div id="mainset" class="tab-pane active in">

	
             <h2 class="titletd"><span><?php echo $entry_m_text; ?></span></h2>
            
			<table class="form">
                
                 <tr>
					<td><?php echo $entry_status; ?></td>
					<td>
		
			
					<label class="ios7-switch">
                        <input type="checkbox" name="storeset_status" <?php if($storeset_status == "on") echo "checked";?>>
                        <span></span>
                    </label> 
			
			
			
                    </td>
				</tr>
                
                
                
				
				
                	<tr>
					<td><?php echo $entry_microdata; ?></td>
					<td>
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_microdata" <?php if($storeset_microdata == "on") echo "checked";?>>
                        <span></span>
                    </label>   
                    </td>
				</tr>
				
				
					<tr>
					<td><?php echo $entry_showmanlogos; ?></td>
					<td>
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_showmanlogos" <?php if($storeset_showmanlogos == "on") echo "checked";?>>
                        <span></span>
                    </label>   
                    </td>
				</tr>
        <tr>
                    <td><?php echo $entry_terms; ?></td>
                    <td>
                      <select name="storeset_terms" class="form-control">
                          <option value="0"><?php echo $text_none; ?></option>
                          <?php foreach ($informations as $information) { ?>
                          <?php if ($information['information_id'] == $storeset_terms) { ?>
                          <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select>      
                    </td>
                </tr>
				
                
                	<tr>
					<td><?php echo $entry_backgr_color; ?></td>
					<td><input type="text" name="storeset_backgr_color" value="<?php echo $storeset_backgr_color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                
                	<tr>
					<td style="width:20%;"><?php echo $entry_main1; ?></td>
					<td><input type="text" name="storeset_main1" value="<?php echo $storeset_main1; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                	<tr>
					<td><?php echo $entry_main2; ?></td>
					<td><input type="text" name="storeset_main2" value="<?php echo $storeset_main2; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>     


                	<tr>
					<td><?php echo $entry_button_text_color; ?></td>
					<td><input type="text" name="storeset_button_text_color" value="<?php echo $storeset_button_text_color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                 
            
                <tr>
					<td style="width:20%;"><?php echo $entry_custom_pattern; ?> </td>
					<td>
                    
                    
                    <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $storeset_pattern_preview; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
						<input type="hidden" name="storeset_custom_pattern" value="<?php echo $storeset_custom_pattern; ?>" id="storeset_custom_pattern" />
					
					</td>
				</tr>
			
			
              
                
                
                      <tr>
						<td><?php echo $entry_custom_topinfo1; ?></td>

					<td >
					
                        	<input type="text" name="storeset_custom_icon1" value="<?php echo $storeset_custom_icon1; ?>" id="storeset_custom_icon1" /> <a target="_blank" href="https://fortawesome.github.io/Font-Awesome/icons/">Выбрать \ select</a>
						
					</td>
	
					
                      <tr>
						<td><?php echo $entry_custom_topinfo2; ?></td>
                       <td >
						
                        
                         <input type="text" name="storeset_custom_icon2" value="<?php echo $storeset_custom_icon2; ?>" id="storeset_custom_icon2" /> <a target="_blank" href="https://fortawesome.github.io/Font-Awesome/icons/">Выбрать \ select</a>
                        
						
					</td>
						
					</tr>
                     <tr>
						<td><?php echo $entry_custom_topinfo3; ?></td>
                       <td>
					
                        
                        	<input type="text" name="storeset_custom_icon3" value="<?php echo $storeset_custom_icon3; ?>" id="storeset_custom_icon3" /> <a target="_blank" href="https://fortawesome.github.io/Font-Awesome/icons/">Выбрать \ select</a>
                        
                        
					</td>
						
					</tr>
                    </table>
                
                 <h2 class="titletd"><span><?php echo $entry_1_text; ?></span></h2>
			     <table class="form">
                    <tr>
					<td style="width:20%;"><?php echo $entry_1_links_color; ?></td>
					<td><input type="text" name="storeset_1_links_color" value="<?php echo $storeset_1_links_color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_1_background; ?></td>
					<td><input type="text" name="storeset_1_background" value="<?php echo $storeset_1_background; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_1_hover; ?></td>
					<td><input type="text" name="storeset_1_hover" value="<?php echo $storeset_1_hover; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                </table>
                
                
                 <h2 class="titletd"><span><?php echo $entry_2_text; ?></span></h2>
			     <table class="form">
                    <tr>
					<td style="width:20%;"><?php echo $entry_2_phonecolor; ?></td>
					<td><input type="text" name="storeset_2_phonecolor" value="<?php echo $storeset_2_phonecolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_2_timecolor; ?></td>
					<td><input type="text" name="storeset_2_timecolor" value="<?php echo $storeset_2_timecolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_2_backcart; ?></td>
					<td><input type="text" name="storeset_2_backcart" value="<?php echo $storeset_2_backcart; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                <tr>
					<td><?php echo $entry_2_colorcart; ?></td>
					<td><input type="text" name="storeset_2_colorcart" value="<?php echo $storeset_2_colorcart; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                                
                </table>
                
                
                
                   <h2 class="titletd"><span><?php echo $entry_3_text; ?></span></h2>
			     <table class="form">
                    <tr>
					<td style="width:20%;"><?php echo $entry_3_linkcolor; ?></td>
					<td><input type="text" name="storeset_3_linkcolor" value="<?php echo $storeset_3_linkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                <tr>
					<td style="width:20%;"><?php echo $entry_3_hover; ?></td>
					<td><input type="text" name="storeset_3_hover" value="<?php echo $storeset_3_hover; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_3_backround; ?></td>
					<td><input type="text" name="storeset_3_backround" value="<?php echo $storeset_3_backround; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_3_childback; ?></td>
					<td><input type="text" name="storeset_3_childback" value="<?php echo $storeset_3_childback; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                <tr>
					<td><?php echo $entry_3_childcolor; ?></td>
					<td><input type="text" name="storeset_3_childcolor" value="<?php echo $storeset_3_childcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>       
                <tr>
					<td><?php echo $entry_3_backsearch; ?></td>
					<td><input type="text" name="storeset_3_backsearch" value="<?php echo $storeset_3_backsearch; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                                           
                </table>      
                
                
                <h2 class="titletd"><span><?php echo $entry_f1_text; ?></span></h2>
			     <table class="form">
				 <tr>
					<td><?php echo $entry_f1_enable; ?></td>
					<td>
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_f1_enable" <?php if($storeset_f1_enable == "on") echo "checked";?>>
                        <span></span>
                    </label>  
                        
                    </td>
				</tr> 
				<tr>
					<td><?php echo $entry_subscribe_footer; ?></td>
					<td>
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_subscribe_footer" <?php if($storeset_subscribe_footer == "on") echo "checked";?>>
                        <span></span>
                    </label>  
                        
                    </td>
				</tr> 
                    <tr>
					<td style="width:20%;"><?php echo $entry_f1_backround; ?></td>
					<td><input type="text" name="storeset_f1_backround" value="<?php echo $storeset_f1_backround; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_f1_linkcolor; ?></td>
					<td><input type="text" name="storeset_f1_linkcolor" value="<?php echo $storeset_f1_linkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_f1_h1color; ?></td>
					<td><input type="text" name="storeset_f1_h1color" value="<?php echo $storeset_f1_h1color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                <tr>
					<td><?php echo $entry_f1_textcolor; ?></td>
					<td><input type="text" name="storeset_f1_textcolor" value="<?php echo $storeset_f1_textcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>       
                                                       
                </table>   
                
                
                
                 <h2 class="titletd"><span><?php echo $entry_f2_text; ?></span></h2>
			     <table class="form">
				 <tr>
					<td><?php echo $entry_f2_enable; ?></td>
					<td>
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_f2_enable" <?php if($storeset_f2_enable == "on") echo "checked";?>>
                        <span></span>
                    </label>
                        
                    </td>
                    
				</tr>    
				     
                    <tr>
					<td style="width:20%;"><?php echo $entry_f2_background; ?></td>
					<td><input type="text" name="storeset_f2_background" value="<?php echo $storeset_f2_background; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_f2_h1color; ?></td>
					<td><input type="text" name="storeset_f2_h1color" value="<?php echo $storeset_f2_h1color; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_f2_linkcolor; ?></td>
					<td><input type="text" name="storeset_f2_linkcolor" value="<?php echo $storeset_f2_linkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                               
                </table>      
                
                
                      


                 <h2 class="titletd"><span><?php echo $entry_f3_text; ?></span></h2>
			     <table class="form">
				 <tr>
					<td><?php echo $entry_f3_enable; ?></td>
					<td>
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_f3_enable" <?php if($storeset_f3_enable == "on") echo "checked";?>>
                        <span></span>
                    </label>
                    </td>
				</tr>           
                    <tr>
					<td style="width:20%;"><?php echo $entry_f3_background; ?></td>
					<td><input type="text" name="storeset_f3_background" value="<?php echo $storeset_f3_background; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_f3_copytextcolor; ?></td>
					<td><input type="text" name="storeset_f3_copytextcolor" value="<?php echo $storeset_f3_copytextcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                <tr>
					<td><?php echo $entry_f3_copylinkcolor; ?></td>
					<td><input type="text" name="storeset_f3_copylinkcolor" value="<?php echo $storeset_f3_copylinkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                                
                </table>
                
                
                                 <h2 class="titletd"><span><?php echo $entry_leftright_text; ?></span></h2>
			     <table class="form">
                    <tr>
					<td style="width:20%;"><?php echo $entry_left_backround; ?></td>
					<td><input type="text" name="storeset_left_backround" value="<?php echo $storeset_left_backround; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_left_fontcolor; ?></td>
					<td><input type="text" name="storeset_left_fontcolor" value="<?php echo $storeset_left_fontcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_left_linkcolor; ?></td>
					<td><input type="text" name="storeset_left_linkcolor" value="<?php echo $storeset_left_linkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                               
                </table>  
                
                
                                 <h2 class="titletd"><span><?php echo $entry_left_menu; ?></span></h2>
			     <table class="form">
                    <tr>
					<td style="width:20%;"><?php echo $entry_left_menubg; ?></td>
					<td><input type="text" name="storeset_left_menubg" value="<?php echo $storeset_left_menubg; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
				  <tr>
					<td><?php echo $entry_left_menucolsapsebg; ?></td>
					<td><input type="text" name="storeset_left_menucolsapsebg" value="<?php echo $storeset_left_menucolsapsebg; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>   
                 <tr>
					<td><?php echo $entry_left_menulinkcolor; ?></td>
					<td><input type="text" name="storeset_left_menulinkcolor" value="<?php echo $storeset_left_menulinkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr> <tr>
					<td><?php echo $entry_left_menulinkcolorhover; ?></td>
					<td><input type="text" name="storeset_left_menulinkcolorhover" value="<?php echo $storeset_left_menulinkcolorhover; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
				

				
				 <tr>
					<td><?php echo $entry_left_collinkcolor; ?></td>
					<td><input type="text" name="storeset_left_collinkcolor" value="<?php echo $storeset_left_collinkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
				
				 <tr>
					<td><?php echo $entry_left_collinkcolorhover; ?></td>
					<td><input type="text" name="storeset_left_collinkcolorhover" value="<?php echo $storeset_left_collinkcolorhover; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
				
								 <tr>
					<td><?php echo $entry_left_collinkcoloractive; ?></td>
					<td><input type="text" name="storeset_left_collinkcoloractive" value="<?php echo $storeset_left_collinkcoloractive; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                                           
                </table>  
                
                
                                 <h2 class="titletd"><span><?php echo $entry_cat_text; ?></span></h2>
			     <table class="form">
                  
                 <tr>
					<td style="width:20%;"><?php echo $entry_category_oldprice; ?></td>
					<td><input type="text" name="storeset_category_oldprice" value="<?php echo $storeset_category_oldprice; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                 <tr>
					<td><?php echo $entry_category_newprice; ?></td>
					<td><input type="text" name="storeset_category_newprice" value="<?php echo $storeset_category_newprice; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                               
                </table>                  


                                 <h2 class="titletd"><span><?php echo $entry_good_text; ?></span></h2>
			     <table class="form">
                    <tr>
					<td style="width:20%;"><?php echo $entry_good_pricecolor; ?></td>
					<td><input type="text" name="storeset_good_pricecolor" value="<?php echo $storeset_good_pricecolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                 <tr>
					<td><?php echo $entry_good_buttontextcolor; ?></td>
					<td><input type="text" name="storeset_good_buttontextcolore" value="<?php echo $storeset_good_buttontextcolore; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>                               
                </table> 
                
				
			</div>
            
           
           
              <div id="mobile" class="tab-pane fade">
            
             <h2 class="titletd"><span><?php echo $entry_mobiletext; ?></span></h2>
            
            <table class="form">
            
            
                    
					
                        
                        
                      
                
               <!-- <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext8; ?></td>
					<td><input type="text" name="storeset_mobile_foot_back" value="<?php echo $storeset_mobile_foot_back; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                  <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext4; ?></td>
					<td><input type="text" name="storeset_mobile_foot" value="<?php echo $storeset_mobile_foot; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>-->
                  <tr>
						<td><?php echo $entry_mobiletext2; ?></td>

					<td >       
                        
                        
                        <a href="" id="thumb-image5" data-toggle="image" class="img-thumbnail"><img src="<?php echo $storeset_icon_mobile; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                        
                        
                        	<input type="hidden" name="storeset_custom_mobile" value="<?php echo $storeset_custom_mobile; ?>" id="storeset_custom_mobile" />
						
					</td>
                    
                    </tr>
                    
                   <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext5; ?></td>
					<td><input type="text" name="storeset_mobile_head_back" value="<?php echo $storeset_mobile_head_back; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                 </tr>
                    
                   <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext3; ?></td>
					<td><input type="text" name="storeset_mobile_head" value="<?php echo $storeset_mobile_head; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                      <!-- <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext10 ?></td>
					<td><input type="text" name="storeset_mobile_head_buttonback" value="<?php echo $storeset_mobile_head_buttonback; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>-->
                
                
                
                 <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext6; ?></td>
					<td><input type="text" name="storeset_mobile_sidebar_back" value="<?php echo $storeset_mobile_sidebar_back; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
                
                
                 <tr>
					<td style="width:20%;"><?php echo $entry_mobiletext7; ?></td>
					<td><input type="text" name="storeset_mobile_sidebar_linkcolor" value="<?php echo $storeset_mobile_sidebar_linkcolor; ?>" size="6" class="color {required:false,hash:true}"  /></td>
				</tr>
				
				
				<tr>
					<td style="width:20%;"><?php echo $entry_mobileed; ?></td>
					<td>
						
						<div class="boxed<?php if($storeset_mobile_sidebar_1 == "on") { echo " selected-box"; }?>">
							<label>
							<input class="boxeded" type="checkbox" name="storeset_mobile_sidebar_1"<?php if($storeset_mobile_sidebar_1 == "on") { echo " checked"; }?>><br />
							<?php echo $entry_mobileed1; ?>
							</label>
						</div>
						
						<div class="boxed<?php if($storeset_mobile_sidebar_2 == "on") { echo " selected-box"; }?>">
							
							<label>
							<input class="boxeded" type="checkbox" name="storeset_mobile_sidebar_2"<?php if($storeset_mobile_sidebar_2 == "on") { echo " checked"; }?>><br />
							<?php echo $entry_mobileed2; ?>
							</label>
						</div>
						
						<div class="boxed<?php if($storeset_mobile_sidebar_3 == "on") { echo " selected-box"; }?>">
							<label>
							<input class="boxeded" type="checkbox" name="storeset_mobile_sidebar_3"<?php if($storeset_mobile_sidebar_3 == "on") { echo " checked"; }?>><br />
							<?php echo $entry_mobileed3; ?>
							</label>
						</div>
						
						<div class="boxed<?php if($storeset_mobile_sidebar_4 == "on") { echo " selected-box"; }?>">
							<label>
							<input class="boxeded" type="checkbox" name="storeset_mobile_sidebar_4"<?php if($storeset_mobile_sidebar_4 == "on") { echo " checked"; }?>><br />
							<?php echo $entry_mobileed4; ?>
							</label>
						</div>
						
						<div class="boxed<?php if($storeset_mobile_sidebar_5 == "on") { echo " selected-box"; }?>">
							<label>
							<input class="boxeded" type="checkbox" name="storeset_mobile_sidebar_5"<?php if($storeset_mobile_sidebar_5 == "on") { echo " checked"; }?>><br />
							<?php echo $entry_mobileed5; ?>
							</label>
						</div>
						
						<div class="boxed<?php if($storeset_mobile_sidebar_6 == "on") { echo " selected-box"; }?>">
							<label>
							<input class="boxeded" type="checkbox" name="storeset_mobile_sidebar_6"<?php if($storeset_mobile_sidebar_6 == "on") { echo " checked"; }?>><br />
							<?php echo $entry_mobileed6; ?>
							</label>
						</div>
						
						<script>
						$(".boxeded").click(function() {
						  $(this).parent().parent().toggleClass("selected-box");
						});
						</script>
						
					</td>
				</tr>
				
                
                 
                
              
                
            
            </table>
            
            </div>
           
            
            
            <div id="soc" class="tab-pane fade">
            
             <h2 class="titletd"><span><?php echo $entry_social_text; ?></span></h2>
            
            <table class="form">
            
            
                    <tr>
						<td style="width: 20%;"><?php echo $entry_facebook_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_facebook_id" value="<?php echo $storeset_facebook_id; ?>" /></td>
					</tr>
                    
                    <tr>
						<td><?php echo $entry_vk_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_vk_id" value="<?php echo $storeset_vk_id; ?>" /></td>
					</tr>
				
				         
					<tr>
						<td><?php echo $entry_gplus_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_gplus_id" value="<?php echo $storeset_gplus_id; ?>" /></td>
					</tr>
                    
					<tr>
						<td><?php echo $entry_odnoklass_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_odnoklass_id" value="<?php echo $storeset_odnoklass_id; ?>" /></td>
					</tr>                    
                     <tr>
						<td><?php echo $entry_rss_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_rss_id" value="<?php echo $storeset_rss_id; ?>" /></td>
					</tr>
                    <tr>
                        <td><?php echo $entry_twitter_username; ?></td>
						<td><input class="form-control" type="text" name="storeset_twitter_id" value="<?php echo $storeset_twitter_id; ?>" /></td>
					</tr> 
                    <tr>
						<td><?php echo $entry_vimeo_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_vimeo_id" value="<?php echo $storeset_vimeo_id; ?>" /></td>
					</tr>    
                    
                  
                    <tr>
						<td><?php echo $entry_pinterest_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_pinterest_id" value="<?php echo $storeset_pinterest_id; ?>" /></td>
					</tr>                     
                    <tr>
						<td><?php echo $entry_dribbble_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_dribbble_id" value="<?php echo $storeset_dribbble_id; ?>" /></td>
					</tr>                     
                    
                         
                    <tr>
						<td><?php echo $entry_flick_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_flick_id" value="<?php echo $storeset_flick_id; ?>" /></td>
					</tr>
					<tr>
						<td><?php echo $entry_linkedin_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_linkedin_id" value="<?php echo $storeset_linkedin_id; ?>" /></td>
					</tr>          
					
                  <tr>
						<td><?php echo $entry_youtube_id; ?></td>
						<td><input class="form-control" type="text" name="storeset_youtube_id" value="<?php echo $storeset_youtube_id; ?>" /></td>
					</tr>
				
                   
                    <tr>
						<td><?php echo $entry_vidget; ?></td>
                        <td><textarea class="form-control" name="storeset_cont_vidget" cols="70" rows="10"><?php echo $storeset_cont_vidget; ?></textarea></td>
					</tr>             
                
            
            </table>
            
            </div>
            

			<div id="contactstatic" class="tab-pane fade">
            
			     
                    <h2 class="titletd"><span><?php echo $entry_static_text; ?></span></h2> 
                   <table class="form">
					<tr>
                        
                       <tr>
						<td style="width: 20%;"><?php echo $entry_phone1; ?></td>
						<td><input type="text" class="form-control" name="storeset_cont_phone1" value="<?php echo $storeset_cont_phone1; ?>">
						</td>
					</tr>  
                    <tr>
                        
                       <tr>
						<td><?php echo $entry_phone2; ?></td>
						<td><input type="text" class="form-control" name="storeset_cont_phone2" value="<?php echo $storeset_cont_phone2; ?>">
						</td>
					</tr>   
                   
                    
                   <tr>
						<td><?php echo $entry_address; ?></td>
						<td><input type="text" class="form-control" name="storeset_cont_address" value="<?php echo $storeset_cont_address; ?>">
						</td>
					</tr>
                    
                    <tr>
						<td><?php echo $entry_skype; ?></td>
						<td><input type="text" class="form-control" name="storeset_cont_skype" value="<?php echo $storeset_cont_skype; ?>">
						</td>
					</tr>
                    
                    <tr>
						<td><?php echo $entry_email; ?></td>
						<td><input type="text" class="form-control" name="storeset_cont_email" value="<?php echo $storeset_cont_email; ?>">
						</td>
					</tr>
                    
                    
 
					<tr>
						<td><?php echo $entry_clock; ?></td>
                        
						<td>
						
						

						<?php foreach ($languages as $language) { ?>
				    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
				    <textarea style="min-height: 100px; " name="storeset_cont_clock[<?php echo $language['code']; ?>]" id="storeset_cont_clock<?php echo $language['code']; ?>" class="form-control"><?php echo isset($storeset_cont_clock[$language['code']]) ? $storeset_cont_clock[$language['code']] : ''; ?></textarea>
				    </div> <br />
					<?php } ?>		
						
						
						
						</td>
					</tr> 
                             
                  

					<tr>
						<td><?php echo $entry_copyright_text; ?></td>
                        
						<td>
						<?php foreach ($languages as $language) { ?>
				    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
				    <textarea style="min-height: 100px; " name="storeset_cont_copyright[<?php echo $language['code']; ?>]" id="storeset_cont_copyright<?php echo $language['code']; ?>" class="form-control"><?php echo isset($storeset_cont_copyright[$language['code']]) ? $storeset_cont_copyright[$language['code']] : ''; ?></textarea>
				    </div> <br />
					<?php } ?>		
						
						</td>
					</tr>
                    <tr>
						<td><?php echo $entry_product_info; ?></td>
                        
						<td>
						
							<?php foreach ($languages as $language) { ?>
				    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
				    <textarea style="min-height: 100px; " name="storeset_product_info[<?php echo $language['code']; ?>]" id="storeset_product_info<?php echo $language['code']; ?>" class="form-control"><?php echo isset($storeset_product_info[$language['code']]) ? $storeset_product_info[$language['code']] : ''; ?></textarea>
				    </div> <br />
					<?php } ?>	
							
						
						</td>
					</tr>
					 <tr>
						<td><?php echo $entry_abouttext; ?></td>
						<td>
							
							<?php foreach ($languages as $language) { ?>
				    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
				    <textarea style="min-height: 100px; " name="storeset_cont_abouttext[<?php echo $language['code']; ?>]" id="storeset_cont_abouttext<?php echo $language['code']; ?>" class="form-control summernote"><?php echo isset($storeset_cont_abouttext[$language['code']]) ? $storeset_cont_abouttext[$language['code']] : ''; ?></textarea>
				    </div> <br />
					<?php } ?>
							
						</td>
					</tr>      
                    <tr>
						<td><?php echo $entry_yamap; ?></td>
                        
						<td>
                        
						<?php foreach ($languages as $language) { ?>
				    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
				    <textarea style="min-height: 100px; " name="storeset_yamap[<?php echo $language['code']; ?>]" id="storeset_yamap<?php echo $language['code']; ?>" class="form-control"><?php echo isset($storeset_yamap[$language['code']]) ? $storeset_yamap[$language['code']] : ''; ?></textarea>
				    </div> <br />
					<?php } ?>
						</td>
					</tr>
					<tr>
						<td><?php echo $entry_yamap_text; ?></td>
                        
						<td>
                        
						<?php foreach ($languages as $language) { ?>
				    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
				    <textarea style="min-height: 100px; " name="storeset_yamap_text[<?php echo $language['code']; ?>]" id="storeset_yamap_text<?php echo $language['code']; ?>" class="form-control summernote"><?php echo isset($storeset_yamap_text[$language['code']]) ? $storeset_yamap_text[$language['code']] : ''; ?></textarea>
				    </div> <br />
					<?php } ?>
						</td>
					</tr>

				</table>

			</div>
            
            	<div id="paymethodts" class="tab-pane fade">
			<h2 class="titletd"><span><?php echo $entry_payment_text; ?></span></h2>
 <table class="form">

         
          
          <tr>
           
            <td colspan="2">
                
                <div class="pay-methods">
                    <img src="view/image/pay/g-wallet.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_google" <?php if($storeset_google == "on") echo "checked";?>>
                        <span></span>
                    </label> 
			
                </div>
                
                <div class="pay-methods">
                    <img src="view/image/pay/mastercard.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_master" <?php if($storeset_master == "on") echo "checked";?>>
                        <span></span>
                    </label> 
                </div>
                
                
                <div class="pay-methods">
                    <img src="view/image/pay/visa.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_visa" <?php if($storeset_visa == "on") echo "checked";?>>
                        <span></span>
                    </label> 
                </div>
                
                
                <div class="pay-methods">
                   <img src="view/image/pay/american.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_american" <?php if($storeset_american == "on") echo "checked";?>>
                        <span></span>
                    </label> 
                </div>       

                
                <div class="pay-methods">
                   <img src="view/image/pay/discover.png"><br />
                   <label class="ios7-switch">
                        <input type="checkbox" name="storeset_discover" <?php if($storeset_discover == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>  


                <div class="pay-methods">
                    <img src="view/image/pay/moneybookers.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_moneybookers" <?php if($storeset_moneybookers == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>
                
                <div class="pay-methods">
                    <img src="view/image/pay/paypal.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_paypal" <?php if($storeset_paypal == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>                

                 <div class="pay-methods">
                    <img src="view/image/pay/yamoney.png"><br />
                     <label class="ios7-switch">
                        <input type="checkbox" name="storeset_yamoney" <?php if($storeset_yamoney == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div> 
                
                 <div class="pay-methods">
                    <img src="view/image/pay/qiwi.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_qiwi" <?php if($storeset_qiwi == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>      
                
                 <div class="pay-methods">
                    <img src="view/image/pay/privat.png"><br />
                   <label class="ios7-switch">
                        <input type="checkbox" name="storeset_privat" <?php if($storeset_privat == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>                  


                 <div class="pay-methods">
                    <img src="view/image/pay/sberbank.png"><br />
                     <label class="ios7-switch">
                        <input type="checkbox" name="storeset_sberbank" <?php if($storeset_sberbank == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>  
                
                 <div class="pay-methods">
                    <img src="view/image/pay/liqpay.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_liqpay" <?php if($storeset_liqpay == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>                  
                
                 <div class="pay-methods">
                    <img src="view/image/pay/webmoney.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_webmoney" <?php if($storeset_webmoney == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>    
                
                 <div class="pay-methods">
                    <img src="view/image/pay/robokassa.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_robokassa" <?php if($storeset_robokassa == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div> 
                
                 <div class="pay-methods">
                    <img src="view/image/pay/2checkout.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_2checkout" <?php if($storeset_2checkout == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>                 
                
                 <div class="pay-methods">
                    <img src="view/image/pay/visa-electron.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_electron" <?php if($storeset_electron == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div> 
                
                
                <div class="pay-methods">
                    <img src="view/image/pay/maestro.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_maestro" <?php if($storeset_maestro == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>                 
                               
                <div class="pay-methods">
                    <img src="view/image/pay/switch.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_switch" <?php if($storeset_switch == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>     
                
                
                <div class="pay-methods">
                   <img src="view/image/pay/solo.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_solo" <?php if($storeset_solo == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>      
                
                 <div class="pay-methods">
                   <img src="view/image/pay/skrill.png"><br />
                    <label class="ios7-switch">
                        <input type="checkbox" name="storeset_skrill" <?php if($storeset_skrill == "on") echo "checked";?>>
                        <span></span>
                    </label>
                </div>                  
                 
                 
                                        
                                         
               </td>
          </tr>

         
        </table>

			</div>
			
		  <div id="size" class="tab-pane fade">
		    <h2 class="titletd"><span><?php echo $entry_size_text; ?></span></h2>
		    <div class="row">
		      <div class="col-sm-2">
		        <ul class="nav nav-pills nav-stacked" id="section">
		          <?php $section_row = 1; foreach ($sections as $section) { ?>
		            <li><a href="#tab-section-<?php echo $section_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-section-<?php echo $section_row; ?>\']').parent().remove(); $('#tab-section-<?php echo $section_row; ?>').remove(); $('#section a:first').tab('show');"></i> <?php echo $entry_size_sect . ' ' . $section_row; ?></a></li>
		          <?php $section_row++; } ?>
		          <li id="section-add" style="cursor:pointer"><a onclick="addSection();"><i class="fa fa-plus-circle"></i> <?php echo $entry_size_add; ?></a></li> 
		        </ul>
		      </div>
		      <div class="col-sm-10">
		        <div class="tab-content first">
		          <?php $section_row = 1; foreach ($sections as $section) { ?>
		            <div class="tab-pane" id="tab-section-<?php echo $section_row; ?>">
		              <div class="tab-content">
                    <div class="form-group">
                      <label class="col-sm-2 control-label"><?php echo $entry_category_block; ?></label>
                      <div class="col-sm-10">
                          <div class="well well-sm" style="height: 150px; overflow: auto; padding: 0 9px;">
                          <?php foreach ($product_categories as $category) { ?>
                          <div class="checkbox">
                            <label>
                              <?php if (isset($section['categories']) && in_array($category['category_id'], $section['categories'])) { ?>
                              <input type="checkbox" name="storeset_sections[<?php echo $section_row; ?>][categories][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                              <?php echo $category['name']; ?>
                              <?php } else { ?>
                              <input type="checkbox" name="storeset_sections[<?php echo $section_row; ?>][categories][]" value="<?php echo $category['category_id']; ?>" />
                              <?php echo $category['name']; ?>
                              <?php } ?>
                            </label>
                          </div>
                          <?php } ?>
                        </div>
                        <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                      </div>
                    </div>
		                <ul class="nav nav-tabs" id="language<?php echo $section_row; ?>">
		                  <?php foreach ($languages as $language) { ?>
		                    <li><a href="#tab-section-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
		                  <?php } ?>
		                </ul>
		                <div class="tab-content">
		                  <?php foreach ($languages as $language) { ?>
		                    <div class="tab-pane" id="tab-section-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>">
		                      <div class="form-vertical">
		                        <div class="control-group">
		                          <label class="control-label"><?php echo $entry_size_title; ?></label>
		                          <div class="controls">
		                            <input type="text" class="form-control" name="storeset_sections[<?php echo $section_row; ?>][title][<?php echo $language['code']; ?>]" value="<?php echo (isset($section['title'][$language['code']]) && $section['title'][$language['code']]) ? $section['title'][$language['code']] : ''; ?>" />         
		                          </div>
		                        </div>
		                        <div class="control-group">
		                          <label class="control-label"><?php echo $entry_size_block; ?></label>
		                          <div class="controls">
		                            <textarea class="form-control custom-control summernote" cols="3" name="storeset_sections[<?php echo $section_row; ?>][block][<?php echo $language['code']; ?>]" id="description-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><?php echo (isset($section['block'][$language['code']]) && $section['block'][$language['code']]) ? $section['block'][$language['code']] : ''; ?></textarea>
		                          </div>
		                        </div>
		                      </div> 
		                    </div>
		                  <?php } ?>
		                </div>
		              </div>
		            </div>
		          <?php $section_row++; } ?> 
		        </div>
		      </div> 
		    </div>	
		  </div>
		  
		  
		  
		  <div id="customcss" class="tab-pane fade">
            
            <h2 class="titletd"><span><?php echo $entry_customcss; ?></span></h2>
            
            <table class="form">
            
            
                    <tr>
						<td style="width: 20%;"><?php echo $entry_customcss; ?></td>
						<td>
							<textarea style="min-height: 300px; " name="storeset_customcss" id="storeset_customcss" class="form-control"><?php echo $storeset_customcss; ?></textarea>
						</td>
					</tr>
                    
                             
                
            
            </table>
            
            </div>
            <div class="tab-pane fade" id="license-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label">KEY:</label>
                <div class="col-sm-10">
                  <input type="text" name="storeset_aOO" value="<?php echo $storeset_aOO; ?>" class="form-control" />
                </div>
              </div>
            </div>      

</form>
<script type="text/javascript"><!--
var section_row = <?php echo $section_row; ?>;

function addSection() {	

  html  = '<div class="tab-pane" id="tab-section-' + section_row + '">';
	html += '<div class="tab-content">';

    html += '<div class="form-group">';
    html += '<label class="col-sm-2 control-label"><?php echo $entry_category_block; ?></label>';
    html += '<div class="col-sm-10">';
    html += '<div class="well well-sm" style="height: 150px; overflow: auto; padding: 0 9px;">';
        <?php foreach ($product_categories as $category) { ?>
        html += '<div class="checkbox">';
          html += '<label><input type="checkbox" name="storeset_sections[' + section_row + '][categories][]" value="<?php echo $category['category_id']; ?>" /> <?php echo $category['name']; ?></label>';
        html += '</div>';
        <?php } ?>
    html += '</div>';
    html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
    html += '</div>';
    html += '</div>';


	html += '<ul class="nav nav-tabs" id="language' + section_row + '">';
	<?php foreach ($languages as $language) { ?>
	html += '<li><a href="#tab-section-' + section_row + '-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
	<?php } ?>
	html += '</ul>';

	html += '<div class="tab-content">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="tab-pane" id="tab-section-' + section_row + '-<?php echo $language['language_id']; ?>">';
	html += '<div class="form-vertical">';
	html += '<div class="control-group">';
	html += '<label class="control-label"><?php echo $entry_size_title; ?></label>';
	html += '<div class="controls">';
	html += '<input type="text" name="storeset_sections[' + section_row + '][title][<?php echo $language['code']; ?>]" class="form-control"/>';
	html += '</div>';
	html += '</div>';
	html += '<div class="control-group">';
	html += '<label class="control-label"><?php echo $entry_size_block; ?></label>';
	html += '<div class="controls">';
	html += '<textarea name="storeset_sections[' + section_row + '][block][<?php echo $language['code']; ?>]" id="description-' + section_row + '-<?php echo $language['language_id']; ?>" class="form-control custom-control summernote" cols="3"></textarea>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';        

	$('.tab-content.first').append(html);

  $('#section-add').before('<li><a href="#tab-section-' + section_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-section-' + section_row + '\\\']\').parent().remove(); $(\'#tab-section-' + section_row + '\').remove(); $(\'#section a:first\').tab(\'show\');"></i> <?php echo $entry_size_sect; ?> ' + section_row + '</a></li>');
  
  $('#section a[href=\'#tab-section-' + section_row + '\']').tab('show');

  $('#language' + section_row + ' li:first-child a').tab('show');
	
  <?php if ($ckeditor) { ?>
    <?php foreach ($languages as $language) { ?>
      ckeditorInit('description-' + section_row + '-<?php echo $language['language_id']; ?>', getURLVar('token'));
    <?php } ?>
  <?php } else { ?>
    $('.summernote').summernote({height: 100});
  <?php } ?>

	section_row++;
}



<?php $section_row = 1; ?>
<?php foreach ( $sections as $section ) { ?>
  $( '#language<?php echo $section_row; ?> li:first-child a' ).tab( 'show' );
<?php $section_row++; ?>
<?php } ?>

$('#section li:first-child a').tab('show');
//--></script>

<script type="text/javascript">
<?php if ($ckeditor) { ?>
  <?php foreach ($languages as $language) { ?>
    ckeditorInit('storeset_yamap_text<?php echo $language['code']; ?>', getURLVar('token'));
    ckeditorInit('storeset_cont_abouttext<?php echo $language['code']; ?>', getURLVar('token'));
  <?php } ?>
<?php } ?>
</script>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script> 

<script type="text/javascript"><!--

// $(document).ready(function() {

// 	$('#storeset_background_color').ColorPicker({
// 		onSubmit: function(hsb, hex, rgb, el) {
// 			$(el).val(hex);
// 			$(el).ColorPickerHide();
// 		},
// 		onBeforeShow: function () {
// 			$(this).ColorPickerSetColor(this.value);
// 		}
// 	})
// 	.bind('keyup', function(){
// 		$(this).ColorPickerSetColor(this.value);
// 	});
// 	 });

//--></script>

<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};



//--></script> 
  </div>
</div>

  </div>
</div>
<?php echo $footer; ?>