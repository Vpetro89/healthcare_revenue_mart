select
    b.*
    , case when e.patient_id is null then 'Y' else 'N' end as orphan_billing_flag
    , 'N' as duplicate_transaction_flag
    , 'N' as paid_greater_than_billed_flag
from {{ ref('stg_billing') }} b
left join {{ ref('stg_encounters') }} e
    on b.patient_id = e.patient_id
   and b.encounter_date = e.encounter_date