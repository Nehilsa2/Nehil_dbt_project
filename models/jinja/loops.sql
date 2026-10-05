{% set countries = ['india','usa','russia','pakistan','srilanka'] %}

{% for x in countries %}
    {{ log(x, info=True) }}
{% endfor %}

select 1 as dummy