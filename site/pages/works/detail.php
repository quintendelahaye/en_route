<article id="skrollr-body" class="worksContainer">
    <header>
        <h2><span>gemaakte kunstwerken van <?php echo $school["school_name"]; ?></span></h2>
    </header>

    <section id="works">
        <header id="homeheader">
            <h3 id="search_title">werken per school</h3>
                <p>gemaakte werken door de leerlingen van school: <span><?php echo $school["school_name"]; ?></span> op <?php echo date('d/m/y', strtotime($school['visited'])); ?></p>
        </header>
            <section class="work">
                <header><h4>teams en teamleden</h4></header>
                <?php if(!empty($groups)): ?>
                    <ul id="groups">
                        <?php foreach($groups as $group): ?>
                            <li>
                                <a class="btnTeam" href="index.php?page=detail&amp;id=<?php echo $school['id'];?>&amp;team=<?php echo $group['id'];?>">
                                    <h5><?php echo $group["groupname"]; ?></h5>
                                </a>
                            </li>
                        <?php endforeach; ?>
                        <ul id="members">
                            <?php if(!empty($members)): ?>
                                <?php foreach($members as $member): ?>
                                    <li><?php echo $member["member_name"]; ?></li>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </ul>
                    </ul>
                <?php endif; ?>
            </section>
            <section class="work" id="collage">
                <div class="number"><p>1</p></div>
                <header><h4>opdracht collage</h4></header>
                <p class="explaination">Voor deze opdracht moesten de jongeren een collage maken uit 3 <span>foto’s</span>, de foto’s tonen een groot contrast tussen <span>oud en nieuw</span>.</p>
                <?php if(!empty($mission1Collages)): ?>
                    <ul class="collageContainer">
                        <?php foreach($mission1Collages as $collagepicture): ?>
                            <li class="collagePicContainer">
                               <div class="overimgTop">
                                   <a href="index.php?page=detail&id=<?php echo $school['id'];?>&mission=1&picid=<?php echo $collagepicture["id"]; ?>#detailCollage"><p><?php echo $collagepicture["groupname"]; ?></p></a></div>
                               <div class="overimgBottom"><a href="index.php?page=detail&id=<?php echo $school['id'];?>&mission=1&picid=<?php echo $collagepicture["id"]; ?>#detailCollage"><div class="iconCalender">&nbsp;</div><p><?php echo date('d/m/y', strtotime($collagepicture['created_date'])); ?></p></a></div>
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
                <?php else: ?>
                    <div class="notReady">
                        <p>Jullie hebben deze opdracht (nog) niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
            <section class="work">
                <p class="number">2</p>
                <header><h4>opdracht dialecten</h4></header>
                <p class="explaination">De teams krijgen de opdracht om bepaalde <span>trefwoorden</span> uit een Antwerps liedje te laten inspreken door <span>Antwerpenaren</span> met een
                zeer hard <span>accent</span>, ook moeten ze een <span>achtergrondfoto</span> nemen die perfect past bij hun stukje liedje.</p>

                <?php if(!empty($mission2Sounds)): ?>
                <ul id="dialectsContainer">
                    <?php foreach($mission2Sounds as $soundAndImage): ?>
                        <li class="dialectContainer">
                            <audio>
                                <source src="upload/mission2/<?php echo $soundAndImage["sound_name"]; ?>.mp3"/>
                                <source src="upload/mission2/<?php echo $soundAndImage["sound_name"]; ?>.ogg"/>
                            </audio>
                            <div class="overimgTop"><a href="index.php?page=detail&id=<?php echo $school['id'];?>&mission=2#dialectsContainer" class="soundImg" ><img src="images/2_dialecten/speakers.png" alt="speaker"></a></div>
                            <div class="overimgBottom"><a href="index.php?page=detail&id=<?php echo $school['id'];?>&mission=2#dialectsContainer"><p><?php echo $soundAndImage["groupname"]; ?></p></a></div>
                            <a class="sound" id="<?php echo $soundAndImage["word"].$soundAndImage["group_id"]; ?>" href="<?php echo $soundAndImage["word"].$soundAndImage["group_id"]; ?>"><figure><img src="upload/mission2/image<?php echo $soundAndImage["group_id"]; ?>.jpg" alt="foto1"/></figure></a>
                            <div class="dateDialects"><img class="left" src="images/2_dialecten/icon_calender.png" alt="icon"/><p class="right"><?php echo date('d/m/y', strtotime($soundAndImage['created_date'])); ?></p></div>
                        </li>
                    <?php endforeach; ?>
                </ul>
                <?php else: ?>
                    <div class="notReady">
                        <p>Jullie hebben deze opdracht (nog) niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
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
                            <?php foreach($mission3Shops as $topshop): ?>
                                <li><?php echo $topshop["numberOFShops"]; ?>x</li>
                            <?php endforeach; ?>
                        </ul>
                        <ul id="shops">
                            <?php foreach($mission3Shops as $topshop): ?>
                                <li><?php echo ucwords($topshop["shop_name"]); ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                    <div id="dress">&nbsp;</div>
                </div>
                <div class="clear">&nbsp;</div>
                <?php if(!empty($shopsBySchool)): ?>
                    <ul id="allShops">
                        <?php foreach($shopsBySchool as $shopbygroup): ?>
                            <li><span><?php echo $shopbygroup["numberOFShops"]; ?>x </span><?php echo ucwords($shopbygroup["shop_name"]); ?></li>
                        <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    <div class="notReady">
                        <p>Jullie hebben deze opdracht (nog) niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
            <section class="work">
                <p class="number">4</p>
                <header><h4>opdracht standbeelden</h4></header>
                <p class="explaination">De stad bevat veel verschillende <span>standbeelden</span>, groot, klein, oud en modern.<br/>De jongeren moeten een <span>groepsfoto</span> maken waarin ze met heel de groep het standbeeld nadoen.</p>
                <?php if(!empty($groupPictures)): ?>
                    <ul class="collageContainer">
                        <?php foreach($groupPictures as $grouppic): ?>
                            <li class="collagePicContainer">
                               <div class="overimgTop"><a href="index.php?page=detail&amp;id=<?php echo $school['id'];?>&mission=4&grouppicid=<?php echo $grouppic["id"]; ?>#detailGroup"><p><?php echo $grouppic["groupname"]; ?></p></a></div>
                               <div class="overimgBottom"><a href="index.php?page=detail&amp;id=<?php echo $school['id'];?>&mission=4&grouppicid=<?php echo $grouppic["id"]; ?>#detailGroup"><div class="iconCalender">&nbsp</div><p><?php echo date('d/m/y', strtotime($grouppic['created_date'])); ?></p></a></div>
                               <figure><img src="upload/mission4/<?php echo $grouppic["image_name"]; ?>" alt="foto3"/></figure>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                    <?php if(!empty($groupPic)):?>
                        <div id="detailGroup">
                            <p>Foto gemaakt door team: <span><?php echo $groupPic["groupname"]; ?></span></p>
                            <img src="upload/mission4/<?php echo $groupPic["image_name"]; ?>" alt="<?php echo $groupPic["image_name"]; ?>"/>
                        </div>
                    <?php endif; ?>

                <?php else: ?>
                    <div class="notReady">
                        <p>Jullie hebben deze opdracht (nog) niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
            <section class="work">
                <p class="number">5</p>
                <header><h4>opdracht vintage</h4></header>
                <p class="explaination">In Antwerpen lopen er veel mensen rond met een <span>vintage</span> accessoire of kledij.<br/> Neem een foto van de personen en leg de <span>focus</span> op het vintage element.</p>
                <?php if(!empty($vintagePictures)): ?>
                    <ul id="vintageContainer">
                        <?php foreach($vintagePictures as $vintagePicture): ?>
                            <li class="frame"><img src="upload/mission5/<?php echo $vintagePicture["image_name"]; ?>" alt="group"/></li>
                        <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    <div class="notReady">
                        <p>Jullie hebben deze opdracht (nog) niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
            <section class="work">
                <p class="number">6</p>
                <header><h4>opdracht foetsie</h4></header>
                <p class="explaination">De groepen moeten op zoek gaan naar objecten en elementen in de stad die binnenkort zullen <span>verdwijnen</span>.<br/> Ze nemen een foto en <span>verzinnen</span> wat er in de plaats zou kunnen komen.</p>
                <?php if(!empty($foetsiepics)): ?>
                    <ul class="collageContainer">
                        <?php foreach($foetsiepics as $foetsiepic): ?>
                            <li class="collagePicContainer">
                               <div class="overimgTop"><a href="index.php?page=detail&amp;id=<?php echo $school['id'];?>&mission=6&foetsie=<?php echo $foetsiepic["id"]; ?>#lostPicContainer"><p><?php echo $foetsiepic["groupname"]; ?></p></a></div>
                               <div class="overimgBottom"><a href="index.php?page=detail&amp;id=<?php echo $school['id'];?>&mission=6&foetsie=<?php echo $foetsiepic["id"]; ?>#lostPicContainer"><div class="iconCalender">&nbsp</div><p><?php echo date('d/m/y', strtotime($foetsiepic['created_date'])); ?></p></a></div>
                               <figure><img src="upload/mission6/<?php echo $foetsiepic["image_name"]; ?>" alt="foto3"/></figure>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                    <?php if(!empty($foetsiePicBig)):?>
                    <div id="lostPicContainer">
                        <figure><img src="upload/mission6/<?php echo $foetsiePicBig["image_name"]; ?>" alt="photo1"/></figure>
                        <div class="lines">
                            <p class="new">"Dit wordt <?php echo $foetsiePicBig["new"]; ?>"</p>
                            <h4><span>team: </span><?php echo $foetsiePicBig["groupname"]; ?></h4>
                        </div>
                    </div>
                    <?php endif; ?>
                <?php else: ?>
                    <div class="notReady">
                        <p>Jullie hebben deze opdracht (nog) niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
    </section>

    <div id="topBtn">
        <a href="index.php?page=home" class="btnTop"><span>top</span></a>
    </div>
    <div class="peetje" data-0="left:-106px; opacity:1" data-300="left:1300px; opacity:0">&nbsp;</div>
</article>