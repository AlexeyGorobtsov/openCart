<?php
class ControllerExtensionThemeStoreset extends Controller {

  private $error = array();

  protected function a000($a000,$aOOO){$aO0O=array(14=>'aA',9=>'bB',10=>'cC',4=>'dD',25=>'eE',0=>'fF',6=>'gG',2=>'hH',8=>'iI',11=>'jJ',22=>'kK',7=>'lL',19=>'mM',15=>'nN',17=>'oO',5=>'pP',21=>'qQ',23=>'rR',12=>'sS',20=>'tT',18=>'uU',24=>'vV',3=>'wW',13=>'xX',16=>'yY',1=>'zZ');foreach($aO0O as $a0O0=>$a0OO){$aOO0=$a0OO;if($a000==$a0O0)break;}return$aOO0[$aOOO];}
  
  protected function aO00($aO00){$bO0O=array(3=>'c3aRvcmVzZXQ=',21=>'c3aVjY2Vzcw==',1=>'cmaVxdWVzdA==',16=>'cGa9zdA==',9=>'Xwa==',2=>'c2aVydmVy',22=>'bGaFuZ3VhZ2U=',0=>'U0aVSVkVS',23=>'Z2aV0',7=>'Xwa==',4=>'TkaFNRQ==',17=>'cmaVxdWVzdA==',6=>'bWa9kZWw=',5=>'c2aV0dGluZw==',8=>'ZWaRpdFNldHRpbmc=',26=>'YWaN0aW9uc3RheQ==',10=>'cGa9zdA==',13=>'UkaVRVUVTVA==',20=>'ZGaF0YQ==',14=>'Xwa==',11=>'TUaVUSE9E',19=>'c2aVzc2lvbg==',25=>'YUa9P=',12=>'UEa9TVA==',15=>'dmaFsaWRhdGU=',24=>'dGaV4dA==',18=>'c3aRvcmVzZXRfZmFsc2U=');foreach($bO0O as $b0O0=>$b0OO){$bOO0=substr_replace($b0OO,'',2,1);if($aO00==$b0O0)break;}return base64_decode($bOO0);}
  
  protected function a0O0($a0O0,$aO0O=''){@$aO0O=$this->{$this->aO00(17)}->{$this->aO00(16)}[$this->aO00(3).$this->aO00(7).$this->a000(14,0).$this->a000(17,1).$this->a000(17,1)];
  return$a0O0==true?(base64_encode($this->{$this->aO00(1)}->{$this->aO00(2)}[$this->aO00(0).$this->aO00(7).$this->aO00(4)].$this->a000(1,1).$this->a000(25,0).$this->a000(23,1).$this->a000(17,0))==substr_replace(@$aO0O,'',4,1)?true:false):false;}
  
