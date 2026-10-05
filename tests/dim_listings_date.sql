select *
from 
{{ref('dim_listing_cleansed')}}
where date(created_at) > date(updated_at)
limit 10