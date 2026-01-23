@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

define view entity ZC_17_BOOKINGTP
  as projection on ZR_17_BOOKINGTP

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,

      /* Associations */
      _Travel : redirected to parent ZC_17_TravelTP
}
