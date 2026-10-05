{{
    config(
        materialized = 'table',
        partition_by = {
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "year"
        },
        partition_expiration_days = 2500,
         require_partition_filter = true,
    )
}}



with cte_1 as (

    select *
    from  {{source('airbnb','hosts')}}

)

select
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at
from cte_1