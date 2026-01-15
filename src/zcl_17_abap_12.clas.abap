CLASS zcl_17_abap_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      DATA airplane TYPE REF TO zcl_17_airplane.
      DATA airplanes TYPE TABLE OF REF TO zcl_17_airplane.

      " Creating and Adding Instances to Table

      airplane = NEW #(  ).
      airplane->set_id( 'D-ABUK' ).
      airplane->set_plane_type( 'Airbus A380-800' ).
      airplane->set_empty_weight_in_tons( 277 ).
      APPEND airplane TO airplanes.

      airplane = NEW #(  ).
      airplane->set_id( 'D-AIND' ).
      airplane->set_plane_type( 'Airbus A320-200' ).
      airplane->set_empty_weight_in_tons( 42 ).
      APPEND airplane TO airplanes.

      airplane = NEW #(  ).
      airplane->set_id( 'D-AJKF' ).
      airplane->set_plane_type( 'Boeing 747-400F' ).
      airplane->set_empty_weight_in_tons( 166 ).
      APPEND airplane TO airplanes.

      "Output

      LOOP AT airplanes INTO airplane.
          out->write( | { airplane->get_id(  ) }, { airplane->get_plane_type(  ) }, { airplane->get_empty_weight_in_tons(  ) } | ).
      ENDLOOP.

  ENDMETHOD.
ENDCLASS.
