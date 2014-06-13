<section id="navmissions">
    <header><h2><span>opdracht navigatie</span></h2></header>
    <div id="missionNav">
        <div id="leftNav" class="left">
            <?php if(($activeMission == "all")&& !empty($activeMission)): ?>
                <a href="index.php?page=works&mission=all" id="allMissionsActive"><span>alle opdrachten</span></a>
            <?php else: ?>
                <a href="index.php?page=works&mission=all" id="allMissions"><span>alle opdrachten</span></a>
            <?php endif; ?>
            <select>
              <option value=""> -- kies je school -- </option>
              <option value="1">Howest</option>
              <option value="1">St-Godelieve</option>
              <option value="1">Audi</option>
            </select>
        </div>
        <div id="rightNav" class="right">
            <ul>
                <?php foreach($missions as $mission): ?>
                    <?php if(($mission["id"] == $activeMission)&& !empty($activeMission)): ?>
                        <li><a href="index.php?page=works&mission=<?php echo $mission["id"];?>" class="activeMission<?php echo $mission["id"];?>"><span><?php echo $mission["name"];?></span></a></li>
                    <?php else: ?>
                        <li><a href="index.php?page=works&mission=<?php echo $mission["id"];?>" id="mission<?php echo $mission["id"];?>"><span><?php echo $mission["name"];?></span></a></li>
                    <?php endif; ?>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
    <div class="clear">&nbsp;</div>
</section>

