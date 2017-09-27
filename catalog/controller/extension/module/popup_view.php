<?php
class ControllerExtensionModulePopupView extends Controller {
  public function index() {
    
    $data = array();

    $this->load->model('catalog/product');
    $this->load->language('extension/module/popup_view');

    $popup_view_data = (array)$this->config->get('popup_view_data');
    $data['popup_view_data'] = $popup_view_data;

    // popup_purchase start
    $data['popup_purchase_data'] = $this->config->get('popup_purchase_data');
    $data['text_one_click_buy'] = $this->language->get('text_one_click_buy');
    // popup_purchase end

    // oct_product_reviews start
    $this->load->language('extension/module/oct_product_reviews');

    $data['oct_product_reviews_data'] = $this->config->get('oct_product_reviews_data');

    $data['entry_positive_text'] = $this->language->get('entry_positive_text');
    $data['entry_negative_text'] = $this->language->get('entry_negative_text');
    $data['text_where_bought'] = $this->language->get('text_where_bought');
    $data['text_where_bought_yes'] = $this->language->get('text_where_bought_yes');
    $data['text_where_bought_no'] = $this->language->get('text_where_bought_no');
    // oct_product_reviews end

    if (isset($this->request->get['product_id'])) {
      $product_id = (int)$this->request->get['product_id'];
    } else {
      $product_id = 0;
    }

    $product_info = $this->model_catalog_product->getProduct($product_id);

    $data['product_id'] = $product_id;

    if ($product_info) {

      $data['heading_title'] = $this->language->get('heading_title');
      
      $data['button_view'] = $this->language->get('button_view');
      $data['text_select'] = $this->language->get('text_select');
      $data['text_manufacturer'] = $this->language->get('text_manufacturer');
      $data['text_model'] = $this->language->get('text_model');
      $data['text_reward'] = $this->language->get('text_reward');
      $data['text_points'] = $this->language->get('text_points');
      $data['text_stock'] = $this->language->get('text_stock');
      $data['text_discount'] = $this->language->get('text_discount');
      $data['text_tax'] = $this->language->get('text_tax');
      $data['text_option'] = $this->language->get('text_option');
      $data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
      $data['text_write'] = $this->language->get('text_write');
      $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
      $data['text_note'] = $this->language->get('text_note');
      $data['text_tags'] = $this->language->get('text_tags');
      $data['text_related'] = $this->language->get('text_related');
      $data['text_loading'] = $this->language->get('text_loading');
      $data['text_option_disable'] = $this->language->get('text_option_disable');

      $data['entry_qty'] = $this->language->get('entry_qty');
      $data['entry_name'] = $this->language->get('entry_name');
      $data['entry_review'] = $this->language->get('entry_review');
      $data['entry_rating'] = $this->language->get('entry_rating');
      $data['entry_good'] = $this->language->get('entry_good');
      $data['entry_bad'] = $this->language->get('entry_bad');

      $data['button_cart'] = $this->language->get('button_cart');
      $data['button_shopping'] = $this->language->get('button_shopping');
      $data['button_view'] = $this->language->get('button_view');
      $data['button_popup_view'] = $this->language->get('button_popup_view');
      $data['button_wishlist'] = $this->language->get('button_wishlist');
      $data['button_compare'] = $this->language->get('button_compare');
      $data['button_upload'] = $this->language->get('button_upload');
      $data['button_continue'] = $this->language->get('button_continue');
      $data['button_cart'] = $this->language->get('button_cart');
      $data['button_compare'] = $this->language->get('button_compare');
      $data['button_wishlist'] = $this->language->get('button_wishlist');

      $this->load->model('catalog/review');

      $data['tab_description'] = $this->language->get('tab_description');
      $data['tab_attribute'] = $this->language->get('tab_attribute');
      $data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

      $data['manufacturer'] = $product_info['manufacturer'];
      $data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
      $data['model'] = $product_info['model'];
      $data['reward'] = $product_info['reward'];
      $data['points'] = $product_info['points'];

      $data['view_product_link'] = $this->url->link('product/product', 'product_id=' . $product_info['product_id']);
      
      if ($product_info['quantity'] <= 0) {
        $data['stock_warning'] = $product_info['stock_status'];
      } else {
        $data['stock_warning'] = '';
      }

      if ($product_info['quantity'] <= 0) {
        $data['stock'] = $product_info['stock_status'];
      } elseif ($this->config->get('config_stock_display')) {
        $data['stock'] = $product_info['quantity'];
      } else {
        $data['stock'] = $this->language->get('text_instock');
      }

      $data['product_name'] = $product_info['name'];

      $this->load->model('tool/image');

      $image_width = ($popup_view_data['image_width']) ? $popup_view_data['image_width'] : '300';
      $image_height = ($popup_view_data['image_height']) ? $popup_view_data['image_height'] : '300';

      if ($product_info['image']) {
        $data['thumb'] = $this->model_tool_image->resize($product_info['image'], $image_width, $image_height);
      } else {
        $data['thumb'] = $this->model_tool_image->resize("placeholder.png", $image_width, $image_height);
      }

      $data['images'] = array();

      $results = $this->model_catalog_product->getProductImages($product_id);

      $image_additional_width = ($popup_view_data['image_additional_width']) ? $popup_view_data['image_additional_width'] : '59';
      $image_additional_height = ($popup_view_data['image_additional_height']) ? $popup_view_data['image_additional_height'] : '59';

      foreach ($results as $result) {
        $data['images'][] = array(
          'popup' => $this->model_tool_image->resize($result['image'], $image_width, $image_height),
          'thumb' => $this->model_tool_image->resize($result['image'], $image_additional_width, $image_additional_height)
        );
      }

      if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
        $data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
      } else {
        $data['price'] = false;
      }

      if ((float)$product_info['special']) {
        $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
      } else {
        $data['special'] = false;
      }

      if ($this->config->get('config_tax')) {
        $data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
      } else {
        $data['tax'] = false;
      }

      $data['points'] = $product_info['points'];

      $discounts = $this->model_catalog_product->getProductDiscounts($product_id);

      $data['discounts'] = array();

      foreach ($discounts as $discount) {
        $data['discounts'][] = array(
          'quantity' => $discount['quantity'],
          'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
        );
      }

      if ($popup_view_data['description_max']) {
        $data['description'] = strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8') , '<p><ul><li><b><strong><a><i><u><br></br><span>');
      } else {
        $data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
      }

      if ($product_info['minimum']) {
        $data['minimum'] = $product_info['minimum'];
      } else {
        $data['minimum'] = 1;
      }

      $data['options'] = array();

      foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
        $product_option_value_data = array();

        foreach ($option['product_option_value'] as $option_value) {
          if (!$option_value['subtract'] || ($option_value['quantity'] >= 0)) {
            if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
              $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
            } else {
              $price = false;
            }

            $product_option_value_data[] = array(
              'product_option_value_id' => $option_value['product_option_value_id'],
              'quantity_status'         => ($option_value['quantity'] <= 0) ? false : true,
              'option_value_id'         => $option_value['option_value_id'],
              'name'                    => $option_value['name'],
              'image'                   => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
              'price'                   => $price,
              'price_prefix'            => $option_value['price_prefix']
           );
          }
        }

