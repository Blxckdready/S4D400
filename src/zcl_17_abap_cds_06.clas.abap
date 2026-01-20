CLASS zcl_17_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT
      FROM Z17_CustomerKPIs( city_input = 'Mainz' )
      FIELDS *
      INTO TABLE @DATA(result).

    out->write( result ).
  ENDMETHOD.
ENDCLASS.
