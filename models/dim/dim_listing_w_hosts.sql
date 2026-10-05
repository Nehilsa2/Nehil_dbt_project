{{
    config(
        materialized='table',
        alias='dim_listing_with_hosts',
        partition_by={
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "year"
        }
    )
}}

with cte_l as (

    select *
    from {{ ref('dim_listing_cleansed') }}
    where date(created_at) >= '1900-01-01'

),

cte_r as (

    select *
    from {{ ref('dim_hosts_cleansed') }}

)

select
    cte_l.listing_id,
    cte_l.listing_name,
    cte_l.room_type,
    cte_l.price_str,
    cte_l.minimum_nights,
    cte_l.host_id,
    cte_r.is_superhost,
    cte_r.host_name,
    cte_l.created_at,
    greatest(cte_l.updated_at, cte_r.updated_at) as updated_at

from cte_l
left join cte_r
    on cte_l.host_id = cte_r.host_id