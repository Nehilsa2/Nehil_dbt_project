select
    *
from {{ ref('dim_listing_w_hosts') }}
where host_id = {{ var("my_host_id") }}