<article id="worksContainer">
    <header>
        <h2><span>gemaakte kunstwerken</span></h2>
    </header>

    <section id="works">
        <header id="homeheader">
            <h3><?php echo $title; ?></h3>
            <p>Hieronder staan enkele resultaten die de jongeren met de app voltooid hebben</p>
        </header>

        <?php if($mission1): ?>
            <section class="work" id="collage">
                <div class="number"><p>1</p></div>
                <header><h4>opdracht collage</h4></header>
                <p class="explaination">Voor deze opdracht moesten de jongeren een collage maken uit 3 <span>foto’s</span>, de foto’s tonen een groot contrast tussen <span>oud en nieuw</span>.</p>
                <ul id="collageContainer">
                    <?php foreach($collagepictures as $collagepicture): ?>
                        <li class="collagePicContainer">
                           <div class="overimgTop"><a href="index.php?page=works&mission=1&id=<?php echo $collagepicture["id"]; ?>#detailCollage"><p><?php echo $collagepicture["groupname"]; ?></p></a></div>
                           <div class="overimgBottom"><a href="index.php?page=works&mission=1&id=<?php echo $collagepicture["id"]; ?>#detailCollage"><div class="iconCalender">&nbsp</div><p><?php echo date('d/m/y', strtotime($collagepicture['created_date'])); ?></p></a></div>
                           <figure><img src="upload/mission1/<?php echo $collagepicture["image_name"]; ?>" alt="foto3"/></figure>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <?php if(!empty($collage)):?>
                    <div id="detailCollage">
                        <p>Foto gemaakt door team: <span><?php echo $collage["groupname"]; ?></span></p>
                        <img src="upload/mission1/<?php echo $collage["image_name"]; ?>" alt="<?php echo $collage["image_name"]; ?>"/>
                    </div>
                <?php endif; ?>
            </section>
        <?php endif; ?>
        <?php if($mission2): ?>
        <section class="work">
            <p class="number">2</p>
            <header><h4>opdracht dialecten</h4></header>
            <p class="explaination">De teams krijgen de opdracht om bepaalde <span>trefwoorden</span> uit een Antwerps liedje te laten inspreken door <span>Antwerpenaren</span> met een
            zeer hard <span>accent</span>, ook moeten ze een <span>achtergrondfoto</span> nemen die perfect past bij hun stukje liedje.</p>
            <ul id="dialectsContainer">
                <li class="dialectContainer">
                    <div class="overimgTop"><a href="#"><img src="images/2_dialecten/speakers.png" alt="speaker"></a></div>
                    <div class="overimgBottom"><a href="#"><p>beiaard</p></a></div>
                    <a href="#"><figure><img src="images/2_dialecten/photo1.png" alt="foto1"/></figure></a>
                    <div class="dateDialects"><img class="left" src="images/2_dialecten/icon_calender.png" alt="icon"/><p class="right" >21/04/14</p></div>
                </li>
                <li class="dialectContainer">
                    <div class="overimgTop"><a href="#"><img src="images/2_dialecten/speakers.png" alt="speaker"></a></div>
                    <div class="overimgBottom"><a href="#"><p>lievrouwke</p></a></div>
                    <a href="#"><figure><img src="images/2_dialecten/photo2.png" alt="foto2"/></figure></a>
                    <div class="dateDialects"><img class="left" src="images/2_dialecten/icon_calender.png" alt="icon"/><p class="right" >21/04/14</p></div>
                </li>
                <li class="dialectContainer">
                    <div class="overimgTop"><a href="#"><img src="images/2_dialecten/speakers.png" alt="speaker"></a></div>
                    <div class="overimgBottom"><a href="#"><p>katteke</p></a></div>
                    <a href="#"><figure><img src="images/2_dialecten/photo3.png" alt="foto3"/></figure></a>
                    <div class="dateDialects"><img class="left" src="images/2_dialecten/icon_calender.png" alt="icon"/><p class="right" >21/04/14</p></div>
                </li>
            </ul>
            <a href="#" class="btnMore">Bekijk soundboard</a>
        </section>
        <?php endif; ?>
        <?php if($mission3): ?>
        <section class="work">
            <p class="number">3</p>
            <header><h4>opdracht mode</h4></header>
            <p class="explaination">Antwerpen is een <span>modestad</span> dus de taak van de teams is om verschillende <span>kledinglabels</span> te verzamelen van shoppende mensen.<br/>
                Die labels worden dan na de tour geniet op een <span>antiek kleed</span>, gemaakt uit katoen. Zo maken we van een oude jurk iets modern.</p>
            <div id="fashionContainer">
                <div id="textContainer">
                    <h4>top 3 winkels</h4>
                    <p>van verzamelde labels</p>
                    <div id="labels">&nbsp;</div>
                    <ul id="amountOfShops">
                        <li>10x</li>
                        <li>10x</li>
                        <li>10x</li>
                    </ul>
                    <ul id="shops">
                        <li>Jack Wolfskin store</li>
                        <li>H&amp;M</li>
                        <li>ZARA</li>
                    </ul>
                </div>
                <div id="dress">&nbsp;</div>
            </div>
            <div class="clear">&nbsp;</div>
            <a href="#" class="btnMore">Bekijk alle resultaten</a>
        </section>
        <?php endif; ?>
        <?php if($mission4): ?>
        <section class="work">
            <p class="number">4</p>
            <header><h4>opdracht standbeelden</h4></header>
            <p class="explaination">De stad bevat veel verschillende <span>standbeelden</span>, groot, klein, oud en modern.<br/>De jongeren moeten een <span>groepsfoto</span> maken waarin ze met heel de groep het standbeeld nadoen.</p>
            <div id="imageContainer">
                <a href="#" id="statuePic"><img id="statue" src="images/4_standbeelden/foto1.png" alt="photo"/></a>
                <h4 class="left">vti Kortrijk</h4>
                <h4 class="right"><img src="images/4_standbeelden/icon_map.png" alt="map"/>Rubens, Groenplaats</h4>
            </div>
            <a href="#" class="btnMore">Bekijk alle foto's</a>
        </section>
        <?php endif; ?>
        <?php if($mission5): ?>
        <section class="work">
            <p class="number">5</p>
            <header><h4>opdracht vintage</h4></header>
            <p class="explaination">In Antwerpen lopen er veel mensen rond met een <span>vintage</span> accessoire of kledij.<br/> Neem een foto van de personen en leg de <span>focus</span> op het vintage element.</p>
            <div id="vintageContainer">
                <div class="left" id="frameLeft"><a href="#"><img src="images/5_vintage/img_big.png" alt="group"/></a></div>
                <div class="bigFrame"><a href="#"><img src="images/5_vintage/img_big.png" alt="group"/></a></div>
                <div class="right" id="frameRight"><a href="#"><img src="images/5_vintage/img_big.png" alt="group"/></a></div>
                <div class="clear">&nbsp;</div>
            </div>
            <a href="#" class="btnMore">Bekijk alle foto's</a>
        </section>
        <?php endif; ?>
        <?php if($mission6): ?>
        <section class="work">
            <p class="number">6</p>
            <header><h4>opdracht verdwijnen</h4></header>
            <p class="explaination">De groepen moeten op zoek gaan naar objecten en elementen in de stad die binnenkort zullen <span>verdwijnen</span>.<br/> Ze nemen een foto en <span>verzinnen</span> wat er in de plaats zou kunnen komen.</p>
            <div id="lostPicContainer">
                <figure><img src="images/6_verdwijnen/photo1.png" alt="photo1"/></figure>
                <div class="lines">
                    <p class="new">"Dit wordt vervangen door een iPad"</p>
                    <h4>VTI Kortrijk</h4>
                </div>
            </div>
            <a href="#" class="btnMore">Bekijk de vervangingen</a>
        </section>
        <?php endif; ?>
    </section>
    <div id="topBtn">
        <a href="index.php?page=home" class="btnTop"><span>top</span></a>
    </div>
</article>