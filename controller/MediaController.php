<?php

require_once( 'model/media.php' );

/***************************
* ----- LOAD HOME PAGE -----
***************************/

function mediaPage() {
    // Get all medias
    $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
    $medias = media::filterMedias( $search );

    require('view/mediaListView.php');

}

function filmPage() {
    // Get only films
    $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
    $medias = media::filterFilm( $search );

    require('view/filteredView.php');

}

function seriesPage() {
    // Get only series
    $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
    $medias = media::filterSeries( $search );

    require('view/filteredView.php');

}
