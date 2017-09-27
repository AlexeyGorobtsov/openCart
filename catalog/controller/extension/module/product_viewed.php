<?php
class ControllerExtensionModuleProductViewed extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/product_viewed');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}


		$data['position'] = $setting['position'];

		if (!empty($this->session->data['product_viewed']) && count($this->session->data['product_viewed']) > 2) {

			$products = array_slice(array_unique($this->session->data['product_viewed']), 0, $setting['limit']);

			krsort($products);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$product_stickers_data = $this->config->get('product_stickers_data');
			        $product_stickers = array();

			        if (isset($product_stickers_data['status']) && $product_stickers_data['status']) {
			          $this->load->model('catalog/product_stickers');

			          if ($product_info['product_stickers']) {
			            $stickers = unserialize($product_info['product_stickers']);
			          } else {
			            $stickers = array();
			          }

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

					$data['products'][] = array(
						'product_stickers' => $product_stickers,
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}

		if ($data['products']) {
			return $this->load->view('extension/module/product_viewed', $data);
		}
	}
}
