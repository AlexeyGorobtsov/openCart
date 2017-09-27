<?php
class ModelCatalogReview extends Model {
	public function addReview($product_id, $data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");

		$review_id = $this->db->getLastId();
        
        // oct_product_reviews start
        $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');

        if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
          $this->db->query("INSERT INTO " . DB_PREFIX . "oct_product_reviews SET review_id = '" . (int)$review_id . "', where_bought = '" . (int)$data['where_bought'] . "', positive_text = '" . $this->db->escape($data['positive_text']) . "', negative_text = '" . $this->db->escape($data['negative_text']) . "'");
        }
        // oct_product_reviews end
      

		if (in_array('review', (array)$this->config->get('config_mail_alert'))) {
			$this->load->language('mail/review');
			$this->load->model('catalog/product');
			
			$product_info = $this->model_catalog_product->getProduct($product_id);

			$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$message  = $this->language->get('text_waiting') . "\n";
			$message .= sprintf($this->language->get('text_product'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_reviewer'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_rating'), $data['rating']) . "\n";
			$message .= $this->language->get('text_review') . "\n";
			$message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if ($email && preg_match($this->config->get('config_mail_regexp'), $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}
	}

	        
        public function checkOctUserIp($ip, $review_id) {
          $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "oct_product_reviews_reputation WHERE ip = '" . $this->db->escape($ip) . "' AND review_id = '" . (int)$review_id . "'");

          return $query->rows;
        }

        public function addOctProductReputation($data = array()) {
          $sql = "INSERT INTO " . DB_PREFIX . "oct_product_reviews_reputation SET review_id = '" . (int)$data['review_id'] . "', ip = '" . $this->db->escape($data['ip']) . "'";

          if ($data['reputation_type'] == 1) {
            $sql .= ", plus_reputation = (plus_reputation + 1)";
          }

          if ($data['reputation_type'] == 2) {
            $sql .= ", minus_reputation = (minus_reputation + 1)";
          }

          $this->db->query($sql);
        }

        public function getReviewsByProductId($product_id, $start = 0, $limit = 20) {
          $oct_product_reviews_data = $this->config->get('oct_product_reviews_data');

          if ($start < 0) {
            $start = 0;
          }

          if ($limit < 1) {
            $limit = 20;
          }

          $sql = "SELECT r.review_id, r.author, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added ";

          if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
            $sql .= ", opr.positive_text, opr.negative_text, opr.admin_answer, opr.where_bought, SUM(oprr.plus_reputation) AS `plus_reputation`, SUM(oprr.minus_reputation) AS `minus_reputation` ";
          }

          $sql .= "FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) ";

          if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) {
            $sql .= "LEFT JOIN " . DB_PREFIX . "oct_product_reviews opr ON (r.review_id = opr.review_id) LEFT JOIN " . DB_PREFIX . "oct_product_reviews_reputation oprr ON (r.review_id = oprr.review_id) ";
          }

          $sql .= "WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY r.review_id ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit;
          
          $query = $this->db->query($sql);

          return $query->rows;
        }

        public function getOldReviewsByProductId($product_id, $start = 0, $limit = 20) {
      
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalReviewsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row['total'];
	}
}