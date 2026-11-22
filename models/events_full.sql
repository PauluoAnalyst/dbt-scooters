{{ config(
    materialized='view',
    alias='events_full',
) }}
select 
    ec.*, et.type
from {{ ref('events_clean')}} ec
left join {{ref ('event_types')}} et on ec.type_id = et.type_id 