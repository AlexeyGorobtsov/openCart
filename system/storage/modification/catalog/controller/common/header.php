<?php
class ControllerCommonHeader extends Controller {
	public function index() {
        // popup_found_cheaper start
        $data['popup_found_cheaper_data'] = $this->config->get('popup_found_cheaper_data');
        // popup_found_cheaper end
      

        // oct_product_preorder start
        $data['oct_product_preorder_data'] = $this->config->get('oct_product_preorder_data');
        // oct_product_preorder end
      
       
        // popup_purchase start
        $data['popup_purchase_data'] = $this->config->get('popup_purchase_data');
        $data['popup_purchase_text'] = $this->language->load('extension/module/popup_purchase');
        // popup_purchase end
        
        // subscribe start
        $data['popup_subscribe_form_data'] = $this->config->get('popup_subscribe_form_data');
        // subscribe end
       
        // popup_call_phone start
        $data['popup_call_phone_data'] = $this->config->get('popup_call_phone_data');
        $data['popup_call_phone_text'] = $this->language->load('extension/module/popup_call_phone');
        // popup_call_phone end
      
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
       
        $this->language->load('common/footer');
        $this->language->load('octemplates/sstorelang');
        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $data['text_account'] = $this->language->get('text_account');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_wishlist'] = $this->language->get('text_wishlist');
        $data['text_compare'] = $this->language->get('text_compare');
        $data['text_settings'] = $this->language->get('text_settings');            
        $data['text_account_login'] = $this->language->get('text_account_login');
        $data['text_user'] = $this->language->get('text_user');
        $data['text_password'] = $this->language->get('text_password');
        $data['text_enter'] = $this->language->get('text_enter');
        $data['text_reg'] = $this->language->get('text_reg');   
        $data['text_forgot'] = $this->language->get('text_forgot');
        $data['text_ads'] = $this->language->get('text_ads');
        $data['text_page'] = $this->language->get('text_page');
        $data['text_megamenu'] = $this->language->get('text_megamenu');
        $data['text_autorization'] = $this->language->get('text_autorization');   
        $data['text_forgotten'] = $this->language->get('text_forgotten');   
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
        $data['text_page'] = $this->language->get('text_page');
        $data['text_settings'] = $this->language->get('text_settings');
        $data['text_account_login'] = $this->language->get('text_account_login');
        $data['text_user'] = $this->language->get('text_user');
        $data['text_password'] = $this->language->get('text_password');
        $data['text_enter'] = $this->language->get('text_enter');
        $data['text_megamenu'] = $this->language->get('text_megamenu');
        $data['loginurl'] = $this->url->link('account/login', '', true);
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
        $data['compare'] = $this->url->link('product/compare', '', 'SSL');
        $data['newsletter'] = $this->url->link('account/newsletter', '', true);
        $data['popup_view_data'] = $this->config->get('popup_view_data');
        $data['popup_view_text'] = $this->language->load('extension/module/popup_view');
        $data['text_autorization'] = $this->language->get('text_autorization');
        $data['storeset_status'] = $this->config->get('storeset_status');
        $data['text_all_category'] = $this->language->get('text_all_category');   
        if ($data['storeset_status'] == "on") {
          $data['storeset_backgr_color'] = $this->config->get('storeset_backgr_color');
          $data['config_url'] = $this->config->get('config_url');
          $data['storeset_custom_pattern'] = $this->config->get('storeset_custom_pattern');
          $data['storeset_main1'] = $this->config->get('storeset_main1');
          $data['storeset_main2'] = $this->config->get('storeset_main2');
          $data['storeset_button_text_color'] = $this->config->get('storeset_button_text_color');
          $data['storeset_custom_icon1'] = $this->config->get('storeset_custom_icon1');
          $data['storeset_custom_icon2'] = $this->config->get('storeset_custom_icon2');
          $data['storeset_custom_icon3'] = $this->config->get('storeset_custom_icon3');
          $data['storeset_1_links_color'] = $this->config->get('storeset_1_links_color');
          $data['storeset_1_background'] = $this->config->get('storeset_1_background');
          $data['storeset_1_hover'] = $this->config->get('storeset_1_hover');
          $data['storeset_2_phonecolor'] = $this->config->get('storeset_2_phonecolor');
          $data['storeset_2_timecolor'] = $this->config->get('storeset_2_timecolor');
          $data['storeset_2_backcart'] = $this->config->get('storeset_2_backcart');
          $data['storeset_2_colorcart'] = $this->config->get('storeset_2_colorcart');
          $data['storeset_3_backround'] = $this->config->get('storeset_3_backround');
          $data['storeset_3_linkcolor'] = $this->config->get('storeset_3_linkcolor');
          $data['storeset_3_hover'] = $this->config->get('storeset_3_hover');
          $data['storeset_3_childback'] = $this->config->get('storeset_3_childback');
          $data['storeset_3_childcolor'] = $this->config->get('storeset_3_childcolor');
          $data['storeset_3_backsearch'] = $this->config->get('storeset_3_backsearch');
          $data['storeset_left_backround'] = $this->config->get('storeset_left_backround');
          $data['storeset_left_fontcolor'] = $this->config->get('storeset_left_fontcolor');
          $data['storeset_left_linkcolor'] = $this->config->get('storeset_left_linkcolor');
          $data['storeset_good_pricecolor'] = $this->config->get('storeset_good_pricecolor');
          $data['storeset_left_menubg'] = $this->config->get('storeset_left_menubg');
          $data['storeset_left_menucolsapsebg'] = $this->config->get('storeset_left_menucolsapsebg');
          $data['storeset_left_menulinkcolor'] = $this->config->get('storeset_left_menulinkcolor');
          $data['storeset_left_menulinkcolorhover'] = $this->config->get('storeset_left_menulinkcolorhover'); 
          $data['storeset_left_collinkcoloractive'] = $this->config->get('storeset_left_collinkcoloractive');
          $data['storeset_left_collinkcolor'] = $this->config->get('storeset_left_collinkcolor');
          $data['storeset_left_collinkcolorhover'] = $this->config->get('storeset_left_collinkcolorhover');  
          $data['storeset_category_oldprice'] = $this->config->get('storeset_category_oldprice');
          $data['storeset_category_newprice'] = $this->config->get('storeset_category_newprice');
          $data['storeset_category_butcolor'] = $this->config->get('storeset_category_butcolor');
          $data['storeset_good_buttonback'] = $this->config->get('storeset_good_buttonback');
          $data['storeset_good_buttontextcolore'] = $this->config->get('storeset_good_buttontextcolore');
          $data['storeset_f1_backround'] = $this->config->get('storeset_f1_backround');
          $data['storeset_f1_linkcolor'] = $this->config->get('storeset_f1_linkcolor');
          $data['storeset_f2_h1color'] = $this->config->get('storeset_f2_h1color');
          $data['storeset_f1_h1color'] = $this->config->get('storeset_f1_h1color');
          $data['storeset_f1_textcolor'] = $this->config->get('storeset_f1_textcolor');
          $data['storeset_f2_background'] = $this->config->get('storeset_f2_background');
          $data['storeset_f2_linkcolor'] = $this->config->get('storeset_f2_linkcolor');
          $data['storeset_f3_background'] = $this->config->get('storeset_f3_background');
          $data['storeset_f3_copytextcolor'] = $this->config->get('storeset_f3_copytextcolor');
          $data['storeset_f3_copylinkcolor'] = $this->config->get('storeset_f3_copylinkcolor');
          $data['storeset_mobile_head'] = $this->config->get('storeset_mobile_head');
          $data['storeset_mobile_foot'] = $this->config->get('storeset_mobile_foot');
          $data['storeset_mobile_head_back'] = $this->config->get('storeset_mobile_head_back');
          $data['storeset_mobile_sidebar_back'] = $this->config->get('storeset_mobile_sidebar_back');
          $data['storeset_mobile_sidebar_linkcolor'] = $this->config->get('storeset_mobile_sidebar_linkcolor');
          $data['storeset_mobile_enabel_foot'] = $this->config->get('storeset_mobile_enabel_foot');
          $data['storeset_mobile_foot_back'] = $this->config->get('storeset_mobile_foot_back');
          $data['storeset_mobile_head_buttonback'] = $this->config->get('storeset_mobile_head_buttonback');
          $data['storeset_custom_mobile'] = $this->config->get('storeset_custom_mobile');
          $data['storeset_mobile_sidebar_1'] = $this->config->get('storeset_mobile_sidebar_1');
          $data['storeset_mobile_sidebar_2'] = $this->config->get('storeset_mobile_sidebar_2');
          $data['storeset_mobile_sidebar_3'] = $this->config->get('storeset_mobile_sidebar_3');
          $data['storeset_mobile_sidebar_4'] = $this->config->get('storeset_mobile_sidebar_4');
          $data['storeset_mobile_sidebar_5'] = $this->config->get('storeset_mobile_sidebar_5');
          $data['storeset_mobile_sidebar_6'] = $this->config->get('storeset_mobile_sidebar_6');
          $data['storeset_customcss'] = html_entity_decode($this->config->get('storeset_customcss'), ENT_QUOTES, 'UTF-8');
        }  

        $data['storeset_cont_address'] = $this->config->get('storeset_cont_address');
        $data['storeset_cont_email'] = $this->config->get('storeset_cont_email');
        $data['storeset_cont_phone1'] = $this->config->get('storeset_cont_phone1');
        $data['storeset_cont_phone2'] = $this->config->get('storeset_cont_phone2');
        $data['storeset_cont_skype'] = $this->config->get('storeset_cont_skype');
        $storeset_cont_clock = $this->config->get('storeset_cont_clock'); 
        $data['storeset_cont_clock'] = $this->config->get('storeset_cont_clock');
        
        if (empty($storeset_cont_clock[$this->session->data['language']])) {
          $data['storeset_cont_clock'] = "09:00 - 18:00";
        } elseif (isset($storeset_cont_clock[$this->session->data['language']])) {
          $data['storeset_cont_clock'] = html_entity_decode($storeset_cont_clock[$this->session->data['language']], ENT_QUOTES, 'UTF-8');
        }
      

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();
      
        $this->load->model('catalog/information');
    
        $data['informations'] = array();

        foreach ($this->model_catalog_information->getInformations() as $result) {
          if ($result['bottom'] && $result['sort_order'] >= 0) {
            $data['informations'][] = array(
              'title' => $result['title'],
              'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
            );
          }
        }
      

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		        
        $data['register'] = $this->url->link('account/register', '', 'SSL');
        $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');    
        $data['text_forgotten'] = $this->language->get('text_forgotten'); 
      
        if ($this->config->get('megamenu_status')=="1") {
          $this->language->load('extension/module/megamenu');
          $this->load->model('extension/module/megamenu');
          $this->load->model('catalog/category');
          $this->load->model('catalog/product');

          $data['heading_title'] = $this->language->get('heading_title');   
      
          $data['items'] = array();

          $menu_items = $this->cache->get('octemplates.megamenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id'));
              
          if (!$menu_items) {
            $tmp_items= $this->model_extension_module_megamenu->getItems();

            if (count($tmp_items))  {
              foreach($tmp_items as $item) {
                if($item['menu_type']=="category")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseCategory($item);
                }
                if($item['menu_type']=="html")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseHtml($item);
                }
                if($item['menu_type']=="link")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseLink($item);
                }
                if($item['menu_type']=="manufacturer")  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseManufacturer($item);
                }
                if($item['menu_type']=="information") {
                  $menu_items[]=$this->model_extension_module_megamenu->parseInformation($item);
                }
                if($item['menu_type']=="product") {
                  $menu_items[]=$this->model_extension_module_megamenu->parseProduct($item);
                } 
                if($item['menu_type']=="auth" && !$this->customer->isLogged())  {
                  $menu_items[]=$this->model_extension_module_megamenu->parseAuth($item);
                } 
              }
            }

            $this->cache->set('octemplates.megamenu.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id'), $menu_items);
          }

          $data['items'] = $menu_items;
        
          //auth
          $this->load->language('account/login');
          $this->load->language('extension/module/megamenu');
          $data['entry_email'] = $this->language->get('entry_email');
          $data['entry_password'] = $this->language->get('entry_password');
          $data['text_register'] = $this->language->get('text_register');
          $data['menu_title'] = $this->language->get('menu_title');
          
          $data['button_login'] = $this->language->get('button_login');
          $data['action'] = $this->url->link('account/login', '', 'SSL');
          $data['email'] = "";
          $data['register'] = $this->url->link('account/register', '', 'SSL');
          $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
          $data['use_megamenu']=true;
          $data['language'] = $this->load->controller('common/language');
        } else {
          $data['use_megamenu']=false;
          $data['language'] = $this->load->controller('common/language');
        }
      
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
       
        public function getChildrenData( $ctg_id, $path_prefix ) {
          $children_data = array();
          $children = $this->model_catalog_category->getCategories($ctg_id);

          foreach ($children as $child) {
            $children_data[] = array(
              'name'  => $child['name'],
              'href'  => $this->url->link('product/category', 'path=' . $path_prefix . '_' . $child['category_id'])
            );
          }

          return $children_data;
        }
         
        public function getChildrenCategory($category, $path) {
          $children_data = array();
          $children = $this->model_catalog_category->getCategories($category['category_id']);
          
          foreach ($children as $child) {             
            $children_data[] = array(
              'name'    => $child['name'],
              'children'  => $this->getChildrenCategory($child, $path . '_' . $child['category_id']),
              'column'    => 1,
              'href'  => $this->url->link('product/category', 'path=' . $path . '_' . $child['category_id'])  
            );
          }

          return $children_data;
        }
      
}
