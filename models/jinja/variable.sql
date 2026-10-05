{% set my_host_id = [12,23,34] %}

select *
from {{ ref('dim_listing_w_hosts') }}
where host_id in (
    {% for id in my_host_id %}
        {{ id }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
)
