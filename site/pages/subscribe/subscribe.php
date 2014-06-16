<article id="skrollr-body" class="worksContainer">
    <header>
        <h2><span>inschrijven</span></h2>
    </header>

    <section id="works">
        <header id="homeheader">
            <h3>inschrijven</h3>
            <?php if(empty($added)): ?>
                <p>schrijf je snel in met je school, groep, vrienden, broer of zus en ontdek Antwerpen op een leuke, originele manier met onze app!</p>
            <?php else: ?>
                <p>Je school of vereniging is met succes toegevoegd!</p>
            <?php endif; ?>
        </header>
        <?php if(empty($added)): ?>
            <form method="post" action="#" id="subscribe">
                <fieldset>
                    <legend>inschrijven</legend>
                        <div class="left">
                            <div>
                                <label for="txtGroup" class="block">school of vereniging<span> (*)</span></label>
                                <input type="text" id="txtGroup" name="txtGroup" placeholder="min. 3 karakters" required pattern=".{3,}" value="<?php echo $txtGroup; ?>" <?php if(!empty($arrErrors["txtGroup"])){ echo 'class="error"';} ?> />
                            </div>

                            <div>
                                <label for="txtEmail" class="block">E-mailadres <span> (*)</span></label>
                                <input type="text"  id="txtEmail" name="txtEmail"required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="e-mailadres van de verantwoordelijke" value="<?php echo $txtEmail; ?>" <?php if(!empty($arrErrors["txtEmail"])){ echo 'class="error"';} ?>/>
                            </div>

                        </div>
                        <div class="right">
                            <div>
                                <label for="txtName" class="block">naam verantwoordelijke<span> (*)</span></label>
                                <input type="text" id="txtName" name="txtName" placeholder="min. 3 karakters" required pattern=".{3,}" value="<?php echo $txtName; ?>" <?php if(!empty($arrErrors["txtName"])){ echo 'class="error"';} ?> />
                            </div>

                            <div>
                                <label for="txtDate" class="block">Datum van bezoek<span> (*)</span></label>
                                <input type="date" id="txtDate" name="txtDate" size="5" maxlength="5" value="<?php echo $txtDate; ?>" <?php if(!empty($arrErrors["txtDate"])){ echo 'class="error"';} ?>/>
                            </div>

                            <div>
                                <input type="submit" name="btnSubscribe" id="btnSubscribe" class="btnSubscribe" value="inschrijven" />
                            </div>
                         </div>
                </fieldset>
            </form>
        <?php endif; ?>
    </section>
</article>