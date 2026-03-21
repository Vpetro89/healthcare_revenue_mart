select b.*
from {{ ref('stg_billing') }} b
left join {{ ref('stg_encounters') }} e
    on b.encounter_id = e.encounter_id
where e.encounter_id is null
  and coalesce(b.paid_amount, 0) <> 0
