CLASS zcl_17_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        data(result) = zcl_17_helper=>get_travel_with_customer( 1 ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
