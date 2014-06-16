<?php

    $arrMenu = array("home"=>"Home",
                     "works"=>"Werken",
                     "about"=>"Over En route",
                     "subscribe"=>"Inschrijven");
?>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>En Route - oud en nieuw in Antwerpen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="js/skrollr/skrollr.js"></script>
    <script type="text/javascript" src="js/vendor/modernizr/modernizr.js"></script>
    <link href="css/screen.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
</head>
<body>
    <h1><a href="index.php?page=home" data-0="transform: scale(1, 1);
        -ms-transform: scale(1, 1);
        -webkit-transform: scale(1, 1);
        -moz-transform: scale(1, 1);
        -o-transform: scale(1, 1); top: 20px;"
        data-100="transform: scale(0.6, 0.6);
        -ms-transform: scale(0.6, 0.6);
        -webkit-transform: scale(0.6, 0.6);
        -moz-transform: scale(0.6, 0.6);
        -o-transform: scale(0.6, 0.6); top: -28px;">
        <span>En Route</span>
        </a>
    </h1>
<article id="container">
    <header>
        <h2><span>enroute container</span></h2>
    </header>
    <div class="skyline">&nbsp;</div>
    <header id="header" <?php if($activeItem == "home" || $activeItem == "subscribe"){ echo 'class=home'; }else{ echo 'class=other'; } ?>>
        <div id="headBorder" data-0="height:100px;" data-100="height:50px;">&nbsp;</div>
    </header>

    <nav class="nav" data-0="height:100px;" data-100="height:50px;">
        <header><h3><span>navigatie</span></h3></header>
        <ul id="menuNav" data-0="margin-top:40px;" data-100="margin-top:15px;">
            <?php foreach($arrMenu as $key=>$value): ?>
                <?php if($key == $activeItem): ?>
                    <li id="nav<?php echo $key; ?>">
                        <a href="index.php?page=<?php echo $key; ?>" class="active"><span><?php echo $value; ?></span></a>
                    </li>
                <?php else: ?>
                    <li id="nav<?php echo $key; ?>">
                        <a href="index.php?page=<?php echo $key; ?>"><span><?php echo $value; ?></span></a>
                    </li>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
        <div class="searchField" data-0="margin-top:33px;" data-100="margin-top:10px;">
            <form method="post" action="index.php?page=search" id="search" autoComplete="off">
                <a href="#" class="search"><span>search</span></a>
                <input type="text" placeholder="zoek je groep of school" id="txtSearch" name="txtSearch"/>
                <div><input type="submit" name="btnSubmitZoek" id="btnSubmitZoek" value="Zoek" /></div>
            </form>
        </div>
    </nav>
    <?php if($activeItem == "home" || $activeItem == "subscribe"): ?>
        <section class="introTextBg" data-0="top:100px;" data-200="top:-230px;">
            <header><h3><span>intro</span></h3></header>
            <p>Een <mark>kunstproject</mark> voor jongeren uit het secundair onderwijs <br/> om hen op een originele manier een stad te laten ontdekken.</p>
            <h4><span>Oud &amp; nieuw in Antwerpen</span></h4>
        </section>
    <?php endif; ?>