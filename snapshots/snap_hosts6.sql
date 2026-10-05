{% snapshot snap_hosts6 %}
 
{{
    config(
        target_schema='RANDOMDS',
        unique_key='host_id',
        strategy='check',
        check_cols='all',
        dbt_valid_to_current="timestamp('9999-12-31 00:00:00 UTC')",
        hard_deletes='new_record'
    )
}}
 
SELECT
    host_id,
    host_name,
    is_superhost,
    created_at,
    updated_at
 
FROM {{ ref('src_hosts') }}
 
{% endsnapshot %}

