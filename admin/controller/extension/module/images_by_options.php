<?php
class ControllerExtensionModuleImagesByOptions extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/images_by_options');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		$data['token'] = $this->session->data['token'];

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('images_by_options', $this->request->post);

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
		$data['text_options'] = $this->language->get('text_options');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');

		$data['tab_setting'] = $this->language->get('tab_setting');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_allow_zoom'] = $this->language->get('entry_allow_zoom');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
	
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
			'href' => $this->url->link('extension/module/images_by_options', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/images_by_options', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['images_by_options_data'])) {
			$data['images_by_options_data'] = $this->request->post['images_by_options_data'];
		} else {
			$data['images_by_options_data'] = $this->config->get('images_by_options_data');
		}

		$this->load->model('catalog/option');
		$data['options'] = array();

    foreach ($this->model_catalog_option->getOptions() as $product_option) {
	  	if ($product_option['type'] == 'select' || $product_option['type'] == 'image' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox') {
	  		$data['options'][] = array(
	        'option_id'  => $product_option['option_id'],
	        'name'       => $product_option['name']
	      );   
	  	}
    }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/images_by_options.tpl', $data));
	}

	public function install() {
		$this->load->language('extension/module/images_by_options');

		$this->load->model('extension/module/images_by_options');
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('user/user_group');
    
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/images_by_options');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/images_by_options');

    $this->model_setting_setting->editSetting('images_by_options', array(
        'images_by_options_data' => array(
          'status'   => '1',
          'allow_zoom'   => '1',
          'allowed_options' => array()
        )
      )
		);

    if (!in_array('images_by_options', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'images_by_options');
    }

    $this->model_extension_module_images_by_options->makeDB();

    $this->session->data['success'] = $this->language->get('text_success_install');
  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
		$this->load->model('extension/module/images_by_options');

		$this->model_extension_module_images_by_options->removeDB();
    $this->model_extension_extension->uninstall('module', 'images_by_options');
    $this->model_setting_setting->deleteSetting('images_by_options_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/images_by_options')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateApprove() {
		if (!$this->user->hasPermission('modify', 'extension/module/images_by_options')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
