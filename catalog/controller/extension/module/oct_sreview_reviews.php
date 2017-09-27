<?php
class ControllerExtensionModuleOctSreviewReviews extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/oct_sreview_reviews');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_reviews_link'] = $this->language->get('text_reviews_link');
		$data['reviews_link'] = $this->url->link('octemplates/sreview_reviews');

		$this->load->model('octemplates/sreview_reviews');

		$data['reviews'] = array();

		$filter_data = array(
			'sort' => $setting['sort_order'],
			'limit' => $setting['limit']
		);

		$results = $this->model_octemplates_sreview_reviews->getReviews($filter_data);

		$data['position'] = $setting['position'];

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'  => $result['author'],
				'avg_rating' => round($result['avg_rating']),
				'date_added' => $result['date_added'],
				'text' => utf8_substr(strip_tags(html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')), 0, $setting['desc_limit']) . '..'
			);
		}

		return $this->load->view('extension/module/oct_sreview_reviews', $data);
	}
}
