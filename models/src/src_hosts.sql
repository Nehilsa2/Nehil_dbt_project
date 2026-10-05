
{{
    config(
        materialized='ephemeral'
    )
}}

with cte_1 as (

    select *
    from {{ source('airbnb', 'hosts') }}

)

select
    id as host_id,
    name as host_name,
    is_superhost,
    created_at,
    updated_at

from cte_1