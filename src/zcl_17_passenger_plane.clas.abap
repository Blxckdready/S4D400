CLASS zcl_17_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_17_airplane "extending airplane class
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.
    METHODS constructor IMPORTING id                   TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i
                                  number_of_seats      TYPE i
                        RAISING
                                  zcx_17_initial_parameter.
    METHODS get_total_weight_in_tons REDEFINITION. "override method from superclass

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_passenger_plane IMPLEMENTATION.
  METHOD constructor.

    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ). "using superclass constructor
    me->number_of_seats = number_of_seats.

  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * '1.1' + number_of_seats * '0.08'.
  ENDMETHOD.

ENDCLASS.
