<?php
class ModelExtensionModuleFilterProducts extends Model {
	public function getProductsByCategoryData($category_id) {
		$filter_products_data = $this->config->get('filter_products_data');
		$customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

		$options = array();
		$attributes = array();
		$manufacturers = array();
		$prices = array();

		// price_slider
		$product_price_query = $this->db->query("SELECT 
			min(coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1), 
			(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price)) AS price_min,
			max(coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1), 
			(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price)) AS price_max 
			FROM " . DB_PREFIX . "product p
			LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (pov.product_id = p.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = p.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p2s.product_id = p.product_id)
			WHERE p.status = '1' 
				AND p2c.category_id = '" . (int)$category_id . "'
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		$tax_class_identify = isset($filter_products_data['tax_class_id']) ? $filter_products_data['tax_class_id'] : '0';
		
		if ($product_price_query->row['price_min']) {
			$prices['price_min'] = round($this->currency->convert($this->tax->calculate($product_price_query->row['price_min'], $tax_class_identify, $this->config->get('config_tax')), $this->config->get('config_currency'), $this->session->data['currency']));
		}
		
		if ($product_price_query->row['price_max']) {
			$prices['price_max'] = round($this->currency->convert($this->tax->calculate($product_price_query->row['price_max'], $tax_class_identify, $this->config->get('config_tax')), $this->config->get('config_currency'), $this->session->data['currency']));
		}
		
