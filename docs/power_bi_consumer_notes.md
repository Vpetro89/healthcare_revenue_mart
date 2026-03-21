Power BI Consumer Notes

Connect Power BI to the mart layer only.

Approved tables

- mart_department_revenue_summary
- fct_encounter_revenue
- dim_department
- dim_provider

Recommended visuals

- Department revenue by month
- Revenue per encounter by department
- Provider encounter volume vs paid amount
- Encounter completion trend

Modeling guidance

- Use encounter_id as the reporting grain for revenue facts
- Do not sum billing rows directly in Power BI if mart tables are available
- Use department_key and provider_key for relationships