<?php
class ModelOctemplatesSreviewReviews extends Model {
	public function addReview($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "oct_sreview_reviews SET author = '" . $this->db->escape($data['author']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$oct_sreview_review_id = $this->db->getLastId();

		return $oct_sreview_review_id;
	}

	public function editReview($oct_sreview_review_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "oct_sreview_reviews SET author = '" . $this->db->escape($data['author']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE oct_sreview_review_id = '" . (int)$oct_sreview_review_id . "'");
	}

	public function deleteReview($oct_sreview_review_id) {
		$reviews = $this->getReviewVote($oct_sreview_review_id);

		if ($reviews) {
			foreach ($reviews as $review) {
				$this->db->query("UPDATE " . DB_PREFIX . "oct_sreview_subject SET subject_rating_count" . (int)$review['rating'] . " = (subject_rating_count" . (int)$review['rating'] . " - " . (int)$review['rating'] . ") WHERE oct_sreview_subject_id = '" . (int)$review['oct_sreview_subject_id'] . "'");
			}
			$this->db->query("DELETE FROM " . DB_PREFIX . "oct_sreview_reviews_vote WHERE oct_sreview_review_id = '" . (int)$oct_sreview_review_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "oct_sreview_reviews WHERE oct_sreview_review_id = '" . (int)$oct_sreview_review_id . "'");
	}

	public function getReviewVote($oct_sreview_review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "oct_sreview_reviews_vote WHERE oct_sreview_review_id = '" . (int)$oct_sreview_review_id . "'");

		return $query->rows;
	}

	public function getReview($oct_sreview_review_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "oct_sreview_reviews WHERE oct_sreview_review_id = '" . (int)$oct_sreview_review_id . "'");

		return $query->row;
	}

	public function getReviews($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "oct_sreview_reviews WHERE date_added != '00-00-0000'";

		if (isset($data['filter_status'])) {
			$sql .= " AND status = '" . $data['filter_status'] . "'";
		}

		if (!empty($data['filter_author'])) {
			$sql .= " AND author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$sort_data = array(
			'author',
			'rating',
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_added";
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
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "oct_sreview_reviews WHERE date_added != '00-00-0000'";

		if (!empty($data['filter_author'])) {
			$sql .= " AND author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}