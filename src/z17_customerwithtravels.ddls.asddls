@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task 7'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z17_CustomerWithTravels as select from Z17_Customer as c
  association [0..*] to Z17_Travel as _Travel on _Travel.CustomerId = c.CustomerId
{
key c.CustomerId,

c.FirstName,
c.LastName,
c.Title,
c.Street,
c.PostalCode,
c.City,

_Travel
   
}
where c.CountryCode = 'DE'
