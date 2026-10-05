select * 
from 
{{ref('src_listings')}} l
left join
{{ref('src_hosts')}} r
on l.host_id= r.host_id
where r.host_id is null