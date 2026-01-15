CLASS zcl_timon_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_timon_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA numA TYPE z17_decimal VALUE '2.00'.
    DATA numB TYPE z17_decimal VALUE '13.05'.
    DATA operator TYPE c LENGTH 2 VALUE '**'.

    DATA result TYPE z17_decimal.

    CASE operator.
      WHEN '*'.
        result = numA * numB.
      WHEN '+'.
        result = numA + numB.
      WHEN '-'.
        result = numA - numB.
      WHEN '/' OR ':'.
        TRY.
            result = zcl_17_calculator=>divide( operand1 = numA operand2 = numB ).
          CATCH cx_sy_zerodivide INTO DATA(x).
            out->write( x->get_text( ) ).
        ENDTRY.
      WHEN '%'.
        result = zcl_17_calculator=>calculate_percentage( percentage = numA base = numB ).
      WHEN '**' OR '^'.
        TRY.
            DATA exp TYPE i.
            exp = CONV #( numB ).
            numB = exp.
            result = zcl_abap_calculator=>calculate_power( base = numA exponent = exp ).
          CATCH zcx_abap_exponent_too_high INTO DATA(y).
            out->write( y->get_text( ) ).
        ENDTRY.
      WHEN OTHERS.
        out->Write( 'invalid operator' ).
        RETURN.
    ENDCASE.

    out->write( |{ numA } { operator } { numB } = { result }| ).

  ENDMETHOD.
ENDCLASS.
