SELECT
    customer_id,
    first_name as cust_first_name,
    last_name as cust_last_name,
    email,
    created_at,
    updated_at,
    source_system
FROM
    {{ source('raw_customer', 'customers') }} -- Adjust this based on your source setup