        $data['options'][] = array(
          'product_option_id'    => $option['product_option_id'],
          'product_option_value' => $product_option_value_data,
          'option_id'            => $option['option_id'],
          'name'                 => $option['name'],
          'type'                 => $option['type'],
          'value'                => $option['value'],
          'required'             => $option['required']
        );
      }

      $data['review_status'] = $this->config->get('config_review_status');

      if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
        $data['review_guest'] = true;
      } else {
        $data['review_guest'] = false;
      }

      if ($this->customer->isLogged()) {
        $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
      } else {
        $data['customer_name'] = '';
      }

      $data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
      $data['rating'] = (int)$product_info['rating'];
      $data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

      $data['recurrings'] = $this->model_catalog_product->getProfiles($product_id);
      $data['tags'] = array();

      if ($product_info['tag']) {
        $tags = explode(',', $product_info['tag']);

        foreach ($tags as $tag) {
          $data['tags'][] = array(
            'tag'  => trim($tag),
            'href' => $this->url->link('product/search', 'tag=' . trim($tag))
          );
        }
      }

      $data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
      
      if ($this->config->get('config_google_captcha_status')) {
        $this->document->addScript('https://www.google.com/recaptcha/api.js');

        $data['site_key'] = $this->config->get('config_google_captcha_public');
      } else {
        $data['site_key'] = '';
      }

      if ($this->config->get('storeset_terms')) {
        $this->load->model('catalog/information');
          
        $information_info = $this->model_catalog_information->getInformation($this->config->get('storeset_terms'));
          
        if ($information_info) {
          $data['text_terms'] = sprintf($this->language->get('text_terms'), $this->url->link('information/information', 'information_id=' . $this->config->get('storeset_terms'), 'SSL'), $information_info['title'], $information_info['title']);
        } else {
          $data['text_terms'] = '';
        }
      } else {
        $data['text_terms'] = '';
      }

      $this->response->setOutput($this->load->view('extension/module/popup_view', $data));
    } else {
      die();
    }
  }

  public function update_prices() {
    $json = array();

    if (isset($this->request->request['product_id']) && isset($this->request->request['quantity'])) {
        
      $this->load->model('catalog/product');

      $product_id      = (int)$this->request->request['product_id'];
      $product_info    = (array)$this->model_catalog_product->getProduct($product_id);
      $option_price    = 0;
      $quantity        = (int)$this->request->request['quantity'];
      $product_options = (array)$this->model_catalog_product->getProductOptions($product_id);

      if (!empty($this->request->request['option'])) {
        $option = $this->request->request['option'];
      } else {
        $option = array();
      }

      foreach ($product_options as $product_option) {
        if (is_array($product_option['product_option_value'])) {
          foreach ($product_option['product_option_value'] as $option_value) {
            if(isset($option[$product_option['product_option_id']])) {
              if(($option[$product_option['product_option_id']] == $option_value['product_option_value_id']) || ((is_array($option[$product_option['product_option_id']])) && (in_array($option_value['product_option_value_id'], $option[$product_option['product_option_id']])))) {
                if ($option_value['price_prefix'] == '+') {  
                    $option_price += $option_value['price']; 
                } elseif ($option_value['price_prefix'] == '-') { 
                    $option_price -= $option_value['price']; 
                }
              }
            }
          }
        }
      }

      $json['special'] = $this->currency->format(($this->tax->calculate($this->get_price_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
      $json['price'] = $this->currency->format(($this->tax->calculate($this->get_price_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
      $json['tax']     = $this->currency->format(($this->get_price_discount($product_id, $quantity) + $option_price) * $quantity, $this->session->data['currency']);
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  public function get_price_discount($product_id, $quantity) {
    $this->load->model('catalog/product');

    $customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

    $product_info = (array)$this->model_catalog_product->getProduct($product_id);

    $price = $product_info['price'];

    $product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
    if ($product_discount_query->num_rows) {
        $price = $product_discount_query->row['price'];
    }

    $product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

    if ($product_special_query->num_rows) {
      $price = $product_special_query->row['price'];
    }       

    return $price;
  }

  public function write() {
    $this->load->language('product/product');

    $json = array();

    if ($this->request->server['REQUEST_METHOD'] == 'POST') {
      if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
        $json['error'] = $this->language->get('error_name');
      }

      if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
        $json['error'] = $this->language->get('error_text');
      }

      if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
        $json['error'] = $this->language->get('error_rating');
      }

      if ($this->config->get('storeset_terms')) {
        if (!isset($this->request->post['terms'])) {
          $this->load->model('catalog/information');
          $this->load->language('extension/module/popup_view');
          
          $information_info = $this->model_catalog_information->getInformation($this->config->get('storeset_terms'));

          $json['error'] = sprintf($this->language->get('error_terms'), $information_info['title']);
        }
      }

      if (!isset($json['error'])) {
        $this->load->model('catalog/review');

        $this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

        $json['success'] = $this->language->get('text_success');
      }
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}