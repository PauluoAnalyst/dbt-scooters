{{ config(
    materialized='view',
    alias='trips_prep',
) }}
SELECT 
 	id
 	,user_id
 	,scooter_hw_id
 	,started_at
 	,finished_at
 	,EXTRACT(
        EPOCH FROM (
           finished_at::timestamp
            - started_at::timestamp
        )
    ) as duration_s
 	,start_lat
 	,start_lon
 	,finish_lat
 	,finish_lon
 	,distance as distance_m
 	,(price / 100.)::decimal(20,2) as price_rub
 	, case when distance > 0 and price = 0 then true else false end as is_free
 	, started_at::date as date 
 FROM --scooters_raw.trips
    {{ source("scooters_raw", "trips") }}