<?php
class ControllerProductSpecial extends Controller {
	public function index() {
		$this->load->language('product/special');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
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

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/special', $url)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');
		$data['button_continue'] = $this->language->get('button_continue');

		$data['compare'] = $this->url->link('product/compare');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $limit,
			'limit' => $limit
		);

		$product_total = $this->model_catalog_product->getTotalProductSpecials();

		$results = $this->model_catalog_product->getProductSpecials($filter_data);
       
        // popup_view start
        $data['popup_view_data'] = $this->config->get('popup_view_data');
        $data['popup_view_text'] = $this->language->load('extension/module/popup_view');
        // popup_view end
      

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$price = false;
			}

        
        if (preg_match("|new|", $result['tag'])) { 
          $novinka = true; 
        } else {
          $novinka = false;
        }

        if ((float)$result['special']) {
          $economy = round((($result['price'] - $result['special'])/($result['price'] + 0.01))*100, 0);
        } else {
          $economy = false;
        }
                
        $dop_img = false;
        $results_img = $this->model_catalog_product->getProductImages($result['product_id']);
     
        if ($results_img) {
          $dop_img = $this->model_tool_image->resize($results_img[0]['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
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

        
        // oct_images_by_options start
        $oct_options = array();

        $images_by_options_data = $this->config->get('images_by_options_data');

        foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {
          $product_option_value_data = array();

          if (isset($images_by_options_data['allowed_options']) && (in_array($option['option_id'], $images_by_options_data['allowed_options']))) {
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
        // oct_images_by_options end
      
        
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
      

				$oct_product_preorder_text = $this->config->get('oct_product_preorder_text');
				$oct_product_preorder_data = $this->config->get('oct_product_preorder_data');
				$oct_product_preorder_language = $this->load->language('extension/module/oct_product_preorder');
								
				if (isset($oct_product_preorder_data['status']) && $oct_product_preorder_data['status'] && isset($oct_product_preorder_data['stock_statuses']) && isset($result['oct_stock_status_id']) && in_array($result['oct_stock_status_id'], $oct_product_preorder_data['stock_statuses'])) {
					$product_preorder_text = $oct_product_preorder_text[$this->session->data['language']]['call_button'];
					$product_preorder_status = 1;
				} else {
					$product_preorder_text = $oct_product_preorder_language['text_out_of_stock'];
					$product_preorder_status = 2;
				}
			
			$data['products'][] = array(
        
        'product_stickers' => $product_stickers,
      
        
        // oct_images_by_options start
        'oct_options' => $oct_options,
        // oct_images_by_options end
      
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
        
        'novinka'       => $novinka,
        'economy'       => $economy,
        'dop_img'       => $dop_img,
      

				'quantity'       => $result['quantity'], 
				'product_preorder_text' => $product_preorder_text,
				'product_preorder_status' => $product_preorder_status,
			
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'minimum'     => ($result['minimum'] > 0) ? $result['minimum'] : 1,
				'rating'      => $rating,
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
			);
		}

		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['sorts'] = array();

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('product/special', 'sort=p.sort_order&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.name-ASC',
			'href'  => $this->url->link('product/special', 'sort=pd.name&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.name-DESC',
			'href'  => $this->url->link('product/special', 'sort=pd.name&order=DESC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_price_asc'),
			'value' => 'ps.price-ASC',
			'href'  => $this->url->link('product/special', 'sort=ps.price&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_price_desc'),
			'value' => 'ps.price-DESC',
			'href'  => $this->url->link('product/special', 'sort=ps.price&order=DESC' . $url)
		);

		if ($this->config->get('config_review_status')) {
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('product/special', 'sort=rating&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('product/special', 'sort=rating&order=ASC' . $url)
			);
		}

		$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/special', 'sort=p.model&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_model_desc'),
			'value' => 'p.model-DESC',
			'href'  => $this->url->link('product/special', 'sort=p.model&order=DESC' . $url)
		);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['limits'] = array();

		$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

		sort($limits);

		foreach($limits as $value) {
			$data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('product/special', $url . '&limit=' . $value)
			);
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/special', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
		    $this->document->addLink($this->url->link('product/special', '', true), 'canonical');
		} elseif ($page == 2) {
		    $this->document->addLink($this->url->link('product/special', '', true), 'prev');
		} else {
		    $this->document->addLink($this->url->link('product/special', 'page='. ($page - 1), true), 'prev');
		}

		if ($limit && ceil($product_total / $limit) > $page) {
		    $this->document->addLink($this->url->link('product/special', 'page='. ($page + 1), true), 'next');
		}

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('product/special', $data));
	}
}
