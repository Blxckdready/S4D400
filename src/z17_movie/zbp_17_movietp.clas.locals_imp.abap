CLASS lhc_ZR_17_MOVIETP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS validatecustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~validatecustomer.

    METHODS DetermineUserNameAndRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineUserNameAndRatingDate.

ENDCLASS.

CLASS lhc_ZR_17_MOVIETP IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateCustomer.
    " Saving created Movies into Table 'Movies'
    DATA Movies TYPE TABLE FOR READ RESULT zr_17_movietp.

    READ ENTITIES OF zr_17_movietp
         ENTITY movie
         FIELDS ( MovieUuid )
         WITH CORRESPONDING #( keys )
         RESULT Movies.

    " Checking each Row of 'Movies'
    LOOP AT Movies INTO DATA(movie).

      " checking if Genre is valid
      SELECT SINGLE FROM zi_17_genrevh
        FIELDS @abap_true
        WHERE genre = @Movie-Genre
        INTO @DATA(exists).

      " Continuing when Genre is valid
      IF exists = abap_true.
        CONTINUE.
      ENDIF.

      " Throwing an error // Stopping database entry
      APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.

      " Throwing error Message
      DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>no_genre_found
                                          genre    = movie-genre
                                          severity = if_abap_behv_message=>severity-error ).

      APPEND VALUE #( %tky               = movie-%tky
                      %msg               = message
                      %element-genre = if_abap_behv=>mk-on )
             TO reported-movie.

    ENDLOOP.
  ENDMETHOD.

  METHOD DetermineUserNameAndRatingDate.

    DATA rating TYPE TABLE FOR UPDATE zr_17_Ratingtp.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #( %tky = key-%tky
                      UserName = sy-uname
                      RatingDate = sy-datlo ) TO rating.

    MODIFY ENTITIES OF zr_17_movietp IN LOCAL MODE
      ENTITY rating
      UPDATE
      FIELDS ( UserName RatingDate )
      WITH rating.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
