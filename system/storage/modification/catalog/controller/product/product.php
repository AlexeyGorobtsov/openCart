<?php
class ControllerProductProduct extends Controller {
	private $error = array();

       
        public function update_prices() {
          if (isset($this->request->request['product_id']) && isset($this->request->request['quantity'])) {
            $this->load->model('catalog/product');

            $option_price    = 0;
            $product_id      = (int)$this->request->request['product_id'];
            $quantity        = (int)$this->request->request['quantity'];
            $product_info    = $this->model_catalog_product->getProduct($product_id);
            $product_options = $this->model_catalog_product->getProductOptions($product_id);

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

            $json = array();

            $json['special'] = $this->currency->format(($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

            $json['price'] = $this->currency->format(($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($option_price * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

            if ($json['special']) {
              $economy = round(((($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) - ($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity))/(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + 0.01))*100, 0);

             //$saver = round(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) - ($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity));                 $saver = round(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) - ($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity));
                  
          $saver = round(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'))) - ($this->tax->calculate($this->update_discount($product_id, $quantity), $product_info['tax_class_id'], $this->config->get('config_tax'))));                  $json['you_save'] = $this->currency->format($json['price'] - $json['special'], $this->session->data['currency']) . ' (-'.$economy.'%)';
            
              //$json['you_save'] = $this->currency->format($json['price'] - $json['special'], $this->session->data['currency']) . ' (-'.$economy.'%)';   
                  
                $json['you_save'] = $this->currency->format(($this->tax->calculate($saver, $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity) + $this->tax->calculate($quantity * $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']) . ' (-'.$economy.'%)';
            } else {
              $json['you_save'] = false;
            }
            
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
          }
        }

        public function update_discount($product_id, $quantity) {
          $this->load->model('catalog/product');

          $product_info = (array)$this->model_catalog_product->getProduct($product_id);

          $customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

          $price = $product_info['price'];

          // discount
          $product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
          if ($product_discount_query->num_rows) {
            $price = $product_discount_query->row['price'];
          }

          // special price
          $product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

          if ($product_special_query->num_rows) {
            $price = $product_special_query->row['price'];
          }       

          return $price;
        }

        public function getPImages() {
          $json = array();
          
          $this->load->model('catalog/product');
          $this->load->model('tool/image');

          if (isset($this->request->get['product_id'])) {
            $product_id = $this->request->get['product_id'];
          } else {
            $product_id = 0;
          }

          $product_info = $this->model_catalog_product->getProduct($product_id);
                
          if (isset($this->request->post['option'])) {
            $opt_array = array();

            foreach ($this->request->post['option'] as $value) {
              if (is_array($value)) {
                foreach ($value as $val) {
                  $opt_array[] = $this->model_catalog_product->getProductOptionValueId($this->request->get['product_id'], $val);
                }
              } else {
                $opt_array[] = $this->model_catalog_product->getProductOptionValueId($this->request->get['product_id'], $value);
              }
            }

            $results = $this->model_catalog_product->getProductImagesByOptionValueId($this->request->get['product_id'], $opt_array);

            foreach ($results as $result) {
              $json['images'][] = array(
                'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
                'main_img'   => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
                'main_popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
              );
            }
          } else {
            $results = false;
          }

          if (!$results) {
            $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

            $json['images'][] = array(
              'popup' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
              'thumb' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
              'main_img'   => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
              'main_popup' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
            );

            foreach ($results as $result) {
              $json['images'][] = array(
                'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
                'main_img'   => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
                'main_popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
              );
            }
          }
              
          $this->response->addHeader('Content-Type: application/json');
          $this->response->setOutput(json_encode($json));
        }
     
	public function index() {
        
        // oct_product_reviews start
        $this->load->language('extension/module/oct_product_reviews');

        $data['oct_product_reviews_data'] = $this->config->get('oct_product_reviews_data');

        $data['entry_positive_text'] = $this->language->get('entry_positive_text');
        $data['entry_negative_text'] = $this->language->get('entry_negative_text');
        $data['text_where_bought'] = $this->language->get('text_where_bought');
        $data['text_where_bought_yes'] = $this->language->get('text_where_bought_yes');
        $data['text_where_bought_no'] = $this->language->get('text_where_bought_no');
        // oct_product_reviews end
      
        // popup_found_cheaper start
        $data['popup_found_cheaper_data'] = $this->config->get('popup_found_cheaper_data');
        // popup_found_cheaper end
      
		$this->load->language('product/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			if ($product_info['meta_title']) {
				$this->document->setTitle($product_info['meta_title']);
			} else {
				$this->document->setTitle($product_info['name']);
			}

			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			if ($product_info['meta_h1']) {
				$data['heading_title'] = $product_info['meta_h1'];
			} else {
				$data['heading_title'] = $product_info['name'];
			}

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
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
        
        $product_stickers_data = $this->config->get('product_stickers_data');
        $data['product_stickers'] = array();

        if (isset($product_stickers_data['status']) && $product_stickers_data['status']) {
          $this->load->model('catalog/product_stickers');

          if (isset($product_info['product_stickers']) && $product_info['product_stickers']) {
            $stickers = unserialize($product_info['product_stickers']);
          } else {
            $stickers = array();
          }

          foreach ($stickers as $product_sticker_id) {
            $sticker_info = $this->model_catalog_product_stickers->getProductSticker($product_sticker_id);
            
            if ($sticker_info) {
              $data['product_stickers'][] = array(
                'text' => $sticker_info['text'],
                'color' => $sticker_info['color'],
                'background' => $sticker_info['background']
              );
            }
          }

          $sticker_sort_order = array();

          foreach ($stickers as $key => $product_sticker_id) {
            $sticker_info = $this->model_catalog_product_stickers->getProductSticker($product_sticker_id);
            
            if ($sticker_info) {
              $sticker_sort_order[$key] = $sticker_info['sort_order'];
            }
          }
          
          array_multisort($sticker_sort_order, SORT_ASC, $data['product_stickers']);
        }
      
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

        
        $product_tabs_data = $this->config->get('product_tabs_data');
        $data['product_extra_tabs'] = array();

        if (isset($product_tabs_data['status']) && $product_tabs_data['status']) {
          $this->load->model('catalog/product_tabs');

          $product_extra_tabs = $this->model_catalog_product_tabs->getProductTabs($product_id);

          if ($product_extra_tabs) {            
            foreach ($product_extra_tabs as $extra_tab) {
              $data['product_extra_tabs'][] = array(
                'title' => $extra_tab['title'],
                'text'  => html_entity_decode($extra_tab['text'], ENT_QUOTES, 'UTF-8')
              );
            }
          }
        }
      
			
				$data['disable_buy'] = 0;
				
				$oct_product_preorder_text = $this->config->get('oct_product_preorder_text');
				$oct_product_preorder_data = $this->config->get('oct_product_preorder_data');
				$oct_product_stock_checkout = $this->config->get('config_stock_checkout');

				if (isset($oct_product_preorder_data['status']) && $oct_product_preorder_data['status'] && isset($oct_product_preorder_data['stock_statuses']) && isset($product_info['oct_stock_status_id']) && in_array($product_info['oct_stock_status_id'], $oct_product_preorder_data['stock_statuses'])) {
					if ($product_info['quantity'] <= 0) {
						$data['stock'] = $this->language->get('text_outstock');
						$data['stockbutton'] = $oct_product_preorder_text[$this->session->data['language']]['call_button'];
						if ($oct_product_stock_checkout == 0) {
							$data['disable_buy'] = 1;
						}
					} elseif ($this->config->get('config_stock_display')) {
						$data['stock'] = $product_info['quantity'];
					} elseif ($product_info['quantity'] >= 1 && $product_info['quantity'] <= 3) {
						$data['stock'] = $this->language->get('text_minstock');
					} else {
						$data['stock'] = $this->language->get('text_instock');
					}
				} else {
					if ($product_info['quantity'] <= 0) {
						$data['stock'] = $product_info['stock_status'];
						$data['stockbutton'] = $product_info['stock_status'];
						if ($oct_product_stock_checkout == 0) {
							$data['disable_buy'] = 2;
						}
					} elseif ($this->config->get('config_stock_display')) {
						$data['stock'] = $product_info['quantity'];
						$data['stockbutton'] = $product_info['quantity'];
					} else {
						$data['stock'] = $this->language->get('text_instock');
						$data['stockbutton'] = $this->language->get('text_instock');
					}
				}
			

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
				$this->document->setOgImage($data['thumb']);
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			        
        // images_by_options start
        $data['images_by_options_data'] = $this->config->get('images_by_options_data');
        $images_by_options_data = $this->config->get('images_by_options_data');
        if (isset($images_by_options_data['status']) && $images_by_options_data['status']) {
          $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

          $data['images'][] = array(
            'popup' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
            'thumb' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
            'main_img'   => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
            'main_popup' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
          );

          foreach ($results as $result) {
            $data['images'][] = array(
              'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
              'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
              'main_img'   => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
              'main_popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
            );
          }
        } else {
          $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
          
          $data['images'][] = array(
            'popup' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
            'thumb' => $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
          );

          foreach ($results as $result) {
            $data['images'][] = array(
              'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
              'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
            );
          }
        }
        // images_by_options end
      
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					        
        // images_by_options start
        if (!$option_value['subtract'] || ($option_value['quantity'] >= 0)) {
          // if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
        // images_by_options end
      
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
        
        // images_by_options start
        'quantity_status'         => ($option_value['quantity'] <= 0) ? false : true, //add
        // images_by_options end
      
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

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
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

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			       
        $results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
      
        $product_auto_related_data = $this->config->get('product_auto_related_data');  
      
        if (isset($product_auto_related_data) && $product_auto_related_data['status'] != 0) {
          // $results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
          // product_auto_related start
          $product_auto_related_data = $this->config->get('product_auto_related_data');

        
          $this->load->model('extension/module/product_auto_related');

          $data_info = array(
            'product_id'          => $this->request->get['product_id'],
            'sort'                => 'p.product_id',
            'filter_category_id'  => (isset($category_id)) ? $category_id : 0,
            'filter_sub_category' => 1,
            'order'               => 'DESC',
            'start'               => 0,
            'limit'               => $product_auto_related_data['limit']
          );

          $results += $this->model_extension_module_product_auto_related->getProductAutoRelated($data_info);
        }
        // product_auto_related end
      

			foreach ($results as $result) {
        
        if (isset($product_auto_related_data['status']) && $product_auto_related_data['status']) {
          if ($result['image']) {
            $image_auto_related = $this->model_tool_image->resize($result['image'], $product_auto_related_data['width'], $product_auto_related_data['height']);
          } else {
            $image_auto_related = $this->model_tool_image->resize('placeholder.png', $product_auto_related_data['width'], $product_auto_related_data['height']);
          }
        } else {
          if ($result['image']) {
            $image_auto_related = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
          } else {
            $image_auto_related = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
          }
        }
      
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

        
        $product_stickers_data = $this->config->get('product_stickers_data');
        $product_stickers = array();

        if (isset($product_stickers_data['status']) && $product_stickers_data['status']) {
          $this->load->model('catalog/product_stickers');

          if (isset($result['product_stickers']) && $result['product_stickers']) {
            $stickers = unserialize($result['product_stickers']);
          } else {
            $stickers = array();
          }

          if ($stickers) {
              foreach ($stickers as $product_sticker_id) {
                $sticker_info = $this->model_catalog_product_stickers->getProductSticker($product_sticker_id);
                
                if ($sticker_info) {
                  $product_stickers[] = array(
                    'text' => $sticker_info['text'],
                    'color' => $sticker_info['color'],
                    'background' => $sticker_info['background']
                  );
                }
              }
    
              $sticker_sort_order = array();
    
              foreach ($stickers as $key => $product_sticker_id) {
                $sticker_info = $this->model_catalog_product_stickers->getProductSticker($product_sticker_id);
                
                if ($sticker_info) {
                  $sticker_sort_order[$key] = $sticker_info['sort_order'];
                }
              }
              
              array_multisort($sticker_sort_order, SORT_ASC, $product_stickers);
          }
        }
      
				$data['products'][] = array(
        
        'product_stickers' => $product_stickers,
      
					'product_id'  => $result['product_id'],
					       
        'thumb'       => $image_auto_related,
      
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

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

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
       
        $this->language->load('octemplates/sstorelang');
        
        // popup_purchase start
        $data['popup_purchase_data'] = $this->config->get('popup_purchase_data');
        $data['popup_purchase_text'] = $this->language->load('extension/module/popup_purchase');
        // popup_purchase end
     
        $data['you_save_text'] = $this->language->get('you_save');
        
        if ((float)$product_info['special']) {
          $data['economy'] = round((($product_info['price'] - $product_info['special'])/($product_info['price'] + 0.01))*100, 0);
          $data['saver'] = round($product_info['price'] - $product_info['special']);
          $data['you_save'] = $this->currency->format($this->tax->calculate($data['saver'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
        } else {
          $data['economy'] = false;
          $data['you_save'] = false;
        }
        
        $data['text_one_click_buy'] = $this->language->get('text_one_click_buy');
        $data['tab_sections'] = $this->language->get('tab_sections');
        $data['show_tabs'] = $this->language->get('show_tabs');
        $data['find_cheap'] =  $this->language->get('find_cheap');
        $data['product_na'] =  $this->language->get('product_na');
        
        $manufacturer_infos = false;
        
        if ($product_info['manufacturer_id']) {
          $manufacturer_infos = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);        
        }
        
        $data['manufacturer_infos'] = $manufacturer_infos;
        
        $storeset_product_info = $this->config->get('storeset_product_info'); 
        
        if (empty($storeset_product_info[$this->session->data['language']])) {
          $data['store_text'] = false;
        } elseif (isset($storeset_product_info[$this->session->data['language']])) {
          $data['store_text'] = html_entity_decode($storeset_product_info[$this->session->data['language']], ENT_QUOTES, 'UTF-8');
        } 
        
        $data['storeset_microdata'] = $this->config->get('storeset_microdata');
        $data['storeset_quick'] = $this->config->get('storeset_quick');
        $data['storeset_sections'] = $this->config->get('storeset_sections');
        $data['lang_code'] = $this->session->data['language'];
        $data['currency_code_data'] = $this->session->data['currency'];
        
        if (isset($this->request->get['route']) && isset($this->request->get['path']) && $this->request->get['route'] == 'product/product' && !empty($data['storeset_sections'])) {
          $parts = explode('_', (string)$this->request->get['path']);
          $data['section_category_id'] = (int)array_pop($parts);

          foreach($data['storeset_sections'] as $block_section) {
            if (isset($block_section['categories']) && in_array($data['section_category_id'], $block_section['categories'])) {
              $data['show_tabs_status'] = true;
              break;
            } else {
              $data['show_tabs_status'] = false;
            }
          }
        } else {
          $data['section_category_id'] = 0;
          $data['show_tabs_status'] = false;
        }
        
        if (preg_match("|new|", $product_info['tag'])) { 
          $data['novinka'] = true; 
        } else {
          $data['novinka'] = false;
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
        
        // product_viewed start
        if (!isset($this->session->data['product_viewed'])) {
          $this->session->data['product_viewed'] = array();
        } else {
          $this->session->data['product_viewed'][] = $this->request->get['product_id'];
        }
        // product_viewed end
      

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

        
        // oct_product_reviews start
        public function oct_review_reputation() {
          $json = array();

          $this->load->language('extension/module/oct_product_reviews');

          if (isset($this->request->get['review_id']) && isset($this->request->get['reputation_type'])) {

            $this->load->model('catalog/review');

            $check_ip = $this->model_catalog_review->checkOctUserIp($this->request->server['REMOTE_ADDR'], $this->request->get['review_id']);

            if ($check_ip) {
              $json['error'] = $this->language->get('error_ip_exist');
            }
            
            if (!isset($json['error'])) {

              $filter_data = array(
                'review_id' => (int)$this->request->get['review_id'],
                'ip' => $this->request->server['REMOTE_ADDR'],
                'reputation_type' => (int)$this->request->get['reputation_type']
              );

              $this->model_catalog_review->addOctProductReputation($filter_data);

              $json['success'] = $this->language->get('text_success');
            }
          }

          $this->response->addHeader('Content-Type: application/json');
          $this->response->setOutput(json_encode($json));
        }
        // oct_product_reviews end
      
	public function review() {
        
        // oct_product_reviews start
        $data['oct_product_reviews_data'] = $this->config->get('oct_product_reviews_data');
        // oct_product_reviews end
      
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');
        
        // oct_product_reviews start
        $this->load->language('extension/module/oct_product_reviews');

        $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');

        $data['entry_positive_text'] = $this->language->get('entry_positive_text');
        $data['entry_negative_text'] = $this->language->get('entry_negative_text');
        $data['text_where_bought'] = $this->language->get('text_where_bought');
        $data['text_where_bought_yes'] = $this->language->get('text_where_bought_yes');
        $data['text_where_bought_no'] = $this->language->get('text_where_bought_no');
        $data['text_admin_answer'] = $this->language->get('text_admin_answer');
        $data['text_my_assessment'] = $this->language->get('text_my_assessment');
        // oct_product_reviews end
      

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
        
        // oct_product_reviews start
        if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
          $positive_text = html_entity_decode($result['positive_text'], ENT_QUOTES, 'UTF-8');
          $negative_text = html_entity_decode($result['negative_text'], ENT_QUOTES, 'UTF-8');
          $admin_answer = html_entity_decode($result['admin_answer'], ENT_QUOTES, 'UTF-8');
          $plus_reputation = (int)$result['plus_reputation'];
          $minus_reputation = (int)$result['minus_reputation'];
          $where_bought = ($result['where_bought']) ? $this->language->get('text_where_bought_yes') : $this->language->get('text_where_bought_no');
        } else {
          $positive_text = '';
          $negative_text = '';
          $admin_answer = '';
          $plus_reputation = FALSE;
          $minus_reputation = FALSE;
          $where_bought = FALSE;
        }
        // oct_product_reviews end
      
			$data['reviews'][] = array(
        
        // oct_product_reviews start
        'review_id'        => $result['review_id'],
        'positive_text'    => $positive_text,
        'negative_text'    => $negative_text,
        'admin_answer'     => $admin_answer,
        'plus_reputation'  => $plus_reputation,
        'minus_reputation' => $minus_reputation,
        'where_bought'     => $where_bought,
        // oct_product_reviews end
      
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
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


        if ($this->config->get('storeset_terms')) {
          if (!isset($this->request->post['terms'])) {
            $this->load->model('catalog/information');
            $this->language->load('extension/module/oct_product_reviews');
            
            $information_info = $this->model_catalog_information->getInformation($this->config->get('storeset_terms'));

            $json['error'] = sprintf($this->language->get('error_terms'), $information_info['title']);
          }
        }
        
			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
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

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