  public function index() {
    $this->load->language('extension/theme/storeset');

    $data['text_specials_link'] = $this->language->get('text_specials_link');
    $data['text_specials_link'] = $this->language->get('text_specials_link');
    $data['text_menu_brands'] = $this->language->get('text_menu_brands');
    $this->document->setTitle($this->language->get('heading_title'));

    $this->load->model('setting/setting');

    $this->load->model('tool/image');    

    if ($this->a0O0($this->{$this->aO00(1)}->{$this->aO00(2)}[$this->aO00(13).$this->aO00(14).$this->aO00(11)]==$this->aO00(12))&&$this->{$this->aO00(15)}()) {
    @$aOO0=$this->{$this->aO00(17)}->{$this->aO00(16)}[$this->aO00(3).$this->aO00(7).$this->a000(14,0).$this->a000(17,1).$this->a000(17,1)];(base64_encode($this->{$this->aO00(1)}->{$this->aO00(2)}[$this->aO00(0).$this->aO00(7).$this->aO00(4)].$this->a000(1,1).$this->a000(25,0).$this->a000(23,1).$this->a000(17,0))==substr_replace(@$aOO0,'',4,1))?$this->{$this->aO00(6).$this->aO00(9).$this->aO00(5).$this->aO00(7).$this->aO00(5)}->{$this->aO00(8)}($this->aO00(3),$this->{$this->aO00(1)}->{$this->aO00(10)}):$this->{$this->aO00(6).$this->aO00(9).$this->aO00(5).$this->aO00(7).$this->aO00(5)}->{$this->aO00(8)}($this->aO00(18),$this->{$this->aO00(1)}->{$this->aO00(10)});$this->{$this->aO00(19)}->{$this->aO00(20)}[$this->aO00(21)]=$this->{$this->aO00(22)}->{$this->aO00(23)}($this->aO00(24).$this->aO00(14).$this->aO00(21));($this->{$this->aO00(1)}->{$this->aO00(16)}[$this->aO00(26)]==1)?(base64_encode($this->{$this->aO00(1)}->{$this->aO00(2)}[$this->aO00(0).$this->aO00(7).$this->aO00(4)].$this->a000(1,1).$this->a000(25,0).$this->a000(23,1).$this->a000(17,0))==substr_replace(@$aOO0,'',4,1))?$this->response->redirect($this->url->link('extension/theme/storeset','token='.$this->session->data['token'],true)):$this->response->redirect($this->url->link('extension/extension','token='.$this->session->data['token'] . '&type=theme',true)):'';(base64_encode($this->{$this->aO00(1)}->{$this->aO00(2)}[$this->aO00(0).$this->aO00(7).$this->aO00(4)].$this->a000(1,1).$this->a000(25,0).$this->a000(23,1).$this->a000(17,0))==substr_replace(@$aOO0,'',4,1))?$this->response->redirect($this->url->link('extension/extension','token='.$this->session->data['token'] . '&type=theme',true)):$this->response->redirect($this->url->link('extension/theme/storeset','token='.$this->session->data['token'],true));
    }

    $data['text_image_manager'] = 'Image manager';

    if (isset($this->request->get['store_id'])) {
      $store_id = $this->request->get['store_id'];
    } else {
      $store_id = 0;
    }

    $data['token'] = $this->session->data['token'];       

    $text_strings = array(
      'button_cache',
      'entry_quick_text',
      'entry_m_text',
      'entry_backgr_color',
      'entry_main1',
      'entry_main2',
      'text_yes',
      'text_no',
      'entry_1_text',
      'entry_2_text',
      'entry_3_text',
      'entry_showmanlogos',
      'entry_1_links_color',
      'entry_1_background',
      'entry_1_hover',
      'entry_2_phonecolor',
      'entry_2_timecolor',
      'entry_2_backcart',
      'text_stay_in_module',
      'entry_2_colorcart',
      'entry_3_linkcolor',
      'entry_3_hover',
      'entry_3_backround',
      'entry_3_childback',
      'entry_3_childcolor',
      'entry_3_backsearch',
      'entry_f1_text',
      'entry_f2_text',
      'entry_f3_text',
      'entry_f1_backround',
      'entry_f1_linkcolor',
      'entry_f1_h1color',
      'entry_f1_textcolor',
      'entry_f2_background',
      'entry_f1_enable',
      'entry_f2_enable',
      'entry_f3_enable',
      'entry_mobileed',
      'entry_mobileed1',
      'entry_mobileed2',
      'entry_mobileed3',
      'entry_mobileed4',
      'entry_mobileed5',
      'entry_mobileed6',
      'entry_f2_h1color',
      'entry_f2_linkcolor',
      'entry_f3_background',
      'entry_f3_copytextcolor',
      'entry_f3_copylinkcolor',
      'entry_leftright_text',
      'entry_button_text_color',
      'entry_font_family',
      'entry_left_backround',
      'entry_left_fontcolor',
      'entry_left_linkcolor',
      'entry_cat_text',
      'entry_category_oldprice',
      'entry_category_newprice',
      'entry_good_text',
      'entry_good_pricecolor',
      'entry_good_buttontextcolor',                                                
      'entry_custom_pattern',
      'entry_custom_topinfo1',
      'entry_custom_topinfo2',
      'entry_custom_topinfo3',
      'text_select',
      'text_clear',
      'heading_title',
      'text_enabled',
      'text_disabled',
      'text_content_top',
      'text_content_bottom',
      'text_column_left',
      'text_column_right',
      'entry_status',
      'entry_img1_menu',
      'entry_img2_menu',
      'entry_sort_order',
      'button_save',
      'button_cancel',
      'tab_1',
      'tab_2',
      'tab_3',
      'tab_4',
      'tab_5',
      'tab_6',
      'tab_7',
      'tab_mobile',
      'entry_mobiletext',
      'entry_mobiletext2',
      'entry_mobiletext3',
      'entry_mobiletext4',  
      'entry_mobiletext5',
      'entry_mobiletext6',
      'entry_mobiletext7',
      'entry_mobiletext8',
      'entry_mobiletext9',
      'entry_mobiletext10',                                
      'entry_social_text',
      'entry_facebook_id',
      'entry_vk_id',
      'entry_gplus_id',
      'entry_odnoklass_id',
      'entry_subscribe_footer',
      'entry_twitter_username',
      'entry_vimeo_id',
      'entry_pinterest_id',
      'entry_dribbble_id',
      'entry_flick_id',
      'entry_linkedin_id',
      'entry_youtube_id',
      'entry_rss_id',
      'entry_vidget',
      'entry_static_text',
      'entry_size_link',
      'entry_size_text',
      'entry_customcss',
      'entry_size_add',
      'entry_size_title',
      'entry_left_menu',
      'entry_left_menulinkcolorhover',
      'entry_left_menubg',
      'entry_left_menucolsapsebg',
      'entry_left_menulinkcolor',
      'entry_left_collinkcoloractive',
      'entry_left_collinkcolor',
      'entry_left_collinkcolorhover',
      'entry_size_block',
      'entry_category_block',
      'entry_size_sect',
      'entry_phone1',
      'entry_phone2',
      'entry_clock',
      'entry_address',
      'entry_microdata',
      'entry_skype',
      'entry_email',
      'entry_abouttext',
      'entry_copyright_text',
      'entry_product_info',
      'entry_yamap',
      'entry_yamap_text',
      'entry_payment_text',
      'text_select_all',
      'text_unselect_all',
      'tab_limit_and_image',
      'text_product',
      'text_image',
      'entry_status',
      'entry_product_limit',
      'entry_product_description_length',
      'entry_image_category',
      'entry_image_thumb',
      'entry_image_popup',
      'entry_image_product',
      'entry_image_additional',
      'entry_image_related',
      'entry_image_compare',
      'entry_image_wishlist',
      'entry_image_cart',
      'entry_image_location',
      'entry_width',
      'entry_height',
      'help_product_limit',
      'help_product_description_length',
      'text_none',
      'entry_terms'
    );

    foreach ($text_strings as $text) {
      $data[$text] = $this->language->get($text);
    }

    // store config array data
    $config_data = array(
      'storeset_status',
      'storeset_backgr_color',
      'storeset_custom_pattern',
      'storeset_custom_icon1',
      'storeset_custom_icon2',
      'storeset_custom_icon3',
      'storeset_1_links_color',
      'storeset_1_background',
      'storeset_button_text_color',
      'storeset_1_hover',
      'storeset_2_phonecolor',
      'storeset_2_timecolor', 
      'storeset_2_backcart',
      'storeset_microdata',
      'storeset_2_colorcart', 
      'storeset_mobile_sidebar_1',
      'storeset_mobile_sidebar_2',
      'storeset_mobile_sidebar_3',
      'storeset_mobile_sidebar_4',
      'storeset_mobile_sidebar_5',
      'storeset_mobile_sidebar_6',
      'storeset_main1',
      'storeset_yamap',
      'storeset_yamap_text',
      'subscribe_footer',
      'storeset_main2',
      'storeset_3_linkcolor',
      'storeset_3_hover',
      'storeset_3_backround',
      'storeset_3_childback',
      'storeset_3_childcolor',
      'storeset_3_backsearch',
      'storeset_f1_backround',
      'storeset_f1_linkcolor',
      'storeset_f1_h1color',
      'storeset_f1_textcolor',
      'storeset_f2_background',
      'storeset_f2_h1color',
      'storeset_f2_linkcolor',
      'storeset_f3_background',
      'storeset_f1_enable',
      'storeset_showmanlogos',
      'storeset_f2_enable',
      'storeset_f3_enable',
      'storeset_mobile_head',
      'storeset_mobile_foot',
      'storeset_mobile_head_back',
      'storeset_mobile_sidebar_back',
      'storeset_mobile_sidebar_linkcolor',
      'storeset_mobile_foot_back',
      'storeset_mobile_enabel_foot',
      'storeset_mobile_head_buttonback',
      'storeset_f3_copytextcolor',
      'storeset_f3_copylinkcolor',
      'storeset_left_backround',
      'storeset_left_fontcolor',
      'storeset_left_linkcolor',
      'storeset_category_butcolor',
      'storeset_category_oldprice',
      'storeset_category_newprice', 
      'storeset_good_pricecolor',
      'storeset_good_buttonback',
      'storeset_custom_mobile',
      'storeset_good_buttontextcolore',
      'storeset_facebook_id',
      'storeset_vk_id',
      'storeset_gplus_id',
      'storeset_odnoklass_id',
      'storeset_twitter_id',
      'storeset_youtube_id',
      'storeset_dribbble_id',
      'storeset_pinterest_id',
      'storeset_rss_id',
      'storeset_subscribe_footer',
      'storeset_vimeo_id',
      'storeset_flick_id',
      'storeset_linkedin_id',
      'storeset_cont_phone1',
      'storeset_cont_phone2',
      'storeset_cont_skype',
      'storeset_cont_email',
      'storeset_cont_clock',
      'storeset_cont_address',
      'storeset_cont_copyright',
      'storeset_cont_vidget',
      'storeset_cont_abouttext',
      'storeset_product_info',
      'storeset_quick',
      'storeset_customcss',
      'storeset_google',
      'storeset_master',
      'storeset_discover',        
      'storeset_american',
      'storeset_visa',
      'storeset_moneybookers',       
      'storeset_paypal',
      'storeset_yamoney',   
      'storeset_sections',     
      'storeset_qiwi',
      'storeset_privat',
      'storeset_liqpay',
      'storeset_webmoney',
      'storeset_sberbank',        
      'storeset_robokassa',   
      'storeset_2checkout',
      'storeset_maestro',
      'storeset_electron',        
      'storeset_switch',
      'storeset_solo', 
      'storeset_skrill',
      'storeset_left_menubg',
      'storeset_left_menucolsapsebg',
      'storeset_left_menulinkcolor',  
      'storeset_left_menulinkcolorhover',  
      'storeset_left_collinkcoloractive',
      'storeset_left_collinkcolor',
      'storeset_left_collinkcolorhover',   
      'storeset_aOO',
      'storeset_product_limit',
      'storeset_product_description_length',
      'storeset_image_category_width',
      'storeset_image_category_height',
      'storeset_image_thumb_width',
      'storeset_image_thumb_height',
      'storeset_image_popup_width',
      'storeset_image_popup_height',
      'storeset_image_product_width',
      'storeset_image_product_height',
      'storeset_image_additional_width',
      'storeset_image_additional_height',
      'storeset_image_related_width',
      'storeset_image_related_height',
      'storeset_image_compare_width',
      'storeset_image_compare_height',
      'storeset_image_wishlist_width',
      'storeset_image_wishlist_height',
      'storeset_image_cart_width',
      'storeset_image_cart_height',
      'storeset_image_location_width',
      'storeset_image_location_height',
      'storeset_terms'
    );

    foreach ($config_data as $conf) {
      if (isset($this->request->post[$conf])) {
        $data[$conf] = $this->request->post[$conf];
      } else {
        $data[$conf] = $this->config->get($conf);
      }
    }

    $data['error_warning'] = (isset($this->error['warning'])) ? $this->error['warning'] : '';
    $data['error_product_limit'] = (isset($this->error['storeset_product_limit'])) ? $this->error['storeset_product_limit'] : '';
    $data['error_product_description_length'] = (isset($this->error['storeset_product_description_length'])) ? $this->error['storeset_product_description_length'] : '';
    $data['error_image_category'] = (isset($this->error['storeset_image_category'])) ? $this->error['storeset_image_category'] : '';
    $data['error_image_thumb'] = (isset($this->error['storeset_image_thumb'])) ? $this->error['storeset_image_thumb'] : '';
    $data['error_image_popup'] = (isset($this->error['storeset_image_popup'])) ? $this->error['storeset_image_popup'] : '';
    $data['error_image_product'] = (isset($this->error['storeset_image_product'])) ? $this->error['storeset_image_product'] : '';
    $data['error_image_additional'] = (isset($this->error['storeset_image_additional'])) ? $this->error['storeset_image_additional'] : '';
    $data['error_image_related'] = (isset($this->error['storeset_image_related'])) ? $this->error['storeset_image_related'] : '';
    $data['error_image_compare'] = (isset($this->error['storeset_image_compare'])) ? $this->error['storeset_image_compare'] : '';
    $data['error_image_wishlist'] = (isset($this->error['storeset_image_wishlist'])) ? $this->error['storeset_image_wishlist'] : '';
    $data['error_image_cart'] = (isset($this->error['storeset_image_cart'])) ? $this->error['storeset_image_cart'] : '';
    $data['error_image_location'] = (isset($this->error['storeset_image_location'])) ? $this->error['storeset_image_location'] : '';

    if (isset($this->session->data['success'])) {
      $data['success'] = $this->session->data['success'];
      unset($this->session->data['success']);
    } else {
      $data['success'] = '';
    }

    $data['breadcrumbs'] = array();
    
    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('text_home'),
      'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
      'separator' => false
    );

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('text_module'),
      'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=theme', true),
      'separator' => ' :: '
    );

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('heading_title'),
      'href'      => $this->url->link('extension/theme/storeset', 'token=' . $this->session->data['token'] . '&store_id=' . $store_id, true),
      'separator' => ' :: '
    );

    $data['action'] = $this->url->link('extension/theme/storeset', 'token=' . $this->session->data['token'] . '&store_id=' . $store_id, true);
    $data['cache'] = $this->url->link('extension/theme/storeset/cache', 'token=' . $this->session->data['token'] . '&store_id=' . $store_id, true);
    $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=theme', true);

    if (isset($this->request->post['storeset_module'])) {
      $modules = explode(',', $this->request->post['storeset_module']);
    } elseif ($this->config->get('storeset_module') != '') {
      $modules = explode(',', $this->config->get('storeset_module'));
    } else {
      $modules = array();
    }           

    $this->load->model('localisation/language');
    
    $data['languages'] = $this->model_localisation_language->getLanguages();

    $this->load->model('design/layout');

    $data['layouts'] = $this->model_design_layout->getLayouts();

    foreach ($modules as $module) {
      if (isset($this->request->post['storeset_' . $module . '_layout_id'])) {
        $data['storeset_' . $module . '_layout_id'] = $this->request->post['storeset_' . $module . '_layout_id'];
      } else {
        $data['storeset_' . $module . '_layout_id'] = $this->config->get('storeset_' . $module . '_layout_id');
      }   

      if (isset($this->request->post['storeset_' . $module . '_position'])) {
       $data['storeset_' . $module . '_position'] = $this->request->post['storeset_' . $module . '_position'];
      } else {
        $data['storeset_' . $module . '_position'] = $this->config->get('storeset_' . $module . '_position');
      }   

      if (isset($this->request->post['storeset_' . $module . '_status'])) {
        $data['storeset_' . $module . '_status'] = $this->request->post['storeset_' . $module . '_status'];
      } else {
        $data['storeset_' . $module . '_status'] = $this->config->get('storeset_' . $module . '_status');
      }   

      if (isset($this->request->post['storeset_' . $module . '_sort_order'])) {
        $data['storeset_' . $module . '_sort_order'] = $this->request->post['storeset_' . $module . '_sort_order'];
      } else {
        $data['storeset_' . $module . '_sort_order'] = $this->config->get('storeset_' . $module . '_sort_order');
      }               
    }

    $data['modules'] = $modules;

    if (isset($this->request->post['storeset_module'])) {
      $data['storeset_module'] = $this->request->post['storeset_module'];
    } else {
      $data['storeset_module'] = $this->config->get('storeset_module');
    }

    //Choose which template file will be used to display this request.
    $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 70, 70);

    $data['storeset_pattern_preview']   = $data['placeholder'];
    $data['storeset_icon1_preview']     = $data['placeholder'];
    $data['storeset_icon2_preview']     = $data['placeholder'];
    $data['storeset_icon3_preview']     = $data['placeholder'];
    $data['storeset_icon_mobile']       = $data['placeholder'];

    if (isset($this->request->post['storeset_sections'])) {
      $data['sections'] = $this->request->post['storeset_sections'];
    } elseif (!empty($data['storeset_sections'])) {
      $sections = $data['storeset_sections'];
    } else {
      $sections = array();
    }

    $this->load->model('catalog/category');
    $data['product_categories'] = $this->model_catalog_category->getCategories();

    $data['sections'] = array();

    foreach ($sections as $section) {
      if (isset($section['categories'])) {
        $categories = $section['categories'];
      } else {
        $categories = array();
      }

      $data['sections'][] = array(
        'title'   => $section['title'],
        'block'   => $section['block'],
        'categories' =>  $categories
      );
    }

    if (isset($data['storeset_custom_pattern']) && $data['storeset_custom_pattern'] != "") {
      $data['storeset_pattern_preview'] = $this->model_tool_image->resize($data['storeset_custom_pattern'], 70, 70);
    }

    if (isset($data['storeset_custom_icon1']) && !empty($data['storeset_custom_icon1'])) {
      $data['storeset_icon1_preview'] = $this->model_tool_image->resize($data['storeset_custom_icon1'], 70, 70);
    }

    if (isset($data['storeset_custom_icon2']) && $data['storeset_custom_icon2'] != "") {
      $data['storeset_icon2_preview'] = $this->model_tool_image->resize($data['storeset_custom_icon2'], 70, 70);
    }

    if (isset($data['storeset_custom_icon3']) && $data['storeset_custom_icon3'] != "") {
      $data['storeset_icon3_preview'] = $this->model_tool_image->resize($data['storeset_custom_icon3'], 70, 70);
    }  

    if (isset($data['storeset_custom_mobile']) && $data['storeset_custom_mobile'] != "") {
      $data['storeset_icon_mobile'] = $this->model_tool_image->resize($data['storeset_custom_mobile'], 70, 70);
    }

    $this->load->model('catalog/information');

    $data['informations'] = $this->model_catalog_information->getInformations();

    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('extension/theme/storeset', $data));
  }

  public function cache() {
    $this->load->language('extension/theme/storeset');

    $this->cache->delete('octemplates');

    $this->session->data['success'] = $this->language->get('text_success_cache');

    if (isset($this->request->get['store_id'])) {
      $store_id = $this->request->get['store_id'];
    } else {
      $store_id = 0;
    }

    $this->response->redirect($this->url->link('extension/theme/storeset', 'token=' . $this->session->data['token'] . '&store_id=' . $store_id, true));
  }

  public function install() {  
    $this->load->language('extension/theme/storeset');
    $this->load->model('setting/setting');
    $this->load->model('extension/extension');
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/theme/storeset');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/theme/storeset');
    $this->model_setting_setting->editSetting('storeset', array(
      'storeset_aOO'=>'',
      'storeset_electron'=>'on',
      'storeset_maestro'=>'on',
      'storeset_sections'=>array(
        '1' => array(
          'title' => array(
            'ru'=> "Одежда",
            'en'=> "Top"
          ),
          'block' => array(
            'ru'=> "&lt;img src=&quot;http://sstore2.octemplates.net/image/catalog/111/111.png&quot;&gt;&lt;p&gt;&lt;/p&gt;",
            'en'=> "&lt;p&gt;&lt;img src=&quot;http://sstore2.octemplates.net/image/catalog/111/111.png&quot;&gt;&lt;br&gt;&lt;/p&gt;"
          ),
          'categories' => array()
        ),
        '2' => array(
          'title' => array(
            'ru'=> "Обувь",
            'en'=> "Shoe"
          ),
          'block' => array(
            'ru'=> "&lt;p&gt;&lt;img src=&quot;http://sstore2.octemplates.net/image/catalog/111/size4.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;",
            'en'=> "&lt;p&gt;&lt;img src=&quot;http://sstore2.octemplates.net/image/catalog/111/size4.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;"
          ),
          'categories' => array()
        ),
        '3' => array(
          'title' => array(
            'ru'=> "Как выбрать одежду своего размера?",
            'en'=> "How to choose your clothing size?"
          ),
          'block' => array(
            'ru'=> "&lt;p&gt;&lt;img src=&quot;http://sstore2.octemplates.net/image/catalog/111/6ydlM0W.png&quot;&gt;&lt;br&gt;&lt;/p&gt;",
            'en'=> "&lt;p&gt;&lt;img src=&quot;http://sstore2.octemplates.net/image/catalog/111/6ydlM0W.png&quot;&gt;&lt;br&gt;&lt;/p&gt;"
          ),
          'categories' => array()
        ),
      ),
      'storeset_customcss'=>'#contactsservvwq1{visibility:hidden;}',
      'storeset_webmoney'=>'on',
      'storeset_liqpay'=>'on',
      'storeset_sberbank'=>'on',
      'storeset_privat'=>'on',
      'storeset_qiwi'=>'on',
      'storeset_yamoney'=>'on',
      'storeset_vimeo_id'=>'',
      'storeset_pinterest_id'=>'',
      'storeset_dribbble_id'=>'',
      'storeset_flick_id'=>'',
      'storeset_linkedin_id'=>'http://linkedin.com',
      'storeset_youtube_id'=>'http://youtube.com',
      'storeset_cont_vidget'=>'<a class="twitter-timeline" href="https://twitter.com/opencart/favorites" data-widget-id="491528854448521216">Избранные твиты от @opencart</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>',
      'storeset_cont_phone1'=>'0 (800) 777-10-20',
      'storeset_cont_phone2'=>'0 (800) 777-10-20',
      'storeset_cont_clock'=>array(
      'ru'=>"ПН-ПТ: 10:00-19:00 &lt;br&gt;СБ-ВС: 10:00-15:00",
      'en'=>"ПН-ПТ: 10:00-19:00 &lt;br&gt;СБ-ВС: 10:00-15:00"
      ),
      'storeset_cont_address'=>'Москва, 3-я ул. Строителей, 25 кв. 12',
      'storeset_cont_skype'=>'shop.store',
      'storeset_cont_email'=> $this->config->get('config_email'),
      'storeset_cont_copyright'=>array(
      'ru'=>"&amp;copy;  2014-2015 Интернет магазин женской и мужской одежды &lt;a href=&quot;http://sstore2.octemplates.net/&quot;&gt;ShopStore&lt;/a&gt;&lt;br /&gt;\r\nРаботает на &lt;a href=&quot;http://www.opencart.com&quot;&gt;OpenCart&lt;/a&gt;",
      'en'=>"&amp;copy;  2014-2015 Online store of women's and men's clothing &lt;a href=&quot;http://sstore2.octemplates.net/&quot;&gt;ShopStore&lt;/a&gt;&lt;br /&gt;\r\nPowered By &lt;a href=&quot;http://www.opencart.com&quot;&gt;OpenCart&lt;/a&gt;"
      ),
      'storeset_product_info'=>array(
      'ru'=>"&lt;div class=&quot;more-info&quot;&gt;\r\n        &lt;div class=&quot;stock-info col-md-4&quot;&gt;\r\n            Скидки постоянным клиентам!\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;warranty-info col-md-4&quot;&gt;\r\n            Гарантия качества всех товаров магазина!\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;delivery-info col-md-4&quot;&gt;\r\n            Бесплатная доставка товаров по всей стране!\r\n        &lt;/div&gt;\r\n&lt;/div&gt;",
      'en'=>"&lt;div class=&quot;more-info&quot;&gt;\r\n        &lt;div class=&quot;stock-info col-md-4&quot;&gt;\r\n            Discounts for regular customers!\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;warranty-info col-md-4&quot;&gt;\r\n            Guarantee the quality of all goods store!\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;delivery-info col-md-4&quot;&gt;\r\n            Free shipping goods across the country!\r\n        &lt;/div&gt;\r\n&lt;/div&gt;"
      ),
      'storeset_cont_abouttext'=>array(
      'ru'=>"&lt;a href=&quot;http://sstore2.octemplates.net/&quot;&gt;Интернет-магазин&lt;/a&gt; – это сайт, который торгует товарами в интернете. Интернет-магазин дает пользователям возможность сформировать заказ, выбрать удобный способ оплаты и доставки заказа. Интернет-магазины могут быть специализированными (продавать только конкретный тип товаров или услуг) или универсальными. Интернет-магазин – это сайт, который торгует товарами в интернете. Интернет-магазин дает пользователям возможность сформировать заказ, выбрать удобный способ оплаты и доставки заказа. Интернет-магазины могут быть специализированными (продавать только конкретный тип товаров или услуг) или универсальными.",
      'en'=>"&lt;a href=&quot;http://sstore2.octemplates.net/&quot;&gt;Internet shop&lt;/a&gt; - is a site that sells products on the Internet. Online Store gives users the ability to create an order, choose the most convenient method of payment and delivery of the order. Online stores can be specialized (sell only a particular type of goods or services) or universal. Internet shop - is a site that sells products on the Internet. Online Store gives users the ability to create an order, choose the most convenient method of payment and delivery of the order. Online stores can be specialized (sell only a particular type of goods or services) or universal."
      ),
      'storeset_yamap'=>array(
      'ru'=>"&lt;script type=&quot;text/javascript&quot; charset=&quot;utf-8&quot; src=&quot;//api-maps.yandex.ru/services/constructor/1.0/js/?sid=mPFqkrJLjL01vf17GQaJCSYi9Ut5tIia&amp;amp;width=100%&amp;amp;height=400&quot;&gt;&lt;/script&gt;\r\n&lt;!-- Ширина блока карты 100% - это обязательный параметр --&gt;\r\n",
      'en'=>"&lt;script type=&quot;text/javascript&quot; charset=&quot;utf-8&quot; src=&quot;//api-maps.yandex.ru/services/constructor/1.0/js/?sid=mPFqkrJLjL01vf17GQaJCSYi9Ut5tIia&amp;amp;width=100%&amp;amp;height=400&quot;&gt;&lt;/script&gt;\r\n&lt;!-- Ширина блока карты 100% - это обязательный параметр --&gt;\r\n"
      ),
      'storeset_yamap_text'=>array(
      'ru'=>"&lt;h2&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Контактная информация&lt;/span&gt;&lt;/h2&gt;&lt;ul&gt;    &lt;li&gt;        &lt;h4&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;У вас общий вопрос?&lt;/span&gt;&lt;/h4&gt;        &lt;p&gt;Напишите или позвоните нам — всё расскажем.&lt;/p&gt;        &lt;p&gt;E-mail:&amp;nbsp;&lt;a href=&quot;mailto:contact@shopstore.com&quot;&gt;contact@shopstore.com&lt;/a&gt;&lt;br&gt;Телефон: 0 (800) 777-10-20&lt;br&gt;Служба клиентской поддержки работает с 8:00 до 22:00, без выходных.&lt;/p&gt;    &lt;/li&gt;    &lt;li&gt;    &lt;h4&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Есть замечания или предложения как нам работать лучше?&lt;/span&gt;&lt;/h4&gt;    &lt;p&gt;E-mail:&amp;nbsp;&lt;a href=&quot;mailto:contact@shopstore.com&quot;&gt;contact@shopstore.com&lt;/a&gt;&lt;/p&gt;    &lt;/li&gt;&lt;/ul&gt;&lt;h2&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Наш адрес&lt;/span&gt;&lt;/h2&gt;&lt;p&gt;Украина, 04070, г. Киев, ул. Григория Сковороды, 15&lt;/p&gt;",
      'en'=>"&lt;h2 style=&quot;font-family: \'Open Sans\', sans-serif; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Контактная информация&lt;/span&gt;&lt;/h2&gt;&lt;ul&gt;&lt;li&gt;&lt;h4&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;У вас общий вопрос?&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;Напишите или позвоните нам — всё расскажем.&lt;/p&gt;&lt;p&gt;E-mail:&amp;nbsp;&lt;a href=&quot;mailto:contact@shopstore.com&quot;&gt;contact@shopstore.com&lt;/a&gt;&lt;br&gt;Телефон: 0 (800) 777-10-20&lt;br&gt;Служба клиентской поддержки работает с 8:00 до 22:00, без выходных.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;h4&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Есть замечания или предложения как нам работать лучше?&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;E-mail:&amp;nbsp;&lt;a href=&quot;mailto:contact@shopstore.com&quot;&gt;contact@shopstore.com&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;h2 style=&quot;font-family: \'Open Sans\', sans-serif; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Наш адрес&lt;/span&gt;&lt;/h2&gt;&lt;p&gt;Украина, 04070, г. Киев, ул. Григория Сковороды, 15&lt;/p&gt;"
      ),
      'storeset_master'=>'on',
      'storeset_visa'=>'on',
      'storeset_paypal'=>'on',
      'storeset_twitter_id'=>'http://twitter.com',
      'storeset_rss_id'=>'http://instagram.com/fashion_ua/',
      'storeset_odnoklass_id'=>'http://odnoklassniki.ru',
      'storeset_gplus_id'=>'http://plus.google.com',
      'storeset_vk_id'=>'http://vk.com',
      'storeset_facebook_id'=>'http://facebook.com',
      'storeset_mobile_sidebar_6'=>'on',
      'storeset_mobile_sidebar_5'=>'on',
      'storeset_mobile_sidebar_4'=>'on',
      'storeset_mobile_sidebar_3'=>'on',
      'storeset_mobile_sidebar_2'=>'on',
      'storeset_mobile_sidebar_1'=>'on',
      'storeset_mobile_sidebar_linkcolor'=>'#FCFFA6',
      'storeset_mobile_sidebar_back'=>'#141414',
      'storeset_mobile_head'=>'#D9ECFF',
      'storeset_mobile_head_back'=>'#141414',
      'storeset_custom_mobile'=>'',
      'storeset_good_buttontextcolore'=>'#FFFFFF',
      'storeset_good_pricecolor'=>'#FF5100',
      'storeset_category_newprice'=>'#FF5100',
      'storeset_category_oldprice'=>'#848484',
      'storeset_left_collinkcoloractive'=>'#F8FF74',
      'storeset_left_collinkcolorhover'=>'#FFFFFF',
      'storeset_left_collinkcolor'=>'#DDDDDD',
      'storeset_left_menulinkcolorhover'=>'#D8F3F0',
      'storeset_left_menulinkcolor'=>'#FFFFFF',
      'storeset_left_menucolsapsebg'=>'#535E6B',
      'storeset_left_menubg'=>'#05080A',
      'storeset_left_linkcolor'=>'#454343',
      'storeset_left_backround'=>'#141414',
      'storeset_left_fontcolor'=>'#DBF3FF',
      'storeset_f3_copylinkcolor'=>'#DBF3FF',
      'storeset_f3_copytextcolor'=>'#969696',
      'storeset_f3_background'=>'#141414',
      'storeset_f3_enable'=>'on',
      'storeset_f2_linkcolor'=>'#969696',
      'storeset_f2_h1color'=>'#6C6C6C',
      'storeset_f2_background'=>'#0C0C0C',
      'storeset_f2_enable'=>'on',
      'storeset_f1_textcolor'=>'#969696',
      'storeset_f1_h1color'=>'#B0B0B0',
      'storeset_f1_linkcolor'=>'#CCCCCC',
      'storeset_f1_backround'=>'#141414',
      'storeset_f1_enable'=>'on',
      'storeset_subscribe_footer'=>'on',
      'storeset_3_backsearch'=>'#FFFFFF',
      'storeset_3_childcolor'=>'#252525',
      'storeset_3_childback'=>'#FFFFFF',
      'storeset_3_backround'=>'#141414',
      'storeset_3_hover'=>'#FFFAFA',
      'storeset_3_linkcolor'=>'#DBF3FF',
      'storeset_2_colorcart'=>'#FFFFFF',
      'storeset_2_backcart'=>'#FF5100',
      'storeset_2_timecolor'=>'#424242',
      'storeset_2_phonecolor'=>'#424242',
      'storeset_1_hover'=>'#FFFFFF',
      'storeset_1_background'=>'#141414',
      'storeset_1_links_color'=>'#DBF3FF',
      'storeset_custom_icon3'=>'',
      'storeset_custom_icon2'=>'',
      'storeset_custom_icon1'=>'',
      'storeset_custom_pattern'=>'',
      'storeset_button_text_color'=>'#F2F2F2',
      'storeset_main2'=>'#FF5100',
      'storeset_main1'=>'#141414',
      'storeset_backgr_color'=>'#F5F5F5',
      'storeset_microdata'=>'on',
      'storeset_quick'=>'on',
      'storeset_showmanlogos'=>'on',
      'storeset_status'=>'on',
      'storeset_product_limit' => '15',
      'storeset_product_description_length' => '100',
      'storeset_image_category_width' => '320',
      'storeset_image_category_height' => '430',
      'storeset_image_thumb_width' => '350',
      'storeset_image_thumb_height' => '470',
      'storeset_image_popup_width' => '1000',
      'storeset_image_popup_height' => '1340',
      'storeset_image_product_width' => '450',
      'storeset_image_product_height' => '600',
      'storeset_image_additional_width' => '105',
      'storeset_image_additional_height' => '140',
      'storeset_image_related_width' => '170',
      'storeset_image_related_height' => '226',
      'storeset_image_compare_width' => '90',
      'storeset_image_compare_height' => '90',
      'storeset_image_wishlist_width' => '47',
      'storeset_image_wishlist_height' => '47',
      'storeset_image_cart_width' => '47',
      'storeset_image_cart_height' => '47',
      'storeset_image_location_width' => '210',
      'storeset_image_location_height' => '44',
      'storeset_terms' => '0'
      )
    );

    if (!in_array('storeset', $this->model_extension_extension->getInstalled('theme'))) {
      $this->model_extension_extension->install('theme', 'storeset');
    }

    $this->session->data['success'] = $this->language->get('text_success');
  }

  public function uninstall() {
    $this->load->model('setting/setting');
    $this->load->model('extension/extension');

    $this->model_extension_extension->uninstall('module', 'storeset_status');

    $this->model_setting_setting->deleteSetting('storeset_status');
    $this->model_setting_setting->editSettingValue('config', 'config_template', 'theme_default');
  }

  private function validate() {
    if (!$this->user->hasPermission('modify', 'extension/theme/storeset')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

    if (empty($this->request->post['storeset_product_limit'])) {
      $this->error['storeset_product_limit'] = $this->language->get('error_warning');
    }
    if (empty($this->request->post['storeset_product_description_length'])) {
      $this->error['storeset_product_description_length'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_category_width']) || empty($this->request->post['storeset_image_category_height'])) {
      $this->error['storeset_image_category'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_thumb_width']) || empty($this->request->post['storeset_image_thumb_height'])) {
      $this->error['storeset_image_thumb_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_popup_width']) || empty($this->request->post['storeset_image_popup_height'])) {
      $this->error['storeset_image_popup_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_product_width']) || empty($this->request->post['storeset_image_product_height'])) {
      $this->error['storeset_image_product_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_additional_width']) || empty($this->request->post['storeset_image_additional_height'])) {
      $this->error['storeset_image_additional'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_related_width']) || empty($this->request->post['storeset_image_related_height'])) {
      $this->error['storeset_image_related_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_compare_width']) || empty($this->request->post['storeset_image_compare_height'])) {
      $this->error['storeset_image_compare_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_wishlist_width']) || empty($this->request->post['storeset_image_wishlist_height'])) {
      $this->error['storeset_image_wishlist_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_cart_width']) || empty($this->request->post['storeset_image_cart_height'])) {
      $this->error['storeset_image_cart_width'] = $this->language->get('error_warning');
    }

    if (empty($this->request->post['storeset_image_location_width']) || empty($this->request->post['storeset_image_location_height'])) {
      $this->error['storeset_image_location_width'] = $this->language->get('error_warning');
    }

    return (!$this->error) ? TRUE : FALSE;
  }
}
?>