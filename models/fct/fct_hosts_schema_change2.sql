{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='host_id',
        on_schema_change='ignore'
    )
}}

with cte_1 as (

    select *
    from {{ ref('src_hosts') }}

)

select
    host_id,
    host_name,
    is_superhost,
    created_at,
    updated_at
from cte_1
where 1 = 1

{% if is_incremental() %}
    and created_at > (
        select max(created_at)
        from {{ this }}
    )
{% endif %}