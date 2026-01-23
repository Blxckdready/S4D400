@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_17_MOVIETP
  as projection on ZR_17_MOVIETP
{
  key MovieUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      @ObjectModel.text.element: ['GenreText']
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_17_GenreVH', element: 'Genre' } } ]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      //Associations
      _Rating : redirected to composition child ZC_17_RATINGTP,
      _GenreText.text as GenreText,
      
      //Transient Data
      @EndUserText.label: 'Average Rating'
      _AverageRating.AverageRating as AverageRating,
      _AverageRating.AverageRatingCriticality as AverageRatingCriticality
} 
