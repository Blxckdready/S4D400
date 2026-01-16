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

    "Instanciation
    vehicle = new #( make = 'Porsche' model = '911' ).
    APPEND vehicle to vehicles.

    vehicle = new #( make = 'Skoda' model = 'Octavia' ).
    APPEND vehicle to vehicles.

    vehicle->accelerate( 10 ).
    TRY.
        vehicle->brake( 100000000 ).
      CATCH zcx_17_value_too_high INTO DATA(x).
        out->write( x->get_text(  ) ).
    ENDTRY.

    LOOP AT vehicles INTO vehicle.
      out->write( | { vehicle->get_make(  ) } { vehicle->get_model(  ) } | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
