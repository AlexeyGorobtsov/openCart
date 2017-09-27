<?php
class ModelExtensionModuleImagesByOptions extends Model {
	public function makeDB() {
		$sql  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_image_by_option` ( ";
		$sql .= "`product_id` int(11) NOT NULL, ";
		$sql .= "`product_image_id` int(11) NOT NULL, ";
		$sql .= "`option_value_id` int(11) NOT NULL ";
		$sql .= ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";

		$this->db->query($sql);
	}

	public function removeDB() {
		$sql  = "DROP TABLE IF EXISTS `" . DB_PREFIX . "product_image_by_option`;";

		$this->db->query( $sql );
	}
}
