$(document).ready(function() {
	$('li.active > a.category-button').addClass('detailed');
	$('ul.box-category .category-button').removeAttr('href');
	$('ul.box-category li.active > ul').slideToggle(200);

	$('ul.box-category a.category-button').click(function() {
		$(this).toggleClass('detailed').closest('li').find('> ul').slideToggle(200);
		$(this).closest('ul').find('.detailed').not(this).toggleClass('detailed').closest('li').find('> ul').slideToggle(200);
	});
});

$(document).ready(function() {
	$('.menu-categories > a.category-button').addClass('detailed');
	$('.menu-categories .category-button').removeAttr('href');

	$('.menu-categories a.category-button').click(function() {
		$(this).toggleClass('detailed').closest('.menu-categories').find('> div').slideToggle(200);
		$(this).closest('div').find('.detailed').not(this).toggleClass('detailed').closest('.menu-categories').find('> div').slideToggle(200);
	});
});

$(document).ready(function() {
	$('li.active > a.category-button').addClass('detailed');
	$('ul.mobile-category .category-button').removeAttr('href');
	$('ul.mobile-category li.active > ul').slideToggle(200);

	$('ul.mobile-category a.category-button').click(function() {
		$(this).toggleClass('detailed').closest('li').find('> ul').slideToggle(200);
		$(this).closest('ul').find('.detailed').not(this).toggleClass('detailed').closest('li').find('> ul').slideToggle(200);
	});
});

$(document).ready(function() {
	$('.menu-categories > a.category-button').addClass('detailed');
	$('.menu-categories .category-button').removeAttr('href');

	$('.menu-categories a.category-button').click(function() {
		$(this).toggleClass('detailed').closest('.menu-categories').find('> div').slideToggle(200);
		$(this).closest('div').find('.detailed').not(this).toggleClass('detailed').closest('.menu-categories').find('> div').slideToggle(200);
	});
});