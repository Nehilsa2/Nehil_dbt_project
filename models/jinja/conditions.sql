{% set host_id = 10 %}

{% if host_id < 10 %}

    SELECT 1 + 2

{% else %}

    SELECT 2 + 5

{% endif %}