		// options
		$options = $this->cache->get('octemplates.filter_options.c.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$category_id);

		if (!$options) {
			$product_option_query = $this->db->query("SELECT DISTINCT o.type, ov.image, od.name as 'op_name', ovd.* FROM `" . DB_PREFIX . "option_value_description` ovd
	    LEFT JOIN `" . DB_PREFIX . "option_value` ov ON (ovd.option_value_id = ov.option_value_id)
	    LEFT JOIN `" . DB_PREFIX . "option_description` od ON (ov.option_id = od.option_id)
	    LEFT JOIN `" . DB_PREFIX . "option` o ON (ov.option_id = o.option_id)
	    LEFT JOIN `" . DB_PREFIX . "product_option_value` pov ON(ovd.`option_value_id` = pov.`option_value_id`)
	    LEFT JOIN `" . DB_PREFIX . "product` p ON (pov.product_id = p.product_id)
	    LEFT JOIN `" . DB_PREFIX . "product_to_category` p2c ON(p.product_id = p2c.product_id)
			LEFT JOIN `" . DB_PREFIX . "product_to_store` p2s ON(p.product_id = p2s.product_id)
			WHERE p.status = '1' 
				AND p2c.category_id = '" . (int)$category_id . "' 
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id')."' 
				AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			ORDER BY o.sort_order, ov.sort_order ASC");

			$this->load->model('tool/image');

			foreach($product_option_query->rows as $option) {
				if (isset($filter_products_data['product_options_array'])) {
					if (in_array($option['option_id'], $filter_products_data['product_options_array'])) {
						if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
							if (!isset($options[$option['option_id']])) {
								$options[$option['option_id']] = array(
									'option_id' 					 		=> $option['option_id'],
									'name' 								 		=> $option['op_name'],
									'product_option_value' 		=> array(),
									'type'										=> $option['type']
								);
							}
							$options[$option['option_id']]['product_option_value'][] = array(
								'option_value_id'	=> $option['option_value_id'], 
								'name' 						=> $option['name'],
								'type'						=> $option['type'],
								'image'           => ($option['image']) ? $this->model_tool_image->resize($option['image'], 20, 20) : ''
							);
						}
					}
				}
			}

			$this->cache->set('octemplates.filter_options.c.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$category_id, $options);
		}

		// attributes
		$attributes = $this->cache->get('octemplates.filter_attributes.c.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$category_id);
			
		if (!$attributes) {
			$product_attribute_query = $this->db->query("SELECT DISTINCT pa.text, a.`attribute_id`, ad.`name`, ag.attribute_group_id FROM `" . DB_PREFIX . "product_attribute` pa
			LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.`attribute_id`)
			LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.`attribute_id`)
			LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (ag.attribute_group_id = a.`attribute_group_id`)
			LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (agd.attribute_group_id = ag.`attribute_group_id`)
			LEFT JOIN " . DB_PREFIX . "product p ON(p.product_id = pa.`product_id`)
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)
			WHERE p.status = '1' 
				AND p2c.category_id = '" . (int)$category_id . "' 
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
				AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			ORDER BY a.sort_order ASC");

			foreach($product_attribute_query->rows as $attribute) {
				if (isset($filter_products_data['product_attributes_array'])) {
					if (in_array($attribute['attribute_id'], $filter_products_data['product_attributes_array'])) {
						if (!isset($attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']])) {
							$attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']] = array(
								'name' 				=> $attribute['name'], 
								'attr_values' => array()
							);
						}

						foreach(explode((!empty($filter_products_data['attribute_delimiter']) ? $filter_products_data['attribute_delimiter'] : ','), $attribute['text']) as $text) {
							if (!in_array($text, $attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']]['attr_values'])) {
								$attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']]['attr_values'][] = $text;
							}
						}
					}
				}
			}

			$this->cache->set('octemplates.filter_attributes.c.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$category_id, $attributes);
		}

		// manufacturers
		$manufacturers = $this->cache->get('octemplates.filter_manufacturers.c.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$category_id);
			
		if (!$manufacturers) {
			$product_manufacturer_query = $this->db->query("SELECT DISTINCT m.`manufacturer_id`, m.`name` FROM `" . DB_PREFIX . "manufacturer` m
			LEFT JOIN " . DB_PREFIX . "product p ON (p.manufacturer_id = m.`manufacturer_id`)
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)
			WHERE p.status = '1' 
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
				AND p2c.category_id = '" . (int)$category_id . "' 
			ORDER BY m.sort_order ASC");

			$manufacturers = $product_manufacturer_query->rows;

			$this->cache->set('octemplates.filter_manufacturers.c.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$category_id, $manufacturers);
		}

		$products_data = array();

		if ($options) {
			$products_data['options'] = $options;
		}

		if ($attributes) {
			$products_data['attributes'] = $attributes;
		}

		if ($manufacturers && $filter_products_data['enable_manufacturer']) {
			$products_data['manufacturers'] = $manufacturers;
		}

		if ($prices) {
			$products_data['prices'] = $prices;
		}

		return $products_data;
	}

	public function getProductsByManufacturerData($manufacturer_id, $hide_block) {
		$filter_products_data = $this->config->get('filter_products_data');
		$customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

		$options = array();
		$attributes = array();
		$manufacturers = array();
		$prices = array();

		// price_slider
		$product_price_query = $this->db->query("SELECT 
			min(coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1), 
			(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price)) AS price_min,
			max(coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1), 
			(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price)) AS price_max 
			FROM " . DB_PREFIX . "product p
			LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (pov.product_id = p.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p2s.product_id = p.product_id)
			WHERE p.status = '1' 
				AND p.manufacturer_id = '" . (int)$manufacturer_id . "' 
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		$tax_class_identify = isset($filter_products_data['tax_class_id']) ? $filter_products_data['tax_class_id'] : '0';
		
		if ($product_price_query->row['price_min']) {
			$prices['price_min'] = $this->currency->convert($this->tax->calculate($product_price_query->row['price_min'], $tax_class_identify, $this->config->get('config_tax')), $this->config->get('config_currency'), $this->session->data['currency']);
		}
		
		if ($product_price_query->row['price_max']) {
			$prices['price_max'] = $this->currency->convert($this->tax->calculate($product_price_query->row['price_max'], $tax_class_identify, $this->config->get('config_tax')), $this->config->get('config_currency'), $this->session->data['currency']);
		}
		
		// options
		$options = $this->cache->get('octemplates.filter_options.m.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$manufacturer_id);

		if (!$options) {
			$product_option_query = $this->db->query("SELECT DISTINCT o.type, ov.image, od.name as 'op_name', ovd.* FROM `" . DB_PREFIX . "option_value_description` ovd
	    LEFT JOIN `" . DB_PREFIX . "option_value` ov ON (ovd.option_value_id = ov.option_value_id)
	    LEFT JOIN `" . DB_PREFIX . "option_description` od ON (ov.option_id = od.option_id)
	    LEFT JOIN `" . DB_PREFIX . "option` o ON (ov.option_id = o.option_id)
	    LEFT JOIN `" . DB_PREFIX . "product_option_value` pov ON(ovd.`option_value_id` = pov.`option_value_id`)
	    LEFT JOIN `" . DB_PREFIX . "product` p ON (pov.product_id = p.product_id)
	    LEFT JOIN `" . DB_PREFIX . "product_to_store` p2s ON (p2s.product_id = p.product_id)
			WHERE p.status = '1' 
				AND p.manufacturer_id = '" . (int)$manufacturer_id . "' 
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id')."' 
				AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			ORDER BY o.sort_order, ov.sort_order ASC");

			$this->load->model('tool/image');

			foreach($product_option_query->rows as $option) {
				if (isset($filter_products_data['product_options_array'])) {
					if (in_array($option['option_id'], $filter_products_data['product_options_array'])) {
						if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
							if (!isset($options[$option['option_id']])) {
								$options[$option['option_id']] = array(
									'option_id' 					 		=> $option['option_id'],
									'name' 								 		=> $option['op_name'],
									'product_option_value' 		=> array(),
									'type'										=> $option['type']
								);
							}
							$options[$option['option_id']]['product_option_value'][] = array(
								'option_value_id'	=> $option['option_value_id'], 
								'name' 						=> $option['name'],
								'type'						=> $option['type'],
								'image'           => ($option['image']) ? $this->model_tool_image->resize($option['image'], 20, 20) : ''
							);
						}
					}
				}
			}

			$this->cache->set('octemplates.filter_options.m.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$manufacturer_id, $options);
		}

		// attributes
		$attributes = $this->cache->get('octemplates.filter_attributes.m.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$manufacturer_id);
			
		if (!$attributes) {
			$product_attribute_query = $this->db->query("SELECT DISTINCT pa.text, a.`attribute_id`, ad.`name`, ag.attribute_group_id FROM `" . DB_PREFIX . "product_attribute` pa
			LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.`attribute_id`)
			LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.`attribute_id`)
			LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (ag.attribute_group_id = a.`attribute_group_id`)
			LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (agd.attribute_group_id = ag.`attribute_group_id`)
			LEFT JOIN " . DB_PREFIX . "product p ON(p.product_id = pa.`product_id`)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p2s.product_id = p.product_id)
			WHERE p.status = '1' 
				AND p.manufacturer_id = '" . (int)$manufacturer_id . "'
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
				AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' 
				AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			ORDER BY ag.sort_order ASC");

			foreach($product_attribute_query->rows as $attribute) {
				if (isset($filter_products_data['product_attributes_array'])) {
					if (in_array($attribute['attribute_id'], $filter_products_data['product_attributes_array'])) {
						if (!isset($attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']])) {
							$attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']] = array(
								'name' 				=> $attribute['name'], 
								'attr_values' => array()
							);
						}

						foreach(explode((!empty($filter_products_data['attribute_delimiter']) ? $filter_products_data['attribute_delimiter'] : ','), $attribute['text']) as $text) {
							if (!in_array($text, $attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']]['attr_values'])) {
								$attributes[$attribute['attribute_group_id']]['product_attribute_data'][$attribute['attribute_id']]['attr_values'][] = $text;
							}
						}
					}
				}
			}

			$this->cache->set('octemplates.filter_attributes.m.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$manufacturer_id, $attributes);
		}

		// manufacturers
		$manufacturers = $this->cache->get('octemplates.filter_manufacturers.m.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$manufacturer_id);
			
		if (!$manufacturers) {
			$product_manufacturer_query = $this->db->query("SELECT DISTINCT m.`manufacturer_id`, m.`name` FROM `" . DB_PREFIX . "manufacturer` m
			LEFT JOIN " . DB_PREFIX . "product p ON (p.manufacturer_id = m.`manufacturer_id`)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p2s.product_id = p.product_id)
			WHERE p.status = '1' 
				AND p.date_available <= NOW() 
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
				AND p.manufacturer_id = '" . (int)$manufacturer_id . "' 
			ORDER BY m.sort_order ASC");

			$manufacturers = $product_manufacturer_query->rows;

			$this->cache->set('octemplates.filter_manufacturers.m.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$manufacturer_id, $manufacturers);
		}

		$products_data = array();

		if ($options) {
			$products_data['options'] = $options;
		}

		if ($attributes) {
			$products_data['attributes'] = $attributes;
		}

		if ($manufacturers && $hide_block == true) {
			$products_data['manufacturers'] = $manufacturers;
		}

		if ($prices) {
			$products_data['prices'] = $prices;
		}

		return $products_data;
	}

	public function getProducts($data = array()) {
		$filter_products_data = $this->config->get('filter_products_data');
		$customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

		$sql = "SELECT p.product_id, count(*) AS product_total, ";
		
		if (isset($data["sort"]) && $data["sort"] == "rating") {
			$sql .= " (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 
			WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, ";
		}
		
		$sql .= "(SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, 
		(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special ";

		if ($data['filter_category_id']) {
			$sql .= "FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
		} else {
			$sql .= "FROM " . DB_PREFIX . "product p";
		}

		if ($data['filter_option_id']) {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_option_value` pov ON (pov.product_id = p.product_id)";
		}

		if ($data['filter_attribute_id']) {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_attribute` pa ON (pa.product_id = p.product_id)";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if ($data['filter_category_id']) {
			$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
		}
		
		$tax_class_identify = isset($filter_products_data['tax_class_id']) ? $filter_products_data['tax_class_id'] : '0';
		
		if ($data['filter_prices']) {
			if ($data['filter_prices']['min'] >= 0) {
				$sql .= " AND coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1),(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price) >=" . round($this->currency->convert($this->tax->calculate($data['filter_prices']['min'], $tax_class_identify, $this->config->get('config_tax')), $this->session->data['currency'], $this->config->get('config_currency')));
			}
			if ($data['filter_prices']['max'] > 0) {
				$sql .= " AND coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1),(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price) <=" . round($this->currency->convert($this->tax->calculate($data['filter_prices']['max'], $tax_class_identify, $this->config->get('config_tax')), $this->session->data['currency'], $this->config->get('config_currency')));
			}
		}

		if ($data['filter_option_id'] && isset($filter_products_data['option_logic_type'])) {
			$option_filters = array();

			if ($filter_products_data['option_logic_type'] == 2) {
				foreach ($data['filter_option_id'] as $option_id => $option_value) {
					if (in_array($option_id, $filter_products_data['product_options_array'])) {
						if (is_array($option_value)) {
							foreach ($option_value as $option_value_id) {
								$option_filters[] = "(pov.option_id = '" . (int)$option_id . "' AND pov.option_value_id = '" . (int)$option_value_id . "')";
							}
						} else {
							if (!empty($option_value)) {
								$option_filters[] = "(pov.option_id = '" . (int)$option_id . "' AND pov.option_value_id = '" . (int)$option_value . "')";
							}
						}
					}
				}

				if ($option_filters) {
					$sql .= " AND (" . implode(" OR ", $option_filters) . ")";
				}

			} else {

				if ($data['filter_option_id']) {
					$filter_option_id = array_filter($data['filter_option_id']);
					foreach ($filter_option_id as $option_id => $option_value) {
						if (in_array($option_id, $filter_products_data['product_options_array'])) {
							if (is_array($option_value)) {
								foreach ($option_value as $op_value_id) {
									$option_filters[] = "option_value_id IN (" . $op_value_id . ")";
								}
							} else {
								$option_filters[] = "option_value_id IN (" . $option_value . ")";
							}
						}
					}
				}

				foreach ($option_filters as $key => $option_value_id) {
					$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_option_value pov" . $key . " WHERE pov" . $key . ".product_id = p.product_id AND pov" . $key . "." . $option_value_id . ") ";
				}
			}
		}

		if ($data['filter_attribute_id']) {
			$attribute_filters = array();

			if ($filter_products_data['attribute_logic_type'] == 2) {
				foreach ($data['filter_attribute_id'] as $attribute_id => $attribute_value) {
					if (in_array($attribute_id, $filter_products_data['product_attributes_array'])) {
						if (is_array($attribute_value)) {
							foreach ($attribute_value as $attribute_value_id) {
								$attribute_filters[] = "(pa.attribute_id = '" . (int)$attribute_id . "' AND pa.text LIKE '%" . $this->db->escape($attribute_value_id) . "%')";
							}
						} else {
							if (!empty($attribute_value)) {
								$attribute_filters[] = "(pa.attribute_id = '" . (int)$attribute_id . "' AND pa.text LIKE '%" . $this->db->escape($attribute_value) . "%')";
							}
						}
					}
				}

				if ($attribute_filters) {
					$sql .= " AND (" . implode(" OR ", $attribute_filters) . ")";
				}

			} else {
				$a_delimiter = (!empty($filter_products_data['attribute_delimiter'])) ? $filter_products_data['attribute_delimiter'] : ',';
				$i = 0;

				$filter_attribute_id = array_filter($data['filter_attribute_id']);
				foreach ($filter_attribute_id as $attribute_id => $attribute_value) {
					if (in_array($attribute_id, $filter_products_data['product_attributes_array'])) {
						if ($filter_products_data['attribute_logic_type_inner'] == 2) {
							$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
							WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . implode("' OR pa" . $i . ".text = '", array_map(array($this->db, 'escape'), $attribute_value)) . "'" . " OR pa" . $i . ".text like '" . implode($a_delimiter . "%' OR pa" . $i . ".text like '", array_map(array($this->db, 'escape'), $attribute_value)) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . implode("' OR pa" . $i . ".text like '%" . $a_delimiter, array_map(array($this->db, 'escape'), $attribute_value)) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . implode($a_delimiter . "%' OR pa" . $i . ".text like '%" . $a_delimiter, array_map(array($this->db, 'escape'), $attribute_value)) . $a_delimiter . "%')) ";
							$i++;
						} else {
							if (is_array($attribute_value)) {
								foreach($attribute_value as $value) {
									$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
									WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . $this->db->escape($value) . "'" . " OR pa" . $i . ".text like '" . $this->db->escape($value) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($value) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($value) . $a_delimiter . "%'))";
									$i++;
								}
							} else {
								$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
									WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . $this->db->escape($attribute_value) . "'" . " OR pa" . $i . ".text like '" . $this->db->escape($attribute_value) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($attribute_value) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($attribute_value) . $a_delimiter . "%'))";
									$i++;
							}
						}
					}
				}
			}		
		}

		if ($data['filter_manufacturer_id'] && $filter_products_data['enable_manufacturer']) {
			if (is_array($data['filter_manufacturer_id'])) {
				$m_implode = array();

				foreach ($data['filter_manufacturer_id'] as $manufacturer_id) {
					$m_implode[] = "p.manufacturer_id = '" . $manufacturer_id . "'";
				}

				if ($m_implode) {
					$sql .= " AND (" . implode(' OR ', $m_implode) . ")";
				}
			} else {
				$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
			}
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.quantity',
			'p.price',
			'p.viewed',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} elseif ($data['sort'] == 'p.price') {
				$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		$product_data = array();

		if ($query->rows) {
			$this->load->model('catalog/product');
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}
		}

		return $product_data;
	}

	public function getTotalProductsByCategory($data) {
		$filter_products_data = $this->config->get('filter_products_data');
		$customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

		$sql =  "SELECT COUNT(DISTINCT p.product_id) as total,
			(SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			 	WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, 
			(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special 
			FROM " . DB_PREFIX . "product_to_category p2c 
			LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";

		if ($data['filter_option_id']) {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_option_value` pov ON (pov.product_id = p.product_id)";
		}

		if ($data['filter_attribute_id']) {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_attribute` pa ON (pa.product_id = p.product_id)";
		}
		
		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
		
		$tax_class_identify = isset($filter_products_data['tax_class_id']) ? $filter_products_data['tax_class_id'] : '0';
		
		if ($data['filter_prices']) {
			if ($data['filter_prices']['min'] >= 0) {
				$sql .= " AND coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1),(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price) >=" . round($this->currency->convert($this->tax->calculate($data['filter_prices']['min'], $tax_class_identify, $this->config->get('config_tax')), $this->session->data['currency'], $this->config->get('config_currency')));
			}
			if ($data['filter_prices']['max'] > 0) {
				$sql .= " AND coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1),(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price) <=" . round($this->currency->convert($this->tax->calculate($data['filter_prices']['max'], $tax_class_identify, $this->config->get('config_tax')), $this->session->data['currency'], $this->config->get('config_currency')));
			}
		}

		if ($data['filter_option_id'] && isset($filter_products_data['option_logic_type'])) {
			$option_filters = array();

			if ($filter_products_data['option_logic_type'] == 2) {
				foreach ($data['filter_option_id'] as $option_id => $option_value) {
					if (in_array($option_id, $filter_products_data['product_options_array'])) {
						if (is_array($option_value)) {
							foreach ($option_value as $option_value_id) {
								$option_filters[] = "(pov.option_id = '" . (int)$option_id . "' AND pov.option_value_id = '" . (int)$option_value_id . "')";
							}
						} else {
							if (!empty($option_value)) {
								$option_filters[] = "(pov.option_id = '" . (int)$option_id . "' AND pov.option_value_id = '" . (int)$option_value . "')";
							}
						}
					}
				}

				if ($option_filters) {
					$sql .= " AND (" . implode(" OR ", $option_filters) . ")";
				}

			} else {

				if ($data['filter_option_id']) {
					$filter_option_id = array_filter($data['filter_option_id']);
					foreach ($filter_option_id as $option_id => $option_value) {
						if (in_array($option_id, $filter_products_data['product_options_array'])) {
							if (is_array($option_value)) {
								foreach ($option_value as $op_value_id) {
									$option_filters[] = "option_value_id IN (" . $op_value_id . ")";
								}
							} else {
								$option_filters[] = "option_value_id IN (" . $option_value . ")";
							}
						}
					}
				}

				foreach ($option_filters as $key => $option_value_id) {
					$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_option_value pov" . $key . " WHERE pov" . $key . ".product_id = p.product_id AND pov" . $key . "." . $option_value_id . ") ";
				}
			}
		}

		if ($data['filter_attribute_id']) {
			$attribute_filters = array();

			if ($filter_products_data['attribute_logic_type'] == 2) {
				foreach ($data['filter_attribute_id'] as $attribute_id => $attribute_value) {
					if (in_array($attribute_id, $filter_products_data['product_attributes_array'])) {
						if (is_array($attribute_value)) {
							foreach ($attribute_value as $attribute_value_id) {
								$attribute_filters[] = "(pa.attribute_id = '" . (int)$attribute_id . "' AND pa.text LIKE '%" . $this->db->escape($attribute_value_id) . "%')";
							}
						} else {
							if (!empty($attribute_value)) {
								$attribute_filters[] = "(pa.attribute_id = '" . (int)$attribute_id . "' AND pa.text LIKE '%" . $this->db->escape($attribute_value) . "%')";
							}
						}
					}
				}

				if ($attribute_filters) {
					$sql .= " AND (" . implode(" OR ", $attribute_filters) . ")";
				}

			} else {
				$a_delimiter = (!empty($filter_products_data['attribute_delimiter'])) ? $filter_products_data['attribute_delimiter'] : ',';
				$i = 0;

				$filter_attribute_id = array_filter($data['filter_attribute_id']);
				foreach ($filter_attribute_id as $attribute_id => $attribute_value) {
					if (in_array($attribute_id, $filter_products_data['product_attributes_array'])) {
						if ($filter_products_data['attribute_logic_type_inner'] == 2) {
							$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
							WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . implode("' OR pa" . $i . ".text = '", array_map(array($this->db, 'escape'), $attribute_value)) . "'" . " OR pa" . $i . ".text like '" . implode($a_delimiter . "%' OR pa" . $i . ".text like '", array_map(array($this->db, 'escape'), $attribute_value)) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . implode("' OR pa" . $i . ".text like '%" . $a_delimiter, array_map(array($this->db, 'escape'), $attribute_value)) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . implode($a_delimiter . "%' OR pa" . $i . ".text like '%" . $a_delimiter, array_map(array($this->db, 'escape'), $attribute_value)) . $a_delimiter . "%')) ";
							$i++;
						} else {
							if (is_array($attribute_value)) {
								foreach($attribute_value as $value) {
									$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
									WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . $this->db->escape($value) . "'" . " OR pa" . $i . ".text like '" . $this->db->escape($value) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($value) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($value) . $a_delimiter . "%'))";
									$i++;
								}
							} else {
								$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
									WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . $this->db->escape($attribute_value) . "'" . " OR pa" . $i . ".text like '" . $this->db->escape($attribute_value) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($attribute_value) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($attribute_value) . $a_delimiter . "%'))";
									$i++;
							}
						}
					}
				}
			}		
		}

		if ($data['filter_manufacturer_id']) {
			if (is_array($data['filter_manufacturer_id'])) {
				$m_implode = array();

				foreach ($data['filter_manufacturer_id'] as $manufacturer_id) {
					$m_implode[] = "p.manufacturer_id = '" . $manufacturer_id . "'";
				}

				if ($m_implode) {
					$sql .= " AND (" . implode(' OR ', $m_implode) . ")";
				}
			} else {
				$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
			}
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalProductsByManufacturer($data) {
		$filter_products_data = $this->config->get('filter_products_data');
		$customer_group_id = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');

		$sql =  "SELECT COUNT(DISTINCT p.product_id) as total,
			(SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			 	WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, 
			(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special 
			FROM " . DB_PREFIX . "product p";

		if ($data['filter_option_id']) {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_option_value` pov ON (pov.product_id = p.product_id)";
		}

		if ($data['filter_attribute_id']) {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_attribute` pa ON (pa.product_id = p.product_id)";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		
		$tax_class_identify = isset($filter_products_data['tax_class_id']) ? $filter_products_data['tax_class_id'] : '0';
		
		if ($data['filter_prices']) {
			if ($data['filter_prices']['min'] >= 0) {
				$sql .= " AND coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1),(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price) >=" . round($this->currency->convert($this->tax->calculate($data['filter_prices']['min'], $tax_class_identify, $this->config->get('config_tax')), $this->session->data['currency'], $this->config->get('config_currency')));
			}
			if ($data['filter_prices']['max'] > 0) {
				$sql .= " AND coalesce((SELECT price FROM " . DB_PREFIX . "product_discount pd2 
			WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1),(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1), p.price) <=" . round($this->currency->convert($this->tax->calculate($data['filter_prices']['max'], $tax_class_identify, $this->config->get('config_tax')), $this->session->data['currency'], $this->config->get('config_currency')));
			}
		}

		if ($data['filter_option_id'] && isset($filter_products_data['option_logic_type'])) {
			$option_filters = array();

			if ($filter_products_data['option_logic_type'] == 2) {
				foreach ($data['filter_option_id'] as $option_id => $option_value) {
					if (in_array($option_id, $filter_products_data['product_options_array'])) {
						if (is_array($option_value)) {
							foreach ($option_value as $option_value_id) {
								$option_filters[] = "(pov.option_id = '" . (int)$option_id . "' AND pov.option_value_id = '" . (int)$option_value_id . "')";
							}
						} else {
							if (!empty($option_value)) {
								$option_filters[] = "(pov.option_id = '" . (int)$option_id . "' AND pov.option_value_id = '" . (int)$option_value . "')";
							}
						}
					}
				}

				if ($option_filters) {
					$sql .= " AND (" . implode(" OR ", $option_filters) . ")";
				}

			} else {

				if ($data['filter_option_id']) {
					$filter_option_id = array_filter($data['filter_option_id']);
					foreach ($filter_option_id as $option_id => $option_value) {
						if (in_array($option_id, $filter_products_data['product_options_array'])) {
							if (is_array($option_value)) {
								foreach ($option_value as $op_value_id) {
									$option_filters[] = "option_value_id IN (" . $op_value_id . ")";
								}
							} else {
								$option_filters[] = "option_value_id IN (" . $option_value . ")";
							}
						}
					}
				}

				foreach ($option_filters as $key => $option_value_id) {
					$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_option_value pov" . $key . " WHERE pov" . $key . ".product_id = p.product_id AND pov" . $key . "." . $option_value_id . ") ";
				}
			}
		}

		if ($data['filter_attribute_id']) {
			$attribute_filters = array();

			if ($filter_products_data['attribute_logic_type'] == 2) {
				foreach ($data['filter_attribute_id'] as $attribute_id => $attribute_value) {
					if (in_array($attribute_id, $filter_products_data['product_attributes_array'])) {
						if (is_array($attribute_value)) {
							foreach ($attribute_value as $attribute_value_id) {
								$attribute_filters[] = "(pa.attribute_id = '" . (int)$attribute_id . "' AND pa.text LIKE '%" . $this->db->escape($attribute_value_id) . "%')";
							}
						} else {
							if (!empty($attribute_value)) {
								$attribute_filters[] = "(pa.attribute_id = '" . (int)$attribute_id . "' AND pa.text LIKE '%" . $this->db->escape($attribute_value) . "%')";
							}
						}
					}
				}

				if ($attribute_filters) {
					$sql .= " AND (" . implode(" OR ", $attribute_filters) . ")";
				}

			} else {
				$a_delimiter = (!empty($filter_products_data['attribute_delimiter'])) ? $filter_products_data['attribute_delimiter'] : ',';
				$i = 0;

				$filter_attribute_id = array_filter($data['filter_attribute_id']);
				foreach ($filter_attribute_id as $attribute_id => $attribute_value) {
					if (in_array($attribute_id, $filter_products_data['product_attributes_array'])) {
						if ($filter_products_data['attribute_logic_type_inner'] == 2) {
							$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
							WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . implode("' OR pa" . $i . ".text = '", array_map(array($this->db, 'escape'), $attribute_value)) . "'" . " OR pa" . $i . ".text like '" . implode($a_delimiter . "%' OR pa" . $i . ".text like '", array_map(array($this->db, 'escape'), $attribute_value)) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . implode("' OR pa" . $i . ".text like '%" . $a_delimiter, array_map(array($this->db, 'escape'), $attribute_value)) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . implode($a_delimiter . "%' OR pa" . $i . ".text like '%" . $a_delimiter, array_map(array($this->db, 'escape'), $attribute_value)) . $a_delimiter . "%')) ";
							$i++;
						} else {
							if (is_array($attribute_value)) {
								foreach($attribute_value as $value) {
									$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
									WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . $this->db->escape($value) . "'" . " OR pa" . $i . ".text like '" . $this->db->escape($value) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($value) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($value) . $a_delimiter . "%'))";
									$i++;
								}
							} else {
								$sql .= " AND EXISTS (SELECT * FROM " . DB_PREFIX . "product_attribute pa" . $i . " 
									WHERE pa" . $i . ".product_id = pa.product_id AND pa" . $i . ".attribute_id = " . (int)$attribute_id . " AND (pa" . $i . ".text = '" . $this->db->escape($attribute_value) . "'" . " OR pa" . $i . ".text like '" . $this->db->escape($attribute_value) . $a_delimiter . "%'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($attribute_value) . "'" . " OR pa" . $i . ".text like '%" . $a_delimiter . $this->db->escape($attribute_value) . $a_delimiter . "%'))";
									$i++;
							}
						}
					}
				}
			}		
		}

		if ($data['filter_manufacturer_id']) {
			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}