CLASS zcl_17_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING
                zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z17_travels
      RAISING
                zcx_abap_no_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_helper IMPLEMENTATION.
  METHOD get_travel_with_customer.

    SELECT SINGLE t~*, c~*
      FROM /dmo/travel AS t
      INNER JOIN /dmo/customer AS c
      ON t~customer_id = c~customer_id
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.

    if sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'TRAVEL_ID'
                                            table = '/DMO/TRAVEL'
                                            value = CONV #( travel_id ) ).
    ENDIF.

  ENDMETHOD.


  METHOD get_travels.
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.

    IF lines( travels ) = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID'
                                            table = '/DMO/TRAVEL'
                                            value = CONV #( customer_id ) ).
    ENDIF.
ENDMETHOD.

ENDCLASS.
