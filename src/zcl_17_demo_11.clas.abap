CLASS zcl_17_demo_11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_demo_11 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Declaration
    DATA vehicle TYPE REF TO zcl_17_vehicle.

    DATA vehicles TYPE TABLE OF REF TO zcl_17_vehicle.

    "Instanceiation
    vehicle = new #( ).
    vehicle->set_make( 'Porsche' ).
    vehicle->set_model( '911' ).
    APPEND vehicle to vehicles.

    vehicle = new #(  ).
    vehicle->set_make( 'Skoda' ).
    vehicle->set_model( 'Octavia' ).
    APPEND vehicle to vehicles.

    LOOP AT vehicles INTO vehicle.
      out->write( | { vehicle->get_make(  ) } { vehicle->get_model(  ) } | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
