select
    patient_id,
    encounter_date,
    department,
    provider_id
from {{ ref('encounters') }}