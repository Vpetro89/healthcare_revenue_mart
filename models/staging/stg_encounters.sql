SELECT
    patient_id,
    encounter_date,
    department,
    provider_id,
    workload_units,
    productive_hours,
    revenue
FROM {{ ref('encounters') }}