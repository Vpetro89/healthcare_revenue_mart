select
    billing_txn_id,
    count(*) as row_count
from {{ ref('stg_billing') }}
group by billing_txn_id
having count(*) > 1
