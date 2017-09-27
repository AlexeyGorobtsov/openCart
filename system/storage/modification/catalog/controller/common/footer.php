<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
       
        // check to enable settings
        $this->language->load('octemplates/sstorelang');
        $data['storeset_status'] = $this->config->get('storeset_status');
        $data['text_aboutus'] = $this->language->get('text_aboutus');
        $data['text_contactus'] = $this->language->get('text_contactus');
        
        if ($data['storeset_status'] == "on") {
          // socials 
          $data['storeset_facebook_id'] = $this->config->get('storeset_facebook_id');
          $data['storeset_vk_id'] = $this->config->get('storeset_vk_id');
          $data['storeset_gplus_id'] = $this->config->get('storeset_gplus_id');
          $data['storeset_odnoklass_id'] = $this->config->get('storeset_odnoklass_id');
          $data['storeset_rss_id'] = $this->config->get('storeset_rss_id');
          $data['storeset_twitter_id'] = $this->config->get('storeset_twitter_id');
          $data['storeset_vimeo_id'] = $this->config->get('storeset_vimeo_id');
          $data['storeset_pinterest_id'] = $this->config->get('storeset_pinterest_id');
          $data['storeset_dribbble_id'] = $this->config->get('storeset_dribbble_id');
          $data['storeset_flick_id'] = $this->config->get('storeset_flick_id');
          $data['storeset_linkedin_id'] = $this->config->get('storeset_linkedin_id');
          $data['storeset_youtube_id'] = $this->config->get('storeset_youtube_id');
          $data['storeset_cont_address'] = $this->config->get('storeset_cont_address');
          $data['storeset_cont_email'] = $this->config->get('storeset_cont_email');
          $data['storeset_cont_phone1'] = $this->config->get('storeset_cont_phone1');
          $data['storeset_cont_phone2'] = $this->config->get('storeset_cont_phone2');
          $storeset_cont_clock = $this->config->get('storeset_cont_clock');
          $data['storeset_cont_clock'] = $this->config->get('storeset_cont_clock'); 
          
          if (empty($storeset_cont_clock[$this->session->data['language']])) {
            $data['storeset_cont_clock'] = "09:00 - 18:00";
          } elseif (isset($storeset_cont_clock[$this->session->data['language']])) {
            $data['storeset_cont_clock'] = html_entity_decode($storeset_cont_clock[$this->session->data['language']], ENT_QUOTES, 'UTF-8');
          } 
          
          $data['storeset_cont_skype'] = $this->config->get('storeset_cont_skype');
          $data['storeset_cont_vidget'] = $this->config->get('storeset_cont_vidget');
          $storeset_cont_abouttext = $this->config->get('storeset_cont_abouttext'); 
          
          if (empty($storeset_cont_abouttext[$this->session->data['language']])) {
            $data['footer_text'] = false;
          } elseif (isset($storeset_cont_abouttext[$this->session->data['language']])) {
            $data['footer_text'] = html_entity_decode($storeset_cont_abouttext[$this->session->data['language']], ENT_QUOTES, 'UTF-8');
          } 
          
          $data['popup_subscribe_form_data'] = $this->config->get('storeset_subscribe_footer');
          $storeset_cont_copyright = $this->config->get('storeset_cont_copyright'); 
          
          if (empty($storeset_cont_copyright[$this->session->data['language']])) {
            $data['copy_text'] = false;
          } elseif (isset($storeset_cont_copyright[$this->session->data['language']])) {
            $data['copy_text'] = html_entity_decode($storeset_cont_copyright[$this->session->data['language']], ENT_QUOTES, 'UTF-8');
          } 

          $data['text_subscribe'] = $this->language->get('text_subscribe');
          $data['text_subscribe_ok'] = $this->language->get('text_subscribe_ok');
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
          $data['storeset_google'] = $this->config->get('storeset_google');
          $data['storeset_master'] = $this->config->get('storeset_master');
          $data['storeset_visa'] = $this->config->get('storeset_visa');
          $data['storeset_american'] = $this->config->get('storeset_american');
          $data['storeset_discover'] = $this->config->get('storeset_discover');
          $data['storeset_moneybookers'] = $this->config->get('storeset_moneybookers');
          $data['storeset_paypal'] = $this->config->get('storeset_paypal');
          $data['storeset_yamoney'] = $this->config->get('storeset_yamoney');
          $data['storeset_qiwi'] = $this->config->get('storeset_qiwi');
          $data['storeset_privat'] = $this->config->get('storeset_privat');
          $data['storeset_sberbank'] = $this->config->get('storeset_sberbank');
          $data['storeset_liqpay'] = $this->config->get('storeset_liqpay');
          $data['storeset_webmoney'] = $this->config->get('storeset_webmoney');
          $data['storeset_robokassa'] = $this->config->get('storeset_robokassa');
          $data['storeset_2checkout'] = $this->config->get('storeset_2checkout');
          $data['storeset_electron'] = $this->config->get('storeset_electron');
          $data['storeset_maestro'] = $this->config->get('storeset_maestro');
          $data['storeset_switch'] = $this->config->get('storeset_switch');
          $data['storeset_solo'] = $this->config->get('storeset_solo');
          $data['storeset_skrill'] = $this->config->get('storeset_skrill');
          $data['storeset_f1_enable'] = $this->config->get('storeset_f1_enable');
          $data['storeset_f2_enable'] = $this->config->get('storeset_f2_enable');
          $data['storeset_f3_enable'] = $this->config->get('storeset_f3_enable');
        }
      

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
