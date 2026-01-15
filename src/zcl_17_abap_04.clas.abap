CLASS zcl_17_abap_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_abap_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(result) = zcl_17_calculator=>divide( operand1 = 5 operand2 = 0 ).
        out->write( result ).
      CATCH cx_sy_zerodivide INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    DATA(percent_result) = zcl_17_calculator=>calculate_percentage( percentage = 50 base = 5 ).
    out->write( percent_result ).

    TRY.
        DATA(power_result) = zcl_abap_calculator=>calculate_power( base = 2 exponent = 4 ).
        out->write( power_result ).
      CATCH zcx_abap_exponent_too_high INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
