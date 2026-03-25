select
    encounter_id,
    patient_id,
    facility_id,
    service_line,
    encounter_class
from {{ ref('encounter_reference') }}