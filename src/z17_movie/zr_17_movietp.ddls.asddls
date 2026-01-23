@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.ignorePropagatedAnnotations: true

define root view entity ZR_17_MOVIETP
  as select from ZI_17_MOVIE as m
  
  association [0..1] to ZI_17_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  
  association [0..1] to ZI_17_GENRETEXT as _GenreText on $projection.Genre = _GenreText.value_low

  composition [0..*] of ZR_17_RATINGTP as _Rating

{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,

      @Semantics.imageUrl: true
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      //Association
      _Rating,     
      _AverageRating,
      _GenreText
}
