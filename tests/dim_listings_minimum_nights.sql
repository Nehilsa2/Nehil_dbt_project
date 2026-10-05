select *
from 
{{ref('dim_listing_cleansed')}}
where 
minimum_nights < 2
limit 10