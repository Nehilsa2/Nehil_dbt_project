{{
    config(
        materialized = 'table'
    )
}}


with cte1 as(
    select * from  {{ref('airbnb_room_type_reference_seed')}}
)

select * from cte1