{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

WITH new_data AS (

    SELECT 
        customer_id, 
        cust_first_name, 
        cust_last_name, 
        email, 
        created_at, 
        updated_at
    FROM {{ ref('stg_customers') }}
    {% if is_incremental() %}
      WHERE updated_at > (SELECT COALESCE(MAX(updated_at), '1900-01-01') FROM {{ this }})
    {% endif %}

)

SELECT * 
FROM new_data
