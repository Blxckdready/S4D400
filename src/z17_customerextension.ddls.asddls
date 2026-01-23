@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Task 8'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z17_CustomerExtension
  as select from Z17_Customer as c

  association [0..*] to /dmo/booking as _ZZBookings on _ZZBookings.customer_id = c.CustomerId

{
  key c.CustomerId,

      _ZZBookings
}
