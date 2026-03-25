select
    upper(trim(raw_department_value)) as raw_department_value,
    upper(trim(standard_department)) as standard_department,
    trim(standard_department_name) as standard_department_name,
    upper(trim(mapping_status)) as mapping_status
from {{ ref('department_aliases') }}
