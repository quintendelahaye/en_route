$(document).ready(function()
{
	var backToTop = jQuery('#container').offset().top;

	jQuery('.btnTop').click(function()
    {
		jQuery('html, body').animate({scrollTop:backToTop}, 'slow');

		return false;
	});

});