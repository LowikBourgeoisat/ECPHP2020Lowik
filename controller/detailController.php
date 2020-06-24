<?php

require_once( 'model/detail.php' );

/***************************
----- LOAD DETAIL PAGE -----
 ***************************/

function detailPage( $id ) {

    $medias = Detail::detailMedia( $id );

    require('view/detailView.php');
}