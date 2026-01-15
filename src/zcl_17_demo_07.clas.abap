CLASS zcl_17_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Deklaration interner Tabellen
    DATA connections TYPE z17_connections. "TYPE tabellentyp
    DATA connections2 TYPE TABLE OF z00_connection. "TYPE TABLE OF (Strukturtyp)
    DATA connection TYPE z17_connection. "Struktur

    "Hinzufügen von Datensätzen
    connections = VALUE #(
    ( carrier_id = 'LH' connection_id = '0400' )
    ( carrier_id = 'UA' airport_from_id = 'FRA' )
    ( )
    ).

    " Anfügen von Datensätzen
    connection = VALUE #( carrier_id = 'AZ' connection_id = '0017' airport_from_id = 'BER' airport_to_id = 'ROM' ).
    connections = VALUE #( BASE connections ( connection ) ).

    APPEND connection TO connections.

    " Lesen von Einzelsätzen
    TRY.
        connection = connections[ 3 ]. " Per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ]. "Per Schlüssel
    ENDIF.

    "Lesen mehrerer Datensätze
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL. "LOOP AT connections into DATA(connection2).
      out->write( |{ sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    "Ändern von Datensätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'. "per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'.
    ENDIF.

    out->write( connections[ 1 ] ).

    "Ändern mehrerer Datensätze
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL. "LOOP AT connections into DATA(connection2).
*     connection-airport_to_id = 'JFK'.
      connections[ sy-tabix ]-airport_to_id = 'JFK'. "per sy-tabix
    ENDLOOP.


    DATA connection2 TYPE REF TO z17_connection.
    LOOP AT connections REFERENCE INTO connection2 WHERE carrier_id IS NOT INITIAL. "LOOP AT connections into DATA(connection2).
      connection2->airport_to_id = 'BER'. "per datenreferenz
    ENDLOOP.


    FIELD-SYMBOLS <connection> TYPE z17_connection.
    LOOP AT connections ASSIGNING <connection> WHERE carrier_id IS NOT INITIAL. "LOOP AT connections into DATA(connection2).
      <connection>-airport_from_id = 'LH'. "Per Feldsymbol
    ENDLOOP.


    " Sortieren
    SORT connections BY carrier_id DESCENDING.

    " Löschen
    DELETE connections WHERE connection_id = '0402'.
    clear connections.

  ENDMETHOD.

ENDCLASS.
