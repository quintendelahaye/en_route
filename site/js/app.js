$(document).ready(init);

var sound;
var arrSounds = [];
//var currentIndex;

function init()
{
	var backToTop = jQuery('#container').offset().top;

	jQuery('.btnTop').click(function()
    {
		jQuery('html, body').animate({scrollTop:backToTop}, 'slow');

		return false;
	});

    //$('.soundImg a').hover(playSound);
    sound = $('audio')[0];
    //currentIndex = 0;
    $('.sound').each(function(data)
    {
        arrSounds.push($(this).attr('id'));
        $(this).hover(changeSound);
    });
}

function changeSound(event){
    event.preventDefault();
    //currentIndex = $.inArray($(this).attr('id'), arrSounds);
    sound = $('audio')[$.inArray((event.currentTarget.id), arrSounds)];
    sound.play();
}