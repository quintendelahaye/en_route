$(document).ready(init);

var hoverSound;
var arrHoverSounds = [];

var sound;
var arrSounds = [];

function init()
{
	var backToTop = jQuery('#container').offset().top;

	jQuery('.btnTop').click(function()
    {
		jQuery('html, body').animate({scrollTop:backToTop}, 'slow');

		return false;
	});

    hoverSound = $('.dialectContainer audio')[0];
    $('.sound').each(function(data){
        arrHoverSounds.push($(this).attr('id'));
        $(this).hover(changeSound);
    });

    sound = $('#soundBoard audio')[0];
    $("#soundBoard li a").each(function(data){
       arrSounds.push($(this).attr('id'));
        $(this).click(playSound);
    });
}

function changeSound(event){
    event.preventDefault();
    hoverSound = $('.dialectContainer audio')[$.inArray((event.currentTarget.id), arrHoverSounds)];
    hoverSound.play();
}

function playSound(event){
    event.preventDefault();
    sound = $('#soundBoard audio')[$.inArray((event.currentTarget.id), arrSounds)];
    sound.play();
}