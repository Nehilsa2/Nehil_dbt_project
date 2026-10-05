{{
    config(
        materialized = 'table',
        partition_by = {
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "day"
        },
        partition_expiration_days = 2500,
        pre_hook="{{ log_message('Starting execution of dim_hosts_cleansed') }}",
        post_hook="{{ log_message('Finished execution of dim_hosts_cleansed') }}"
    )
}}

with cte as (

    select *
    from {{ ref('src_hosts') }}
    where is_superhost is not null

)

select
    host_id,
    coalesce(host_name, 'Anonymous') as host_name,
    is_superhost,
    created_at,
    updated_at
from cte