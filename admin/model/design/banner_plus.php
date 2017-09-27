<?php
class ModelDesignBannerPlus extends Model {
	public function addBanner($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "banner_plus SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "'");

		$banner_id = $this->db->getLastId();

		if (isset($data['banner_plus_image'])) {
			foreach ($data['banner_plus_image'] as $banner_plus_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "banner_plus_image SET banner_id = '" . (int)$banner_id . "', link = '" .  $this->db->escape($banner_plus_image['link']) . "', image = '" .  $this->db->escape($banner_plus_image['image']) . "', sort_order = '" . (int)$banner_plus_image['sort_order'] . "'");

				$banner_image_id = $this->db->getLastId();

				foreach ($banner_plus_image['banner_plus_image_description'] as $language_id => $banner_plus_image_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "banner_plus_image_description SET banner_image_id = '" . (int)$banner_image_id . "', language_id = '" . (int)$language_id . "', banner_id = '" . (int)$banner_id . "', title = '" .  $this->db->escape($banner_plus_image_description['title']) . "', button = '" .  $this->db->escape($banner_plus_image_description['button']) . "', description = '" .  $this->db->escape($banner_plus_image_description['description']) . "'");
				}
			}
		}

		return $banner_id;
	}

	public function editBanner($banner_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "banner_plus SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "' WHERE banner_id = '" . (int)$banner_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_plus_image WHERE banner_id = '" . (int)$banner_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_plus_image_description WHERE banner_id = '" . (int)$banner_id . "'");

		if (isset($data['banner_plus_image'])) {
			foreach ($data['banner_plus_image'] as $banner_plus_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "banner_plus_image SET banner_id = '" . (int)$banner_id . "', link = '" .  $this->db->escape($banner_plus_image['link']) . "', image = '" .  $this->db->escape($banner_plus_image['image']) . "', sort_order = '" . (int)$banner_plus_image['sort_order'] . "'");

				$banner_image_id = $this->db->getLastId();

				foreach ($banner_plus_image['banner_plus_image_description'] as $language_id => $banner_plus_image_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "banner_plus_image_description SET banner_image_id = '" . (int)$banner_image_id . "', language_id = '" . (int)$language_id . "', banner_id = '" . (int)$banner_id . "', title = '" .  $this->db->escape($banner_plus_image_description['title']) . "', button = '" .  $this->db->escape($banner_plus_image_description['button']) . "', description = '" .  $this->db->escape($banner_plus_image_description['description']) . "'");
				}
			}
		}
	}

	public function deleteBanner($banner_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_plus WHERE banner_id = '" . (int)$banner_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_plus_image WHERE banner_id = '" . (int)$banner_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_plus_image_description WHERE banner_id = '" . (int)$banner_id . "'");
	}

	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "banner_plus WHERE banner_id = '" . (int)$banner_id . "'");

		return $query->row;
	}

	public function getBanners($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "banner_plus";

		$sort_data = array(
			'name',
			'status'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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
	}

	public function getBannerImages($banner_id) {
		$banner_plus_image_data = array();

		$banner_plus_image_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_plus_image WHERE banner_id = '" . (int)$banner_id . "' ORDER BY sort_order ASC");

		foreach ($banner_plus_image_query->rows as $banner_plus_image) {
			$banner_plus_image_description_data = array();

			$banner_plus_image_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_plus_image_description WHERE banner_image_id = '" . (int)$banner_plus_image['banner_image_id'] . "' AND banner_id = '" . (int)$banner_id . "'");

			foreach ($banner_plus_image_description_query->rows as $banner_plus_image_description) {
				$banner_plus_image_description_data[$banner_plus_image_description['language_id']] = array(
					'title'       => $banner_plus_image_description['title'],
					'button'      => $banner_plus_image_description['button'],
					'description' => $banner_plus_image_description['description']
				);
			}

			$banner_plus_image_data[] = array(
				'banner_plus_image_description' => $banner_plus_image_description_data,
				'link'                          => $banner_plus_image['link'],
				'image'                         => $banner_plus_image['image'],
				'sort_order'                    => $banner_plus_image['sort_order']
			);
		}

		return $banner_plus_image_data;
	}

	public function getTotalBanners() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "banner_plus");

		return $query->row['total'];
	}

	public function createDBTables() {
		$sql_01  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "banner_plus` ( ";
		$sql_01 .= "`banner_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql_01 .= "`name` varchar(64) NOT NULL, ";
		$sql_01 .= "`status` tinyint(1) NOT NULL, ";
		$sql_01 .= "PRIMARY KEY (`banner_id`) ";
		$sql_01 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ; ";

		$this->db->query( $sql_01 );
		
		$sql_02  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "banner_plus_image` ( ";
		$sql_02 .= "`banner_image_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql_02 .= "`banner_id` int(11) NOT NULL, ";
		$sql_02 .= "`link` varchar(255) NOT NULL, ";
		$sql_02 .= "`image` varchar(255) NOT NULL, ";
		$sql_02 .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
		$sql_02 .= "PRIMARY KEY (`banner_image_id`) ";
		$sql_02 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ; ";

		$this->db->query( $sql_02 );
		
		$sql_03  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "banner_plus_image_description` ( ";
		$sql_03 .= "`banner_image_id` int(11) NOT NULL, ";
		$sql_03 .= "`language_id` int(11) NOT NULL, ";
		$sql_03 .= "`banner_id` int(11) NOT NULL, ";
		$sql_03 .= "`title` varchar(64) NOT NULL, ";
		$sql_03 .= "`button` varchar(64) NOT NULL, ";
		$sql_03 .= "`description` text NOT NULL, ";
		$sql_03 .= "PRIMARY KEY (`banner_image_id`,`language_id`) ";
		$sql_03 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 ; ";

		$this->db->query( $sql_03 );
	}
}