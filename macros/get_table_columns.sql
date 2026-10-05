{% macro get_table_columns(model_name) %}
 
    {% set relation = adapter.get_relation(
        database=target.database,
        schema=target.schema,
        identifier=model_name
    ) %}
 
    {% set columns = adapter.get_columns_in_relation(relation) %}
 
    {% for column in columns %}
 
        {{ log(
            "Column: " ~ column.name ~
            " | Type: " ~ column.data_type,
            info=true
        ) }}
 
    {% endfor %}
 
{% endmacro %}

