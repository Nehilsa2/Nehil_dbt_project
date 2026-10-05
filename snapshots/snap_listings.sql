{% snapshot snap_listings %}
 
{{
    config(
        target_schema='RANDOMDS',
        unique_key='listing_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}
 
select
    *
from {{ref('src_listings')}}
 
{% endsnapshot %}