<?php
class ControllerExtensionModuleCategory extends Controller {
	        
        public function index() {
          $this->load->language('extension/module/category');
      
          $data['heading_title'] = $this->language->get('heading_title');
      
          if (isset($this->request->get['path'])) {
            $parts = explode('_', (string)$this->request->get['path']);
          } else {
            $parts = array();
          }
          
          if (isset($parts[0])) {
            $data['category_id'] = $parts[0];
          } else {
            $data['category_id'] = 0;
          }
      
          if (isset($parts[1])) {
            $data['child_id'] = $parts[1];
          } else {
            $data['child_id'] = 0;
          }
          
          if (isset($parts[2])) {
            $data['child2_id'] = $parts[2];
          } else {
            $data['child2_id'] = 0;
          }
      
          $this->load->model('catalog/category');
      
          $this->load->model('catalog/product');
      
          $result_all_categories = $this->cache->get('octemplates.module_category.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id'));
          
          if (!$result_all_categories) {
            $categories = $this->model_catalog_category->getCategories(0);  
            
            foreach ($categories as $category) {
              $children_data = array();
              $children = $this->model_catalog_category->getCategories($category['category_id']);
              
              foreach ($children as $child) {
                $children_data_level2 = array();
                $children_level2 = $this->model_catalog_category->getCategories($child['category_id']);       
                
                foreach ($children_level2 as $child_level2) {
                  $data_level2 = array(
                    'filter_category_id'  => $child_level2['category_id'],
                    'filter_sub_category' => true
                  );

                  $children_data_level2[] = array(
                    'category_id' => $child_level2['category_id'],
                    'name'  =>  $child_level2['name'],
                    'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_level2['category_id']),
                    'id' => $category['category_id']. '_' . $child['category_id']. '_' . $child_level2['category_id']
                  );
                }

                $children_data[] = array(
                  'category_id' => $child['category_id'],
                  'name'        => $child['name'],
                  'children2'    => $children_data_level2,
                  'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']) 
                );    
              }
        
              $result_all_categories[] = array(
                'category_id' => $category['category_id'],
                'name'        => $category['name'],
                'children'    => $children_data,        
                'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
              );  
            }
      
            $this->cache->set('octemplates.module_category.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id'), $result_all_categories);
          }

          $data['categories'] = $result_all_categories;

          return $this->load->view('extension/module/category', $data);
        }

        public function old_index() {
		$this->load->language('extension/module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();

			if ($category['category_id'] == $data['category_id']) {
				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach($children as $child) {
					$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
			}

			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}

		return $this->load->view('extension/module/category', $data);
	}
}