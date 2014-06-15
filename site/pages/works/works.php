
<article id="skrollr-body" class="worksContainer">
    <header>
        <h2><span>gemaakte kunstwerken</span></h2>
    </header>

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
                    <?php foreach($schools as $school): ?>
                        <option value="<?php echo $school["id"];?>"><?php echo $school["school_name"];?></option>
                    <?php endforeach; ?>
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
                <ul class="collageContainer">
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
                <?php foreach($soundsAndBgs as $soundAndImage): ?>
                    <li class="dialectContainer">
                        <audio>
                        	<source src="upload/mission2/<?php echo $soundAndImage["sound_name"]; ?>.mp3"/>
                        	<source src="upload/mission2/<?php echo $soundAndImage["sound_name"]; ?>.ogg"/>
                        </audio>
                        <div class="overimgTop"><a href="#"><img src="images/2_dialecten/speakers.png" alt="speaker"></a></div>
                        <div class="overimgBottom"><a href="#"><p><?php echo $soundAndImage["word"]; ?></p></a></div>
                        <a class="sound" id="<?php echo $soundAndImage["word"].$soundAndImage["group_id"]; ?>" href="<?php echo $soundAndImage["word"].$soundAndImage["group_id"]; ?>"><figure><img src="upload/mission2/image<?php echo $soundAndImage["group_id"]; ?>.jpg" alt="foto1"/></figure></a>
                        <div class="dateDialects"><img class="left" src="images/2_dialecten/icon_calender.png" alt="icon"/><p class="right"><?php echo date('d/m/y', strtotime($soundAndImage['created_date'])); ?></p></div>
                    </li>
                <?php endforeach; ?>
            </ul>
            <ul id="soundBoard">
                <?php foreach($sounds as $sound): ?>
                    <audio>
                        <source src="upload/mission2/<?php echo $sound["sound_name"]; ?>.mp3"/>
                        <source src="upload/mission2/<?php echo $sound["sound_name"]; ?>.ogg"/>
                    </audio>
                    <li><a id="<?php echo $sound["word"].$sound["group_id"]; ?>" href="upload/mission2/<?php echo $sound["word"].$sound["group_id"]; ?>.mp3" class="btnSound"><?php echo $sound["word"]; ?></a></li>
                <?php endforeach; ?>
            </ul>
        </section>
        <?php endif; ?>
        <?php if($mission3): ?>
        <section class="work">
            <p class="number">3</p>
            <header><h4>opdracht mode</h4></header>
            <p class="explaination">Antwerpen is een <span>modestad</span> dus de taak van de teams is om verschillende <span>kledinglabels</span> te verzamelen van shoppende mensen.<br/>
                Die labels worden dan na de tour geniet op een <span>antiek kleed</span>, gemaakt uit katoen. Zo maken we van een oude jurk iets modern.</p>
            <div id="fashionContainer">
                <div class="clear">&nbsp;</div>
                <div id="textContainer">
                    <h4>top 3 winkels</h4>
                    <p>van verzamelde labels</p>
                    <div id="labels">&nbsp;</div>
                    <ul id="amountOfShops">
                        <?php foreach($topShops as $topshop): ?>
                            <li><?php echo $topshop["numberOFShops"]; ?>x</li>
                        <?php endforeach; ?>
                    </ul>
                    <ul id="shops">
                        <?php foreach($topShops as $topshop): ?>
                            <li><?php echo ucwords($topshop["shop_name"]); ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
                <div id="dress">&nbsp;</div>
            </div>
            <div class="clear">&nbsp;</div>
            <ul id="allShops">
                <?php foreach($shops as $shop): ?>
                    <li><span><?php echo $shop["numberOFShops"]; ?>x </span><?php echo ucwords($shop["shop_name"]); ?></li>
                <?php endforeach; ?>
            </ul>
        </section>
        <?php endif; ?>
        <?php if($mission4): ?>
        <section class="work">
            <p class="number">4</p>
            <header><h4>opdracht standbeelden</h4></header>
            <p class="explaination">De stad bevat veel verschillende <span>standbeelden</span>, groot, klein, oud en modern.<br/>De jongeren moeten een <span>groepsfoto</span> maken waarin ze met heel de groep het standbeeld nadoen.</p>
            <ul class="collageContainer">
                <?php foreach($grouppics as $grouppic): ?>
                    <li class="collagePicContainer">
                       <div class="overimgTop"><a href="index.php?page=works&mission=4&id=<?php echo $grouppic["id"]; ?>#detailGroup"><p><?php echo $grouppic["groupname"]; ?></p></a></div>
                       <div class="overimgBottom"><a href="index.php?page=works&mission=4&id=<?php echo $grouppic["id"]; ?>#detailGroup"><div class="iconCalender">&nbsp</div><p><?php echo date('d/m/y', strtotime($grouppic['created_date'])); ?></p></a></div>
                       <figure><img src="upload/mission4/<?php echo $grouppic["image_name"]; ?>" alt="foto3"/></figure>
                    </li>
                <?php endforeach; ?>
            </ul>
            <?php if(!empty($group)):?>
                <div id="detailGroup">
                    <p>Foto gemaakt door team: <span><?php echo $group["groupname"]; ?></span></p>
                    <img src="upload/mission4/<?php echo $group["image_name"]; ?>" alt="<?php echo $group["image_name"]; ?>"/>
                </div>
            <?php endif; ?>
        </section>
        <?php endif; ?>
        <?php if($mission5): ?>
        <section class="work">
            <p class="number">5</p>
            <header><h4>opdracht vintage</h4></header>
            <p class="explaination">In Antwerpen lopen er veel mensen rond met een <span>vintage</span> accessoire of kledij.<br/> Neem een foto van de personen en leg de <span>focus</span> op het vintage element.</p>
            <ul id="vintageContainer">
                <?php foreach($vintagepics as $vintagepic): ?>
                    <li class="frame"><img src="upload/mission5/<?php echo $vintagepic["image_name"]; ?>" alt="group"/></li>
                <?php endforeach; ?>

            </ul>
        </section>
        <?php endif; ?>
        <?php if($mission6): ?>
        <section class="work">
            <p class="number">6</p>
            <header><h4>opdracht verdwijnen</h4></header>
            <p class="explaination">De groepen moeten op zoek gaan naar objecten en elementen in de stad die binnenkort zullen <span>verdwijnen</span>.<br/> Ze nemen een foto en <span>verzinnen</span> wat er in de plaats zou kunnen komen.</p>
                <ul class="collageContainer">
                    <?php foreach($oldvsnewpics as $oldvsnewpic): ?>
                        <li class="collagePicContainer">
                           <div class="overimgTop"><a href="index.php?page=works&mission=6&id=<?php echo $oldvsnewpic["group_id"]; ?>#lostPicContainer"><p><?php echo $oldvsnewpic["groupname"]; ?></p></a></div>
                           <div class="overimgBottom"><a href="index.php?page=works&mission=6&id=<?php echo $oldvsnewpic["group_id"]; ?>#lostPicContainer"><div class="iconCalender">&nbsp</div><p><?php echo date('d/m/y', strtotime($oldvsnewpic['created_date'])); ?></p></a></div>
                           <figure><img src="upload/mission6/<?php echo $oldvsnewpic["image_name"]; ?>" alt="foto3"/></figure>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <?php if(!empty($oldvsnew)):?>
                <div id="lostPicContainer">
                    <figure><img src="upload/mission6/image<?php echo $oldvsnew["group_id"]; ?>.png" alt="photo1"/></figure>
                    <div class="lines">
                        <p class="new">"Dit wordt <?php echo $oldvsnew["new"]; ?>"</p>
                        <h4><span>team: </span><?php echo $oldvsnew["groupname"]; ?></h4>
                    </div>
                    <p class="street"><?php echo $oldvsnew["street_name"]; ?></p>
                </div>
                <?php endif; ?>
        </section>
        <?php endif; ?>
    </section>
    <div id="topBtn">
        <a href="index.php?page=home" class="btnTop"><span>top</span></a>
    </div>
</article>