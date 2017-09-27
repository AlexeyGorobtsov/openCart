<?php
class ControllerExtensionModulePopupSubscribe extends Controller {
	private $error = array();

	public function index() {
		//CKEditor
    if ($this->config->get('config_editor_default')) {
      $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
      $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
    } else {
      $this->document->addScript('view/javascript/summernote/summernote.js');
      $this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
      $this->document->addScript('view/javascript/summernote/opencart.js');
      $this->document->addStyle('view/javascript/summernote/summernote.css');
    }

    $data['ckeditor'] = $this->config->get('config_editor_default');

		$this->load->language('extension/module/popup_subscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		$this->load->model('extension/module/popup_subscribe');

		$this->model_extension_module_popup_subscribe->makeDB();

		$data['token'] = $this->session->data['token'];
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('popup_subscribe', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_days'] = $this->language->get('text_days');

		$data['column_email'] = $this->language->get('column_email');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_subscribes'] = $this->language->get('tab_subscribes');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_time_expire'] = $this->language->get('entry_time_expire');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_image_x'] = $this->language->get('entry_image_x');
		$data['entry_image_y'] = $this->language->get('entry_image_y');
		$data['entry_promo_text'] = $this->language->get('entry_promo_text');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_csv'] = $this->language->get('button_csv');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_approved'])) {
			$filter_approved = $this->request->get['filter_approved'];
		} else {
			$filter_approved = null;
		}

		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'], true);
		$data['delete'] = $this->url->link('extension/module/popup_subscribe/delete', 'token=' . $this->session->data['token'] . $url, true);
		$data['csv'] = $this->url->link('extension/module/popup_subscribe/csv', 'token=' . $this->session->data['token'] . $url, true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$data['subscribes'] = array();

		$filter_data = array(
			'filter_email'             => $filter_email,
			'filter_approved'          => $filter_approved,
			'filter_date_added'        => $filter_date_added,
			'filter_ip'                => $filter_ip,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$subscribe_total = $this->model_extension_module_popup_subscribe->getTotalSubscribes();

		$results = $this->model_extension_module_popup_subscribe->getSubscribes($filter_data);

		foreach ($results as $result) {
			if (!$result['approved']) {
				$approve = $this->url->link('extension/module/popup_subscribe/approve', 'token=' . $this->session->data['token'] . '&subscribe_id=' . $result['subscribe_id'] . $url, true);
			} else {
				$approve = 1;
			}

			$data['subscribes'][] = array(
				'subscribe_id'   => $result['subscribe_id'],
				'email'          => $result['email'],
				'ip'             => $result['ip'],
				'date_added'     => date("d/m/y H:i:s", strtotime($result['date_added'])),
				'approve'        => $approve
			);
		}

		if (isset($this->request->post['popup_subscribe_form_data'])) {
			$data['popup_subscribe_form_data'] = $this->request->post['popup_subscribe_form_data'];
		} else {
			$data['popup_subscribe_form_data'] = $this->config->get('popup_subscribe_form_data');
		}

		if (isset($this->request->post['popup_subscribe_text_data'])) {
			$data['popup_subscribe_text_data'] = $this->request->post['popup_subscribe_text_data'];
		} else {
			$data['popup_subscribe_text_data'] = $this->config->get('popup_subscribe_text_data');
		}

		$popup_subscribe_form_data = $this->config->get('popup_subscribe_form_data');

		$this->load->model('tool/image');

		if (isset($this->request->post['popup_subscribe_form_data']['image']) && is_file(DIR_IMAGE . $this->request->post['popup_subscribe_form_data']['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['popup_subscribe_form_data']['image'], 100, 100);
		} elseif (!empty($popup_subscribe_form_data) && is_file(DIR_IMAGE . $popup_subscribe_form_data['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($popup_subscribe_form_data['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_email'] = $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . '&sort=email' . $url, true);
		$data['sort_approved'] = $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . '&sort=approved' . $url, true);
		$data['sort_ip'] = $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . '&sort=ip' . $url, true);
		$data['sort_date_added'] = $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $subscribe_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($subscribe_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($subscribe_total - $this->config->get('config_limit_admin'))) ? $subscribe_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $subscribe_total, ceil($subscribe_total / $this->config->get('config_limit_admin')));

		$data['filter_email'] = $filter_email;
		$data['filter_approved'] = $filter_approved;
		$data['filter_ip'] = $filter_ip;
		$data['filter_date_added'] = $filter_date_added;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/popup_subscribe.tpl', $data));
	}

	public function install() {

		$this->load->language('extension/module/popup_subscribe');

    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
		$this->load->model('user/user_group');

    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/popup_subscribe');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/popup_subscribe');

    $this->model_setting_setting->editSetting('popup_subscribe', array(
				'popup_subscribe_text_data' => array(
					$this->config->get('config_admin_language') => array(
						'promo_text' => '',
					)
				),
        'popup_subscribe_form_data' => array(
          'status'   => '1',
					'image'	   => '',
					'image_x'	 => '0',
					'image_y'	 => '0',
					'expire'   => '1',
					'seconds'  => '15000'
        )
      )
		);

    if (!in_array('popup_subscribe', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'popup_subscribe');
    }

    $this->session->data['success'] = $this->language->get('text_success_install');

  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
		$this->load->model('extension/module/popup_subscribe');

		$this->model_extension_module_popup_subscribe->removeDB();
    $this->model_extension_extension->uninstall('module', 'popup_subscribe');
    $this->model_setting_setting->deleteSetting('popup_subscribe_form_data');
		$this->model_setting_setting->deleteSetting('popup_subscribe_text_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/popup_subscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateApprove() {
		if (!$this->user->hasPermission('modify', 'extension/module/popup_subscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function approve() {
		$this->load->language('extension/module/popup_subscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module/popup_subscribe');

		$subscribes = array();

		if (isset($this->request->post['selected'])) {
			$subscribes = $this->request->post['selected'];
		} elseif (isset($this->request->get['subscribe_id'])) {
			$subscribes[] = $this->request->get['subscribe_id'];
		}

		if ($subscribes && $this->validateApprove()) {
			$this->model_extension_module_popup_subscribe->approve($this->request->get['subscribe_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}

			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . $url, true));
		} else {
			$this->index();
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/module/popup_subscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function delete() {
		$this->load->language('extension/module/popup_subscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module/popup_subscribe');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $subscribe_id) {
				$this->model_extension_module_popup_subscribe->deleteSubscribe($subscribe_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}

			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/module/popup_subscribe', 'token=' . $this->session->data['token'] . $url, true));
		} else {
			$this->index();
		}
	}

	protected function validateCSV() {
		if (!$this->user->hasPermission('modify', 'extension/module/popup_subscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function csv() {
		$this->load->language('extension/module/popup_subscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module/popup_subscribe');

		if ($this->validateCSV()) {

			$this->response->addheader('Pragma: public');
			$this->response->addheader('Expires: 0');
			$this->response->addheader('Content-Description: File Transfer');
			$this->response->addheader('Content-Type: application/octet-stream');
			$this->response->addheader('Content-Disposition: attachment; filename=subscribes_'.date("Y-m-d H:i:s", time()).'.csv');
			$this->response->addheader('Content-Transfer-Encoding: binary');

			$this->response->setOutput($this->model_extension_module_popup_subscribe->exportCSV());
		} else {
			$this->index();
		}
	}
}
