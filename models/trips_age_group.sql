{{ config(
    materialized='table',
    alias='trips_age_group',
) }}
select 
    ag.group as age_group, 
    count(*) as trips, 
    sum(tu.price_rub) as revenue_rub 
from {{ ref('trips_users')}} tu
left join {{ref('age_groups')}} ag on ag.age_start <= tu.age and tu.age <= ag.age_end
group by 1
