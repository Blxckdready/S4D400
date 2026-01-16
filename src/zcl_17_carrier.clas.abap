CLASS zcl_17_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_17_partner.

    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE z17_airplanes READ-ONLY.

    METHODS constructor IMPORTING name TYPE string.

    METHODS: add_airplane IMPORTING airplane TYPE REF TO zcl_17_airplane,
      get_biggest_cargo_plane RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_17_cargo_plane
                              RAISING
                                        zcx_abap_no_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_carrier IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.

    DATA biggest TYPE i.
    LOOP AT airplanes INTO DATA(airplane).
      DATA(weight) = airplane->get_total_weight_in_tons( ).
      IF airplane IS INSTANCE OF zcl_17_cargo_plane AND weight > biggest.

        biggest = weight.
        biggest_cargo_plane = CAST #( airplane ). " explicit widening cast

      ENDIF.

    ENDLOOP.

    IF biggest IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = 'zcl_17_carrier->airplanes' value = 'no data' field = 'Leere Zeile' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
