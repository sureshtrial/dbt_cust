{{
  config(
    materialized='incremental',
    unique_key='customer_id',
    schema='DEV_CORE',
  )
}}

WITH new_data AS (

  {% if is_incremental() %}
    -- If this is an incremental run, filter for new records
    SELECT
      customer_id,
      cust_first_name,
      cust_last_name,
      email,
      created_at,
      updated_at
    FROM {{ ref('stg_customers') }}  -- Reference the raw layer
    WHERE updated_at > (
      SELECT COALESCE(MAX(updated_at), '1900-01-01') FROM {{ this }}
    )

  {% else %}
    -- If this is the first run, select all records
    SELECT
      customer_id,
      cust_first_name,
      cust_last_name,
      email,
      created_at,
      updated_at
    FROM {{ ref('stg_customers') }}  -- Reference the raw layer
  {% endif %}

)

SELECT * FROM new_data
