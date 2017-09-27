$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected-tab');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			$(this).addClass('selected-tab');
			
			$($(this).attr('href')).fadeIn();
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};