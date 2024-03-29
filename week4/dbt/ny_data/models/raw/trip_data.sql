{{ config(materialized="view") }}

select 
-- identifiers
    {{ dbt_utils.generate_surrogate_key(['vendorid', 'tpep_pickup_datetime'])}} as tripid,
    cast(vendorId as integer) as vendorid,
    cast(ratecodeId as integer) as ratecodeid,
    cast(pulocationid as integer) as pulocationid,
    cast(dolocationid as integer) as dolocationid,

--timestamp
    cast(tpep_pickup_datetime as timestamp) as pickup_datetime,
    cast(tpep_dropoff_datetime as timestamp) as dropoff_datetime,

--trip info
    store_and_fwd_flag,
    cast(passenger_count as integer) as passenger_count,
    cast(trip_distance as numeric) as trip_distance,
    -- cast(trip_type as integer) as trip_type,

--payment info
    cast(fare_amount as numeric) as fare_amount,
    cast(extra as numeric) as extra,
    cast(mta_tax as numeric) as mta_tax,
    cast(tip_amount as numeric) as tip_amount,
    cast(tolls_amount as numeric) as tolls_amount,
    -- cast(ehall_fee as integer) as ehall_fee,
    cast(improvement_surcharge as numeric) as improvement_surcharge,
    cast(total_amount as numeric) as total_amount,
    cast(payment_type as integer) as payment_type,
    {{get_payment_type_name('payment_type')}} as payment_type_name,
    cast(congestion_surcharge as numeric) as congestion_surcharge

from {{source('raw', 'yellow_taxi_data')}}
limit 100
