CLASS zcl_17_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TRY.
        data(result) = zcl_17_helper=>get_travels( 1 ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->GET_TEXT(  ) ).
    ENDTRY.

    DELETE result WHERE begin_date < sy-datum.

    LOOP AT result REFERENCE INTO DATA(row).
      row->booking_fee = row->booking_fee * '1.1'.
    ENDLOOP.

    SORT result BY description DESCENDING.

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
