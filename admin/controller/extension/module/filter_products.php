<?php
class ControllerExtensionModuleFilterProducts extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/filter_products');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('catalog/option');
		$this->load->model('catalog/attribute');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('filter_products', $this->request->post);

			$this->cache->delete('octemplates.filter_options');
			$this->cache->delete('octemplates.filter_attributes');
			$this->cache->delete('octemplates.filter_manufacturers');

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_show_like_select'] = $this->language->get('text_show_like_select');
		$data['text_show_like_radio'] = $this->language->get('text_show_like_radio');
		$data['text_show_like_checkbox'] = $this->language->get('text_show_like_checkbox');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_update_on_button'] = $this->language->get('text_update_on_button');
		$data['text_update_on_changing_values'] = $this->language->get('text_update_on_changing_values');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_manufacturer_show_type'] = $this->language->get('entry_manufacturer_show_type');
		$data['entry_attribute_show_type'] = $this->language->get('entry_attribute_show_type');
		$data['entry_attribute_delimiter'] = $this->language->get('entry_attribute_delimiter');
		$data['entry_update_results_type'] = $this->language->get('entry_update_results_type');
		$data['entry_update_mask'] = $this->language->get('entry_update_mask');
		$data['entry_enable_manufacturer'] = $this->language->get('entry_enable_manufacturer');
		$data['entry_enable_options'] = $this->language->get('entry_enable_options');
		$data['entry_enable_attributes'] = $this->language->get('entry_enable_attributes');
		$data['entry_tax_class_id'] = $this->language->get('entry_tax_class_id');
		$data['entry_enable_categories'] = $this->language->get('entry_enable_categories');
		$data['entry_option_logic_type'] = $this->language->get('entry_option_logic_type');
		$data['entry_and'] = $this->language->get('entry_and');
		$data['entry_or'] = $this->language->get('entry_or');
		$data['entry_attribute_logic_type'] = $this->language->get('entry_attribute_logic_type');
		$data['entry_attribute_logic_type_inner'] = $this->language->get('entry_attribute_logic_type_inner');
		$data['entry_default_sort'] = $this->language->get('entry_default_sort');
		$data['entry_default_sort_1'] = $this->language->get('entry_default_sort_1');
		$data['entry_default_sort_2'] = $this->language->get('entry_default_sort_2');
		$data['entry_default_sort_3'] = $this->language->get('entry_default_sort_3');
		$data['entry_default_sort_4'] = $this->language->get('entry_default_sort_4');
		$data['entry_default_sort_5'] = $this->language->get('entry_default_sort_5');
		$data['entry_default_sort_6'] = $this->language->get('entry_default_sort_6');
		$data['entry_default_order'] = $this->language->get('entry_default_order');
		$data['entry_default_order_1'] = $this->language->get('entry_default_order_1');
		$data['entry_default_order_2'] = $this->language->get('entry_default_order_2');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cache'] = $this->language->get('button_cache');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->session->data['success'])) {
      $data['success'] = $this->session->data['success'];

      unset($this->session->data['success']);
    } else {
      $data['success'] = '';
    }

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
			'href' => $this->url->link('extension/module/filter_products', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/filter_products', 'token=' . $this->session->data['token'], true);
		$data['cache'] = $this->url->link('extension/module/filter_products/cache', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['filter_products_status'])) {
			$data['filter_products_status'] = $this->request->post['filter_products_status'];
		} else {
			$data['filter_products_status'] = $this->config->get('filter_products_status');
		}

		if (isset($this->request->post['filter_products_data'])) {
			$data['filter_products_data'] = $this->request->post['filter_products_data'];
		} else {
			$data['filter_products_data'] = $this->config->get('filter_products_data');
		}

		$data['product_options'] = array();

    $allowed_types = array('text','textarea','file','date','time','datetime');

    foreach ($this->model_catalog_option->getOptions() as $product_option) {
      if (!in_array($product_option['type'], $allowed_types)) {
        $data['product_options'][] = array(
          'option_id' => $product_option['option_id'],
          'name'      => $product_option['name']
        );   
      }           
    }

    $data['product_attributes'] = array();

    foreach ($this->model_catalog_attribute->getAttributes() as $product_attribute) {
      $data['product_attributes'][] = array(
        'attribute_id' => $product_attribute['attribute_id'],
        'name'         => $product_attribute['name']
      );            
    }

    $this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		$this->load->model('catalog/category');

    $data['product_categories'] = $this->model_catalog_category->getCategories();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/filter_products.tpl', $data));
	}

	public function install() {   
		$this->load->language('extension/module/filter_products');

    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
    $this->load->model('user/user_group');
    
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/filter_products');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/filter_products');

    $this->model_setting_setting->editSetting('filter_products', array(
    	'filter_products_status' => '1',
      'filter_products_data' => array(
        'manufacturer_show_type'     => 'checkbox',
        'attribute_show_type'        => 'checkbox',
        'attribute_delimiter'        => ',',
        'update_results_type'        => '0',
        'update_mask' 				       => '1',
        'enable_manufacturer'        => '1',
        'tax_class_id'					     => '0',
        'option_logic_type'			     => '2',
        'attribute_logic_type' 			 => '2',
				'attribute_logic_type_inner' => '2',
				'default_sort'               => 'p.quantity',
				'default_order'              => 'DESC',
        'product_options_array'      => array(),
        'product_attributes_array'   => array(),
        'product_categories_array'   => array()
      ))
		);        

		if (!in_array('filter_products', $this->model_extension_extension->getInstalled('module'))) {
		  $this->model_extension_extension->install('module', 'filter_products');
		}
      
    $this->session->data['success'] = $this->language->get('text_success_install');
  }

  public function cache() {
		$this->load->language('extension/module/filter_products');
		
		$this->cache->delete('octemplates.filter_options');
		$this->cache->delete('octemplates.filter_attributes');
		$this->cache->delete('octemplates.filter_manufacturers');

		$this->session->data['success'] = $this->language->get('text_success_cache');

		$this->response->redirect($this->url->link('extension/module/filter_products', 'token=' . $this->session->data['token'], true));
	}

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');

    $this->model_extension_extension->uninstall('module', 'filter_products');
    $this->model_setting_setting->deleteSetting('filter_products_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/filter_products')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}