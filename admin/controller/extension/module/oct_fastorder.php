<?php
class ControllerExtensionModuleOctFastorder extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/oct_fastorder');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('view/javascript/oct_fastorder/jquery.minicolors.min.js');
		$this->document->addStyle('view/javascript/oct_fastorder/jquery.minicolors.css');

		$this->load->model('setting/setting');
		$this->load->model('localisation/country');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('oct_fastorder_data', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_display'] = $this->language->get('tab_display');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_customer_groups'] = $this->language->get('entry_customer_groups');
		$data['entry_backgorund_color_block_border'] = $this->language->get('entry_backgorund_color_block_border');
		$data['entry_backgorund_color_block_heading'] = $this->language->get('entry_backgorund_color_block_heading');
		$data['entry_text_color_block_heading'] = $this->language->get('entry_text_color_block_heading');
		$data['entry_backgorund_color_block_body'] = $this->language->get('entry_backgorund_color_block_body');
		$data['entry_text_color_block_body'] = $this->language->get('entry_text_color_block_body');
		$data['entry_backgorund_color_remove_button'] = $this->language->get('entry_backgorund_color_remove_button');
		$data['entry_text_color_remove_button'] = $this->language->get('entry_text_color_remove_button');
		$data['entry_backgorund_color_quantity_button'] = $this->language->get('entry_backgorund_color_quantity_button');
		$data['entry_text_color_quantity_button'] = $this->language->get('entry_text_color_quantity_button');
		$data['entry_backgorund_color_checkout_button'] = $this->language->get('entry_backgorund_color_checkout_button');
		$data['entry_text_color_checkout_button'] = $this->language->get('entry_text_color_checkout_button');
		$data['entry_mask'] = $this->language->get('entry_mask');
		$data['entry_mask_info'] = $this->language->get('entry_mask_info');

		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country_and_region'] = $this->language->get('entry_country_and_region');
		$data['entry_default_country'] = $this->language->get('entry_default_country');
		$data['entry_default_region'] = $this->language->get('entry_default_region');
		$data['entry_default_city'] = $this->language->get('entry_default_city');
		$data['entry_cart_position'] = $this->language->get('entry_cart_position');
		$data['entry_cart_position_1'] = $this->language->get('entry_cart_position_1');
		$data['entry_cart_position_2'] = $this->language->get('entry_cart_position_2');
		$data['entry_registration'] = $this->language->get('entry_registration');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['default_country'])) {
			$data['error_default_country'] = $this->error['default_country'];
		} else {
			$data['error_default_country'] = '';
		}

		if (isset($this->error['default_region'])) {
			$data['error_default_region'] = $this->error['default_region'];
		} else {
			$data['error_default_region'] = '';
		}

		if (isset($this->error['default_city'])) {
			$data['error_default_city'] = $this->error['default_city'];
		} else {
			$data['error_default_city'] = '';
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
			'href' => $this->url->link('extension/module/oct_fastorder', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/oct_fastorder', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['oct_fastorder_data'])) {
			$data['oct_fastorder_data'] = $this->request->post['oct_fastorder_data'];
		} else {
			$data['oct_fastorder_data'] = $this->config->get('oct_fastorder_data');
		}

		$data['countries'] = array();

		$countries = $this->model_localisation_country->getCountries();

    foreach ($countries as $country) {
      $data['countries'][] = array(
        'country_id' => $country['country_id'],
        'name'       => $country['name'] . (($country['country_id'] == $this->config->get('config_country_id')) ? $this->language->get('text_default') : null)
      );
    }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/oct_fastorder', $data));
	}

	public function install() {   
		$this->load->language('extension/module/oct_fastorder');

    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('user/user_group');

    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/oct_fastorder');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/oct_fastorder');

    $this->model_setting_setting->editSetting('oct_fastorder_data', array(
				'oct_fastorder_data' => array(
				'status'                           => '1',
				'fax'                              => '1',
				'company'                          => '1',
				'address_1'                        => '1',
				'address_2'                        => '1',
				'postcode'                         => '0',
				'city'							 							 => '1',
				'comment'                          => '1',
				'country_and_region'							 => '1',
				'cart_position'							 			 => '2',
				'registration'							 			 => '1',
				'lastname'                         => '1',
				'customer_groups'                  => '1',
				'default_country'									 => $this->config->get('config_country_id'),
				'default_region'									 => $this->config->get('config_zone_id'),
				'default_city'										 => '',
				'backgorund_color_block_border'    => '',
				'backgorund_color_block_heading'   => '',
				'text_color_block_heading'         => '',
				'backgorund_color_block_body'      => '',
				'text_color_block_body'            => '',
				'backgorund_color_remove_button'   => '',
				'text_color_remove_button'         => '',
				'backgorund_color_quantity_button' => '',
				'text_color_quantity_button'       => '',
				'backgorund_color_checkout_button' => '',
				'text_color_checkout_button'       => '',
				'mask'   	   											 => '(999) 999-99-99'
      )
   	));        

    if (!in_array('oct_fastorder', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'oct_fastorder');
    }
    
    $this->session->data['success'] = $this->language->get('text_success_install');
  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');

    $this->model_extension_extension->uninstall('module', 'oct_fastorder');
    $this->model_setting_setting->deleteSetting('oct_fastorder_data');
  }

  public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}	

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/oct_fastorder')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['oct_fastorder_data'] as $key => $field) {
      if (empty($field) && $key == "default_country") {
        $this->error['default_country'] = $this->language->get('error_default_country');
      }

      if (empty($field) && $key == "default_region") {
        $this->error['default_region'] = $this->language->get('error_default_region');
      }

      if (empty($field) && $key == "default_city") {
        $this->error['default_city'] = $this->language->get('error_default_city');
      }
    }

		return !$this->error;
	}
}