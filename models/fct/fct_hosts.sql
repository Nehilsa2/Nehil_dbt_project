{{
    config(
        materialized='incremental',
        incremental_strategy = 'merge',
        unique_key = 'host_id',
        on_schema_change = 'fail'
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
    and created_at > (
        select max(created_at)
        from {{ this }}
    )
{% endif %}