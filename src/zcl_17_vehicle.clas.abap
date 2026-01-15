CLASS zcl_17_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS accelerate IMPORTING value TYPE i.
    METHODS brake      IMPORTING value TYPE i.
    METHODS: get_make RETURNING value(r_result) TYPE string,
             set_make IMPORTING make TYPE string,
             get_model RETURNING value(r_result) TYPE string,
             set_model IMPORTING model TYPE string,
             get_speed_in_kmh RETURNING value(r_result) TYPE i,
             set_speed_in_kmh IMPORTING speed_in_kmh TYPE i.

  PRIVATE SECTION.
    DATA make         TYPE string.
    DATA model        TYPE string.
    DATA speed_in_kmh TYPE i.
ENDCLASS.



CLASS zcl_17_vehicle IMPLEMENTATION.

  METHOD accelerate.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD get_make.
    r_result = me->make.
  ENDMETHOD.

  METHOD set_make.
    me->make = make.
  ENDMETHOD.

  METHOD get_model.
    r_result = me->model.
  ENDMETHOD.

  METHOD set_model.
    me->model = model.
  ENDMETHOD.

  METHOD get_speed_in_kmh.
    r_result = me->speed_in_kmh.
  ENDMETHOD.

  METHOD set_speed_in_kmh.
    me->speed_in_kmh = speed_in_kmh.
  ENDMETHOD.

ENDCLASS.
