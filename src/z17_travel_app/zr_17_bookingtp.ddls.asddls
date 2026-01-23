@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZR_17_BOOKINGTP
  as select from ZI_17_Booking

  association to parent ZR_17_TravelTP as _Travel on $projection.TravelId = _Travel.TravelId

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      CurrencyCode,

      // Associations
      _Travel
}
