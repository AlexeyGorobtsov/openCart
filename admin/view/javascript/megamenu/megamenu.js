function make_sel_type(){
	
  sel_menu_type=$("#input-menu_type :selected").val();
  sel_category_type=$("#input-variant_category :selected").val();


  $(".show_elements").hide();
   if((sel_menu_type=="category" && (sel_category_type=="simple" || sel_category_type=="0")) || sel_menu_type=="0" || sel_menu_type=="auth" || sel_menu_type=="link" || sel_menu_type=="html")
  {

  $(".show_elements_add_html").hide();
  }
  else
  {
  $(".show_elements_add_html").show();
  }
  
  
  
  $(".show_elements_"+sel_menu_type).show();	
}
$( document ).ready(function() {
	
	make_sel_type();
	
  $( "#input-menu_type" ).bind( "change", function() {
  make_sel_type();
});
  $( "#input-add_html" ).bind( "click", function() {
  make_sel_type();
});
    $( "#input-variant_category" ).bind( "change", function() {
  make_sel_type();
});
});