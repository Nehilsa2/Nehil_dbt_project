{% set columns = [
    'host_id',
    'host_name',
    'is_superhost'
] %}

select

{% for cols in columns %}
    {{ cols }}{% if not loop.last %},{% endif %}
{% endfor %}

from {{ ref('src_hosts') }}