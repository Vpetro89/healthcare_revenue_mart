select
    status_event_id,
    encounter_id,
    status_raw,
    status_timestamp,
    updated_by,
    source_system
from {{ ref('encounter_status_history') }}