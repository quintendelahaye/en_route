<article id="skrollr-body" class="worksContainer">
    <header>
        <h2><span>gemaakte kunstwerken</span></h2>
    </header>

    <section id="works">
        <header id="homeheader">
            <h3 id="search_title">zoekresultaten van</h3>
            <?php if(!empty($schools)): ?>
                <p>zoekresultaten van "<?php echo $searchItem; ?>"</p>
            <?php else: ?>
            <p>Geen zoekresultaten gevonden van <?php echo $searchItem; ?></p>
            <?php endif; ?>
        </header>

        <?php if(!empty($schools)): ?>
            <ol id="searchesOl">
                <?php foreach($schools as $school): ?>
                <li><a href="index.php?page=detail&amp;id=<?php echo $school['id']; ?>"><?php echo htmlentities($school['school_name']); ?></a></li>
                <?php endforeach; ?>
            </ol>
        <?php endif; ?>
    </section>
</article>