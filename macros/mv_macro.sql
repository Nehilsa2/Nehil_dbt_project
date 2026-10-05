{% macro mv_macro() %}
    {% set sql %}
        create materialized view if not exists 
            `{{ target.project }}.{{ target.dataset }}.atharv_materialized_view`
            as 
            select * from {{ref('src_hosts_old')}}
    {% endset %}
 
    {% if execute %}
        {{log('Creating MV...', info=True)}}
        {% do run_query(sql) %}
        {{log('Created MV successfully...', info=True)}}
    {% endif %}    
 
{% endmacro %}