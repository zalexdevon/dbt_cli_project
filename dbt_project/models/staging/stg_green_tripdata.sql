{{ config(materialized="view") }}
with
    source as (select * from {{ source("staging", "green_tripdata") }}),
    renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(["vendorid", "lpep_pickup_datetime"]) }}
            as tripid,
            {{ adapter.quote("vendorid") }},
            {{ adapter.quote("lpep_pickup_datetime") }} as pickup_datetime,
            {{ adapter.quote("lpep_dropoff_datetime") }} as dropoff_datetime,
            {{ adapter.quote("store_and_fwd_flag") }},
            {{ adapter.quote("ratecodeid") }},
            {{ adapter.quote("pulocationid") }} as pickup_locationid,
            {{ adapter.quote("dolocationid") }} as dropoff_locationid,
            {{ adapter.quote("passenger_count") }},
            {{ adapter.quote("trip_distance") }},
            {{ adapter.quote("fare_amount") }},
            {{ adapter.quote("extra") }},
            {{ adapter.quote("mta_tax") }},
            {{ adapter.quote("tip_amount") }},
            {{ adapter.quote("tolls_amount") }},
            {{ adapter.quote("improvement_surcharge") }},
            {{ adapter.quote("total_amount") }},
            {{ adapter.quote("payment_type") }},
            {{ get_payment_type_description("payment_type") }}
            as payment_type_description
        from source
    )
select *
from renamed
{% if var("is_test_run", default=true) %} limit 100 {% endif %}
