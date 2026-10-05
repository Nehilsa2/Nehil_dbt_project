'{{ target.project }}'
'{{ target.dataset }}'
'{{ target.type }}'
 
 
{% if target.project == 'racko-master-project-505113'  %}
    select {{2+3}}
{% elif target.project == 'abc' %}
    SELECT {{10+2}}
{% endif %}
 
{% if execute %}
 
    {% set results = run_query(
        "select count(*) from tre_dataset_rit.src_hosts"
    ) %}
    {% set row_count = results.columns[0].values()[0] %}
 
    {{log("row_count = " ~ row_count, info = true)}}
 
{% endif %}