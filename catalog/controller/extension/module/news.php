<?php
class ControllerModuleNews extends Controller {
	private $_name = 'news';

	protected function index($setting) {
		static $module = 0;

		$this->language->load('module/' . $this->_name);

      	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->document->addStyle('catalog/view/theme/sstore/style/news.css');

		$this->data['customtitle'] = $this->config->get($this->_name . '_customtitle' . $this->config->get('config_language_id'));
		$this->data['header'] = $this->config->get($this->_name . '_header');

		if (!$this->data['customtitle']) { $this->data['customtitle'] = $this->data['heading_title']; }
		if (!$this->data['header']) { $this->data['customtitle'] = ''; }

		$this->data['icon'] = $this->config->get($this->_name . '_icon');
		$this->data['box'] = $this->config->get($this->_name . '_box');

		$this->data['text_more'] = $this->language->get('text_more');
		$this->data['text_posted'] = $this->language->get('text_posted');

		$this->data['buttonlist'] = $this->language->get('buttonlist');

		$this->load->model('catalog/news');
		$this->load->model('tool/image');

		$this->data['news_count'] = $this->model_catalog_news->getTotalNews();
        

		$this->data['news_limit'] = $setting['limit'];

		if ($this->data['news_count'] > $this->data['news_limit']) {
			$this->data['showbutton'] = true;
		} else {
			$this->data['showbutton'] = false;
		}

		$this->data['newslist'] = $this->url->link('information/news');

		$this->data['show_headline'] = $this->config->get($this->_name . '_headline_module');

		$this->data['numchars'] = $setting['numchars'];

		if (isset($this->data['numchars'])) {
			$chars = $this->data['numchars'];
		} else {
			$chars = 100;
		}

		$this->data['news'] = array();
        

        
		$results = $this->model_catalog_news->getNewsShort($setting['limit']);
        
    

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], 230, 205);
			} else {
				$image = false;
			}

			$news_length = strlen(utf8_decode($result['description']));

			if ($news_length > $chars) {
                $description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
                $description = substr($description, 0, $chars);    
                $description = rtrim($description, "!,.-");
                $description = substr($description, 0, strrpos($description, ' ')); 
                $description .= "...";
			} else {
				$description = html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
			}

			$this->data['news'][] = array(
				'title'        		=> $result['title'],
				'image'			=> $image,
				'description'	=> $description,
				'href'         		=> $this->url->link('information/news', 'news_id=' . $result['news_id']),
				'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$this->data['module'] = $module++;

		// Template
		$this->data['template'] = $this->config->get('config_template');

		// if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl')) {
		// 	$this->template = $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl';
		// } else {
		// 	$this->template = 'default/template/module/' . $this->_name . '.tpl';
		// }

		// $this->render();

		return $this->load->view('extension/module/' . $this->_name, $data);
	}
}
?>