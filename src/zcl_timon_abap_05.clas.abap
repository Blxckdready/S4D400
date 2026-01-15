CLASS zcl_timon_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_timon_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA customer TYPE z17_customer_info.

    TRY.
        customer = zcl_abap_helper=>get_customer( customer_id = 000001 ).
      CATCH zcx_abap_no_data INTO DATA(k).
        out->write( k->get_text( ) ).
    ENDTRY.
      out->write( customer ).

  ENDMETHOD.
ENDCLASS.
