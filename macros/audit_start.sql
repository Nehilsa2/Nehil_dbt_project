{% macro audit_start() %}
 
    SELECT

        'Starting model execution' AS message,

        CURRENT_TIMESTAMP() AS execution_time
 
{% endmacro %}
 