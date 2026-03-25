select *
from {{ ref('int_claim_reimbursement') }}
where coalesce(paid_amount, 0) > coalesce(billed_amount, 0)
