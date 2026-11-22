{{ config(
    materialized='table',
    alias='companies',
) }}
select
    company,
    count(*) as models,
    sum(scooters) as scooters
from
    {{ ref("scooters") }}
group by
    1
order by 3 desc