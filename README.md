# Healthcare Revenue Data Mart

This project builds a reporting layer for healthcare encounter, billing, and reimbursement data.

The goal is to fix data issues in the warehouse so reporting stays consistent downstream.

Common revenue reporting issues usually come from:
- duplicate billing rows
- missing provider or department mappings
- inconsistent status values
- billing activity that does not tie back to a valid encounter
- claim amounts that do not line up cleanly with billed amounts

This repo handles that cleanup in dbt instead of pushing it downstream into Power BI or Tableau.

## What this project does effectively is the following: 
- stages and standardizes encounter, billing, claims, provider, department, and payer data
- normalizes department aliases and raw status values
- reconciles billing rows back to encounter records
- surfaces common QA issues before they reach reporting tables
- builds reporting models for department performance, provider performance, and data quality tracking

## Stack

- Snowflake
- dbt
- SQL
- Power BI
- Tableau
- Git

## Project structure

### Staging

Raw seed data is cleaned and standardized here.

Main models:

- `stg_encounters`
- `stg_billing`
- `stg_claims_adjudication`
- `stg_encounter_reference`
- `stg_charge_code_reference`
- `stg_payer_reference`
- `stg_departments`
- `stg_providers`
- `stg_department_aliases`
- `stg_status_normalization`
- `stg_provider_department_expectations`
- `stg_encounter_status_history`
- `stg_source_load_audit`

### Intermediate

This layer handles reconciliation and QA logic.

Main models:

- `int_billing_reconciled`
- `int_claim_reimbursement`
- `int_data_quality_summary`

### Marts

This is the reporting layer used by dashboards.

Main models:

- `fct_encounters`
- `dim_department`
- `dim_provider`
- `mart_department_revenue_summary`
- `mart_provider_revenue_summary`
- `mart_data_quality_summary`

## QA checks in scope

The repo includes logic for:

- duplicate billing transactions
- orphan billing rows
- missing provider IDs
- unmapped or inconsistent status values
- provider and department mismatch checks
- paid amount greater than billed amount
- source load count and exception tracking

## Run

```bash
dbt seed --full-refresh
dbt run
dbt test
