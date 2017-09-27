<?php
class ModelCatalogOctBlog extends Model {
	public function addBlog($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "blog SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$blog_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "blog SET image = '" . $this->db->escape($data['image']) . "' WHERE blog_id = '" . (int)$blog_id . "'");
		}

		foreach ($data['blog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "blog_description SET blog_id = '" . (int)$blog_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['blog_store'])) {
			foreach ($data['blog_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_to_store SET blog_id = '" . (int)$blog_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['blog_layout'])) {
			foreach ($data['blog_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_to_layout SET blog_id = '" . (int)$blog_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if (isset($data['blog_product'])) {
			foreach ($data['blog_product'] as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product WHERE blog_id = '" . (int)$blog_id . "' AND product_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_product SET blog_id = '" . (int)$blog_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'blog_id=" . (int)$blog_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('blog');

		return $blog_id;
	}

	public function editBlog($blog_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE blog_id = '" . (int)$blog_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "blog SET image = '" . $this->db->escape($data['image']) . "' WHERE blog_id = '" . (int)$blog_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_description WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($data['blog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "blog_description SET blog_id = '" . (int)$blog_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_to_store WHERE blog_id = '" . (int)$blog_id . "'");

		if (isset($data['blog_store'])) {
			foreach ($data['blog_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_to_store SET blog_id = '" . (int)$blog_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_to_layout WHERE blog_id = '" . (int)$blog_id . "'");

		if (isset($data['blog_layout'])) {
			foreach ($data['blog_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_to_layout SET blog_id = '" . (int)$blog_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product WHERE blog_id = '" . (int)$blog_id . "'");

		if (isset($data['blog_product'])) {
			foreach ($data['blog_product'] as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product WHERE blog_id = '" . (int)$blog_id . "' AND product_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_product SET blog_id = '" . (int)$blog_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_id=" . (int)$blog_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'blog_id=" . (int)$blog_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('blog');
	}

	public function deleteBlog($blog_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog WHERE blog_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_description WHERE blog_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_to_store WHERE blog_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product WHERE product_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_to_layout WHERE blog_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_id=" . (int)$blog_id . "'");

		$this->cache->delete('blog');
	}

	public function getBlog($blog_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_id=" . (int)$blog_id . "') AS keyword FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_description bd ON (b.blog_id = bd.blog_id) WHERE b.blog_id = '" . (int)$blog_id . "' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getBlogs($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			if (!empty($data['filter_name'])) {
				$sql .= " AND bd.title LIKE '" . $this->db->escape($data['filter_name']) . "%'";
			}

			$sql .= " GROUP BY b.blog_id";

			$sort_data = array(
				'bd.title',
				'b.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY bd.title";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
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
		} else {
			$blog_data = $this->cache->get('blog.' . (int)$this->config->get('config_language_id'));

			if (!$blog_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$blog_data = $query->rows;

				$this->cache->set('blog.' . (int)$this->config->get('config_language_id'), $blog_data);
			}

			return $blog_data;
		}
	}

	public function getBlogDescriptions($blog_id) {
		$blog_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_description WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($query->rows as $result) {
			$blog_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $blog_description_data;
	}

	public function getBlogStores($blog_id) {
		$blog_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_to_store WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($query->rows as $result) {
			$blog_store_data[] = $result['store_id'];
		}

		return $blog_store_data;
	}

	public function getBlogLayouts($blog_id) {
		$blog_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_to_layout WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($query->rows as $result) {
			$blog_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $blog_layout_data;
	}

	public function getTotalBlogs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog");

		return $query->row['total'];
	}

	public function getTotalBlogsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}

	public function getBlogProduct($blog_id) {
		$product_blog_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_product WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($query->rows as $result) {
			$product_blog_data[] = $result['product_id'];
		}

		return $product_blog_data;
	}

	public function getTotalStoresByBlogId($blog_id) {
		$account_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_account_id' AND `value` = '" . (int)$blog_id . "' AND store_id != '0'");

		$checkout_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_checkout_id' AND `value` = '" . (int)$blog_id . "' AND store_id != '0'");

		return ($account_query->row['total'] + $checkout_query->row['total']);
	}

	public function makeDB() {
		$sql1  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog` ( ";
    $sql1 .= "`blog_id` int(11) NOT NULL AUTO_INCREMENT, ";
    $sql1 .= "`image` varchar(255) DEFAULT NULL, ";
    $sql1 .= "`date_added` datetime NOT NULL, ";
    $sql1 .= "`date_modified` datetime NOT NULL, ";
    $sql1 .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
    $sql1 .= "`status` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql1 .= "PRIMARY KEY (`blog_id`) ";
    $sql1 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;";

    $this->db->query( $sql1 );

    $sql2  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_description` ( ";
    $sql2 .= "`blog_id` int(11) NOT NULL, ";
    $sql2 .= "`language_id` int(11) NOT NULL, ";
    $sql2 .= "`title` varchar(64) NOT NULL, ";
    $sql2 .= "`description` text NOT NULL, ";
    $sql2 .= "`meta_title` varchar(255) NOT NULL, ";
    $sql2 .= "`meta_description` varchar(255) NOT NULL, ";
    $sql2 .= "`meta_keyword` varchar(255) NOT NULL, ";
    $sql2 .= "PRIMARY KEY (`blog_id`,`language_id`) ";
    $sql2 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8;";

    $this->db->query( $sql2 );

    $sql3  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_layout` ( ";
    $sql3 .= "`blog_id` int(11) NOT NULL, ";
    $sql3 .= "`store_id` int(11) NOT NULL, ";
    $sql3 .= "`layout_id` int(11) NOT NULL, ";
    $sql3 .= "PRIMARY KEY (`blog_id`,`store_id`) ";
    $sql3 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8;";

    $this->db->query( $sql3 );

    $sql4  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_store` ( ";
    $sql4 .= "`blog_id` int(11) NOT NULL, ";
    $sql4 .= "`store_id` int(11) NOT NULL, ";
    $sql4 .= "PRIMARY KEY (`blog_id`,`store_id`) ";
    $sql4 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8;";

    $this->db->query( $sql4 );

    $sql5  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_product` ( ";
    $sql5 .= "`blog_id` int(11) NOT NULL, ";
    $sql5 .= "`product_id` int(11) NOT NULL, ";
    $sql5 .= "PRIMARY KEY (`blog_id`,`product_id`) ";
    $sql5 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8;";

    $this->db->query( $sql5 );

    //$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE keyword = 'news'");
    $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product/blog'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product/oct_blog', keyword = 'news'");
	}
}