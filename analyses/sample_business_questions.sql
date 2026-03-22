-- Revenue by department
select
    department_name,
    sum(total_revenue) as total_revenue,
    sum(encounter_count) as total_encounters
from {{ ref('fct_encounters') }}
group by 1
order by total_revenue desc;

-- Provider performance
select
    provider_name,
    specialty,
    sum(total_revenue) as total_revenue,
    avg(revenue_per_hour) as avg_revenue_per_hour,
    avg(revenue_per_encounter) as avg_revenue_per_encounter
from {{ ref('fct_encounters') }}
group by 1, 2
order by total_revenue desc;