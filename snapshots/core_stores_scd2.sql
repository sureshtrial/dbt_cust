{% snapshot my_snapshot %}
    
    {{
        config(
            target_schema='snapshots',
            unique_key='STOREID',
            strategy='timestamp',
            updated_at='last_updated'
        )
    }}
    
    SELECT
        STATE,
        ZIPCODE,
        STORENAME,
        EMAIL,
        ADDRESS,
        PHONE,
        STOREID,
        CITY,
        to_timestamp(UPDATED_AT, 'MM-DD-YYYY HH24:MI:SS') as last_updated
    FROM
        DEV.STORES

{% endsnapshot %}
