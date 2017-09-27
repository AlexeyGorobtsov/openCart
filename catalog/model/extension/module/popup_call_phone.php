<?php
class ModelExtensionModulePopupCallPhone extends Model {
	public function addRequest($data) {
		$this->db->query("INSERT INTO ".DB_PREFIX."popup_call_phone SET info = '".$this->db->escape($data['info'])."', date_added = NOW()");
	}
}
?>