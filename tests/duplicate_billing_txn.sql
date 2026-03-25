select
    transaction_id,
    count(*) as row_count
from {{ ref('stg_billing') }}
group by transaction_id
having count(*) > 1
