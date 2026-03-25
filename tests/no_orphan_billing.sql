select *
from {{ ref('int_billing_reconciled') }}
where orphan_billing_flag = 'Y'
  and coalesce(billed_amount, 0) <> 0
