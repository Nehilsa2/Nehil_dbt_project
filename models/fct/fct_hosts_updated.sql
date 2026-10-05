{{
    config(
        materialized='incremental',
        incremental_strategy = 'insert_overwrite',
        unique_key = 'host_id',
        partition_by = {
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "year"
        },  

    )
}}

with cte_1 as (

    select *
    from {{ ref('src_hosts') }}

)

select *
from cte_1
where 1=1

{% if is_incremental() %}
    and created_at > timestamp_sub(
        current_timestamp(),INTERVAL 1 DAY
    )
{% endif %}