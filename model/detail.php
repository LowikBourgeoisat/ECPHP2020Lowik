<?php

require_once( 'database.php' );

class detail {

    protected $id;
    protected $genre_id;
    protected $title;
    protected $type;
    protected $status;
    protected $release_date;
    protected $summary;
    protected $trailer_url;

    public function __construct( $media ) {

        $this->setId( isset( $media->id ) ? $media->id : null );
        $this->setGenreId( $media->genre_id );
        $this->setTitle( $media->title );
    }

     /***************************
     * -------- SETTERS ---------
     ***************************/

    public function setId( $id ) {
        $this->id = $id;
    }

    public function setGenreId( $genre_id ) {
        $this->genre_id = $genre_id;
    }

    public function setTitle( $title ) {
        $this->title = $title;
    }

    public function setType( $type ) {
        $this->type = $type;
    }

    public function setStatus( $status ) {
        $this->status = $status;
    }

    public function setReleaseDate( $release_date ) {
        $this->release_date = $release_date;
    }

     /***************************
     * -------- GETTERS ---------
     ***************************/

    public function getId() {
        return $this->id;
    }

    public function getGenreId() {
        return $this->genre_id;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getType() {
        return $this->type;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getReleaseDate() {
        return $this->release_date;
    }

    public function getSummary() {
        return $this->summary;
    }

    public function getTrailerUrl() {
        return $this->trailer_url;
    }

     /***************************
     * -------- GET LIST --------
     ***************************/


    public static function detailMedia ( $title ) {
        // Open database connection
        $db = init_db();
        // Get everything from table media
        $req = $db->prepare( "SELECT * FROM media WHERE id = ? ORDER BY release_date DESC");
        $req->execute(array($title));

        // Close database connection
        $db = null;

        return $req->fetchAll();
    }

    public static function getSeasons( $id ) {
        // Open database connection
        $db = init_db();
        // Get ID from table series
        $req  = $db->prepare( "SELECT id_season FROM series WHERE id_media = ? GROUP BY id_season");
        $req->execute(array($id));

        // Close database connection
        $db = null;

        return $req->fetchAll();


    }

    public static function getEpisodes( $id ) {
        // Open database connection
        $db = init_db();
        // Get everything from table series
        $req  = $db->prepare( "SELECT * FROM series WHERE id_media = ?");
        $req->execute(array($id));

        // Close database connection
        $db = null;

        return $req->fetchAll();


    }

}
