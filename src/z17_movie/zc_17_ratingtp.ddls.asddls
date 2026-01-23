@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

@Metadata.allowExtensions: true

define view entity ZC_17_RATINGTP
  as projection on ZR_17_RATINGTP

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie : redirected to parent ZC_17_MOVIETP
}
