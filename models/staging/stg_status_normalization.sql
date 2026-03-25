select
    trim(raw_status) as raw_status,
    upper(trim(standard_status)) as standard_status,
    upper(trim(is_finalized)) as is_finalized,
    upper(trim(is_billable)) as is_billable,
    trim(qa_group) as qa_group
from {{ ref('status_normalization') }}
