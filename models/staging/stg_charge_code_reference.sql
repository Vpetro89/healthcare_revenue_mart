select
    charge_code,
    charge_description,
    charge_category,
    expected_department,
    billable_flag,
    active_flag
from {{ ref('charge_code_reference') }}