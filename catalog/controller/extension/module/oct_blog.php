<?php
class ControllerExtensionModuleOctBlog extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/oct_blog');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_date_added'] = $this->language->get('text_date_added');
		$data['text_all_news'] = $this->language->get('text_all_news');

		$data['all_news'] = $this->url->link('product/oct_blog');

		$this->load->model('catalog/oct_blog');

		$this->load->model('tool/image');

		$data['blogs'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

    $data['position'] = $setting['position'];
    
		if (!empty($setting['blog'])) {
			$blogs = array_slice($setting['blog'], 0, (int)$setting['limit']);

			foreach ($blogs as $blog_id) {
				$blog_info = $this->model_catalog_oct_blog->getBlog($blog_id);

				if ($blog_info) {
					if ($blog_info['image']) {
						$image = $this->model_tool_image->resize($blog_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					$data['blogs'][] = array(
						'title'       => $blog_info['title'],
						'thumb'       => $image,
						'date_added'  => date($this->language->get('date_format_short'), strtotime($blog_info['date_added'])),
						'description' => utf8_substr(strip_tags(html_entity_decode($blog_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['desc_limit']) . '..',
						'href'        => $this->url->link('product/oct_blog/info', 'blog_id=' . $blog_info['blog_id'])
					);
				}
			}
		} else {

			$sort = 'b.date_added';

			$order = 'DESC';

			$data_x = array(
				'sort'  => $sort,
				'order' => $order,
				'start' => 0,
				'limit' => (int)$setting['limit']
			);

			$blogs = $this->model_catalog_oct_blog->getBlogs($data_x);

			foreach ($blogs as $blog) {

				if ($blog['image']) {
					$image = $this->model_tool_image->resize($blog['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				$data['blogs'][] = array(
					'title'       => $blog['title'],
					'thumb'       => $image,
					'date_added'  => date($this->language->get('date_format_short'), strtotime($blog['date_added'])),
					'description' => utf8_substr(strip_tags(html_entity_decode($blog['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['desc_limit']) . '..',
					'href'        => $this->url->link('product/oct_blog/info', 'blog_id=' . $blog['blog_id'])
				);
			}
		}

		if ($data['blogs']) {
			return $this->load->view('extension/module/oct_blog', $data);
		}
	}
}
