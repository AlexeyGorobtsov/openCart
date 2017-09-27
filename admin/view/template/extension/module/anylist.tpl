<?php echo $header; ?>
<style>
.box {
	margin-bottom: 15px;
}
.box > .heading {
	height: 38px;
	padding-left: 7px;
	padding-right: 7px;
	border: 1px solid #DBDBDB;
	background: url('../image/box.png') repeat-x;
	-webkit-border-radius: 7px 7px 0px 0px;
	-moz-border-radius: 7px 7px 0px 0px;
	-khtml-border-radius: 7px 7px 0px 0px;
	border-radius: 7px 7px 0px 0px;
}
.box > .heading h1 {
	margin: 0px;
	padding: 11px 0px 0px 0px;
	color: #003A88;
	font-size: 16px;
	float: left;
}
.box > .heading h1 img {
	float: left;
	margin-top: -1px;
	margin-left: 3px;
	margin-right: 8px;
}
.box > .heading .buttons {
	float: right;
	padding-top: 7px;
	margin-right: 5px;
}
.box > .heading .buttons .button {
	margin-left: 5px;
}
.box > .content h2 {
	text-transform: uppercase;
	color: #FF802B;
	font-size: 15px;
	font-weight: bold;
	padding-bottom: 3px;
	border-bottom: 1px dotted #000000;
}
.box > .content {
	padding: 10px;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	min-height: 300px;
	overflow: auto;
}
a.button, .list a.button {
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	background: #000;

    cursor: pointer;
}
.list {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	margin-bottom: 20px;
}
.list td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;
}
.list thead td {
	background-color: #EFEFEF;
	padding: 0px 5px;
}
.list thead td a, .list thead td {
	text-decoration: none;
	color: #222222;
	font-weight: bold;
}
.list tbody td a {
	text-decoration: underline;
}
.list tbody td {
	vertical-align: middle;
	padding: 0px 5px;
}

