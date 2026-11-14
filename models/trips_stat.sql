{{ config(
    materialized='table',
    alias='trips_stat',
) }}
with t as (
		select
			count(*) as trips,
		    count(distinct user_id) as users,
			avg(duration_s / 60) as avg_duration_m,
			sum(price_rub) as revenue_rub,
			--round(((COUNT(*) FILTER (WHERE coalesce(price,0) = 0)::numeric) / count(*)::numeric) * 100., 2) 
			count(is_free = True) / cast(count(*) as real) * 100 AS count_zeros,
			sum(distance_m / 1000) as sum_distance_km	
		from --scooters_raw.trips
			{{ ref("trips_prep") }}
		)
select * -- trips, users, avg_duration_m, revenue_rub, (count_zeros / trips) * 100 as free_trips_pct
from t
