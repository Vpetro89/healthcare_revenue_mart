select *
from {{ ref('stg_billing') }}
where paid_amount > billed_amount
