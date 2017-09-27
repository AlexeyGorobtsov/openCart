<?php
class ControllerCatalogOctBlogSetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/oct_blog_setting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$this->load->model('catalog/oct_blog');

		$this->model_catalog_oct_blog->makeDB();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('blog', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('catalog/oct_blog_setting', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['entry_blog_desc_limit'] = $this->language->get('entry_blog_desc_limit');
    $data['entry_blog_image_thumb'] = $this->language->get('entry_blog_image_thumb');
    $data['entry_width'] = $this->language->get('entry_width');
    $data['entry_height'] = $this->language->get('entry_height');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['blog_desc_limit'])) {
			$data['error_blog_desc_limit'] = $this->error['blog_desc_limit'];
		} else {
			$data['error_blog_desc_limit'] = '';
		}

		if (isset($this->error['blog_image_thumb_width'])) {
			$data['error_blog_image_thumb_width'] = $this->error['blog_image_thumb_width'];
		} else {
			$data['error_blog_image_thumb_width'] = '';
		}

		if (isset($this->error['blog_image_thumb_height'])) {
			$data['error_blog_image_thumb_height'] = $this->error['blog_image_thumb_height'];
		} else {
			$data['error_blog_image_thumb_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_blog'),
			'href' => $this->url->link('catalog/oct_blog_setting', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('catalog/oct_blog_setting', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['blog_desc_limit'])) {
      	$data['blog_desc_limit'] = $this->request->post['blog_desc_limit'];
    } else {
      	$data['blog_desc_limit'] = $this->config->get('blog_desc_limit');
    }

    if (isset($this->request->post['blog_image_thumb_width'])) {
      	$data['blog_image_thumb_width'] = $this->request->post['blog_image_thumb_width'];
    } else {
      	$data['blog_image_thumb_width'] = $this->config->get('blog_image_thumb_width');
    }

    if (isset($this->request->post['blog_image_thumb_height'])) {
      	$data['blog_image_thumb_height'] = $this->request->post['blog_image_thumb_height'];
    } else {
      	$data['blog_image_thumb_height'] = $this->config->get('blog_image_thumb_height');
    }
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/oct_blog_setting.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'catalog/oct_blog_setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['blog_desc_limit']) {
			$this->error['blog_desc_limit'] = $this->language->get('error_blog_desc_limit');
		}

		if (!$this->request->post['blog_image_thumb_width']) {
			$this->error['blog_image_thumb_width'] = $this->language->get('error_blog_image_thumb_width');
		}

		if (!$this->request->post['blog_image_thumb_height']) {
			$this->error['blog_image_thumb_height'] = $this->language->get('error_blog_image_thumb_height');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) ) {
			
			$this->load->model('catalog/oct_blog');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 5;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_oct_blog->getBlogs($filter_data);

			foreach ($results as $result) {

				$json[] = array(
					'blog_id' => $result['blog_id'],
					'title'   => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		
		$this->response->setOutput(json_encode($json));
	}
}