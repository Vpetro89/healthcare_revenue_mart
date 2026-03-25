select
    'orphan_billing' as qa_metric,
    'high' as severity,
    count(*) as issue_count
from {{ ref('stg_billing') }} b
left join {{ ref('stg_encounters') }} e
  on b.patient_id = e.patient_id
 and b.encounter_date = e.encounter_date
where e.patient_id is null