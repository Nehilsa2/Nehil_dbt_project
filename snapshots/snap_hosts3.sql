{% snapshot snap_hosts3 %}
 
{{
    config(
        target_schema='RANDOMDS',
        unique_key='host_id',
        strategy='timestamp',
        updated_at='updated_at',
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

