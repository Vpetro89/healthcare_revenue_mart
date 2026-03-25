select
    upper(trim(department)) as department,
    trim(department_name) as department_name
from {{ ref('departments') }}
