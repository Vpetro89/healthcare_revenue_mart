# Healthcare Revenue Data Mart

This project builds a reporting layer on top of encounter and billing data. The focus is on fixing data issues before anything reaches Power BI.

Purpose

The goal is to produce consistent metrics for operational and revenue cycle reporting. Most reporting issues come from mismatched definitions, duplicate billing, and inconsistent joins. This is handled at the SQL layer.

What’s in scope

- Standardized encounter data (status, department, dates)
- Billing data tied back to valid encounters
- Encounter-level revenue model
- Department and provider reference tables
- Tests for duplicates, nulls, and invalid financial values
- Documentation for metric definitions and known data issues

Stack

- Snowflake
- dbt
- SQL
- Power BI
- Tableau
- Git

What this supports

- Volume vs revenue by department
- Provider performance at encounter level
- Detection of orphan or duplicate billing
- Consistent department-level reporting

Data flow

1. Raw data is loaded as seed tables
2. Staging models standardize fields and clean inputs
3. Encounter and billing data are joined at encounter grain
4. Revenue and dimension tables are built for reporting
5. Tests validate joins, uniqueness, and financial logic

Run

dbt seed
dbt run
dbt test

Key tables

- fct_encounter_revenue
- dim_department
- dim_provider
- mart_department_revenue_summary

Reporting

Power BI connects to mart tables only.
Staging and intermediate models are not used in reports.
