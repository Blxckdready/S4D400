CLASS zcl_17_travel_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: name     TYPE string READ-ONLY,
          partners TYPE z17_partners READ-ONLY.

    METHODS: constructor IMPORTING name TYPE string,
      add_partner IMPORTING partner TYPE REF TO zif_17_partner.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_travel_agency IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_partner.
    APPEND partner TO partners.
  ENDMETHOD.
ENDCLASS.
