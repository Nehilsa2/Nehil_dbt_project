select *
from 
{{ref('dim_listing_cleansed')}}
where price_str < 0
limit 10