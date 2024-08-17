{{ config(
    materialized='table'
) }}

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    created_at,
    updated_at,
    source_system
FROM
    {{ source('custome_staging', 'customers') }} -- Adjust this based on your source setup
