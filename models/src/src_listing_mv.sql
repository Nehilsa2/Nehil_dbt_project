{{
    config(
        materialized = 'materialized_view',
        enable_refresh = true,
        refresh_interval_minute = 30
    )
}}


with cte_1 as (

    select *
    from {{source('airbnb','listings')}}

)

select
    id AS listing_id,
    listing_url,
    name AS listing_name,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
from cte_1
   
  