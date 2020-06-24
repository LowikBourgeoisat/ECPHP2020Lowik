<?php

require_once( 'model/user.php' );

/****************************
* ----- LOAD SIGNUP PAGE -----
****************************/

function signupPage( $post ) {

    if ( $post ):

        if ( filter_var($post['email'], FILTER_VALIDATE_EMAIL) && isset ( $post['email'] ) ):
            $data     = new stdClass();
            $data->email    = $post['email'];
            $data->password = $post['password'];
            $data->password_confirm = $post['password_confirm'];
            $user           = new User( $data );
            $userData       = $user->getUserByEmail();

            if( $userData == "" ):
                if( $post['password'] == $post['password_confirm'] ):
                    $user->createUser();
                    header( 'location: index.php' );
                else:
                    $error_msg = "Les mots de passent ne correspondent pas !";
                endif;
            else:
                $error_msg = "Cet e-mail est déjà utilisé !";
            endif;
        else:
            $error_msg = "Cet e-mail n'est pas valide !";
        endif;

    endif;

    require('view/auth/signupView.php');

}

/***************************
* ----- SIGNUP FUNCTION -----
***************************/
