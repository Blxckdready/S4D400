CLASS zcl_17_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA passenger_plane TYPE REF TO ZCL_17_passenger_plane.
    DATA cargo_plane     TYPE REF TO ZCL_17_cargo_plane.

    DATA carrier         TYPE REF TO zcl_17_carrier.

    carrier = NEW #( 'fluggesellschaft' ).

    DATA travel_agency TYPE REF TO zcl_17_travel_agency.
    travel_agency = NEW #( 'Reisebüro' ).

    travel_agency->add_partner( carrier ).

    " Creating and Adding Airplane-Instances to Carrier
    TRY.
        cargo_plane = NEW #( id                   = 'D-ABUK'
                             plane_type           = 'Airbus 380-800'
                             empty_weight_in_tons = 277
                             cargo_in_tons        = 60 ).
        carrier->add_airplane( cargo_plane ).

        cargo_plane = NEW #( id                   = 'D-AIND'
                             plane_type           = 'Airbus 320-200'
                             empty_weight_in_tons = 42
                             cargo_in_tons        = 50 ).
        carrier->add_airplane( cargo_plane ).

        passenger_plane = NEW #( id                   = 'D-BUKA'
                                 plane_type           = 'Boeing 747-400F'
                                 empty_weight_in_tons = 166
                                 number_of_seats      = 10 ).
        carrier->add_airplane( passenger_plane ).

      CATCH zcx_17_initial_parameter INTO DATA(x). " TODO: variable is assigned but never used (ABAP cleaner)

    ENDTRY.

    " Output

    out->write( |{ travel_agency->name }, partner: { carrier->name }: | ).
    LOOP AT carrier->airplanes INTO DATA(airplane).
      out->write(
          |{ airplane->id }, { airplane->plane_type }, { airplane->empty_weight_in_tons } weight: { airplane->get_total_weight_in_tons( ) }| ).
    ENDLOOP.
    TRY.
        out->write( |biggest cargo: { carrier->get_biggest_cargo_plane( )->get_total_weight_in_tons( ) }| ).
      CATCH zcx_abap_no_data INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
