CLASS zcl_17_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
  DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
  DATA connection TYPE /dmo/connection.
  DATA connections TYPE TABLE OF /dmo/connection.

    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.

    out->write( connection ).

    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
