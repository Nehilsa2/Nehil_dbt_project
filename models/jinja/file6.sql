{{ log("Project = " ~ target.project, info=True) }}
{{ log("Dataset = " ~ target.dataset, info=True) }}
{{ log("Type = " ~ target.type, info=True) }}

{% if target.project == 'racko-master-project-505113' %}

    select {{ 2 + 3 }} as result

{% elif target.project == 'abc' %}

    select {{ 10 + 2 }} as result

{% endif %}

{% if execute %}

    {% set results = run_query(
        "select count(*) from tre_dataset_rit.src_hosts"
    ) %}

    {% set row_count = results.columns[0].values()[0] %}

    {{ log("row_count = " ~ row_count, info=True) }}

{% endif %}
