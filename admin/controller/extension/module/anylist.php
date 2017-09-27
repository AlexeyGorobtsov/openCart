<?php
class ControllerExtensionModuleAnylist extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('extension/module/anylist');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('catalog/product');
        $this->load->model('tool/image'); 
        $this->load->model('extension/module');



        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            
           	if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('anylist', $this->request->post);
                
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
                
			}
    
            $this->session->data['success'] = $this->language->get('text_success');           
           $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }
        
        
        
				
		$data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_autoplay'] = $this->language->get('entry_autoplay');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_view_grid'] = $this->language->get('text_view_grid');
		$data['text_view_list'] = $this->language->get('text_view_list');
		$data['text_period'] = $this->language->get('text_period');
		
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_code'] = $this->language->get('entry_code');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_image'] = $this->language->get('text_image');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_titlelink'] = $this->language->get('entry_titlelink');
		$data['text_cat_desc'] = $this->language->get('text_cat_desc');
        
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_products'] = $this->language->get('entry_products');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_limit_help'] = $this->language->get('entry_limit_help');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_selection'] = $this->language->get('entry_selection');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_sort_descending'] = $this->language->get('entry_sort_descending');
		$data['entry_latest_text'] = $this->language->get('entry_latest_text');
		$data['entry_latest_products'] = $this->language->get('entry_latest_products');
		$data['entry_specials_text'] = $this->language->get('entry_specials_text');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
        if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
        
		if (isset($this->error['dimension'])) {
			$data['error_dimension'] = $this->error['dimension'];
		} else {
			$data['error_dimension'] = array();
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/anylist', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/anylist', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}
        
        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
        
        if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		
        if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/anylist', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/anylist', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		$data['token'] = $this->session->data['token'];
		$data['modules'] = array();
		
			
        
        if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
        
        
        if (isset($this->request->post['autoplay'])) {
			$data['autoplay'] = $this->request->post['autoplay'];
		} elseif (!empty($module_info)) {
			$data['autoplay'] = $module_info['autoplay'];
		} else {
			$data['autoplay'] = '1';
		}
        
        
        if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = '20';
		}
        
        if (!isset($module_info['products_list'])) {
			$module_info['products_list'] = false;
		}        
        
        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
     
            $data['modules'][0] = $module_info['anylist_module']['0'];
        
		}
         
                
		for($i=0; $i<count($data['modules']); $i++) {

            $data['products_list_sel'] = array();
            
            
           
            
			if (!empty($module_info['anylist_module']['0']['products_list'])) {
			 
             
             foreach($module_info['anylist_module']['0']['products_list'] as $product_id){		
        		$product = $this->model_catalog_product->getProduct((int)$product_id);				
        		if(isset($product['product_id']))
        		$data['products_list_sel'][]=array('product_id'=>$product['product_id'],'name'=>$product['name']);
		      }
             
				
			}
            
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 200, 200);
            
            if (isset($this->request->post['anylist_module'][0]['image']) && is_file(DIR_IMAGE . $this->request->post['anylist_module'][0]['image'])) {
    			$data['thumb'] = $this->model_tool_image->resize($this->request->post['anylist_module'][0]['image'], 200, 200);
    			$data['thumb_hidden'] = $this->request->post['anylist_module'][0]['image'];
    			
    		} elseif (!empty($data['modules'][$i]['image']) && is_file(DIR_IMAGE . $data['modules'][$i]['image'])) {
    			$data['thumb'] = $this->model_tool_image->resize($data['modules'][$i]['image'], 200, 200);
                $data['thumb_hidden'] = $data['modules'][$i]['image'];
    		}
            
    		$data['placeholder_thumb'] = $this->model_tool_image->resize('no_image.png', 200, 200);
            
     
            
            
             if (isset($data['modules'][$i]['module_image']) && $data['modules'][$i]['module_image'] != "") {
            
            $data['modules'][$i]['module_image_value'] = $data['modules'][$i]['module_image'];    
            $data['modules'][$i]['module_image'] = $this->model_tool_image->resize($data['modules'][$i]['module_image'], 70, 70);
        } else {
            $data['modules'][$i]['module_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
        }
            
		}	
        
        	
        
        
        $data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);

		$data['prodfields'] = array();
		//  GET product table structure
		$p = $this->model_catalog_product->getProducts(array('start'=>0,'limit'=>1));
		if ($p[0]) {
			foreach($p[0] as $f=>$v) {
				$data['prodfields'][] = $f;
				if ($f=='viewed') break;
			}
		}

		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(0);

		$this->load->model('catalog/manufacturer');
		$data['manufacturers'] = $results = $this->model_catalog_manufacturer->getManufacturers();

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();


        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        
		$this->response->setOutput($this->load->view('extension/module/anylist.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/anylist')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

	
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>