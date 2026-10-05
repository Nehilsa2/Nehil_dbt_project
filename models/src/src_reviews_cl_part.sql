{{
    config(
        materialized = 'table',
        partition_by = {
            "field": "listing_id",
            "data_type": "INT64",
            "range":{
                "start":3000,
                "end": 60000000,
                "interval":1000000
            }
        },
        cluster_by = [
            "listing_id","reviewer_name","review_sentiment"
        ],
        require_partition_filter = true,
        
      
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
   
  