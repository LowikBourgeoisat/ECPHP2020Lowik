<?php

require_once( 'model/detail.php' );

/***************************
----- LOAD DETAIL PAGE -----
 ***************************/

function detailPage( $id ) {

    $medias = detail::detailMedia( $id );
    //See if the media is a series or not and then instantiate the
    //variables containing the episodes and the number of seasons
    if ($medias[0]['type'] == 'series'):
        $nb_seasons = detail::getSeasons( $id );
        $nb_episodes = detail::getEpisodes( $id );
    endif;

    require('view/detailView.php');
}
