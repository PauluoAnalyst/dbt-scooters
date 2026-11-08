with t as (
		select
			count(*) as trips,
		    count(distinct user_id) as users,
			avg(finished_at::timestamp - started_at::timestamp) as avg_duration_m,
			sum(price) as revenue_rub,
			--round(((COUNT(*) FILTER (WHERE coalesce(price,0) = 0)::numeric) / count(*)::numeric) * 100., 2) 
			count(price = 0 or null) / cast(count(*) as real) * 100 AS count_zeros	
		from scooters_raw.trips
		)
select * -- trips, users, avg_duration_m, revenue_rub, (count_zeros / trips) * 100 as free_trips_pct
from t
