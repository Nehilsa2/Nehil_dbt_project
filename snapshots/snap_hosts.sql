{% snapshot snap_hosts %}
 
{{
    config(
        target_schema='RANDOMDS',
        unique_key='host_id',
        strategy='timestamp',
        updated_at='updated_at',
        hard_deletes='ignore'
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

