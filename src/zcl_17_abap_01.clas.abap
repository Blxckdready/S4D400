CLASS zcl_17_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA first_name TYPE c LENGTH 40 VALUE 'Bruce'.
    DATA last_name TYPE c Length 40 Value 'wayne'.

    out->write( |Hello { first_name } { last_name }, how are you!| ).

  ENDMETHOD.
ENDCLASS.
