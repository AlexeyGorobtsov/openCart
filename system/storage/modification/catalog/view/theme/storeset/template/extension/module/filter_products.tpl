<div class="box" id="ismobile">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content filtered">
    <form id="filter-products-form">
    <input type="hidden" name="category_id" value="<?php echo $category_id; ?>" />
    <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
    <input type="hidden" name="sort" value="" />
    <input type="hidden" name="order" value="" />
    <input type="hidden" name="limit" value="" />
    <input type="hidden" name="page" value="<?php echo $page; ?>" />
    <input type="hidden" name="path" value="<?php echo $path; ?>" />
    <a class="list-group-item price-name">
      <?php echo $text_prices; ?>
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
      <strong><?php echo $currency['symbol_left']; ?></strong>
      <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
      <strong><?php echo $currency['symbol_right']; ?></strong>
      <?php } ?>
      <?php } ?>
    </a>
    <div class="list-group-item price-item">
      <div class="slider"></div>
      <br/>
      <div class="row">
        <div class="col-xs-6"><input type="text" id="input_price_min" name="p_val[min]" value="<?php echo $price_min; ?>" class="form-control" /></div>
        <div class="col-xs-6"><input type="text" id="input_price_max" name="p_val[max]" value="<?php echo $price_max; ?>" class="form-control" /></div>
      </div>
    </div>
    <?php if (isset($products_data['options']) && $products_data['options']) { ?>
      <?php foreach ($products_data['options'] as $option) { ?>
      <div class="inner-box expanded">
        <div class="item-title">
          <a class="list-group-item item-name"><span class="name"><?php echo $option['name']; ?></span><span class="link"><i class="fa fa-minus"></i></span></a>
        </div>
        <div class="list-group-item item-content">
        <?php if ($option['type'] == 'select') { ?>
            <select name="o_val[<?php echo $option['option_id']?>]" class="form-control">
              <option value=""><?php echo $text_select_value; ?></option>
              <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <option id="o_val_<?php echo $product_option_value['option_value_id']?>" value="<?php echo $product_option_value['option_value_id'] ?>"><?php echo $product_option_value['name']; ?></option>
              <?php }?>
            </select>
          <?php } elseif ($option['type'] == 'checkbox') {?>
            <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <div class="checkbox">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                     type="checkbox" name="o_val[<?php echo $option['option_id']?>][]"
                     value="<?php echo $product_option_value['option_value_id']?>" />
                  <?php echo $product_option_value['name']; ?>
                </label>
              </div>
            <?php } ?>
          <?php } elseif ($option['type'] == 'radio') {?>
            <?php foreach ($option['product_option_value'] as $product_option_value) { ?>
              <!-- <div class="radio">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                   type="radio" name="o_val[<?php echo $option['option_id']?>]"
                   value="<?php echo $product_option_value['option_value_id']?>" />
                  <?php echo $product_option_value['name']; ?>
                </label>
              </div> -->
              <?php if ($product_option_value['image']) { ?>
              <div class="checkbox-image">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                  type="checkbox" style="display:none;" name="o_val[<?php echo $option['option_id']?>][]"
                  value="<?php echo $product_option_value['option_value_id']?>" />
                  <img src="<?php echo $product_option_value['image']?>" alt="<?php echo $product_option_value['name']; ?>" title="<?php echo $product_option_value['name']; ?>" class="select-image" />
                </label>
              </div>
              <?php } else { ?>
              <div class="checkbox">
                <label>
                  <input id="o_val_<?php echo $product_option_value['option_value_id']?>"
                     type="checkbox" name="o_val[<?php echo $option['option_id']?>][]"
                     value="<?php echo $product_option_value['option_value_id']?>" />
                  <?php echo $product_option_value['name']; ?>
                </label>
              </div>
              <?php } ?>
            <?php } ?>
          <?php } ?>
        </div>
        </div>
      <?php } ?>
    <?php } ?>
    <?php if (isset($products_data['attributes']) && $products_data['attributes']) { ?>
      <?php foreach($products_data['attributes'] as $attribute_group_id => $attribute) { ?>
        <?php foreach($attribute['product_attribute_data'] as $attribute_value_id => $attribute_value) { ?>
        <div class="inner-box expanded">
        <div class="item-title">
          <a class="list-group-item item-name"><span class="name"><?php echo $attribute_value['name']; ?></span><span class="link"><i class="fa fa-minus"></i></span></a>
        </div>
          <div class="list-group-item item-content">
            <?php if ($filter_products_data['attribute_show_type'] == 'select') { ?>
              <select name="a_val[<?php echo $attribute_value_id; ?>]" class="form-control">
                <option value=""><?php echo $text_select_value; ?></option>
                <?php asort($attribute_value['attr_values']); foreach($attribute_value['attr_values'] as $value) { ?>
                <option id="a_val_<?php echo md5($attribute_value_id.':'.$value); ?>" value="<?php echo $value ?>"><?php echo $value; ?></option>
                <?php }?>
              </select>
            <?php } elseif ($filter_products_data['attribute_show_type'] == 'checkbox') {?>
              <?php asort($attribute_value['attr_values']); foreach($attribute_value['attr_values'] as $value) { ?>
                <div class="checkbox">
                  <label>
                    <input id="a_val_<?php echo md5($attribute_value_id.':'.$value); ?>" type="checkbox" name="a_val[<?php echo $attribute_value_id; ?>][]" value="<?php echo $value ?>" />
                    <?php echo $value; ?>
                  </label>
                </div>
              <?php } ?>
            <?php } elseif ($filter_products_data['attribute_show_type'] == 'radio') {?>
              <?php asort($attribute_value['attr_values']); foreach($attribute_value['attr_values'] as $value) { ?>
                <div class="radio">
                  <label>
                    <input id="a_val_<?php echo md5($attribute_value_id.':'.$value); ?>" type="radio" name="a_val[<?php echo $attribute_value_id; ?>]" value="<?php echo $value ?>" />
                    <?php echo $value; ?>
                  </label>
                </div>
              <?php } ?>
            <?php } ?>
          </div>
          </div>
        <?php } ?>
      <?php } ?>
    <?php } ?>
    <?php if (isset($products_data['manufacturers']) && $products_data['manufacturers']) { ?>
    <div class="inner-box expanded manufacturers-filter">
      <div class="item-title">
          <a class="list-group-item item-name"><span class="name"><?php echo $text_manufacturer; ?></span><span class="link"><i class="fa fa-minus"></i></span></a>
        </div>
      <div class="list-group-item item-content">
        <?php if ($filter_products_data['manufacturer_show_type'] == 'select') { ?>
          <select name="m_val" class="form-control">
            <option value=""><?php echo $text_select_value; ?></option>
            <?php foreach($products_data['manufacturers'] as $manufacturer) { ?>
            <option id="m_val_<?php echo $manufacturer['manufacturer_id']?>" value="<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']; ?></option>
            <?php } ?>
          </select>
        <?php } elseif ($filter_products_data['manufacturer_show_type'] == 'checkbox') {?>
          <?php foreach($products_data['manufacturers'] as $manufacturer) { ?>
            <div class="checkbox">
              <label>
                <input id="m_val_<?php echo $manufacturer['manufacturer_id']?>" type="checkbox" name="m_val[]" value="<?php echo $manufacturer['manufacturer_id']?>" />
                <?php echo $manufacturer['name']; ?>
              </label>
            </div>
          <?php } ?>
        <?php } elseif ($filter_products_data['manufacturer_show_type'] == 'radio') {?>
          <?php foreach($products_data['manufacturers'] as $manufacturer) { ?>
            <div class="radio">
              <label>
                <input id="m_val_<?php echo $manufacturer['manufacturer_id']?>" type="radio" name="m_val" value="<?php echo $manufacturer['manufacturer_id']?>" />
                <?php echo $manufacturer['name']; ?>
              </label>
            </div>
          <?php } ?>
        <?php } ?>
      </div>
      </div>
    <?php } ?>
    <div id="selected-filters"></div>
    </form>
    <?php if ($filter_products_data['update_results_type']) { ?>
    <div class="list-group-item item-content" style="border:0;">
      <button type="button" id="button-filter" class="btn button"><?php echo $button_filter; ?></button>
    </div>
  <?php } ?>
  </div>
