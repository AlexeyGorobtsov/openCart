<?php
class ModelCatalogReview extends Model {
	        
        public function addReview($data) {
          $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');

          $this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . (int)$data['product_id'] . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

          $review_id = $this->db->getLastId();

          if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "oct_product_reviews SET review_id = '" . $review_id . "', where_bought = '" . (int)$data['where_bought'] . "', negative_text = '" . $this->db->escape(strip_tags($data['negative_text'])) . "', positive_text = '" . $this->db->escape(strip_tags($data['positive_text'])) . "', admin_answer = '" . $this->db->escape(strip_tags($data['admin_answer'])) . "'");
          }

          $this->cache->delete('product');

          return $review_id;
        }

        public function addOldReview($data) {
      
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . (int)$data['product_id'] . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "'");

		$review_id = $this->db->getLastId();

		$this->cache->delete('product');

		return $review_id;
	}

	        
        public function editReview($review_id, $data) {
          $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');

          $this->db->query("UPDATE " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . (int)$data['product_id'] . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "', date_modified = NOW() WHERE review_id = '" . (int)$review_id . "'");

          if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
            $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "oct_product_reviews WHERE review_id = '" . (int)$review_id . "'");

            if ($query->rows) {
              $this->db->query("UPDATE " . DB_PREFIX . "oct_product_reviews SET where_bought = '" . (int)$data['where_bought'] . "', negative_text = '" . $this->db->escape(strip_tags($data['negative_text'])) . "', positive_text = '" . $this->db->escape(strip_tags($data['positive_text'])) . "', admin_answer = '" . $this->db->escape(strip_tags($data['admin_answer'])) . "' WHERE review_id = '" . (int)$review_id . "'");
            } else {
              $this->db->query("INSERT INTO " . DB_PREFIX . "oct_product_reviews SET review_id = '" . $review_id . "', where_bought = '" . (int)$data['where_bought'] . "', negative_text = '" . $this->db->escape(strip_tags($data['negative_text'])) . "', positive_text = '" . $this->db->escape(strip_tags($data['positive_text'])) . "', admin_answer = '" . $this->db->escape(strip_tags($data['admin_answer'])) . "'");
            }
          }

          $this->cache->delete('product');
        }

        public function editOldReview($review_id, $data) {
      
		$this->db->query("UPDATE " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . (int)$data['product_id'] . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "', date_modified = NOW() WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('product');
	}

	public function deleteReview($review_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE review_id = '" . (int)$review_id . "'");
        
        // oct_product_reviews start
        $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');

        if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
          $this->db->query("DELETE FROM " . DB_PREFIX . "oct_product_reviews WHERE review_id = '" . (int)$review_id . "'");
          $this->db->query("DELETE FROM " . DB_PREFIX . "oct_product_reviews_reputation WHERE review_id = '" . (int)$review_id . "'");
        }
        // oct_product_reviews end
      

		$this->cache->delete('product');
	}

	        
        public function getReview($review_id) {
          $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');
          
          if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
            $query = $this->db->query("SELECT DISTINCT r.*, opr.positive_text, opr.negative_text, opr.admin_answer, opr.where_bought, (SELECT pd.name FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = r.product_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "oct_product_reviews opr ON (r.review_id = opr.review_id) WHERE r.review_id = '" . (int)$review_id . "'");
          } else {
            $query = $this->db->query("SELECT DISTINCT *, (SELECT pd.name FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = r.product_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product FROM " . DB_PREFIX . "review r WHERE r.review_id = '" . (int)$review_id . "'");
          }

          return $query->row;
        }

        public function getOldReview($review_id) {
      
		$query = $this->db->query("SELECT DISTINCT *, (SELECT pd.name FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = r.product_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product FROM " . DB_PREFIX . "review r WHERE r.review_id = '" . (int)$review_id . "'");

		return $query->row;
	}

	public function getReviews($data = array()) {
		$sql = "SELECT r.review_id, pd.name, r.author, r.rating, r.status, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_product'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
		}

		if (!empty($data['filter_author'])) {
			$sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$sort_data = array(
			'pd.name',
			'r.author',
			'r.rating',
			'r.status',
			'r.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY r.date_added";
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

	public function getTotalReviews($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_product'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
		}

		if (!empty($data['filter_author'])) {
			$sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalReviewsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review WHERE status = '0'");

		return $query->row['total'];
	}
}