CLASS zcl_17_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING id                   TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i.

    DATA: id                   TYPE string READ-ONLY,
          plane_type           TYPE string READ-ONLY,
          empty_weight_in_tons TYPE i READ-ONLY.
ENDCLASS.



CLASS zcl_17_airplane IMPLEMENTATION.

  METHOD constructor.
    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
  ENDMETHOD.

ENDCLASS.