</div>
<?php if ($filter_products_data['update_mask']) { ?>
<style type="text/css">
.masked {
  position: absolute;
  z-index: 10000;
  width: 100%;
  height: 100%;
  background: #eee;
  opacity: 0.4;
  left: 0;
  top: 0;
}
.masked_loading {
  background: url(catalog/view/javascript/filter_products/ring-alt.svg) no-repeat center center;
  width: 100%;
  height: 100%;
  position: absolute;
  z-index: 10001;
  top: 0;
  left: 0;
}
#res-products {
  position: relative;
}
.selected-filters-label {
  padding-left: 0 !important;
}
</style>
<?php } ?>
<script type="text/javascript"><!--
$(function(){
  if ((navigator.userAgent.match(/iPad/i) <= 0)) {
    $('body').prepend('<div id="filter-mobile"></div>');
    $('.mobile-category-header').prepend('<div id="filter-button" class="button"><i class="fa fa-search"></i> <?php echo $heading_title; ?></div>');
    $('.box-heading').prepend('<div id="filter-close"><i class="fa fa-times"></i></div>');
    var portraitWidth = $(window).width();
      if (portraitWidth <= '768'){
        $("#ismobile") .appendTo("#filter-mobile");
      }
      $("#filter-button").click(function() {
      $("#filter-mobile").toggleClass("filter-show");
      return false;
    });
    $("#filter-close").click(function() {
      $("#filter-mobile").removeClass("filter-show");
      return false;
    });
  }
  $(document).on('click', '#filter-products-form a.list-group-item .link', function(e) {
    $(this).parent().parent().parent().toggleClass( "expanded" );
    $(this).find("i").toggleClass("fa-minus").addClass("fa-plus");
  });
  $(document).on('click', '#filter-products-form a.list-group-item .name', function(e) {
    $(this).parent().parent().parent().toggleClass( "expanded" );
    $(this).next().find("i").toggleClass("fa-minus").addClass("fa-plus");
  });
  $('.pagination li a').on('click', function() {
    var get_link = $(this).attr('href');
    var get_page = get_link.match(/page=(\d+)/);
    $('input[name=page]').val(get_page[1]);
    filtering();
    scroll_to_products();
    return false;
  });
  $(".select-image").click(function() {
    $(this).toggleClass('highlight');
  });
  if ($('#input-sort').length) {
    $('#input-sort').get(0).onchange = null;
    $('#input-sort').on('change', function() {
      var get_query = $(this).val().split('&');
      $('input[name=sort]').val(get_query[0]);
      $('input[name=order]').val(get_query[1]);
      filtering();
    });
    $('#input-sort option').each(function() {
      var get_value = $(this).val();
      var get_value_sort = url_value(get_value, 'sort');
      if (get_value_sort == 'rating') {
        $(this).remove();
      } else {
        $(this).val(get_value_sort + '&' + url_value(get_value, 'order'));
      }
    });
  }
  if ($('#input-limit').length) {
    $('#input-limit').get(0).onchange = null;
    $('#input-limit').on('change', function() {
      $('input[name=limit]').val($(this).val());
      filtering();
    });
    $('#input-limit option').each(function() {
      $(this).val(url_value($(this).val(), 'limit'));
    });
  }
  if ($('#input-sort').length) {
    if ($('input[name=sort]').val()) {
      $('#input-sort').val($('input[name=sort]').val() + '&' + $('input[name=order]').val());
    } else {
      var get_query = $('#input-sort').val().split('&');
      $('input[name=sort]').val(get_query[0]);
      $('input[name=order]').val(get_query[1]);
    }
  }
  if ($('input[name=limit]').length) {
    if ($('input[name=limit]').val()) {
      $('#input-limit').val($('input[name=limit]').val());
    } else {
      $('input[name=limit]').val($('#input-limit').val());
    }
  }
  <?php if ($price_min || $price_max || $m_vals || $o_vals || $a_vals) { ?>
    $('#input_price_min').val('<?php echo $price_min; ?>');
    $('#input_price_max').val('<?php echo $price_max; ?>');
    <?php if ($o_vals) { ?>
    <?php foreach ($o_vals as $o_val) { ?>
    if ($($('#o_val_<?php echo $o_val; ?>')).prop("tagName") == 'INPUT') {
      $('#o_val_<?php echo $o_val; ?>').attr('checked', true);
      $('#o_val_<?php echo $o_val; ?>').parent().find('img').addClass('highlight');
    } else if ($($('#o_val_<?php echo $o_val; ?>')).prop("tagName") == 'OPTION') {
      $('#o_val_<?php echo $o_val; ?>').attr('selected', true);
    }
    <?php } ?>
    <?php } ?>
    <?php if ($a_vals) { ?>
    <?php foreach ($a_vals as $a_val) { ?>
    if ($($('#a_val_<?php echo $a_val; ?>')).prop("tagName") == 'INPUT') {
      $('#a_val_<?php echo $a_val; ?>').attr('checked', true);
    } else if ($($('#a_val_<?php echo $a_val; ?>')).prop("tagName") == 'OPTION') {
      $('#a_val_<?php echo $a_val; ?>').attr('selected', true);
    }
    <?php } ?>
    <?php } ?>
    <?php if ($m_vals) { ?>
    <?php foreach ($m_vals as $m_val) { ?>
    $('#m_val_<?php echo $m_val; ?>').attr('checked', true);
    <?php } ?>
    <?php } ?>
  <?php } ?>
  <?php if ($auto_load) { ?>
  filtering();
  <?php } ?>
});
function uncheck_option(id) {
  if ($($('#o_val_'+id)).prop("tagName") == 'INPUT') {
    $('#o_val_'+id).attr('checked', false);
    $('#o_val_'+id).parent().find('img').removeClass('highlight');
  } else if ($($('#o_val_'+id)).prop("tagName") == 'OPTION') {
    $('#o_val_'+id).attr('selected', false);
  }
  filtering();
}
function uncheck_attribute(id) {
  if ($($('#a_val_'+id)).prop("tagName") == 'INPUT') {
    $('#a_val_'+id).attr('checked', false);
  } else if ($($('#a_val_'+id)).prop("tagName") == 'OPTION') {
    $('#a_val_'+id).attr('selected', false);
  }
  filtering();
}
function uncheck_manufacturer(id) {
  $('#m_val_'+id).attr('checked', false);
  filtering();
}
function url_value(value, query) {
  var result = '',
      part = String(value).split('?');
  if (part[1]) {
    var sub_part = part[1].split('&');
    for (var n = 0; n <= (sub_part.length); n++) {
      if (sub_part[n]) {
        var sub_part_val = sub_part[n].split('=');
        if (sub_part_val[0] && sub_part_val[0] == query) {
          result = sub_part_val[1]
        }
      }
    }
  }
  return result;
}
$('.slider').slider({
  min: <?php echo $products_data['prices']['price_min']; ?>,
  max: <?php echo $products_data['prices']['price_max']; ?>,
  range: true,
  values: [<?php echo $price_min; ?>, <?php echo $price_max; ?>],
  rest: 'label'
// }).slider('pips', {
//   rest: false
}).on("slidechange", function(e, ui) {
  $('#input_price_min').val(ui['values'][0]);
  $('#input_price_max').val(ui['values'][1]);
  filtering();
});
//--></script>
<script type="text/javascript"><!--
$(document).on('click', '#button-reset', function() {
  $('#filter-products-form input[type=\'radio\']').removeAttr('checked');
  $('#filter-products-form input[type=\'checkbox\']').removeAttr('checked');
  $('#filter-products-form select').val('');
  $('.highlight').removeClass('highlight');
  $slider = $(".slider");
  $slider.slider("values", [<?php echo $products_data['prices']['price_min']; ?>,<?php echo $products_data['prices']['price_max']; ?>]);
  $('#input_price_min').val(<?php echo $products_data['prices']['price_min']; ?>);
  $('#input_price_max').val(<?php echo $products_data['prices']['price_max']; ?>);
  filtering();
});
<?php if ($filter_products_data['update_results_type']) { ?>
$('#button-filter').on('click', function() {
  filtering();
});
<?php } else { ?>
$(document).on('change', '#filter-products-form input[type=\'text\'], #filter-products-form input[type=\'radio\'], #filter-products-form input[type=\'checkbox\'], #filter-products-form select', function() {
  filtering();
});
<?php } ?>
function filtering() {
  <?php if ($filter_products_data['update_mask']) { ?>
  masked('#filter-products-form', true);
  masked('#res-products', true);
  <?php } ?>
  $.ajax({
    type: 'post',
    <?php if ($page_type == 'category') { ?>
    url: 'index.php?route=extension/module/filter_products/getProductsByCategory',
    <?php } elseif ($page_type == 'manufacturer') { ?>
    url: 'index.php?route=extension/module/filter_products/getProductsByManufacturer',
    <?php } ?>
    dataType: 'json',
    data: $('#filter-products-form input[type=\'hidden\'], #filter-products-form input[type=\'text\'], #filter-products-form input[type=\'radio\']:checked, #filter-products-form input[type=\'checkbox\']:checked, #filter-products-form select'),
    success: function(json) {
      selected_filters = '<div class="inner-box expanded">';
        selected_filters += '<div class="item-title">';
          selected_filters += '<a class="list-group-item item-name"><span class="name">'+json['text_selected_filters']+'</span><span class="link"><i class="fa fa-minus"></i></span></a>';
        selected_filters += '</div>';
        selected_filters += '<div class="list-group-item item-content">';
        if (json['selected_options']) {
          $.each(json['selected_options'], function(i,value) {
            selected_filters += '<div class="checkbox"><b>'+value['name']+':</b></div>';
            if (value['option_values']) {
              $.each(value['option_values'], function(b,sub_value) {
                selected_filters += '<div class="checkbox">';
                  selected_filters += '<label class="selected-filters-label" onclick="uncheck_option('+sub_value['option_value_id']+');"><i class="fa fa-times-circle"></i> ' + sub_value['name'] + '</label>';
                selected_filters += '</div>';
              });
            }
          });
        }
        if (json['selected_attributes']) {
          $.each(json['selected_attributes'], function(i,value) {
            selected_filters += '<div class="checkbox"><b>'+value['name']+':</b></div>';
            if (value['attribute_values']) {
              $.each(value['attribute_values'], function(b,sub_value) {
                selected_filters += '<div class="checkbox">';
                  selected_filters += '<label class="selected-filters-label" onclick="uncheck_attribute(\''+sub_value['attribute_value']+'\');"><i class="fa fa-times-circle"></i> ' + sub_value['name'] + '</label>';
                selected_filters += '</div>';
              });
            }
          });
        }
        if (json['selected_manufacturers']) {
          $.each(json['selected_manufacturers'], function(i,value) {
            selected_filters += '<div class="checkbox"><b>'+value['name']+':</b></div>';
            if (value['manufacturer_values']) {
              $.each(value['manufacturer_values'], function(b,sub_value) {
                selected_filters += '<div class="checkbox">';
                  selected_filters += '<label class="selected-filters-label" onclick="uncheck_manufacturer('+sub_value['manufacturer_id']+');"><i class="fa fa-times-circle"></i> ' + sub_value['name'] + '</label>';
                selected_filters += '</div>';
              });
            }
          });
        }
        selected_filters += '<div><button type="button" id="button-reset" class="btn button"><?php echo $button_reset; ?></button></div>';
        selected_filters += '</div>';
      selected_filters += '</div>';
      $('#selected-filters').html(selected_filters);
      if (!json['selected_options_empty'] && !json['selected_attributes_empty'] && !json['selected_manufacturers_empty']) {
        $('#selected-filters').hide();
      } else {
        $('#selected-filters').show();
      }
      if (json['go_back']) {
        $('input[name=page]').val(1);
        window.location.href = json['go_back'];
      }
      if (json['products']) {
        product = '<div class="product-grid row">';
        if (json['empty']) {
          product += '<div class="col-sm-12"><p>'+json['empty']+'</p></div>';
        }
        $.each(json['products'], function(i,value) {
        product += '<div class="cols">';
          product += '<div class="product">';
            if (value['product_stickers']) {
              product += '<div class="sticker-box-cat">';
                $.each(value['product_stickers'], function(i,product_sticker) {
                  product += '<span class="stickers-cat" style="color: '+product_sticker['color']+'; background: '+product_sticker['background']+';">'+product_sticker['text']+'</span>';
                });
              product += '</div>';
            }
            if (value['economy']) {
              product += '<div class="sticker">-'+value['economy']+'%</div>';
            }
            if (value['thumb']) {
              product += '<div class="image">';
                product += '<a href="'+value['href']+'"><img src="'+value['thumb']+'" title="'+value['name']+'" alt="'+value['name']+'" /></a>';
                if (value['dop_img']) {
                  product += '<a class="hover-image" href="'+value['href']+'"><img src="'+value['dop_img']+'" title="'+value['name']+'" alt="'+value['name']+'" /></a>';
                }
                if (json['popup_view_status'] && value['quantity'] > 0) {
                  product += '<a href="javascript:void(0);" class="popup_view_button" onclick="get_popup_view('+value['product_id']+');">'+json['button_popup_view']+'</a>';
                }
              product += '</div>';
            }
            product += '<div class="product-about">';
              product += '<div class="name"><a href="'+value['href']+'">'+value['name']+'</a></div>';
              product += '<div class="description">'+value['description']+'</div>';
              if (value['price']) {
                product += '<div class="price">';
                if (!value['special']) {
                  product += value['price'];
                } else {
                  product += '<span class="price-old">'+value['price']+'</span> <span class="price-new">'+value['special']+'</span>';
                }
                product += '</div>';
              }
              if (value['oct_options'].length > 0) {
                product += '<div class="cat-options">';
                  $.each(value['oct_options'], function(io,option) {
                    if (option['type'] == 'radio') {
                      product += '<div class="form-group">';
                        product += '<label class="control-label">'+option['name']+':&nbsp;</label>';
                        if (option['product_option_value']) {
                          $.each(option['product_option_value'], function(pov,povalue) {
                            if (povalue['image']) {
                              product += '<div class="radio">';
                                product += '<label>';
                                  product += '<img src="'+povalue['image']+'" alt="'+povalue['name']+'" class="img-responsive" title="'+povalue['name']+'" />';
                                product += '</label>';
                              product += '</div>';
                            } else {
                              product += '<div class="radio">';
                                product += '<label>'+povalue['name']+'</label>';
                              product += '</div>';
                            }
                          });
                        }
                      product += '</div>';
                    } else {
                      product += '<div class="form-group size-box">';
                        product += '<label class="control-label">'+option['name']+':&nbsp;</label>';
                        if (option['product_option_value']) {
                          $.each(option['product_option_value'], function(pov,povalue) {
                            product += '<div class="radio">';
                              product += '<label>'+povalue['name']+'</label>';
                            product += '</div>';
                          });
                        }
                      product += '</div>';
                    }
                  });
                product += '</div>';
              }
              product += '<div class="product-buttons">';
                if (value['rating']) {
                  product += '<div class="rating">';
                  $.each(["1","2","3","4","5",], function(index,element) {
                    if (value['rating'] < element) {
                      product += '<span><i class="fa fa-star-o stars-rev"></i></span>';
                    } else {
                      product += '<span><i class="fa fa-star stars-rev"></i></span>';
                    }
                  });
                  product += '</div>';
                }
                
				if(value['quantity'] > 0) {
				  product += '<a class="cart" onclick="addToCart('+value['product_id']+');"><i class="fa fa-shopping-cart" aria-hidden="true"></i>'+json['button_cart']+'</a>';  
				} else {
					if (value['product_preorder_status'] == 1) {
						product += '<a class="cart" href="javascript: void(0);" onclick="get_oct_product_preorder('+value['product_id']+'); return false;">'+value['product_preorder_text']+'</a>';  
					} else {
						product += '<a class="cart" href="javascript: void(0);">'+value['product_preorder_text']+'</a>';  
					}
				}
			
                product += '<div class="additional">';
                  product += '<a class="wishlist" onclick="addToWishList('+value['product_id']+');"><i class="fa fa-heart-o" aria-hidden="true"></i></a>';
                  product += '<a class="compare" onclick="addToCompare('+value['product_id']+');"><i class="fa fa-exchange" aria-hidden="true"></i></a>';
                product += '</div>';
              product += '</div>';
            product += '</div>';
          product += '</div>';
        product += '</div>';
        });
        product += '<div class="pagination">'+json['pagination']+'</div>';
        product += '</div>';
        $('#res-products').html(product);
        <?php if ($filter_products_data['update_mask']) { ?>
        masked('#filter-products-form', false);
        masked('#res-products', false);
        <?php } ?>
        if ($(window).width() <= '767') {
          $("html, body").delay(400).animate({ scrollTop: $('#res-products').offset().top-140}, 700);
     }
        var cols = $('#column-right, #column-left').length;
        if (cols == 2) {
          $('#content .product-grid .cols').attr('class', 'col-lg-6 col-md-6 col-sm-6 col-xs-6');
        } else if (cols == 1) {
          $('#content .product-grid .cols').attr('class', 'col-lg-4 col-md-4 col-sm-6 col-xs-6');
        } else {
          $('#content .product-grid .cols').attr('class', 'col-lg-3 col-md-3 col-sm-6 col-xs-6');
        }
        var cols1 = $('#column-right, #column-left').length;
        if (cols1 == 2) {
          $('#content .product-grid > div:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
        } else if (cols1 == 1) {
          $('#content .product-grid > div:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
        } else {
          $('#content .product-grid > div:nth-child(4n+4)').after('<div class="clearfix"></div>');
        }
        // tooltips on hover
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
        $('.pagination li a').on('click', function () {
          var get_link = $(this).attr('href');
          var get_page = get_link.match(/page=(\d+)/);
          $('input[name=page]').val(get_page[1]);
          filtering();
          scroll_to_products();
          return false;
        });
        history.pushState({}, json['heading_title'], json['url']);
      }
    }
  });
}
function scroll_to_products() {
  $("html, body").animate({
    scrollTop: $('#content').offset().top + "px"
  }, {
    duration: 900,
    easing: "swing"
  });
}
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}
//--></script>
