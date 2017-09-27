<?php
class ModelExtensionModuleMegamenu extends Model {

	public function getItems()
	{
		$sort = "sort_order";
		$sql = "SELECT * FROM " . DB_PREFIX . "megamenu n LEFT JOIN " . DB_PREFIX . "megamenu_description nd ON n.id = nd.megamenu_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' and n.status='1' ORDER BY {$sort}";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getCategoryPath($category_id)
	{
		$sql = "SELECT path_id FROM " . DB_PREFIX . "category_path WHERE category_id='".$category_id."' ORDER BY LEVEL";
		$query = $this->db->query($sql);
		if ($query->rows) {
			$result = array();
			foreach($query->rows as $row) $result[] = $row['path_id'];
			return $result;
		}
		else return false;
	}

	public function parseHtml($item)
	{
		$this->load->model('tool/image');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$result['type'] = "html";
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['use_target_blank'] = $item['use_target_blank'];
		$result['html'] = $item['html'];
		$result['children'] = true;
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		return $result;
	}

	public function parseLink($item)
	{
		$this->load->model('tool/image');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$result['type'] = "link";
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['use_target_blank'] = $item['use_target_blank'];
		$result['children'] = true;
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		return $result;
	}

	public function parseInformation($item)
	{
		$this->load->model('tool/image');
		$this->load->model('catalog/information');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$result['type'] = "information";
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['use_target_blank'] = $item['use_target_blank'];
		$result['children'] = array();
		if ($item['use_add_html']) $result['add_html'] = $item['add_html'];
		else $result['add_html'] = "";
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		if (is_array($item['options']['informations_list'])) {
			foreach($item['options']['informations_list'] as $information_id) {
				$information = $this->model_catalog_information->getInformation($information_id);
				if ($information) {
					$result['children'][] = array(
						'sort_order' => $information['sort_order'],
						'name' => $information['title'],
						'href' => $this->url->link('information/information', 'information_id=' . $information['information_id']) ,
					);
				}
			}
		}

		foreach($result['children'] as $key => $item) {
			$sort_order[$key] = $item['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $result['children']);
		return $result;
	}

	public function parseAuth($item)
	{
		$this->load->model('tool/image');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$result['type'] = "auth";
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['use_target_blank'] = $item['use_target_blank'];
		$result['children'] = true;
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		return $result;
	}

	public function parseProduct($item)
	{
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$width = ((int)$item['options']['product_width'] > 0) ? (int)$item['options']['product_width'] : 50;
		$height = ((int)$item['options']['product_height'] > 0) ? (int)$item['options']['product_height'] : 50;
		$result['type'] = "product";
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['use_target_blank'] = $item['use_target_blank'];
		if ($item['use_add_html']) $result['add_html'] = $item['add_html'];
		else $result['add_html'] = "";
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		$result['children'] = array();
		if (is_array($item['options']['products_list'])) {
			foreach($item['options']['products_list'] as $product_id) {
				$product = $this->model_catalog_product->getProduct($product_id);
				if ($product) {
					$thumb = "";
					if (is_file(DIR_IMAGE . $product['image'])) {
						$thumb = $this->model_tool_image->resize($product['image'], $width, $height);
					}
					else {
						$thumb = $this->model_tool_image->resize('no_image.png', $width, $height);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					}
					else {
						$price = false;
					}

					if ((float)$product['special']) {
						$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					}
					else {
						$special = false;
					}

					$result['children'][] = array(
						'name' => $product['name'],
						'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']) ,
						'thumb' => $thumb,
						'price' => $price,
						'special' => $special
					);
				}
			}
		}

		return $result;
	}

	public function parseManufacturer($item)
	{
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$result['type'] = "manufacturer";
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['use_target_blank'] = $item['use_target_blank'];
		if ($item['use_add_html']) $result['add_html'] = $item['add_html'];
		else $result['add_html'] = "";
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		$result['children'] = array();
		if (is_array($item['options']['manufacturers_list'])) {
			foreach($item['options']['manufacturers_list'] as $manufacturer_id) {
				$manufacturer = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);
				if ($manufacturer) {
					$thumb = "";
					if (is_file(DIR_IMAGE . $manufacturer['image'])) {
						$thumb = $this->model_tool_image->resize($manufacturer['image'], 50, 50);
					}
					else {
						$thumb = $this->model_tool_image->resize('no_image.png', 50, 50);
					}

					$result['children'][] = array(
						'name' => $manufacturer['name'],
						'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) ,
						'thumb' => $thumb
					);
				}
			}
		}

		return $result;
	}

