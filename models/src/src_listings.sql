{{
    config(
        materialized = 'table',
        partition_by = {
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "year"
        },
        partition_expiration_days = 2500,
         require_partiton_filter = true,
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
   
  