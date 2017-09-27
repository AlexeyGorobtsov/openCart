<?php
class ControllerExtensionModuleProductStickers extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/product_stickers');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/module/product_stickers');
		$this->load->model('catalog/product_stickers');
		
		$data['token'] = $this->session->data['token'];

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('product_stickers', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_all_categories'] = $this->language->get('text_all_categories');
		$data['text_col_name'] = $this->language->get('text_col_name');
		$data['text_col_allow'] = $this->language->get('text_col_allow');
		$data['text_col_value'] = $this->language->get('text_col_value');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_bulk_addition'] = $this->language->get('tab_bulk_addition');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_categoriers'] = $this->language->get('entry_categoriers');
		$data['entry_stickers'] = $this->language->get('entry_stickers');
		$data['entry_filters'] = $this->language->get('entry_filters');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_status'] = $this->language->get('entry_date_status');
		$data['entry_quantity_status'] = $this->language->get('entry_quantity_status');
		$data['entry_viewed_status'] = $this->language->get('entry_viewed_status');
		$data['entry_sell_status'] = $this->language->get('entry_sell_status');
		$data['entry_special_status'] = $this->language->get('entry_special_status');
		$data['entry_discount_status'] = $this->language->get('entry_discount_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_stickers'] = $this->language->get('button_add_stickers');
	
		$data['date_start'] = date('Y-m-d');
	
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/product_stickers', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['product_stickers_data'])) {
			$data['product_stickers_data'] = $this->request->post['product_stickers_data'];
		} else {
			$data['product_stickers_data'] = $this->config->get('product_stickers_data');
		}

		$categories = $this->model_extension_module_product_stickers->getCategories();

    $data['categories'] = $this->getAllCategories($categories);

		$data['stickers'] = $this->model_catalog_product_stickers->getProductStickers();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/product_stickers.tpl', $data));
	}

	private function getAllCategories($categories, $parent_id = 0, $parent_name = '') {
		$output = array();

		if (array_key_exists($parent_id, $categories)) {
			if ($parent_name != '') {
				$parent_name .= ' &gt; ';
			}

			foreach ($categories[$parent_id] as $category) {
				$output[$category['category_id']] = array(
					'category_id' => $category['category_id'],
					'name'        => $parent_name . $category['name']
				);

				$output += $this->getAllCategories($categories, $category['category_id'], $parent_name . $category['name']);
			}
		}

    uasort($output, array($this, 'sortByName'));
    
		return $output;
	}

  function sortByName($a, $b) {
    return strcmp($a['name'], $b['name']);
  }

	public function install() {
		$this->load->language('extension/module/product_stickers');

		$this->load->model('extension/module/product_stickers');
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('user/user_group');
    
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/product_stickers');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/product_stickers');

    $this->model_setting_setting->editSetting('product_stickers', array(
        'product_stickers_data' => array(
          'status'   => '1'
        )
      )
		);

    if (!in_array('product_stickers', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'product_stickers');
    }

    $this->model_extension_module_product_stickers->makeDB();

    $this->session->data['success'] = $this->language->get('text_success_install');

  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
		$this->load->model('extension/module/product_stickers');

		$this->model_extension_module_product_stickers->removeDB();
    $this->model_extension_extension->uninstall('module', 'product_stickers');
    $this->model_setting_setting->deleteSetting('product_stickers_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/product_stickers')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function add_stickers()	{
		$json = array();
		
		if (!$this->user->hasPermission('modify', 'extension/module/product_stickers')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			if (isset($this->request->request['module_categories']) || isset($this->request->request['module_stickers'])) {
				
				$this->load->model('extension/module/product_stickers');
				$this->load->language('extension/module/product_stickers');

				if (isset($this->request->request['module_stickers'])) {
					$stickers = $this->request->request['module_stickers'];
				} else {
					$stickers = array();
				}

				$filters = array(
					'date_status' => (isset($this->request->request['date_status']) && $this->request->request['date_status']) ? $this->request->request['date_status'] : '',
					'quantity_status' => (isset($this->request->request['quantity_status']) && $this->request->request['quantity_status']) ? $this->request->request['quantity_status'] : '',
					'viewed_status' => (isset($this->request->request['viewed_status']) && $this->request->request['viewed_status']) ? $this->request->request['viewed_status'] : '',
					'sell_status' => (isset($this->request->request['sell_status']) && $this->request->request['sell_status']) ? $this->request->request['sell_status'] : '',
					'special_status' => (isset($this->request->request['special_status']) && $this->request->request['special_status']) ? $this->request->request['special_status'] : '',
					'discount_status' => (isset($this->request->request['discount_status']) && $this->request->request['discount_status']) ? $this->request->request['discount_status'] : '',
					'date' => (isset($this->request->request['date'])) ? $this->request->request['date'] : '',
					'quantity' => (isset($this->request->request['quantity'])) ? (int)$this->request->request['quantity'] : 0,
					'viewed' => (isset($this->request->request['viewed'])) ? (int)$this->request->request['viewed'] : 0,
					'sell' => (isset($this->request->request['sell'])) ? (int)$this->request->request['sell'] : 0
				);

				$status = $this->model_extension_module_product_stickers->updateStickers($this->request->request['module_categories'], $stickers, $filters);

				if ($status) {
					$json['success'] = $this->language->get('text_bulk_stickers_success');
				} else {
					$json['error'] = $this->language->get('text_bulk_stickers_error');
				}

				$this->cache->delete('product');
			}	
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