	public function aasort(&$array, $key)
	{
		$sorter = array();
		$ret = array();
		reset($array);
		foreach($array as $ii => $va) {
			$sorter[$ii] = $va[$key];
		}

		asort($sorter);
		foreach($sorter as $ii => $va) {
			$ret[$ii] = $array[$ii];
		}

		$array = $ret;
	}

	public function parseCategory($item)
	{
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$result = array();
		$item['options'] = unserialize($item['options']);
		$result['type'] = "category";
		$result['subtype'] = $item['options']['variant_category'];
		$result['href'] = (trim($item['link'])) ? $item['link'] : "javascript:void(0);";
		$result['name'] = $item['title'];
		$result['limit_item'] = $item['limit_item'];
		$result['use_target_blank'] = $item['use_target_blank'];
		if ($item['use_add_html']) $result['add_html'] = $item['add_html'];
		else $result['add_html'] = "";
		if ($item['thumb']) $result['thumb'] = $item['thumb'];
		else $result['thumb'] = "";
		if ($result['thumb']) {
			$result['thumb'] = $this->model_tool_image->resize($result['thumb'], 50, 50);
		}

		$result['name'] = $item['title'];
		$result['children'] = array();
		if (is_array($item['options']['categories_list'])) {
			$l = $item['options']['categories_list'];
			$category_list = array();
			foreach($item['options']['categories_list'] as $cat) {
				$category = $this->model_catalog_category->getCategory($cat);
				if ($category) {
					$category_list[] = $category;
				}
			}

			// $this->aasort($category_list, "sort_order");

			$sort_order = array();

			foreach ($category_list as $key => $value) {
				$sort_order[$key] = $value["sort_order"];
			}

			array_multisort($sort_order, SORT_ASC, $category_list);

			foreach($category_list as $category) {
				if ($category) {
					$thumb = "";
					if ($result['subtype'] == "full_image") {
						if (is_file(DIR_IMAGE . $category['image'])) {
							$thumb = $this->model_tool_image->resize($category['image'], 50, 50);
						}
						else {
							$thumb = $this->model_tool_image->resize('no_image.png', 50, 50);
						}
					}

					$children_data = array();
					if ($item['options']['category_show_subcategory']) {
						$children = $this->model_catalog_category->getCategories($category['category_id']);

						$sort_order = array();

						foreach ($children as $key => $value) {
							$sort_order[$key] = $value["sort_order"];
						}

						array_multisort($sort_order, SORT_ASC, $children);

						if ($children) {
							foreach($children as $child) {
								$filter_data = array(
									'filter_category_id' => $child['category_id'],
									'filter_sub_category' => false
								);
								$path = $this->getCategoryPath($child['category_id']);
								if ($path) $path = implode("_", $path);
								$children_data[] = array(
									'name' => $child['name'],
									'href' => $this->url->link('product/category', 'path=' . $path)
								);
							}
						}
					}

					$path = $this->getCategoryPath($category['category_id']);
					if ($path) $path = implode("_", $path);
					$result['children'][] = array(
						'name' => $category['name'],
						'href' => $this->url->link('product/category', 'path=' . $path) ,
						'children' => $children_data,
						'thumb' => $thumb
					);
				}
			}
		}

		return $result;
	}
}
