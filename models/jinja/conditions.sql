{% set host_id = 10 %}

{% if host_id < 10 %}

    select 1 + 2 as result

{% else %}

    select 2 + 5 as result

{% endif %}