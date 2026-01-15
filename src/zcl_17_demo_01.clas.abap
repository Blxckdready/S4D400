CLASS zcl_17_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
*  Hello World
**********************************************************************

    DATA text TYPE string. " Deklaration

    text = 'Hello World!'. " Wertzuweisung

    out->write( text ). "Ausgabe

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************

    DATA age TYPE i. " Ganze Zahlen
    DATA salary_in_euro TYPE p LENGTH 16 DECIMALS 2. " Kommazahlen
    DATA first_name TYPE c LENGTH 40. " Zeichenketten fester Länge
    DATA matriculation_number TYPE n LENGTH 7. " Ziffernkette
    DATA flag TYPE abap_boolean. " boolscher Wert, ist aber nur ein x oder ''; Wird als char gespeichert
    DATA flag2. "Kennzeichen x oder ''
    DATA xmas TYPE d. " Datum
    DATA noon TYPE t. " Zeitangabe

    DATA carrier_id TYPE c LENGTH 3. " ABAP Standarttyp
    DATA carrier_id2 TYPE /dmo/carrier_id. " Datenelement

**********************************************************************
* Wertezuweisung
**********************************************************************

    age = 44.
    salary_in_euro = '6000.52'. " Maskierung als zeichenfolge
    first_name = 'Timon'.
    matriculation_number = '9182643'.
    xmas = '20261225'. " Jahr Monat Tag
    noon = '120000'. " Stunde Minute Sekunde
    flag = 'X'.
    flag2 = ''.

    DATA last_name TYPE c LENGTH 40 VALUE 'Strauß'. " statische Vorbelegung

    DATA(size_in_cm) = 179. " implizite Typisierung; inline deklaration

  ENDMETHOD.
ENDCLASS.
