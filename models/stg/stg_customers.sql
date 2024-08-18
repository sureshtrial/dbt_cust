{{ 
  config(
    schema='DEV_STG',
    materialized= 'table'
  ) 
}}

WITH stg_data AS (
  SELECT
    *
  FROM {{ ref('raw_customers') }}
)
  select * from stg_data