<?php
class ControllerExtensionModuleOctProductReviews extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/oct_product_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('oct_product_reviews_data', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['tab_setting'] = $this->language->get('tab_setting');
	
		$data['entry_status'] = $this->language->get('entry_status');
				
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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
			'href' => $this->url->link('extension/module/oct_product_reviews', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/oct_product_reviews', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['oct_product_reviews_data'])) {
			$data['oct_product_reviews_data'] = $this->request->post['oct_product_reviews_data'];
		} else {
			$data['oct_product_reviews_data'] = $this->config->get('oct_product_reviews_data');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/oct_product_reviews.tpl', $data));
	}

	public function install() {   
		$this->load->language('extension/module/oct_product_reviews');

    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('user/user_group');
    $this->load->model('extension/module/oct_product_reviews');

    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/oct_product_reviews');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/oct_product_reviews');

    $this->model_setting_setting->editSetting('oct_product_reviews_data', array(
			'oct_product_reviews_data' => array(
				'status' => '1'
      )
   	));        

    if (!in_array('oct_product_reviews', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'oct_product_reviews');
    }

    $this->model_extension_module_oct_product_reviews->makeDB();
    
    $this->session->data['success'] = $this->language->get('text_success_install');
  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('extension/module/oct_product_reviews');

		$this->model_extension_module_oct_product_reviews->removeDB();
    $this->model_extension_extension->uninstall('module', 'oct_product_reviews');
    $this->model_setting_setting->deleteSetting('oct_product_reviews_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/oct_product_reviews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}