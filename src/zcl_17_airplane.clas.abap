CLASS zcl_17_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_id RETURNING VALUE(r_result) TYPE string,
      set_id IMPORTING i_id TYPE string,
      get_plane_type RETURNING VALUE(r_result) TYPE string,
      set_plane_type IMPORTING i_plane_type TYPE string,
      get_empty_weight_in_tons RETURNING VALUE(r_result) TYPE i,
      set_empty_weight_in_tons IMPORTING i_empty_weight_in_tons TYPE i.

  PRIVATE SECTION.
    DATA: id                   TYPE string,
          plane_type           TYPE string,
          empty_weight_in_tons TYPE i.
ENDCLASS.



CLASS zcl_17_airplane IMPLEMENTATION.
  METHOD get_id.
    r_result = me->id.
  ENDMETHOD.

  METHOD set_id.
    me->id = i_id.
  ENDMETHOD.

  METHOD get_plane_type.
    r_result = me->plane_type.
  ENDMETHOD.

  METHOD set_plane_type.
    me->plane_type = i_plane_type.
  ENDMETHOD.

  METHOD get_empty_weight_in_tons.
    r_result = me->empty_weight_in_tons.
  ENDMETHOD.

  METHOD set_empty_weight_in_tons.
    me->empty_weight_in_tons = i_empty_weight_in_tons.
  ENDMETHOD.

ENDCLASS.
