CLASS zcl_17_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_cds_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      SELECT FROM Z17_CUSTOMERWITHTRAVELS
        FIELDS *
        INTO TABLE @DATA(result).

      out->write( result ).

  ENDMETHOD.
ENDCLASS.
