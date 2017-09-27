<?php
class ControllerProductOctBlog extends Controller {
	public function index() {
		$this->load->language('product/oct_blog');

		$this->load->model('catalog/oct_blog');

		$this->load->model('tool/image');

		$this->load->model('catalog/product');


		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_blog'] = $this->language->get('text_blog');
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['text_date_added'] = $this->language->get('text_date_added');

		$data['button_continue'] = $this->language->get('button_continue');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'b.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_blog'),
			'href' => $this->url->link('product/oct_blog')
		);

		$data['blogs'] = array();

		$data_x = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $limit,
			'limit' => $limit
		);

		$results = $this->model_catalog_oct_blog->getBlogs( $data_x );

		$blog_total = $this->model_catalog_oct_blog->getTotalBlogs();

		foreach ($results as $result) {

			$img_w = $this->config->get('blog_image_thumb_width');
			$img_h = $this->config->get('blog_image_thumb_height');
			$desc_l = $this->config->get('blog_desc_limit');

			if (!empty($img_w)) {
				$image_width = $img_w;
			} else {
				$image_width = 228;
			}

			if (!empty($img_h)) {
				$image_height = $img_h;
			} else {
				$image_height = 228;
			}

			if (!empty($desc_l)) {
				$description_limit = $desc_l;
			} else {
				$description_limit = 400;
			}

			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], 250, 160);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $image_width, $image_height);
			}

			$data['blogs'][] = array(
				'title' 	  => $result['title'],
				'thumb'       => $image,
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_limit) . '..',
				'href' 		  => $this->url->link('product/oct_blog/info', 'blog_id=' . $result['blog_id'])
			);
		}

		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['sorts'] = array();

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_date_desc'),
			'value' => 'b.date_added-DESC',
			'href'  => $this->url->link('product/oct_blog', '&sort=b.date_added&order=DESC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_date_asc'),
			'value' => 'b.date_added-ASC',
			'href'  => $this->url->link('product/oct_blog', '&sort=b.date_added&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'bd.title-ASC',
			'href'  => $this->url->link('product/oct_blog', '&sort=bd.title&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'bd.title-DESC',
			'href'  => $this->url->link('product/oct_blog', '&sort=bd.title&order=DESC' . $url)
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
				'href'  => $this->url->link('product/oct_blog', $url . '&limit=' . $value)
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
		$pagination->total = $blog_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/oct_blog', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($blog_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($blog_total - $limit)) ? $blog_total : ((($page - 1) * $limit) + $limit), $blog_total, ceil($blog_total / $limit));

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

		$this->response->setOutput($this->load->view('product/oct_blog_list', $data));
	}

	public function info() {
		$this->load->language('product/oct_blog');

		$this->load->model('catalog/oct_blog');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['text_date_added'] = $this->language->get('text_date_added');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['heading_products_title'] = $this->language->get('heading_products_title');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_blog'),
			'href' => $this->url->link('product/oct_blog')
		);

		if (isset($this->request->get['blog_id'])) {
			$blog_id = (int)$this->request->get['blog_id'];
		} else {
			$blog_id = 0;
		}

		$blog_info = $this->model_catalog_oct_blog->getBlog($blog_id);

		if ($blog_info) {
			$this->document->setTitle($blog_info['meta_title']);
			$this->document->setDescription($blog_info['meta_description']);
			$this->document->setKeywords($blog_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $blog_info['title'],
				'href' => $this->url->link('product/oct_blog/info', 'blog_id=' . $blog_id)
			);

			$data['heading_title'] = $blog_info['title'];

			$data['button_continue'] = $this->language->get('button_continue');

      $info = html_entity_decode($blog_info['description'], ENT_QUOTES, 'UTF-8');

      $data['description'] = $info;

			$data['date_added'] = date($this->language->get('date_format_short'), strtotime($blog_info['date_added']));

			$img_w = $this->config->get('blog_image_thumb_width');
			$img_h = $this->config->get('blog_image_thumb_height');

			if (!empty($img_w)) {
				$image_width = $img_w;
			} else {
				$image_width = 228;
			}

			if (!empty($img_h)) {
				$image_height = $img_h;
			} else {
				$image_height = 228;
			}

			$data['image'] = ( $blog_info['image'] ) ? $this->model_tool_image->resize($blog_info['image'], $img_w, $img_h) : false;

			$data['continue'] = $this->url->link('common/home');

			$data['products'] = array();

			$results = $this->model_catalog_oct_blog->getBlogProducts($blog_id);

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
        $data['product_stickers'] = array();

        if (isset($product_stickers_data['status']) && $product_stickers_data['status']) {
          $this->load->model('catalog/product_stickers');

          if ($result['product_stickers']) {
            $stickers = unserialize($result['product_stickers']);
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



        if ((float)$result['special']) {
			    $economy = round((($result['price'] - $result['special'])/($result['price'] + 0.01))*100, 0);
   			} else {
  				$economy = false;
   			}

        $dop_img = false;
        $results_img = $this->model_catalog_product->getProductImages($result['product_id']);

        if ($results_img) {

          $dop_img = $this->model_tool_image->resize($results_img[0]['image'], 320, 430);

        }

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => $data['description'],
					'price'       => $price,
                    'stick'       => $data['product_stickers'],
                    'economy'     => $economy,
                    'dop_img'     => $dop_img,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'])
				);
			}


			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/oct_blog_info', $data));
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/oct_blog/info', 'blog_id=' . $blog_id)
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
}
