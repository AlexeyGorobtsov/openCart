<?php
class ControllerExtensionModuleMegamenu extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('extension/module/megamenu');
		$this->load->model('extension/megamenu');
		$this->load->model('setting/setting');
		$this->cache->delete('octemplates');
		$this->document->setTitle($this->language->get('heading_title'));

			if (($this->request->server['REQUEST_METHOD'] == 'POST')  && isset($this->request->post['megamenu_status']) && $this->validateStatus()) {

			$this->model_setting_setting->editSetting('megamenu',$this->request->post);



			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'] . '&type=module', true));
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
			'href' => $this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error'] = $this->error['warning'];

			unset($this->error['warning']);
		} else {
			$data['error'] = '';
		}



		if (isset($this->request->post['megamenu_status'])) {
			$data['megamenu_status'] = $this->request->post['megamenu_status'];
		} else {
			$data['megamenu_status'] = $this->config->get('megamenu_status');
		}
		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_th_title'] = $this->language->get('text_th_title');
		$data['text_th_link'] = $this->language->get('text_th_link');
		$data['text_th_sort_order'] = $this->language->get('text_th_sort_order');
		$data['text_short_description'] = $this->language->get('text_short_description');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_action'] = $this->language->get('text_action');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['entry_status'] = $this->language->get('entry_status_module');
		$data['action'] = $this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true);
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['add'] = $this->url->link('extension/module/megamenu/insert', '&token=' . $this->session->data['token'], true);
    $data['refresh'] = $this->url->link('extension/module/megamenu/refresh', '&token=' . $this->session->data['token'], true);
		$data['delete'] = $this->url->link('extension/module/megamenu/delete', 'token=' . $this->session->data['token'], true);

		$data['all_items'] = array();

		$filter_data=array('sort'=>'sort_order');
		$all_items = $this->model_extension_megamenu->getItems($filter_data);


		foreach ($all_items as $item) {

			$item_desc = $this->model_extension_megamenu->getItemDescription($item['megamenu_id']);

			$data['all_items'][] = array(
				'id' 			=> $item['megamenu_id'],
				'title' 			=> $item['title'],
				'link' 			=> (isset($item_desc[$this->config->get('config_language_id')]['link'])) ? $item_desc[$this->config->get('config_language_id')]['link'] : '',
				'sort_order' 			=> $item['sort_order'],
				'edit' 				=> $this->url->link('extension/module/megamenu/edit', 'id=' . $item['megamenu_id'] . '&token=' . $this->session->data['token'], true)
			);
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/megamenu_list.tpl', $data));
	}

	public function edit() {
		$this->language->load('extension/module/megamenu');

		$this->load->model('extension/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {


			$this->model_extension_megamenu->editItem($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true));
		}

		$this->form();
	}

	public function insert() {

		$this->language->load('extension/module/megamenu');

		$this->load->model('extension/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_extension_megamenu->addItem($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true));
		}

		$this->form();
	}

	public function form() {
		$this->language->load('extension/module/megamenu');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/information');

//CKEditor
    if ($this->config->get('config_editor_default')) {
        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
    } else {
        $this->document->addScript('view/javascript/summernote/summernote.js');
        $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
        $this->document->addScript('view/javascript/summernote/opencart.js');
        $this->document->addStyle('view/javascript/summernote/summernote.css');
    }

		$this->load->model('extension/megamenu');
		$this->cache->delete('octemplates');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true)
		);

		if (isset($this->request->get['id'])) {
			$data['action'] = $this->url->link('extension/module/megamenu/edit', '&id=' . $this->request->get['id'] . '&token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/megamenu/insert', '&token=' . $this->session->data['token'], true);
		}

		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['lang'] = $this->language->get('lang');

		$data['cancel'] = $this->url->link('extension/module/megamenu', '&token=' . $this->session->data['token'], true);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_image'] = $this->language->get('text_image');
		$data['text_title'] = $this->language->get('text_title');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_short_description'] = $this->language->get('text_short_description');
		$data['text_status'] = $this->language->get('text_status');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_type'] = $this->language->get('text_type');
		$data['text_type_category'] = $this->language->get('text_type_category');
		$data['text_type_html'] = $this->language->get('text_type_html');
        $data['text_type_link'] = $this->language->get('text_type_link');
        $data['text_link_options_yes'] = $this->language->get('text_link_options_yes');
        $data['text_link_options'] = $this->language->get('text_link_options');
        $data['text_link_options_no'] = $this->language->get('text_link_options_no');
		$data['text_html_description'] = $this->language->get('text_html_description');
		$data['text_type_manufacturer'] = $this->language->get('text_type_manufacturer');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_type_information'] = $this->language->get('text_type_information');
		$data['text_information'] = $this->language->get('text_information');
		$data['text_type_product'] = $this->language->get('text_type_product');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_thumb'] = $this->language->get('text_thumb');


		$data['text_product_width'] = $this->language->get('text_product_width');
		$data['text_product_height'] = $this->language->get('text_product_height');

		$data['text_type_auth'] = $this->language->get('text_type_auth');
		$data['text_add_html'] = $this->language->get('text_add_html');


		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_html'] = $this->language->get('tab_html');
		$data['tab_options'] = $this->language->get('tab_options');
		$data['tab_add_html'] = $this->language->get('tab_add_html');
		$data['text_variant_category'] = $this->language->get('text_variant_category');
		$data['variant_category_simple'] = $this->language->get('variant_category_simple');
		$data['variant_category_full'] = $this->language->get('variant_category_full');
		$data['variant_category_full_image'] = $this->language->get('variant_category_full_image');
		$data['text_link'] = $this->language->get('text_link');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_category_show_subcategory'] = $this->language->get('text_category_show_subcategory');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_sort_order'] = $this->language->get('text_sort_order');
		$data['text_limit_item'] = $this->language->get('text_limit_item');
		$data['token'] = $this->session->data['token'];



		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->error['warning'])) {
			$data['error'] = $this->error['warning'];
		} else {
			$data['error'] = '';
		}

		if (isset($this->request->get['id'])) {
			$item = $this->model_extension_megamenu->getItem($this->request->get['id']);
			$item['options']=unserialize($item['options']);
		} else {
			$item = array();
		}

		if (isset($this->request->post['menu_type'])) {
			$data['menu_type'] = $this->request->post['menu_type'];
		} elseif (!empty($item['menu_type'])) {
			$data['menu_type'] = $item["menu_type"];
		} else {
			$data['menu_type'] = '';
		}

		if (isset($this->request->post['megamenu'])) {
			$data['megamenu'] = $this->request->post['megamenu'];
		} elseif (!empty($item)) {
			$data['megamenu'] = $this->model_extension_megamenu->getItemDescription($this->request->get['id']);
		} else {
			$data['megamenu'] = '';
		}


		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($item['status'])) {
			$data['status'] = $item['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($item['sort_order'])) {
			$data['sort_order'] = $item['sort_order'];
		} else {
			$data['sort_order'] = '0';
		}

		if (isset($this->request->post['limit_item'])) {
			$data['limit_item'] = $this->request->post['limit_item'];
		} elseif (!empty($item['limit_item'])) {
			$data['limit_item'] = $item['limit_item'];
		} else {
			$data['limit_item'] = 5;
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($item)) {
			$data['image'] = $item['thumb'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($item) && is_file(DIR_IMAGE . $item['thumb'])) {
			$data['thumb'] = $this->model_tool_image->resize($item['thumb'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['use_add_html'])) {
			$data['use_add_html'] = (int)$this->request->post['use_add_html'];
		} elseif (!empty($item['use_add_html'])) {
			$data['use_add_html'] = (int)$item['use_add_html'];
		} else {
			$data['use_add_html'] = '0';
		}

        if (isset($this->request->post['use_target_blank'])) {
			$data['use_target_blank'] = (int)$this->request->post['use_target_blank'];
		} elseif (!empty($item['use_target_blank'])) {
			$data['use_target_blank'] = (int)$item['use_target_blank'];
		} else {
			$data['use_target_blank'] = '0';
		}

		##category start
		if (isset($this->request->post['variant_category'])) {
			$data['variant_category'] = $this->request->post['variant_category'];
		} elseif (!empty($item['options']['variant_category'])) {
			$data['variant_category']=$item['options']['variant_category'];
		} else {
			$data['variant_category'] = '';
		}



			if (isset($this->request->post['category_show_subcategory'])) {
			$data['category_show_subcategory'] = $this->request->post['category_show_subcategory'];
		} elseif (!empty($item['options']['category_show_subcategory'])) {
			$data['category_show_subcategory']=$item['options']['category_show_subcategory'];
		} else {
			$data['category_show_subcategory'] = '';
		}
		if (isset($this->request->post['categories_list'])) {

			$categories_list_selected = $this->request->post['categories_list'];
		} elseif (!empty($item['options']['categories_list'])) {
			$categories_list_selected=$item['options']['categories_list'];
		} else {
			$categories_list_selected = array();
		}

		foreach($categories_list_selected as $k=>$v){
		$data['categories_list_selected'][$v]=1;
		}




		//categories list
		$data['categories_list'] = array();
		$results = $this->model_catalog_category->getCategories(array('start'=>0,'limit'=>2999,'sort'=>'name'));
		foreach ($results as $result) {
				$data['categories_list'][] = array(
					'category_id' => $result['category_id'],
					'name'        => ($result['name'])
				);
			}

		##category end

		##manufacturer start
		$data['manufacturers_list'] = array();
		$results = $this->model_catalog_manufacturer->getManufacturers(array('start'=>0,'limit'=>2999,'sort'=>'name'));
		foreach ($results as $result) {
				$data['manufacturers_list'][] = array(
					'manufacturer_id' => $result['manufacturer_id'],
					'name'        => ($result['name'])
				);
			}

		if (isset($this->request->post['manufacturers_list'])) {
			$manufacturers_list_selected = $this->request->post['manufacturers_list'];
		} elseif (!empty($item['options']['manufacturers_list'])) {
			$manufacturers_list_selected=$item['options']['manufacturers_list'];
		} else {
			$manufacturers_list_selected = array();
		}

		foreach($manufacturers_list_selected as $k=>$v){
		$data['manufacturers_list_selected'][$v]=1;
		}

		##manufacturer end

		##information start
		$data['informations_list'] = array();
		$results = $this->model_catalog_information->getInformations(array('start'=>0,'limit'=>2999,'sort'=>'title'));
		foreach ($results as $result) {
				$data['informations_list'][] = array(
					'information_id' => $result['information_id'],
					'title'        => ($result['title'])
				);
			}

		if (isset($this->request->post['informations_list'])) {
			$informations_list_selected = $this->request->post['informations_list'];
		} elseif (!empty($item['options']['informations_list'])) {
			$informations_list_selected=$item['options']['informations_list'];
		} else {
			$informations_list_selected = array();
		}

		foreach($informations_list_selected as $k=>$v){
		$data['informations_list_selected'][$v]=1;
		}

		##information end


		##product start

		if (isset($this->request->post['products_list'])) {
			$products_list_sel_tmp = $this->request->post['products_list'];
		} elseif (!empty($item['options']['products_list'])) {
			$products_list_sel_tmp=$item['options']['products_list'];
		} else {
			$products_list_sel_tmp = array();
		}

		$data['products_list_sel']=array();
		foreach($products_list_sel_tmp as $product_id){
		$product = $this->model_catalog_product->getProduct((int)$product_id);
		if(isset($product['product_id']))
		$data['products_list_sel'][]=array('product_id'=>$product['product_id'],'name'=>$product['name']);
		}

		if (isset($this->request->post['product_width'])) {
			$data['product_width'] = $this->request->post['product_width'];
		} elseif (!empty($item['options']['product_width'])) {
			$data['product_width']=$item['options']['product_width'];
		} else {
			$data['product_width'] = 50;
		}

		if (isset($this->request->post['product_height'])) {
			$data['product_height'] = $this->request->post['product_height'];
		} elseif (!empty($item['options']['product_height'])) {
			$data['product_height']=$item['options']['product_height'];
		} else {
			$data['product_height'] = 50;
		}

		##product end

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/megamenu_form.tpl', $data));
	}

	public function delete() {
		$this->language->load('extension/module/megamenu');

		$this->load->model('extension/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $id) {
				$this->model_extension_megamenu->deleteItem($id);
			}

			$this->session->data['success'] = $this->language->get('text_success');
		}

		$this->response->redirect($this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true));
	}

	protected function validateStatus() {
		if (!$this->user->hasPermission('modify', 'extension/module/megamenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/module/megamenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	protected function validate() {
		$this->error="";
		if (!$this->user->hasPermission('modify', 'extension/module/megamenu')) {
			if(isset($this->error['warning']))
			$this->error['warning'].= "<p>".$this->language->get('error_permission')."</p>";
			else
			$this->error['warning']= "<p>".$this->language->get('error_permission')."</p>";
		}


		foreach ($this->request->post['megamenu'] as $key => $value) {
			if(!trim($value['title']))
			{
			if(isset($this->error['warning']))
			$this->error['warning'].= "<p>".$this->language->get('error_title')."</p>";
			else
			$this->error['warning']= "<p>".$this->language->get('error_title')."</p>";
			}
		}

		if(!in_array($this->request->post['menu_type'],array("category","html","manufacturer","information","product","auth","link")))
		{
			if(isset($this->error['warning']))
			$this->error['warning'].= "<p>".$this->language->get('error_menu_type')."</p>";
			else
			$this->error['warning']= "<p>".$this->language->get('error_menu_type')."</p>";
		}


		//category
		if($this->request->post['menu_type']=="category" && !in_array($this->request->post['variant_category'],array("simple","full","full_image")))
		{
			if(isset($this->error['warning']))
			$this->error['warning'].= "<p>".$this->language->get('error_menu_type')."</p>";
			else
			$this->error['warning']= "<p>".$this->language->get('error_menu_type')."</p>";
		}


		//html
		if($this->request->post['menu_type']=="html")
		{
			foreach ($this->request->post['megamenu'] as $key => $value) {
			if(isset($value['html']) && !trim($value['html']))
			{
			if(isset($this->error['warning']))
			$this->error['warning'].= "<p>".$this->language->get('error_html')."</p>";
			else
			$this->error['warning']= "<p>".$this->language->get('error_html')."</p>";
			}
		}
		}











		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function refresh() {
		$this->language->load('extension/module/megamenu');

		// $r = $this->db->query("ALTER TABLE `" . DB_PREFIX . "megamenu` DROP COLUMN link");
		
		// if ($r->num_rows == 0) {
		// 	$msqlr = "ALTER TABLE  `" . DB_PREFIX . "megamenu_description` ADD  `link` varchar(255) AFTER  `title`";
		// 	$queryr = $this->db->query($msqlr);
		// }	

		$this->db->query("ALTER TABLE  `" . DB_PREFIX . "megamenu` ADD `limit_item` int(11) NOT NULL DEFAULT '5' AFTER `menu_type`");


		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('extension/module/megamenu', 'token=' . $this->session->data['token'], true));
	}


	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "megamenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `menu_type` varchar(32) NOT NULL,
  `limit_item` int(11) NOT NULL DEFAULT '5',
  `options` text,
  `sort_order` int(10) NOT NULL DEFAULT '0',
  `use_add_html` int(1) DEFAULT '0',
  `use_target_blank` int(1) DEFAULT '0',
  `thumb` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "megamenu_description` (
  `megamenu_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `megamenu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `html` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `add_html` text NOT NULL,
  PRIMARY KEY (`megamenu_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");


	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "megamenu`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "megamenu_description`");
	}

}
