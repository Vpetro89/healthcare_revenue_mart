select
    upper(trim(payer_id)) as payer_id,
    trim(payer_name) as payer_name,
    trim(parent_payer) as parent_payer,
    trim(plan_type) as plan_type,
    trim(line_of_business) as line_of_business,
    upper(trim(network_status)) as network_status,
    upper(trim(idr_eligible_flag)) as idr_eligible_flag,
    try_to_number(priority_rank) as priority_rank
from {{ ref('payer_reference') }}
