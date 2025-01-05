select id as customer_id, first_name, last_name, {{ add_etl_timestamp() }}
from {{ source('jaffle_shop', 'customers') }}
