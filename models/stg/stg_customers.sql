WITH stg_data AS (
  SELECT
    *
  FROM {{ ref('raw_customers') }} -- refrerence
)
  select * from stg_data