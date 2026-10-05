select count(*)
from
{{ref('dim_listing_cleansed')}}
group by host_id
having count(*) >1
limit 10