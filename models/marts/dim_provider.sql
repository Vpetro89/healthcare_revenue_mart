select
    p.provider_id,
    p.provider_name,
    p.specialty,
    pe.expected_department,
    pe.expected_department_name,
    coalesce(pe.active_flag, 'Y') as active_flag
from {{ ref('stg_providers') }} p
left join {{ ref('stg_provider_department_expectations') }} pe
    on p.provider_id = pe.provider_id
