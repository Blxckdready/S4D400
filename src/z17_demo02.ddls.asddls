@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 2'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z17_Demo02
  as select from /dmo/connection as c

    inner join   /dmo/carrier    as a on c.carrier_id = a.carrier_id
    inner join   /dmo/flight     as f on c.connection_id = f.connection_id and a.carrier_id = f.carrier_id

{
  key a.carrier_id            as CarrierId,
  key c.connection_id         as ConnectionId,
  key f.flight_date           as FlightDate,

      a.name                  as Name,
      a.currency_code         as CurrencyCode,
      a.local_created_by      as LocalCreatedBy,
      a.local_created_at      as LocalCreatedAt,
      a.local_last_changed_by as LocalLastChangedBy,
      a.local_last_changed_at as LocalLastChangedAt,
      a.last_changed_at       as LastChangedAt,
      c.airport_from_id       as AirportFromId,
      c.airport_to_id         as AirportToId,
      c.departure_time        as DepartureTime,
      c.arrival_time          as ArrivalTime,
      c.distance              as Distance,
      c.distance_unit         as DistanceUnit,
      f.currency_code         as FlightCurrencyCode,
      f.plane_type_id         as PlaneTypeId,
      f.seats_max             as SeatsMax,
      f.seats_occupied        as SeatsOccupied
}
where c.carrier_id = 'LH' and c.connection_id = '0400'
