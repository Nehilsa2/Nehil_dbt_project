{{
    config(
        materialized = 'table',
        cluster_by = [
            "listing_id","reviewer_name","review_sentiment"
        ]
     
    )
}}


with cte_1 as (

    select *
    from {{source('airbnb','reviews')}}

)


select
    listing_id,
    DATE AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
from cte_1
   
  