<?php

require_once( 'model/media.php' );

/***************************
* ----- LOAD HOME PAGE -----
***************************/

function mediaPage() {

  $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
  $medias = Media::filterMedias( $search );

  require('view/mediaListView.php');

}

function filmPage() {

    $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
    $medias = Media::filterFilm( $search );

    require('view/filteredView.php');

}

function seriesPage() {

    $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
    $medias = Media::filterSeries( $search );

    require('view/filteredView.php');

}
