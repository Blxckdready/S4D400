@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Task 3'

define view entity Z17_CustomerKPIs
  with parameters city_Input : /dmo/city
  as select from Z17_TravelWithCustomer

{
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(TotalPrice)          as TotalRevenue,

  cast('EUR' as abap.cuky) as CurrencyCode,

  division(sum(Duration), count(*), 0) as AverageDuration,
  
  count(distinct AgencyId) as NumberOfDifferentAgencys
}
where City = $parameters.city_Input

group by CustomerId,
         CustomerName,
         Street,
         PostalCode,
         City

having sum(TotalPrice) >= 5000
