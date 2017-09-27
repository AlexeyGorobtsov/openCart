<?php
class ControllerExtensionModuleProductTabs extends Controller {
	private $error = array();

	public function index() {
    $this->document->addScript('view/javascript/summernote/summernote.js');
    $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
    $this->document->addScript('view/javascript/summernote/opencart.js');
    $this->document->addStyle('view/javascript/summernote/summernote.css');

		$this->load->language('extension/module/product_tabs');
		$this->load->model('extension/module/product_tabs');
		$this->load->model('catalog/product_tabs');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('product_tabs', $this->request->post);

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
		$data['text_select'] = $this->language->get('text_select');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_bulk_addition'] = $this->language->get('tab_bulk_addition');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_categoriers'] = $this->language->get('entry_categoriers');
		$data['entry_tabs'] = $this->language->get('entry_tabs');
		$data['entry_text'] = $this->language->get('entry_text');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_tab'] = $this->language->get('button_add_tab');
		$data['button_remove_tab'] = $this->language->get('button_remove_tab');
	
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
			'href' => $this->url->link('extension/module/product_tabs', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/product_tabs', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['product_tabs_data'])) {
			$data['product_tabs_data'] = $this->request->post['product_tabs_data'];
		} else {
			$data['product_tabs_data'] = $this->config->get('product_tabs_data');
		}

		$categories = $this->model_extension_module_product_tabs->getCategories();

    $data['categories'] = $this->getAllCategories($categories);

    $data['tabs'] = $this->model_catalog_product_tabs->getProductTabs();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/product_tabs.tpl', $data));
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
		$this->load->language('extension/module/product_tabs');

		$this->load->model('extension/module/product_tabs');
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('user/user_group');
    
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/product_tabs');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/product_tabs');
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'catalog/product_tabs');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'catalog/product_tabs');

    $this->model_setting_setting->editSetting('product_tabs', array(
        'product_tabs_data' => array(
          'status'   => '1'
        )
      )
		);

    if (!in_array('product_tabs', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'product_tabs');
    }

    $this->model_extension_module_product_tabs->makeDB();

    $this->session->data['success'] = $this->language->get('text_success_install');
  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
		$this->load->model('extension/module/product_tabs');

		$this->model_extension_module_product_tabs->removeDB();
    $this->model_extension_extension->uninstall('module', 'product_tabs');
    $this->model_setting_setting->deleteSetting('product_tabs_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/product_tabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function tap_processing()	{
		$json = array();
		
		if (!$this->user->hasPermission('modify', 'extension/module/product_tabs')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			if (isset($this->request->request['type'])) {
				if (isset($this->request->request['module_categories']) && isset($this->request->request['module_tab']) && isset($this->request->request['tab_description'])) {
					
					$this->load->model('extension/module/product_tabs');
					$this->load->language('extension/module/product_tabs');

					if (empty($this->request->request['module_tab'])) {
						$json['error'] = $this->language->get('error_enter_tab');
					}

					if (isset($this->request->request['type']) == 'add') {
						foreach ($this->request->request['tab_description'] as $language_id => $value) {
							if (empty($value['text'])) {
								$json['error'] = $this->language->get('error_enter_text');
								break;
							}
						}
					}


					if (!isset($json['error'])) {
						if ($this->request->request['type'] == 'add') {
							$status = $this->model_extension_module_product_tabs->updateTab($this->request->request['module_categories'], $this->request->request['module_tab'], $this->request->request['tab_description']);
						} else {
							$status = $this->model_extension_module_product_tabs->removeTab($this->request->request['module_categories'], $this->request->request['module_tab']);
						}

						if ($status) {
							$json['success'] = $this->language->get('text_bulk_tabs_success');
						} else {
							$json['error'] = $this->language->get('error_select_produts');
						}

						$this->cache->delete('product');
					}
					
				}	
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
