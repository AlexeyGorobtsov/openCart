<?php
class ModelCatalogProductTabs extends Model {
	public function getProductTabs($product_id) {
    $product_extra_tab_ids = array();

    $product_extra_tab_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product_extra_tabs pet LEFT JOIN " . DB_PREFIX . "extra_tabs et ON (et.extra_tab_id = pet.extra_tab_id) LEFT JOIN " . DB_PREFIX . "extra_tabs_description etd ON (etd.extra_tab_id = pet.extra_tab_id) WHERE pet.product_id = '" . (int)$product_id . "' AND pet.language_id = '" . (int)$this->config->get('config_language_id') . "' AND etd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND et.status = '1'");

    if ($product_extra_tab_query->rows) {
      foreach ($product_extra_tab_query->rows as $product_extra_tab) {
        $product_extra_tab_ids[] = array(
        	'title' => $product_extra_tab['title'],
					'text' => $product_extra_tab['text']
        );
      }
    }
    
    return $product_extra_tab_ids;
  }
}