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
                    <div id="detailCollage">
                        <p>nog niet gemaakt</p>
                    </div>
                <?php endif; ?>
            </section>
            <section class="work">
                <p class="number">2</p>
                <header><h4>opdracht dialecten</h4></header>
                <p class="explaination">De teams krijgen de opdracht om bepaalde <span>trefwoorden</span> uit een Antwerps liedje te laten inspreken door <span>Antwerpenaren</span> met een
                zeer hard <span>accent</span>, ook moeten ze een <span>achtergrondfoto</span> nemen die perfect past bij hun stukje liedje.</p>
                <ul id="dialectsContainer">
                    <?php foreach($mission2Sounds as $soundAndImage): ?>
                        <li class="dialectContainer">
                            <audio>
                                <source src="upload/mission2/<?php echo $soundAndImage["sound_name"]; ?>.mp3"/>
                                <source src="upload/mission2/<?php echo $soundAndImage["sound_name"]; ?>.ogg"/>
                            </audio>
                            <div class="overimgTop"><a href="#"><img src="images/2_dialecten/speakers.png" alt="speaker"></a></div>
                            <div class="overimgBottom"><a href="#"><p><?php echo $soundAndImage["groupname"]; ?></p></a></div>
                            <a class="sound" id="<?php echo $soundAndImage["word"].$soundAndImage["group_id"]; ?>" href="<?php echo $soundAndImage["word"].$soundAndImage["group_id"]; ?>"><figure><img src="upload/mission2/image<?php echo $soundAndImage["group_id"]; ?>.jpg" alt="foto1"/></figure></a>
                            <div class="dateDialects"><img class="left" src="images/2_dialecten/icon_calender.png" alt="icon"/><p class="right"><?php echo date('d/m/y', strtotime($soundAndImage['created_date'])); ?></p></div>
                        </li>
                    <?php endforeach; ?>
                </ul>
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
                <ul id="allShops">
                    <?php foreach($shopsByGroup as $shopbygroup): ?>
                        <li><span><?php echo $shopbygroup["numberOFShops"]; ?>x </span><?php echo ucwords($shopbygroup["shop_name"]); ?></li>
                    <?php endforeach; ?>
                </ul>
            </section>
    </section>
</article>