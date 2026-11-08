{{ config(
    materialized='table',
    alias='scooters_raw.trips_stat_daily'  -- Здесь укажите желаемое имя таблицы в БД
) }}
select
	date(started_at) as date, --дата начала поездки (день).
	count(*) as trips, -- количество поездок за этот день.
	max(price) / 100 as max_price_rub, -- максимальная стоимость поездки за день в рублях.
	avg(distance) / 1000 as avg_distance_km --средняя дальность поездки за день в километрах.
from scooters_raw.trips
group by 1
having count(*) < 1000
