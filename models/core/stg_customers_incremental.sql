{{
  config(
    materialized='incremental',
    unique_key='customer_id'
  )
}}

WITH new_data AS (
  SELECT
    customer_id,
    first_name,
    last_name,
    email,
    created_at,
    updated_at
  FROM {{ ref('raw_customers') }}  -- Reference the raw layer
  WHERE updated_at > COALESCE((SELECT MAX(updated_at) FROM {{ this }}), '1900-01-01')  -- Handle the first run gracefully
)

SELECT * FROM new_data
