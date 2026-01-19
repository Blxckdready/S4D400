@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Task 3'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z17_TravelWithCustomer
  as select from Z17_Customer as c

    inner join   Z17_Travel   as t on c.CustomerId = t.CustomerId

{
  key t.TravelId,

      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      
      t.AgencyId,
      t.CustomerId,
      t.BeginDate,
      t.EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status
}
where c.CountryCode = 'DE'

