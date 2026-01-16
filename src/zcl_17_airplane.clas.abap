CLASS zcl_17_airplane DEFINITION
  PUBLIC
  ABSTRACT "abstract class
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING id                   TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i
                        RAISING
                                  zcx_17_initial_parameter.

    METHODS get_total_weight_in_tons ABSTRACT RETURNING VALUE(total_weight_in_tons) TYPE i. "abstract method

    DATA: id                   TYPE string READ-ONLY,
          plane_type           TYPE string READ-ONLY,
          empty_weight_in_tons TYPE i READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_17_airplane IMPLEMENTATION.

  METHOD constructor.
    "raise exception for missing input of parameter

    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_17_initial_parameter( 'ID' ).
    ENDIF.

    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_17_initial_parameter( 'PLANE_TYPE' ).
    ENDIF.

    IF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_17_initial_parameter( 'EMPTY_WEIGHT_IN_TONS' ).
    ENDIF.

    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.

    number_of_airplanes += 1.
  ENDMETHOD.

ENDCLASS.
