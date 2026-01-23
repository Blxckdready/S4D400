@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_17_TravelTP
  as select from ZI_17_Travel

  composition [0..*] of ZR_17_BOOKINGTP as _Bookings

{
  key TravelId,

      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreateDat,
      LastChangedBy,
      LastChangedAt,

      // Associations
      _Bookings,

      // Transient Data
      case when Status = 'X' then 1
     when Status = 'P' then 2
     when Status = 'B' then 3
     else 0 end      as StatusCriticality
}
