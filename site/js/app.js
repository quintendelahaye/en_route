$(document).ready(init);

var hoverSound;
var arrHoverSounds = [];

var sound;
var arrSounds = [];

var $window;

function init()
{
    var backToTop = jQuery('#container').offset().top;
   	jQuery('.btnTop').click(function(){
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

    $("#txtSearch").on("input change", changeHandler);

    $(".soundImg").click(clickedOnSoundImg);

    $("#txtGroup").on("keyup blur change", checkThreeCharacters);
    $("#txtEmail").on("keyup blur change", checkIfEmail);
    $("#txtName").on("keyup blur change", checkThreeCharacters);

    $window = $(window);
    checkWidth();
    $(window).resize(checkWidth);

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

function changeHandler(){
    console.log($("#search").serializeArray());
    var $_POST = $("#search").serializeArray();
    $.post("index.php?page=search",$_POST).done(getSearchDataHandler);
}

function getSearchDataHandler(data){
    var $ol = $(data).find("ol");
    if($("#search_title").length != 0){
        $("#skrollr-body").remove();
        $(".nav").after(data);
    }
    $("#search+ol").remove();
    $("#search").after($ol);
}

function clickedOnSoundImg(e){
    e.preventDefault();
}

function checkThreeCharacters(){
    if(!Modernizr.input.required || !Modernizr.input.pattern){
        var $el = $(this);
        if($el.val().length < 3){
            showInValid($el)
        }
        else{
            showValid($el);
        }
    }
}

function checkIfEmail(){
    if(!Modernizr.inputtypes.email){
        var email = $(this);

        var emailregex = new RegExp(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);

        if(!emailregex.test(email.val())){
            showInValid(email,email.next(), "gelieve een emailadres in te vullen" );
        }
        else{
            showValid(email,email.next() );
        }
    }
}

function showInValid($el){
    $el.addClass("error");
}

function showValid($el){
    $el.removeClass("error");
}

function getTodaysDate (val) {
    var t = new Date, day, month, year = t.getFullYear();
    if (t.getDate() < 10) {
        day = "0" + t.getDate();
    }
    else {
        day = t.getDate();
    }
    if ((t.getMonth() + 1) < 10) {
        month = "0" + (t.getMonth() + 1 - val);
    }
    else {
        month = t.getMonth() + 1 - val;
    }

    return (day + '/' + month + '/' + year);
}

function checkWidth() {
    var windowsize = $window.width();
    console.log(windowsize);
}