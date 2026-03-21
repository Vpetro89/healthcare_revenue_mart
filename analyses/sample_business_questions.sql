-- Department revenue by month
select
    date_trunc('month', encounter_date) as revenue_month,
    department_key,
    sum(total_paid_amount) as total_paid_amount,
    count(distinct encounter_id) as total_encounters
from {{ ref('fct_encounter_revenue') }}
group by 1, 2
order by 1, 2;

-- Provider performance snapshot
select
    provider_key,
    count(distinct encounter_id) as total_encounters,
    sum(total_paid_amount) as total_paid_amount,
    round(sum(total_paid_amount) / nullif(count(distinct encounter_id), 0), 2) as revenue_per_encounter
from {{ ref('fct_encounter_revenue') }}
group by 1
order by total_paid_amount desc;

-- Billing vs encounter reconciliation
select
    e.encounter_id,
    sum(b.paid_amount) as billing_paid,
    e.total_paid_amount as encounter_paid,
    sum(b.paid_amount) - e.total_paid_amount as variance
from {{ ref('fct_encounter_revenue') }} e
left join {{ ref('stg_billing') }} b
    on e.encounter_id = b.encounter_id
group by e.encounter_id, e.total_paid_amount
having abs(sum(b.paid_amount) - e.total_paid_amount) > 0.01
order by variance desc;

-- Monthly revenue by department (with names)
select
    date_trunc('month', f.encounter_date) as revenue_month,
    d.department_name,
    sum(f.total_paid_amount) as total_paid,
    count(distinct f.encounter_id) as encounters
from {{ ref('fct_encounter_revenue') }} f
join {{ ref('dim_department') }} d
    on f.department_key = d.department_key
group by 1, 2
order by 1, total_paid desc;

-- High revenue encounter outliers
select
    provider_key,
    encounter_id,
    total_paid_amount
from {{ ref('fct_encounter_revenue') }}
where total_paid_amount > (
    select avg(total_paid_amount) + 2 * stddev(total_paid_amount)
    from {{ ref('fct_encounter_revenue') }}
)
order by total_paid_amount desc;

-- Completed encounters only (operational slice)
select
    date_trunc('month', encounter_date) as month,
    count(distinct encounter_id) as completed_encounters,
    sum(total_paid_amount) as total_paid
from {{ ref('fct_encounter_revenue') }}
where encounter_status = 'Completed'
group by 1
order by 1;