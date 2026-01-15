CLASS zcl_17_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING
                operand1      TYPE z17_decimal
                operand2      TYPE z17_decimal
      RETURNING VALUE(result) TYPE z17_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS calculate_percentage
      IMPORTING
                percentage              TYPE z17_decimal
                base                    TYPE z17_decimal
      RETURNING VALUE(percentage_value) TYPE z17_decimal.

    CLASS-METHODS calculate_power
      IMPORTING
                base                TYPE z17_decimal
                exponent            TYPE i
      RETURNING VALUE(power_result) TYPE z17_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_calculator IMPLEMENTATION.


  METHOD divide.
    IF operand2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand1 / operand2.
*    return operand1 / operand2.
  ENDMETHOD.
  METHOD calculate_percentage.
    percentage_value = ( percentage / 100 ) * base.
  ENDMETHOD.

  METHOD calculate_power.
    power_result = base ** exponent.
  ENDMETHOD.

ENDCLASS.
