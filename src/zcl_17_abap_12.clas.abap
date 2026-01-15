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

    airplane = NEW #( id = 'D-ABUK' plane_type = 'Airbus 380-800' empty_weight_in_tons = 277 ).
    APPEND airplane TO airplanes.

    airplane = NEW #( id = 'D-ABUK' plane_type = 'Airbus 380-800' empty_weight_in_tons = 277 ).
    APPEND airplane TO airplanes.

    airplane = NEW #( id = 'D-AJKF' plane_type = 'Boeing 747-400F' empty_weight_in_tons = 166 ).
    APPEND airplane TO airplanes.

    "Output

    LOOP AT airplanes INTO airplane.
      out->write( | { airplane->id }, { airplane->plane_type }, { airplane->empty_weight_in_tons } | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
