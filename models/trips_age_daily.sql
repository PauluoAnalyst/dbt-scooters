{{ config(
    materialized='table',
    alias='trips_age_daily',
) }}
select
    "date",
    age,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from
    {{ ref("trips_users")}}
group by
    1,
    2