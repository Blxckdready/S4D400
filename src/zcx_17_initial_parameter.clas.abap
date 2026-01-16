CLASS zcx_17_initial_parameter DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF zcx_17_initial_parameter,
        msgid TYPE symsgid VALUE 'Z17',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_17_initial_parameter.

    DATA value TYPE string.

    METHODS constructor
    IMPORTING
        !previous LIKE previous OPTIONAL value TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_17_initial_parameter IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    if_t100_message~t100key = zcx_17_initial_parameter.
    me->value = value.
  ENDMETHOD.
ENDCLASS.
