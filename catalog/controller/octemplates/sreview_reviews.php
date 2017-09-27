<?php
class ControllerOctemplatesSreviewReviews extends Controller {
	public function index() {
		$this->load->language('octemplates/sreview_reviews');

		$oct_sreview_setting_data = $this->config->get('oct_sreview_setting_data');

		$this->load->model('octemplates/sreview_reviews');

		if (isset($oct_sreview_setting_data['status']) || $oct_sreview_setting_data['status'] == 1) {

			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			} else {
				$sort = 'sort_order_asc';
			}

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			if (isset($this->request->get['limit'])) {
				$limit = (int)$this->request->get['limit'];
			} else {
				$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			}

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);

			$reviews = $this->model_octemplates_sreview_reviews->getReviews();

			$this->document->setTitle($this->language->get('heading_title'));

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_note'] = $this->language->get('text_note');

			$data['button_write_review'] = $this->language->get('button_write_review');
			$data['button_dismiss_write_review'] = $this->language->get('button_dismiss_write_review');
			$data['button_send_review'] = $this->language->get('button_send_review');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('octemplates/sreview_reviews')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$filter_data = array(
				'sort'  => $sort,
				'start' => ($page - 1) * $limit,
				'limit' => $limit
			);

			$data['subjects'] = $this->model_octemplates_sreview_reviews->getSubjects();

			$review_total = $this->model_octemplates_sreview_reviews->getTotalReviews($filter_data);

			$data['text_store_rating'] = sprintf($this->language->get('text_store_rating'), round($this->model_octemplates_sreview_reviews->getTotalStoreReviews(), 1));

			$data['reviews'] = array();

			$results = $this->model_octemplates_sreview_reviews->getReviews($filter_data);

			foreach ($results as $result) {

				$review_subjects = $this->model_octemplates_sreview_reviews->getReviewSubjects($result['oct_sreview_review_id']);

				$review_subject_array = array();

				if ($review_subjects) {

					foreach ($review_subjects as $review_subject) {
						$subject_info = $this->model_octemplates_sreview_reviews->getSubject($review_subject['oct_sreview_subject_id']);

						if ($subject_info) {
							$review_subject_array[] = array(
								'name' => $subject_info['name'],
								'rating' => $review_subject['rating']
							);
						}
					}
				}

				$data['reviews'][] = array(
					'oct_sreview_review_id'  => $result['oct_sreview_review_id'],
					'author'        => $result['author'],
					'review_subject_array' => $review_subject_array,
					'avg_rating' => sprintf($this->language->get('text_rating'), round($result['avg_rating'], 1)),
					'date_added' => $result['date_added'],
					'text' => html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')
				);
			}

			$url = '';

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_date_added_asc'),
				'value' => 'date_added_asc',
				'href'  => $this->url->link('octemplates/sreview_reviews', '&sort=date_added_asc' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_date_added_desc'),
				'value' => 'date_added_desc',
				'href'  => $this->url->link('octemplates/sreview_reviews', '&sort=date_added_desc' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_author_asc'),
				'value' => 'author_asc',
				'href'  => $this->url->link('octemplates/sreview_reviews', '&sort=author_asc' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_author_desc'),
				'value' => 'author_desc',
				'href'  => $this->url->link('octemplates/sreview_reviews', '&sort=author_desc' . $url)
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('octemplates/sreview_reviews', $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $review_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('octemplates/sreview_reviews', $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($review_total - $limit)) ? $review_total : ((($page - 1) * $limit) + $limit), $review_total, ceil($review_total / $limit));

			// http://googlewebmastercentral.sreviewspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('octemplates/sreview_reviews', 'SSL'), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('octemplates/sreview_reviews', 'SSL'), 'prev');
			} else {
			    $this->document->addLink($this->url->link('octemplates/sreview_reviews', '&page='. ($page - 1), 'SSL'), 'prev');
			}

			if ($limit && ceil($review_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('octemplates/sreview_reviews', '&page='. ($page + 1), 'SSL'), 'next');
			}

			$data['sort'] = $sort;
			$data['limit'] = $limit;

			if ($this->config->get('storeset_terms')) {
			  $this->load->model('catalog/information');
			    
			  $information_info = $this->model_catalog_information->getInformation($this->config->get('storeset_terms'));
			    
			  if ($information_info) {
			    $data['text_terms'] = sprintf($this->language->get('text_terms'), $this->url->link('information/information', 'information_id=' . $this->config->get('storeset_terms'), 'SSL'), $information_info['title'], $information_info['title']);
			  } else {
			    $data['text_terms'] = '';
			  }
			} else {
			  $data['text_terms'] = '';
			}

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('octemplates/sreview_reviews', $data));
		} else {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('octemplates/sreview_reviews', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function write() {
		$this->load->language('octemplates/sreview_reviews');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 25)) {
				$json['error'] = $this->language->get('error_author');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (!isset($this->request->post['rating'])) {
				$json['error'] = $this->language->get('error_rating');
			}

			if ($this->config->get('storeset_terms')) {
			  if (!isset($this->request->post['terms'])) {
			    $this->load->model('catalog/information');
			    
			    $information_info = $this->model_catalog_information->getInformation($this->config->get('storeset_terms'));

			    $json['error'] = sprintf($this->language->get('error_terms'), $information_info['title']);
			  }
			}

			if (!isset($json['error'])) {
				$this->load->model('octemplates/sreview_reviews');

				$this->model_octemplates_sreview_reviews->addReview($this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
