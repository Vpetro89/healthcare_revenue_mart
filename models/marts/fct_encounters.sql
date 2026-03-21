SELECT
    e.patient_id,
    e.provider_id,
    p.provider_name,
    p.specialty,
    e.department,
    d.department_name,
    COUNT(*) AS encounter_count,
    SUM(e.workload_units) AS total_workload,
    SUM(e.productive_hours) AS total_hours,
    SUM(e.revenue) AS total_revenue,
    SUM(e.revenue) / NULLIF(SUM(e.productive_hours), 0) AS revenue_per_hour,
    SUM(e.revenue) / NULLIF(COUNT(*), 0) AS revenue_per_encounter
FROM {{ ref('stg_encounters') }} e
LEFT JOIN {{ ref('stg_providers') }} p
    ON e.provider_id = p.provider_id
LEFT JOIN {{ ref('stg_departments') }} d
    ON e.department = d.department
GROUP BY
    e.patient_id,
    e.provider_id,
    p.provider_name,
    p.specialty,
    e.department,
    d.department_name