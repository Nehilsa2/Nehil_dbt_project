with cte1 as (

    select *
    from {{ ref('src_listings') }}

)

select *
from cte1
where created_at >= '{{ var("my_var") }}'