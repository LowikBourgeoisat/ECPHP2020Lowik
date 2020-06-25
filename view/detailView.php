<?php ob_start(); ?>

    <div class="row">
        <div class="col-md-4 offset-md-8">
            <form method="get">
                <div class="form-group has-btn">
                    <input type="search" id="search" name="title" value="<?= $search; ?>" class="form-control"
                           placeholder="Rechercher un film ou une série">

                    <button type="submit" class="btn btn-block bg-red">Valider</button>
                </div>
            </form>
        </div>
    </div>

    <div class="media-list">
        <?php foreach( $medias as $media ): ?>
            <a class="item" href="index.php?media=<?= $media['id']; ?>">
                <div class="video">
                    <div>
                        <iframe allowfullscreen="" frameborder="0" src="<?= $media['trailer_url']; ?>" ></iframe>
                    </div>
                </div>
                <div class="title"><?= $media['title']; ?></div>
                <div class="title"><?php
                    $duration = gmdate("H:i", $media['duration']);
                    echo str_replace(":", "h", $duration); ?></div>
                <div class="title"><?= date("d/m/Y", strtotime($media['release_date'])); ?></div>
                <div class="title"><?= $media['summary']; ?></div>
            </a>
        <?php endforeach; ?>
    </div>


    <div class="media-list">
        <?php foreach( $nb_seasons as $season ): ?>
            <p>SAISON <?php print_r($season['id_season']) ?></p>
            <?php foreach( $nb_episodes as $episode ): ?>
                <?php if ($episode['id_season'] == $season['id_season']):?>
                    <a class="item" href="index.php?media=<?= $episode['id']; ?>">
                        <div class="video">
                            <div>
                                <iframe allowfullscreen="" frameborder="0" src="<?= $episode['trailer_url']; ?>" ></iframe>
                            </div>
                        </div>
                        <div class="title"><?= $episode['episode_title']; ?></div>
                        <div class="title"><?php
                            $duration = gmdate("H:i", $episode['duration']);
                            echo str_replace(":", "h", $duration); ?></div>
                    </a>
                <?php endif; ?>
            <?php endforeach; ?>
        <?php endforeach; ?>
    </div>


<?php $content = ob_get_clean(); ?>

<?php require('dashboard.php'); ?>