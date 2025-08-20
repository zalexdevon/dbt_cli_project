{{ config(materialized="view") }}
with
    source as (select * from {{ source("staging", "taxi_zone_lookup") }}),
    renamed as (
        select
            {{ adapter.quote("locationid") }},
            {{ adapter.quote("borough") }},
            {{ adapter.quote("zone") }},
            {{ adapter.quote("service_zone") }}

        from source
    )
select *
from renamed
