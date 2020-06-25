<?php

require_once( 'controller/homeController.php' );
require_once( 'controller/loginController.php' );
require_once( 'controller/signupController.php' );
require_once( 'controller/mediaController.php' );
require_once( 'controller/detailController.php' );
require_once( 'controller/historyController.php' );
require_once( 'controller/contactUsController.php' );
require_once( 'controller/profileController.php' );

/**************************
* ----- HANDLE ACTION -----
***************************/

if ( isset( $_GET['action'] ) ):

  switch( $_GET['action']):

    case 'login':

      if ( !empty( $_POST ) ) login( $_POST );
      else loginPage();

    break;

    case 'signup':

      signupPage( $_POST );

    break;

    case 'logout':

      logout();

    break;

    case 'filmpage':

      filmPage();

    break;

    case 'seriespage':

      seriesPage();

    break;

    case 'history':

      historyPage();

    break;

    case 'profile':

      profilePage();

    break;

    case 'contactus':

      contactUsPage();

    break;

  endswitch;

else:

    $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : false;

    if( $user_id ):
        if ( isset($_GET['media'])):
                detailPage($_GET['media']);
        else:
            mediaPage();
        endif;
    else:
        homePage();
    endif;

endif;
