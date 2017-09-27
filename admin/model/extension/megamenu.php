<?php
class ModelExtensionMegamenu extends Model {
	public function getOptions($data){
	if($data['menu_type']=="category"){	
	$options=$this->getOptionsCategory($data);	
	}
	elseif($data['menu_type']=="manufacturer"){	
	$options=$this->getOptionsManufacturer($data);	
	}
	elseif($data['menu_type']=="information"){	
	$options=$this->getOptionsInformation($data);	
	}
	elseif($data['menu_type']=="product"){	
	$options=$this->getOptionsProduct($data);	
	}
	else
	$options="";
		
		
		
	return $options;	
	}
	
	public function getOptionsProduct($data){
	$opts=array();
	$opts['products_list']=array();
	if(isset($data['products_list']) && is_array($data['products_list']))
	{
	foreach($data['products_list'] as $v){
	$cid=(int)$v;
	if($cid)
	$opts['products_list'][]=$cid;
	}
	}
	
	if(isset($data['product_width']) && isset($data['product_width'])>0)
	$opts['product_width']=(int)$data['product_width'];
	else
	$opts['product_width']=50;
	
	if(isset($data['product_height']) && isset($data['product_height'])>0)
	$opts['product_height']=(int)$data['product_height'];
	else
	$opts['product_height']=50;
	
	return serialize($opts);
	}
	
	public function getOptionsInformation($data){
	$opts=array();
	$opts['informations_list']=array();
	if(isset($data['informations_list']) && is_array($data['informations_list']))
	{
	foreach($data['informations_list'] as $v){
	$cid=(int)$v;
	if($cid)
	$opts['informations_list'][]=$cid;
	}
	}
	return serialize($opts);
	}
	
	public function getOptionsManufacturer($data){
	$opts=array();
	$opts['manufacturers_list']=array();
	if(isset($data['manufacturers_list']) && is_array($data['manufacturers_list']))
	{
	foreach($data['manufacturers_list'] as $v){
	$cid=(int)$v;
	if($cid)
	$opts['manufacturers_list'][]=$cid;
	}
	}
	return serialize($opts);
	}
	
	public function getOptionsCategory($data){
	
	$opts=array();
	$opts['variant_category']=$data['variant_category'];
	if(isset($data['category_show_subcategory']))
	$opts['category_show_subcategory']=1;
	else
	$opts['category_show_subcategory']=0;

	$opts['categories_list']=array();
	if(isset($data['categories_list']) && is_array($data['categories_list']))
	{
	foreach($data['categories_list'] as $v){
	$cid=(int)$v;
	if($cid)
	$opts['categories_list'][]=$cid;
	}
	}
	
	return serialize($opts);	
	}
	
	public function getUseAddHtml($data){
		$use_add_html=isset($data['use_add_html'])?(int)$data['use_add_html']:0;
		if(($data['menu_type']=="category" && ($data['variant_category']=="simple")) || ($data['menu_type']=="auth") || ($data['menu_type']=="html"))
		$use_add_html=0;
	
	return $use_add_html;
	}
	
	public function addItem($data) {
		
		$options=$this->getOptions($data);	
		$use_add_html=$this->getUseAddHtml($data);
        $use_target_blank = isset($data['use_target_blank'])?(int)$data['use_target_blank']:0;
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu SET thumb='".$this->db->escape($data['image'])."',sort_order='".(int)$data['sort_order']."',limit_item='".(int)$data['limit_item']."',menu_type='".$this->db->escape(trim($data['menu_type']))."',date_added = NOW(), use_add_html = '{$use_add_html}', use_target_blank = '{$use_target_blank}', status = '" . (int)$data['status'] . "',options='{$options}'");
		
		$megamenu_id = $this->db->getLastId();
		
		foreach ($data['megamenu'] as $key => $value) {
			if($data['menu_type']=="html")
			$html=isset($value['html'])?$this->db->escape(html_entity_decode($value['html'])):"";			
			else
			$html="";
		
			if($use_add_html)
			$add_html=isset($value['add_html'])?$this->db->escape(html_entity_decode($value['add_html'])):"";			
			else
			$add_html="";
		
		
			$this->db->query("INSERT INTO " . DB_PREFIX ."megamenu_description SET megamenu_id = '" . (int)$megamenu_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "',html='{$html}',add_html='{$add_html}', link='".$this->db->escape(trim($value['link']))."'");
		}
		
	
	}
	
	public function editItem($id, $data) {
					
	$use_target_blank = isset($data['use_target_blank'])?(int)$data['use_target_blank']:0;
	$use_add_html=$this->getUseAddHtml($data);
	$options=$this->getOptions($data);			
	
	$this->db->query("UPDATE " . DB_PREFIX . "megamenu SET thumb='".$this->db->escape($data['image'])."',sort_order='".(int)$data['sort_order']."',limit_item='".(int)$data['limit_item']."',status = '" . (int)$data['status'] . "',menu_type='".$this->db->escape(trim($data['menu_type']))."',options='{$options}',use_add_html='{$use_add_html}', use_target_blank = '{$use_target_blank}' WHERE id = '" . (int)$id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_description WHERE megamenu_id = '" . (int)$id. "'");
		
		foreach ($data['megamenu'] as $key => $value) {
			if($data['menu_type']=="html")
			$html=isset($value['html'])?$this->db->escape(html_entity_decode($value['html'])):"";			
			else
			$html="";
		
			if($use_add_html)
			$add_html=isset($value['add_html'])?$this->db->escape(html_entity_decode($value['add_html'])):"";			
			else
			$add_html="";
		
		
			$this->db->query("INSERT INTO " . DB_PREFIX ."megamenu_description SET megamenu_id = '" . (int)$id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape(trim($value['title'])) . "',html='{$html}',add_html='{$add_html}', link='".$this->db->escape(trim($value['link']))."'");
		}
		
		
	}
	
	public function getItem($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu WHERE id = '" . (int)$id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getItemDescription($megamenu_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "megamenu_description WHERE megamenu_id = '" . (int)$megamenu_id . "'"); 
		
		foreach ($query->rows as $result) {
			$megamenu_description[$result['language_id']] = array(
				'title'       			=> $result['title'],
				'html'       			=> $result['html'],
				'add_html'       			=> $result['add_html'],
				'link'       			=> $result['link'],	
			);
		}
		
		return $megamenu_description;
	}
 
	public function getItems($data) {
		if(isset($data['sort']))
			$sort=$data['sort'];
		else
			$sort="sort_order";
		
	$sql = "SELECT * FROM " . DB_PREFIX . "megamenu n LEFT JOIN " . DB_PREFIX . "megamenu_description nd ON n.id = nd.megamenu_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY {$sort}";		
		
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deleteItem($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_description WHERE megamenu_id = '" . (int)$id . "'");
		
	}
 
}