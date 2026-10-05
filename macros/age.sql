{% macro age(date_col) %}

    DATE_DIFF(
        CURRENT_DATE(),
        DATE({{ date_col }}),
        YEAR
    )

{% endmacro %}