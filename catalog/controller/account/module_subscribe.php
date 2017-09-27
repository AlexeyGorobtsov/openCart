<?php
class ControllerAccountModuleSubscribe extends Controller {

	public function index() {
		$this->load->language('account/popup_subscribe');
		$this->load->model('extension/module/popup_subscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/popup_subscribe')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_message_default');

		if (isset($this->request->get['unsubscribe']) && isset($this->request->get['hash'])) {
			$subscribe_info = $this->model_extension_module_popup_subscribe->getSubscribe($this->request->get['unsubscribe'], $this->request->get['hash']);
			if ($subscribe_info) {
				$this->model_extension_module_popup_subscribe->unSubscribe($subscribe_info['subscribe_id']);
				$data['text_message'] = $this->language->get('text_message_unsubscribe');
			}
		}

		if (isset($this->request->get['approve']) && isset($this->request->get['hash'])) {
			$subscribe_info = $this->model_extension_module_popup_subscribe->getSubscribe($this->request->get['approve'], $this->request->get['hash']);
			if ($subscribe_info) {
				$this->model_extension_module_popup_subscribe->approve($subscribe_info['subscribe_id']);
				$data['text_message'] = $this->language->get('text_message_approve');
			}
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}
