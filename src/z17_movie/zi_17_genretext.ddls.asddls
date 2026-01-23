@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Genre Text'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_17_GENRETEXT
  as select distinct from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                            p_domain_name : 'ZABAP_GENRE')

{
  value_low,
  text
}

where language = $session.system_language