.list .left {
	text-align: left;
	padding: 7px;
}
.list .right {
	text-align: right;
	padding: 7px;
}
.list .center {
	text-align: center;
	padding: 7px;
}
.list .asc {
	padding-right: 15px;
	background: url('../image/asc.png') right center no-repeat;
}
.list .desc {
	padding-right: 15px;
	background: url('../image/desc.png') right center no-repeat;
}
.list tr.filter td, .list tr:hover.filter td {
	padding: 5px;
	background: #E7EFEF;
}
.pagination {
	border-top: 1px solid #DDDDDD;
	display: inline-block;
	width: 100%;
	padding-top: 6px;
}
.pagination .links {
	float: left;
	padding-top: 6px;
}
.pagination .links a {
	border: 1px solid #DDDDDD;
	padding: 4px 10px;
	font-size: 12px;
	text-decoration: none;
	color: #A3A3A3;
}
.pagination .links b {
	border: 1px solid #269BC6;
	padding: 4px 10px;
	font-size: 12px;
	font-weight: normal;
	text-decoration: none;
	color: #269BC6;
	background: #FFFFFF;
}
.pagination .results {
	float: right;
	padding-top: 6px;
	font-size: 12px;
}
table {
	border-collapse: collapse;
	margin-top: 20px;
}
table.form > tbody > tr > td:first-child {
	width: 200px;
}
table.form > tbody > tr > td {
	padding: 10px;
	color: #000000;
	border-bottom: 1px dotted #CCCCCC;
}
.scrollbox {
	border: 1px solid #CCCCCC;
	width: 350px;
	height: 160px;
	background: #FFFFFF;
	overflow-y: scroll;
}
.scrollbox img {
	float: right;
	cursor: pointer;
}
.htabs {
	padding: 0px 0px 0px 1px;
	height: 30px;
	line-height: 16px;
	border-bottom: 1px solid #DDDDDD;
	margin-bottom: 15px;
}
.htabs a {
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	border-right: 1px solid #DDDDDD;
	background: #FFFFFF url('../image/tab.png') repeat-x;
	padding: 7px 15px 6px 15px;
	float: left;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	color: #000000;
	margin-right: 2px;
	display: none;
}
.htabs a.selected {
	padding-bottom: 7px;
	background: #FFFFFF;
}
.vtabs {
	width: 190px;
	padding: 10px 0px;
	min-height: 300px;
	float: left;
	display: block;
	border-right: 1px solid #DDDDDD;
}
.vtabs a {
	display: none;
}
.vtabs a, .vtabs span {
	display: block;
	float: left;
	width: 160px;
	margin-bottom: 5px;
	clear: both;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;
	background: #F7F7F7;
	padding: 6px 14px 7px 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	text-align: right;
	text-decoration: none;
	color: #000000;
}
.vtabs a.selected {
	padding-right: 15px;
	background: #FFFFFF;
}
.vtabs a img, .vtabs span img {
	position: relative;
	top: 3px;
	cursor: pointer;
}
.vtabs-content {
	margin-left: 205px;
}
.accordion-heading {
	background: #EFEFEF;
	border: 1px solid #DDDDDD;
	padding: 8px;
	font-weight: bold;
	font-size: 13px;
	color: #555555;
	margin-bottom: 15px;
}
.accordion-heading a {
	float: right;
	margin-top: 1px;
	font-weight: normal;
	text-decoration: none;
}
.accordion-content {
	padding: 0px 0px 15px 0px;
	overflow: auto;
}
.scrollbox div {
	padding: 3px;
}
.scrollbox div input {
	margin: 0px;
	padding: 0px;
	margin-right: 3px;
}
.scrollbox div.even {
	background: #FFFFFF;
}
.scrollbox div.odd {
	background: #E4EEF7;
}
.overview {
	float: left;
	width: 49%;
	margin-bottom: 20px;
}
.overview table {
	width: 100%;
}
.overview td + td {
	text-align: right;
}
.statistic {
	float: right;
	width: 49%;
	margin-bottom: 20px;
}
.range {
	float: right;
	color: #FFF;
	vertical-align: middle;
}
.range {
	padding-top: 1px;
	padding-right: 1px;
}
.range, .range select {
	font-size: 11px;
}
.latest {
	clear: both;
}
.latest tbody td {
	background: #FFF;
}
</style>
<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product-tab" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-anylist-module">
      <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div><br /><br /><br />
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
          <br /><br /><br />
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" size="33" value="<?php echo $limit; ?>" id="input-limit" class="form-control" />

            </div>
          </div><br /><br /><br />
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
            <div class="col-sm-10">
              <select name="autoplay" id="input-autoplay" class="form-control">
                <?php if ($autoplay) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <br /><br />
            <table id="module" class="list">


          <?php $module_row = 0; ?>
          <?php
          foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td style="vertical-align: top" class="left col-md-4 col-sm-12">

              <div style="padding: 20px;!important">

				<?php echo $entry_titlelink ?> <input type="text" name="anylist_module[<?php echo $module_row; ?>][titlelink]" class="form-control" value="<?php echo $module['titlelink']; ?>" /><br/>&nbsp;<br/>
		          <?php foreach ($languages as $language) { ?>
		          <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name'] . " " . $entry_title; ?> <input type="text" class="form-control" name="anylist_module[<?php echo $module_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo (isset($module['title'][$language['language_id']]) ? $module['title'][$language['language_id']] : ''); ?>" /><br/>
		          <?php } ?>


				</td>
              <td style="vertical-align: top" class="left col-md-8 col-sm-12">
              <div style="padding: 20px;!important">
                    <br /><b><?php echo $entry_category; ?></b><br />
			    <div class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($categories as $category) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (isset($module['category']) and in_array($category['category_id'], $module['category'] )) { ?>
                    <input type="checkbox" name="anylist_module[<?php echo $module_row; ?>][category][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                    <?php echo $category['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="anylist_module[<?php echo $module_row; ?>][category][]" value="<?php echo $category['category_id']; ?>" />
                    <?php echo $category['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
                <br />&nbsp;<br /><b>
                <?php echo $entry_products; ?></b>:<br />
			    <div style="padding-bottom: 4px;"><?php echo $entry_product; ?> <input type="text" name="input-product" id="input-product"/><br/></div>


                <div id="product-product" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($products_list_sel as $products_list) { ?>
                    <div id="product-item<?php echo $products_list['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $products_list['name']; ?>
                      <input type="hidden" name="anylist_module[<?php echo $module_row; ?>][products_list][]" value="<?php echo $products_list['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>


			  <br />&nbsp;<br />
			  <b><?php echo $entry_latest_text; ?></b>: <input size="3" type="text" name="anylist_module[<?php echo $module_row; ?>][latest]" value="<?php echo (isset($module['latest'])) ? $module['latest'] : 0; ?>"/>
			  <br />&nbsp;<br />
			  <b><?php echo $entry_specials_text; ?></b>: <input size="3" type="text" name="anylist_module[<?php echo $module_row; ?>][specials]" value="<?php echo (isset($module['specials'])) ? $module['specials'] : 0; ?>"/>






			  <hr/>


					<?php if (isset($module['sortorder']) and $module['sortorder']=='desc') { ?>
						<input type="checkbox" name="anylist_module[<?php echo $module_row; ?>][sortorder]" value="desc" checked="checked"/> <?php echo $entry_sort_descending; ?>
					<?php } else { ?>
						<input type="checkbox" name="anylist_module[<?php echo $module_row; ?>][sortorder]" value="desc"/> <?php echo $entry_sort_descending; ?>
					<?php } ?>
			  	</div>
				</td>



            </tr>
          </tbody>

          <?php } ?>
          <tfoot>
            <!--<tr>
              <td colspan="9" class="right"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>-->
          </tfoot>
        </table>

        <?php if(!$modules) { ?>

        <input type="hidden" name="anylist_module[0][titlelink]" value="">
        <input type="hidden" name="anylist_module[0][title][1]" value="">
        <input type="hidden" name="anylist_module[0][title][2]" value="">
        <input type="hidden" name="anylist_module[0][cat_desc]" value="">
        <input type="hidden" name="anylist_module[0][products_list]" value="">
        <input type="hidden" name="anylist_module[0][latest]" value="0">
        <input type="hidden" name="anylist_module[0][specials]" value="0">
        <input type="hidden" name="anylist_module[0][sortorder]" value="asc">



        <?php } ?>






      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
                      $('#input-product').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#input-product').val('');
		$('#product-item' + item['value']).remove();
		$('#product-product').append('<div id="product-item' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="anylist_module[<?php echo $module_row; ?>][products_list][]" value="' + item['value'] + '" /></div>');
	}
});
$('#product-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});




//--></script>
<?php echo $footer; ?>
