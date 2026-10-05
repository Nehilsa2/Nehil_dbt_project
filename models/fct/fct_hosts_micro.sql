{{
    config(
        materialized='incremental',
        incremental_strategy='microbatch',
        event_time='created_at',
        begin='2009-06-04',
        batch_size='year',
        partition_by={
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "year"
        }
    )
}}

with cte_1 as (

    select *
    from {{ ref('src_hosts') }}

)

select *
from cte_1

{% if is_incremental() %}
where created_at > timestamp_sub(
    current_timestamp(),
    interval 1 day
)
{% endif %}