<?php
class ModelCatalogOctBlog extends Model {
	public function getBlog($blog_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_description bd ON (b.blog_id = bd.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store b2s ON (b.blog_id = b2s.blog_id) WHERE b.blog_id = '" . (int)$blog_id . "' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1'");

		return $query->row;
	}

	public function getBlogs($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_description bd ON (b.blog_id = bd.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store b2s ON (b.blog_id = b2s.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1'";

		$sort_data = array(
			'bd.title',
			'b.sort_order',
			'b.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'bd.title') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY b.date_added";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(bd.title) DESC";
		} else {
			$sql .= " ASC, LCASE(bd.title) ASC";
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

		return $query->rows;
	}

	public function getBlogProducts($blog_id) {
		$product_data = array();
		
		$this->load->model('catalog/product');
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_product bp LEFT JOIN " . DB_PREFIX . "product p ON (bp.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE bp.blog_id = '" . (int)$blog_id . "' AND p.date_available <= NOW() AND p.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		foreach ($query->rows as $result) { 
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}

		return $product_data;
	}

	public function getTotalBlogs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_to_store b2s ON (b.blog_id = b2s.blog_id) WHERE b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1'");

		return $query->row['total'];
	}
}