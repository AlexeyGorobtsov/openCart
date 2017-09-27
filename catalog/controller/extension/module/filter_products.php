<?php
class ControllerExtensionModuleFilterProducts extends Controller {
	public function index() {
		$filter_products_data = $this->config->get('filter_products_data');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($this->request->get['manufacturer_id'])) {
			$data['manufacturer_id'] = $this->request->get['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}

		if (isset($this->request->get['page'])) {
			$data['page'] = $this->request->get['page'];
		} else {
			$data['page'] = 1;
		}

		$this->document->addScript('catalog/view/javascript/filter_products/jquery-ui-slider-pips.js');
		$this->document->addStyle('catalog/view/javascript/filter_products/jquery-ui-slider-pips.css');
		$this->document->addStyle('https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css');

		$this->load->model('catalog/product');
		$this->load->model('extension/module/filter_products');
		$this->load->model('localisation/currency');
		$this->load->language('extension/module/filter_products');

		$data['category_id'] = end($parts);

		$data['products_data'] = array();
		$data['page_type'] = '';

		if (isset($this->request->get['route'])) {
			if ($this->request->get['route'] == 'product/category') {
				$data['products_data'] = $this->model_extension_module_filter_products->getProductsByCategoryData($data['category_id']);
				$data['page_type'] = 'category';
			} elseif ($this->request->get['route'] == 'product/manufacturer/info') {
				$data['products_data'] = $this->model_extension_module_filter_products->getProductsByManufacturerData($data['manufacturer_id'], false);
				$data['page_type'] = 'manufacturer';
			}
		} 
	
		$data['filter_products_data'] = $this->config->get('filter_products_data');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_reset'] = $this->language->get('button_reset');
		$data['text_select_value'] = $this->language->get('text_select_value');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_prices'] = $this->language->get('text_prices');
		$data['text_empty_2'] = $this->language->get('text_empty_2');

		$data['code'] = $this->session->data['currency'];
		
		$results = $this->model_localisation_currency->getCurrencies();

		foreach ($results as $result) {
			if ($result['status']) {
				$data['currencies'][] = array(
					'title'        => $result['title'],
					'code'         => $result['code'],
					'symbol_left'  => $result['symbol_left'],
					'symbol_right' => $result['symbol_right']
				);
			}
		}

		// filtering from url
		if (isset($this->request->get['p_val'])) {
			$prices = explode(':', str_replace(array('[',']'), '', $this->request->get['p_val']));
			$data['price_min'] = $prices[0];
			$data['price_max'] = $prices[1];
		} else {
			$data['price_min'] = (isset($data['products_data']['prices']['price_min'])) ? $data['products_data']['prices']['price_min'] : 0;
			$data['price_max'] = (isset($data['products_data']['prices']['price_max'])) ? $data['products_data']['prices']['price_max'] : 0;
		}

		$data['m_vals'] = array();

		if (isset($this->request->get['m_val'])) {
			if (isset($this->request->get['m_val'])) {
				$m_vals = $this->request->get['m_val'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$m_vals = $this->request->get['manufacturer_id'];
			} else {
				$m_vals = '';
			}
			
			$manufacturers = explode(',', str_replace(array('[',']'), '', $m_vals));
			foreach ($manufacturers as $manufacturer) {
				$data['m_vals'][] = $manufacturer;
			}
		}

		$data['o_vals'] = array();

		if (isset($this->request->get['o_val'])) {
			$options = explode(';', str_replace(array('[',']'), '', $this->request->get['o_val']));
			foreach ($options as $option) {
				$option_value = explode(':', $option);
				if (isset($option_value[1])) {
					$option_vals = explode(',', $option_value[1]);
					foreach ($option_vals as $val) {
						$data['o_vals'][] = $val;
					}
				}
			}
		}

		$data['a_vals'] = array();

		if (isset($this->request->get['a_val'])) {
			$attributes = explode(';', str_replace(array('[',']'), '', $this->request->get['a_val']));
			foreach ($attributes as $attribute) {
				$attribute_value = explode(':', $attribute);
				if (isset($attribute_value[1])) {
					$attribute_vals = explode(',', $attribute_value[1]);
					foreach ($attribute_vals as $val) {
						$data['a_vals'][] = md5($attribute_value[0].':'.$val);
					}
				}
			}
		}

		if (isset($this->request->get['path'])) {
			$data['path'] = $this->request->get['path'];
		} else {
			$data['path'] = '';
		}

		if (isset($prices[0]) || isset($prices[1]) || $data['m_vals'] || $data['o_vals'] || $data['a_vals']) {
			$data['auto_load'] = true;
		} else {
			$data['auto_load'] = false;
		}
		
		if ($data['products_data']) {

			if (isset($this->request->get['route'])) {
				if ($this->request->get['route'] == 'product/category' && isset($filter_products_data['product_categories_array']) && in_array($data['category_id'], $filter_products_data['product_categories_array'])) {
					return $this->load->view('extension/module/filter_products', $data);
				} elseif ($this->request->get['route'] == 'product/manufacturer/info') {
					return $this->load->view('extension/module/filter_products', $data);
				}
			} 

		} else {
			return $this->load->view('extension/module/filter_products_empty', $data);
		}
	}

	public function getProductsByCategory() {
		$json = array();

		if (isset($this->request->post['category_id'])) {
			$this->load->model('extension/module/filter_products');
			$this->load->model('tool/image');
			$this->load->model('catalog/category');
			$this->load->language('product/category');
			$this->load->language('extension/module/filter_products');

			$json['text_tax'] = $this->language->get('text_tax');
			$json['button_cart'] = $this->language->get('button_cart');
			$json['button_wishlist'] = $this->language->get('button_wishlist');
			$json['button_compare'] = $this->language->get('button_compare');
			$json['button_list'] = $this->language->get('button_list');
			$json['button_grid'] = $this->language->get('button_grid');
			$json['text_sort'] = $this->language->get('text_sort');
			$json['text_limit'] = $this->language->get('text_limit');
			$json['button_popup_view'] = $this->language->get('button_popup_view');
			$json['text_selected_filters'] = $this->language->get('text_selected_filters');

			// popup_view start
	    $oct_popup_view_data = $this->config->get('popup_view_data');

	    if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status']) {
	    	$json['popup_view_status'] = 1;
	    } else {
				$json['popup_view_status'] = 0;
	    }
	    // popup_view end

			$json['products'] = array();

			if (isset($this->request->post['sort'])) {
				$sort = $this->request->post['sort'];
			} else {
				$sort = 'p.sort_order';
			}

			if (isset($this->request->post['order'])) {
				$order = $this->request->post['order'];
			} else {
				$order = 'ASC';
			}

			if (isset($this->request->post['page'])) {
				$page = $this->request->post['page'];
			} else {
				$page = 1;
			}

			if (isset($this->request->post['limit'])) {
				$limit = (int)$this->request->post['limit'];
			} else {
				$limit = $this->config->get('config_product_limit');
			}

			$data = array(
				'filter_category_id' => $this->request->post['category_id'],
				'filter_manufacturer_id' => (isset($this->request->post['m_val']) && !empty($this->request->post['m_val'])) ? $this->request->post['m_val'] : '',
				'filter_option_id' => (isset($this->request->post['o_val']) && !empty($this->request->post['o_val'])) ? $this->request->post['o_val'] : '',
				'filter_attribute_id' => (isset($this->request->post['a_val']) && !empty($this->request->post['a_val'])) ? $this->request->post['a_val'] : '',
				'filter_prices'	=> (isset($this->request->post['p_val'])) ? $this->request->post['p_val'] : 0,
				'sort' => $sort,
				'order' => $order,
				'start' => ($page - 1) * $limit,
				'limit' => $limit
			);

			$path = '';

			$parts = explode('_', (string)$this->request->post['path']);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}
			}
			
			$results = $this->model_extension_module_filter_products->getProducts($data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$economy = round((($result['price'] - $result['special'])/($result['price'] + 0.01))*100, 0);
				} else {
					$economy = false;
				}

				$dop_img = false;
				$this->load->model('catalog/product');
				$results_img = $this->model_catalog_product->getProductImages($result['product_id']);

				if ($results_img) {
					$dop_img = $this->model_tool_image->resize($results_img[0]['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
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

				$oct_product_stickers_data = $this->config->get('product_stickers_data');
        $oct_product_stickers = array();

        if (isset($oct_product_stickers_data['status']) && $oct_product_stickers_data['status']) {
          $this->load->model('catalog/product_stickers');

          if ($result['product_stickers']) {
            $stickers = unserialize($result['product_stickers']);
          } else {
            $stickers = array();
          }

          foreach ($stickers as $product_sticker_id) {
            $sticker_info = $this->model_catalog_product_stickers->getProductSticker($product_sticker_id);
            
            if ($sticker_info) {
              $oct_product_stickers[] = array(
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
          
          array_multisort($sticker_sort_order, SORT_ASC, $oct_product_stickers);
        }

        $oct_options = array();

        $oct_images_by_options_data = $this->config->get('images_by_options_data');

        foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {
          $product_option_value_data = array();

          if (isset($oct_images_by_options_data['allowed_options']) && (in_array($option['option_id'], $oct_images_by_options_data['allowed_options']))) {
            foreach ($option['product_option_value'] as $option_value) {
              if (!$option_value['subtract'] || ($option_value['quantity'] >= 0)) {
                
                if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                  $oct_option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                } else {
                  $oct_option_price = false;
                }

                $product_option_value_data[] = array(
                  'product_option_value_id' => $option_value['product_option_value_id'],
                  'option_value_id'         => $option_value['option_value_id'],
                  'name'                    => $option_value['name'],
                  'image'                   => ($option_value['image']) ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
                  'price'                   => $oct_option_price,
                  'price_prefix'            => $option_value['price_prefix']
               );
              }
            }

            $oct_options[] = array(
              'product_option_id'    => $option['product_option_id'],
              'product_option_value' => $product_option_value_data,
              'option_id'            => $option['option_id'],
              'name'                 => $option['name'],
              'type'                 => $option['type'],
              'value'                => $option['value'],
              'required'             => $option['required']
            );
          }
        }

				$json['products'][] = array(
					'oct_options' => $oct_options,
					'product_stickers' => $oct_product_stickers,
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
          'economy'     => $economy,
          'dop_img'     => $dop_img,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'path=' . $path . '&product_id=' . $result['product_id'])
				);
			}

			$json['url'] = $this->url->link('product/category', 'path=' . $path, true);
			
			if (isset($this->request->post['p_val'])) {				
				$json['url'] .= '&amp;p_val=[' . $this->request->post['p_val']['min'] . ':' . $this->request->post['p_val']['max'] . ']';
			}

			if (isset($this->request->post['m_val'])) {
				if (is_array($this->request->post['m_val'])) {

					$m_implode = array();

					foreach ($this->request->post['m_val'] as $manufacturer_id) {
						$m_implode[] = $manufacturer_id;
					}

					$m_vals = implode(',', $m_implode);

					$json['url'] .= '&amp;m_val=[' . $m_vals . ']';
				} else {
					$json['url'] .= '&amp;m_val=' . $this->request->post['m_val'];
				}
			}

			if (isset($this->request->post['o_val'])) {
				$options_part = '';
				$op_d = 0;
				foreach ($this->request->post['o_val'] as $option_id => $option_value) {
					if ($this->request->post['o_val'][$option_id]) {
						if ($op_d > 0) {
							$options_part .= ';';
						}
						if (is_array($option_value)) {

							$ov_implode = array();

							foreach ($option_value as $option_value_id) {
								$ov_implode[] = $option_value_id;
								$o_vals = implode(',', $ov_implode);
							}

							$options_part .= $option_id.':'.$o_vals;
						} else {
							$options_part .= $option_id.':'.$option_value;
						}
					}
				$op_d++;
				}

				$json['url'] .= '&amp;o_val=['.$options_part.']';
			}

			if (isset($this->request->post['a_val'])) {
				$attributes_part = '';
				$at_d = 0;
				foreach ($this->request->post['a_val'] as $attribute_id => $attribute_value) {
					if ($this->request->post['a_val'][$attribute_id]) {
						if ($at_d > 0) {
							$attributes_part .= ';';
						}
						if (is_array($attribute_value)) {

							$ov_implode = array();

							foreach ($attribute_value as $attribute_value_id) {
								$ov_implode[] = $attribute_value_id;
								$a_vals = implode(',', $ov_implode);
							}

							$attributes_part .= $attribute_id.':'.$a_vals;
						} else {
							$attributes_part .= $attribute_id.':'.$attribute_value;
						}
					}
				$at_d++;
				}

				$json['url'] .= '&amp;a_val=['.$attributes_part.']';
			}

			if (isset($this->request->post['limit'])) {				
				$json['url'] .= '&amp;limit=' . $this->request->post['limit'];
			}

			if (isset($this->request->post['sort'])) {				
				$json['url'] .= '&amp;sort=' . $this->request->post['sort'];
			}

			if (isset($this->request->post['order'])) {				
				$json['url'] .= '&amp;order=' . $this->request->post['order'];
			}

			if (isset($this->request->post['page'])) {				
				$json['url'] .= '&amp;page=' . $this->request->post['page'];
			}

			$json['sorts'] = array();

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
			);

			if ($this->config->get('config_review_status')) {
				$json['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',			
				);

				$json['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',			
				);
			}

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
			);

			$json['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$json['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $value
				);
			}

			$category_info = $this->model_catalog_category->getCategory($this->request->post['category_id']);

			if ($category_info) {
				$json['heading_title'] = $category_info['name'];
			
				$product_total = $this->model_extension_module_filter_products->getTotalProductsByCategory($data);

				$pagination = new Pagination();
				$pagination->total = $product_total;
				$pagination->page = $page;
				$pagination->limit = $limit;
				$pagination->url = str_replace("&amp;page=" . $this->request->post['page'], "", $json['url']) . '&page={page}';

				$json['pagination'] = $pagination->render();

				$json['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

				if ($page == 1) {
				  $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], 'SSL'), 'canonical');
				} elseif ($page == 2) {
				  $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], 'SSL'), 'prev');
				} else {
				  $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), 'SSL'), 'prev');
				}

				if ($limit && ceil($product_total / $limit) > $page) {
				  $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), 'SSL'), 'next');
				}
			}

			if (!$json['products']) {
				$json['empty'] = $this->language->get('text_empty_1');
				if ($this->request->post['page'] != 1) {
					$json['go_back'] = str_replace("&amp;page=" . $this->request->post['page'], "&amp;page=1", $json['url']);
				} else {
					$json['go_back'] = '';
				}
			} else {
				$json['empty'] = '';
				$json['go_back'] = '';
			}

			$json['url'] = str_replace('&amp;', '&', $json['url']);

			$products_data = $this->model_extension_module_filter_products->getProductsByCategoryData($this->request->post['category_id']);

			// selected filters
			$json['selected_options'] = array();

			$ov_implode = array();

			if (isset($this->request->post['o_val'])) {
				foreach ($this->request->post['o_val'] as $option_id => $option_value) {
					if ($this->request->post['o_val'][$option_id]) {
						if (is_array($option_value)) {
							foreach ($option_value as $option_value_id) {
								$ov_implode[] = $option_value_id;
							}
						} else {
							$ov_implode[] = $option_value;
						}
					}
				}
			}

			if (isset($products_data['options']) && $products_data['options']) {
				foreach ($products_data['options'] as $option) {
					
					$option_values = array();

					foreach ($option['product_option_value'] as $product_option_value) {
						if ($ov_implode && in_array($product_option_value['option_value_id'], $ov_implode)) {
							$option_values[] = array(
								'name'  					=> $product_option_value['name'],
								'option_value_id' => $product_option_value['option_value_id']
							);
						}
					}

					if ($option_values) {
						$json['selected_options'][] = array(
							'name'  					=> $option['name'],
							'option_values'   => $option_values,
						);
					}
				}
			}

			$json['selected_attributes'] = array();

			$av_implode = array();

			if (isset($this->request->post['a_val'])) {
				foreach ($this->request->post['a_val'] as $attribute_id => $attribute_value) {
					if ($this->request->post['a_val'][$attribute_id]) {
						if (is_array($attribute_value)) {
							foreach ($attribute_value as $value) {
								$av_implode[$attribute_id][] = $value;
							}
						} else {
							$av_implode[$attribute_id][] = $attribute_value;
						}
					}
				}
			}

			if (isset($products_data['attributes']) && $products_data['attributes']) {
				foreach($products_data['attributes'] as $attribute_group_id => $attribute) {
					foreach($attribute['product_attribute_data'] as $attribute_value_id => $attribute_value) {
						
						$attribute_values = array();

						foreach($attribute_value['attr_values'] as $value) {
							if (isset($av_implode[$attribute_value_id])) {
								if ($av_implode && in_array($value, $av_implode[$attribute_value_id])) {
									$attribute_values[] = array(
										'name'  					=> $value,
										'attribute_value' => md5($attribute_value_id.':'.$value)
									);
								}
							}
						}

						if ($attribute_values) {
							$json['selected_attributes'][] = array(
								'name'  					 => $attribute_value['name'],
								'attribute_values' => $attribute_values
							);
						}
					}
				}
			}

			$json['selected_manufacturers'] = array();

			$mv_implode = array();

			if (isset($this->request->post['m_val'])) {
				if (is_array($this->request->post['m_val'])) {
					foreach ($this->request->post['m_val'] as $manufacturer_id) {
						$mv_implode[] = $manufacturer_id;
					}
				} else {
					$mv_implode[] = $this->request->post['m_val'];
				}
			}

			if (isset($products_data['manufacturers']) && $products_data['manufacturers']) {

				$manufacturer_values = array();

				foreach($products_data['manufacturers'] as $manufacturer) {
					if ($mv_implode && in_array($manufacturer['manufacturer_id'], $mv_implode)) {
						$manufacturer_values[] = array(
							'name'  					=> $manufacturer['name'],
							'manufacturer_id' => $manufacturer['manufacturer_id']
						);
					}
				}

				if ($manufacturer_values) {
					$json['selected_manufacturers'][] = array(
						'name'  					    => $this->language->get('text_manufacturer'),
						'manufacturer_values' => $manufacturer_values
					);
				}
			}

			if ($json['selected_options']) {
				$json['selected_options_empty'] = 1;
			} else {
				$json['selected_options_empty'] = '';
			}

			if ($json['selected_attributes']) {
				$json['selected_attributes_empty'] = 1;
			} else {
				$json['selected_attributes_empty'] = '';
			}

			if ($json['selected_manufacturers']) {
				$json['selected_manufacturers_empty'] = 1;
			} else {
				$json['selected_manufacturers_empty'] = '';
			}
		}

		$this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
	}

	public function getProductsByManufacturer() {
		$json = array();

		if (isset($this->request->post['manufacturer_id'])) {
			$this->load->model('extension/module/filter_products');
			$this->load->model('tool/image');
			$this->load->model('catalog/manufacturer');
			$this->load->language('product/manufacturer');
			$this->load->language('extension/module/filter_products');

			$json['text_tax'] = $this->language->get('text_tax');
			$json['button_cart'] = $this->language->get('button_cart');
			$json['button_wishlist'] = $this->language->get('button_wishlist');
			$json['button_compare'] = $this->language->get('button_compare');
			$json['button_list'] = $this->language->get('button_list');
			$json['button_grid'] = $this->language->get('button_grid');
			$json['text_sort'] = $this->language->get('text_sort');
			$json['text_limit'] = $this->language->get('text_limit');
			$json['button_popup_view'] = $this->language->get('button_popup_view');
			$json['text_selected_filters'] = $this->language->get('text_selected_filters');

			// popup_view start
	    $oct_popup_view_data = $this->config->get('popup_view_data');

	    if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status']) {
	    	$json['popup_view_status'] = 1;
	    } else {
				$json['popup_view_status'] = 0;
	    }
	    // popup_view end

			$json['products'] = array();

			if (isset($this->request->post['sort'])) {
				$sort = $this->request->post['sort'];
			} else {
				$sort = 'p.sort_order';
			}

			if (isset($this->request->post['order'])) {
				$order = $this->request->post['order'];
			} else {
				$order = 'ASC';
			}

			if (isset($this->request->post['page'])) {
				$page = $this->request->post['page'];
			} else {
				$page = 1;
			}

			if (isset($this->request->post['limit'])) {
				$limit = (int)$this->request->post['limit'];
			} else {
				$limit = $this->config->get('config_product_limit');
			}

			$data = array(
				'filter_category_id' => '',
				'filter_manufacturer_id' => $this->request->post['manufacturer_id'],
				'filter_option_id' => (isset($this->request->post['o_val']) && !empty($this->request->post['o_val'])) ? $this->request->post['o_val'] : '',
				'filter_attribute_id' => (isset($this->request->post['a_val']) && !empty($this->request->post['a_val'])) ? $this->request->post['a_val'] : '',
				'filter_prices'	=> (isset($this->request->post['p_val'])) ? $this->request->post['p_val'] : 0,
				'sort' => $sort,
				'order' => $order,
				'start' => ($page - 1) * $limit,
				'limit' => $limit
			);

			$results = $this->model_extension_module_filter_products->getProducts($data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$economy = round((($result['price'] - $result['special'])/($result['price'] + 0.01))*100, 0);
				} else {
					$economy = false;
				}

				$dop_img = false;
				$this->load->model('catalog/product');
				$results_img = $this->model_catalog_product->getProductImages($result['product_id']);

				if ($results_img) {
					$dop_img = $this->model_tool_image->resize($results_img[0]['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
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

				$oct_product_stickers_data = $this->config->get('product_stickers_data');
        $oct_product_stickers = array();

        if (isset($oct_product_stickers_data['status']) && $oct_product_stickers_data['status']) {
          $this->load->model('catalog/product_stickers');

          if ($result['product_stickers']) {
            $stickers = unserialize($result['product_stickers']);
          } else {
            $stickers = array();
          }

          foreach ($stickers as $product_sticker_id) {
            $sticker_info = $this->model_catalog_product_stickers->getProductSticker($product_sticker_id);
            
            if ($sticker_info) {
              $oct_product_stickers[] = array(
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
          
          array_multisort($sticker_sort_order, SORT_ASC, $oct_product_stickers);
        }

        $oct_options = array();

        $oct_images_by_options_data = $this->config->get('images_by_options_data');

        foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {
          $product_option_value_data = array();

          if (isset($oct_images_by_options_data['allowed_options']) && (in_array($option['option_id'], $oct_images_by_options_data['allowed_options']))) {
            foreach ($option['product_option_value'] as $option_value) {
              if (!$option_value['subtract'] || ($option_value['quantity'] >= 0)) {
                
                if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                  $oct_option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                } else {
                  $oct_option_price = false;
                }

                $product_option_value_data[] = array(
                  'product_option_value_id' => $option_value['product_option_value_id'],
                  'option_value_id'         => $option_value['option_value_id'],
                  'name'                    => $option_value['name'],
                  'image'                   => ($option_value['image']) ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '',
                  'price'                   => $oct_option_price,
                  'price_prefix'            => $option_value['price_prefix']
               );
              }
            }

            $oct_options[] = array(
              'product_option_id'    => $option['product_option_id'],
              'product_option_value' => $product_option_value_data,
              'option_id'            => $option['option_id'],
              'name'                 => $option['name'],
              'type'                 => $option['type'],
              'value'                => $option['value'],
              'required'             => $option['required']
            );
          }
        }

				$json['products'][] = array(
					'oct_options' => $oct_options,
					'product_stickers' => $oct_product_stickers,
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
          'economy'     => $economy,
          'dop_img'     => $dop_img,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'manufacturer_id=' . $this->request->post['manufacturer_id'] . '&product_id=' . $result['product_id'])
				);
			}

			if (!$json['products']) {
				$json['empty'] = $this->language->get('text_empty_1');
			} else {
				$json['empty'] = '';
			}

			$json['url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->post['manufacturer_id'], true);
			
			if (isset($this->request->post['p_val'])) {				
				$json['url'] .= '&amp;p_val=[' . $this->request->post['p_val']['min'] . ':' . $this->request->post['p_val']['max'] . ']';
			}

			if (isset($this->request->post['manufacturer_id'])) {
				$json['url'] .= '&amp;m_val=' . $this->request->post['manufacturer_id'];
			}

			if (isset($this->request->post['o_val'])) {
				$options_part = '';
				$op_d = 0;
				foreach ($this->request->post['o_val'] as $option_id => $option_value) {
					if ($this->request->post['o_val'][$option_id]) {
						if ($op_d > 0) {
							$options_part .= ';';
						}
						if (is_array($option_value)) {

							$ov_implode = array();

							foreach ($option_value as $option_value_id) {
								$ov_implode[] = $option_value_id;
								$o_vals = implode(',', $ov_implode);
							}

							$options_part .= $option_id.':'.$o_vals;
						} else {
							$options_part .= $option_id.':'.$option_value;
						}
					}
				$op_d++;
				}

				$json['url'] .= '&amp;o_val=['.$options_part.']';
			}

			if (isset($this->request->post['a_val'])) {
				$attributes_part = '';
				$at_d = 0;
				foreach ($this->request->post['a_val'] as $attribute_id => $attribute_value) {
					if ($this->request->post['a_val'][$attribute_id]) {
						if ($at_d > 0) {
							$attributes_part .= ';';
						}
						if (is_array($attribute_value)) {

							$ov_implode = array();

							foreach ($attribute_value as $attribute_value_id) {
								$ov_implode[] = $attribute_value_id;
								$a_vals = implode(',', $ov_implode);
							}

							$attributes_part .= $attribute_id.':'.$a_vals;
						} else {
							$attributes_part .= $attribute_id.':'.$attribute_value;
						}
					}
				$at_d++;
				}

				$json['url'] .= '&amp;a_val=['.$attributes_part.']';
			}

			if (isset($this->request->post['limit'])) {				
				$json['url'] .= '&amp;limit=' . $this->request->post['limit'];
			}

			if (isset($this->request->post['sort'])) {				
				$json['url'] .= '&amp;sort=' . $this->request->post['sort'];
			}

			if (isset($this->request->post['order'])) {				
				$json['url'] .= '&amp;order=' . $this->request->post['order'];
			}

			if (isset($this->request->post['page'])) {				
				$json['url'] .= '&amp;page=' . $this->request->post['page'];
			}

			$json['sorts'] = array();

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
			);

			if ($this->config->get('config_review_status')) {
				$json['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',			
				);

				$json['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',			
				);
			}

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
			);

			$json['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
			);

			$json['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$json['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $value
				);
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->post['manufacturer_id']);

			if ($manufacturer_info) {
				$json['heading_title'] = $manufacturer_info['name'];
			
				$product_total = $this->model_extension_module_filter_products->getTotalProductsByManufacturer($data);

				$pagination = new Pagination();
				$pagination->total = $product_total;
				$pagination->page = $page;
				$pagination->limit = $limit;
				$pagination->url = str_replace("&amp;page=" . $this->request->post['page'], "", $json['url']) . '&page={page}';

				$json['pagination'] = $pagination->render();

				$json['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

				if ($page == 1) {
			    $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->post['manufacturer_id'], 'SSL'), 'canonical');
				} elseif ($page == 2) {
				  $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->post['manufacturer_id'], 'SSL'), 'prev');
				} else {
				  $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->post['manufacturer_id'] . '&page='. ($page - 1), 'SSL'), 'prev');
				}

				if ($limit && ceil($product_total / $limit) > $page) {
				  $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->post['manufacturer_id'] . '&page='. ($page + 1), 'SSL'), 'next');
				}
			}

			$json['url'] = str_replace('&amp;', '&', $json['url']);

			$products_data = $this->model_extension_module_filter_products->getProductsByManufacturerData($this->request->post['manufacturer_id'], false);

			// selected filters
			$json['selected_options'] = array();

			$ov_implode = array();

			if (isset($this->request->post['o_val'])) {
				foreach ($this->request->post['o_val'] as $option_id => $option_value) {
					if ($this->request->post['o_val'][$option_id]) {
						if (is_array($option_value)) {
							foreach ($option_value as $option_value_id) {
								$ov_implode[] = $option_value_id;
							}
						} else {
							$ov_implode[] = $option_value;
						}
					}
				}
			}

			if (isset($products_data['options']) && $products_data['options']) {
				foreach ($products_data['options'] as $option) {
					
					$option_values = array();

					foreach ($option['product_option_value'] as $product_option_value) {
						if ($ov_implode && in_array($product_option_value['option_value_id'], $ov_implode)) {
							$option_values[] = array(
								'name'  					=> $product_option_value['name'],
								'option_value_id' => $product_option_value['option_value_id']
							);
						}
					}

					if ($option_values) {
						$json['selected_options'][] = array(
							'name'  					=> $option['name'],
							'option_values'   => $option_values,
						);
					}
				}
			}

			$json['selected_attributes'] = array();

			$av_implode = array();

			if (isset($this->request->post['a_val'])) {
				foreach ($this->request->post['a_val'] as $attribute_id => $attribute_value) {
					if ($this->request->post['a_val'][$attribute_id]) {
						if (is_array($attribute_value)) {
							foreach ($attribute_value as $value) {
								$av_implode[$attribute_id][] = $value;
							}
						} else {
							$av_implode[$attribute_id][] = $attribute_value;
						}
					}
				}
			}

			if (isset($products_data['attributes']) && $products_data['attributes']) {
				foreach($products_data['attributes'] as $attribute_group_id => $attribute) {
					foreach($attribute['product_attribute_data'] as $attribute_value_id => $attribute_value) {
						
						$attribute_values = array();

						foreach($attribute_value['attr_values'] as $value) {
							if (isset($av_implode[$attribute_value_id])) {
								if ($av_implode && in_array($value, $av_implode[$attribute_value_id])) {
									$attribute_values[] = array(
										'name'  					=> $value,
										'attribute_value' => md5($attribute_value_id.':'.$value)
									);
								}
							}
						}

						if ($attribute_values) {
							$json['selected_attributes'][] = array(
								'name'  					 => $attribute_value['name'],
								'attribute_values' => $attribute_values
							);
						}
					}
				}
			}

			$json['selected_manufacturers'] = array();

			if ($json['selected_options']) {
				$json['selected_options_empty'] = 1;
			} else {
				$json['selected_options_empty'] = '';
			}

			if ($json['selected_attributes']) {
				$json['selected_attributes_empty'] = 1;
			} else {
				$json['selected_attributes_empty'] = '';
			}

			if ($json['selected_manufacturers']) {
				$json['selected_manufacturers_empty'] = 1;
			} else {
				$json['selected_manufacturers_empty'] = '';
			}
		}

		$this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
	}
}