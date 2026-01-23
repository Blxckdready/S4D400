@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZR_17_RATINGTP
  as select from ZI_17_RATING

  association to parent ZR_17_MOVIETP as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      _Movie
}
