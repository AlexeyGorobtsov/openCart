$(document).ready(function() {

	megamenu_adapMenu();
	$( window ).resize(function() {
	megamenu_adapMenu();	
});
$( "#megamenu-menu a.dropdown-toggle" ).bind( "click", function() {
	if(($(this).attr('href')!="javascript:void(0);")&&($( document ).width()>1024))
	{
	window.document.location=$(this).attr('href');
	}
});
/*
$('ul.nav li.dropdown').hover(function() {
	$(this).find('.dropdown-menu').hide();
  $(this).find('.dropdown-menu').stop(true, true).delay(500).fadeIn(100);
}, function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(10);
});
*/	
});
function megamenu_adapMenu(){
	$(".megamenu-bigblock").css('width',$("#megamenu-menu").outerWidth()-10);
	$('#megamenu-menu .dropdown-menu').each(function() {
		var menu = $('#megamenu-menu').offset();
		var dropdown = $(this).parent().offset();
	

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#megamenu-menu').outerWidth());
		
		

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}		
		var l=$(this).outerWidth()-2;			
		$(this).find(".megamenu-ischild-simple").css('left',l);
		
	});
	
}