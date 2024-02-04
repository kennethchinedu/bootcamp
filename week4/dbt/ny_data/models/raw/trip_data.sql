{{ config(materialized="view") }}

select * from {{ source('raw', 'yellow_taxi_data') }}
limit 100

