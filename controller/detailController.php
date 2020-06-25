<?php

require_once( 'model/detail.php' );

/***************************
----- LOAD DETAIL PAGE -----
 ***************************/

function detailPage( $id ) {

    $medias = Detail::detailMedia( $id );

    if ($medias[0]['type'] == 'series'):
        $nb_seasons = Detail::getSeasons( $id );
        $nb_episodes = Detail::getEpisodes( $id );
    endif;

    require('view/detailView.php');
}
