{{
    config(
        materialized='table',
        partition_by={
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "year"
        },
        partition_expiration_days=2500,
    )
}}

with cte_1 as (

    select *    
    from {{ ref('src_listings') }}
    where created_at >= timestamp('2000-01-01')

)

select
    listing_id,
    listing_url,
    listing_name,
    room_type,
    case
        when minimum_nights = 0 then 1
        else minimum_nights
    end as minimum_nights,
    host_id,
    price_str,
    created_at,
    updated_at
from cte_1