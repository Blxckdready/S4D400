CLASS zcl_17_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA connection TYPE z17_connection.
    DATA flight TYPE z17_flight.
    DATA flight_extention TYPE z17_flight_extention.

    flight-carrier_id = 'LH'.
    flight-connection_id  = '0400'.
    flight-flight_date = '20260113'.

    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.

    flight_extention = CORRESPONDING #( flight ).
    flight_extention = CORRESPONDING #( base ( flight_extention ) connection ).

    out->write( flight_extention ).

  ENDMETHOD.
ENDCLASS.
