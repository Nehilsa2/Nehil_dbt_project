
{% macro audit_end() %}
 
    SELECT

        'Finished model execution' AS message,

        CURRENT_TIMESTAMP() AS execution_time
 
{% endmacro %}
 