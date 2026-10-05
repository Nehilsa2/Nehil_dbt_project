{% macro stored_procedure() %}
    {% set sql %}
        CREATE OR REPLACE PROCEDURE `{{ target.project }}.{{ target.dataset }}.update_host_name`
        (p_host_id INT64, p_host_name STRING)
        BEGIN
            UPDATE `{{ target.project }}.{{ target.dataset }}.src_hosts_old`
            SET host_name = p_host_name
            WHERE host_id = p_host_id;
        END;
    {% endset %}
    {% if execute %}
        {% do run_query(sql) %}
        {{ log("Stored procedure created successfully", info=True) }}
    {% endif %}
{% endmacro %}