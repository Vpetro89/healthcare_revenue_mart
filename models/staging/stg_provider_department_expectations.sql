select
    upper(trim(provider_id)) as provider_id,
    trim(provider_name) as provider_name,
    trim(specialty) as specialty,
    upper(trim(expected_department)) as expected_department,
    trim(expected_department_name) as expected_department_name,
    upper(trim(active_flag)) as active_flag
from {{ ref('provider_department_expectations') }}
