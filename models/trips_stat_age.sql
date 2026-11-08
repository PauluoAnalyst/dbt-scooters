{{ config(
    materialized='table',
    alias='trips_stat_age',
) }}
with t as (
		select 
			t.started_at::date as date, (t.started_at::date - u.birth_date) / 365 as age,
			count(*) as trips
		from scooters_raw.trips t
		left join scooters_raw.users u on t.user_id = u.id
		group by 1,2
		)
select age, avg(trips) as avg_trips from t 
group by 1
order by 1