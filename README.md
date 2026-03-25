# Healthcare Revenue Data Mart

# 

# This project builds a reporting layer for healthcare encounter, billing, and reimbursement data.

# 

# The goal is to fix data issues in the warehouse so reporting stays consistent downstream.

# 

# A lot of revenue reporting problems come from the same places:

# \- duplicate billing rows

# \- missing provider or department mappings

# \- inconsistent status values

# \- billing activity that does not tie back to a valid encounter

# \- claim amounts that do not line up cleanly with billed amounts

# 

# This repo handles that cleanup in dbt instead of leaving it to Power BI or Tableau.

# 

# &#x20;What the project does

# 

# \- stages and standardizes encounter, billing, claims, provider, department, and payer data

# \- normalizes department aliases and raw status values

# \- reconciles billing rows back to encounter records

# \- surfaces common QA issues before they reach reporting tables

# \- builds reporting models for department performance, provider performance, and data quality tracking

# 

# &#x20;Stack

# 

# \- Snowflake

# \- dbt

# \- SQL

# \- Power BI

# \- Tableau

# \- Git

# 

# Project structure

# 

# Staging

# Raw seed data is cleaned and standardized here.

# 

# Main models:

# \- `stg\_encounters`

# \- `stg\_billing`

# \- `stg\_claims\_adjudication`

# \- `stg\_encounter\_reference`

# \- `stg\_charge\_code\_reference`

# \- `stg\_payer\_reference`

# \- `stg\_departments`

# \- `stg\_providers`

# \- `stg\_department\_aliases`

# \- `stg\_status\_normalization`

# \- `stg\_provider\_department\_expectations`

# \- `stg\_encounter\_status\_history`

# \- `stg\_source\_load\_audit`

# 

# Intermediate

# This layer handles reconciliation and QA logic.

# 

# Main models:

# \- `int\_billing\_reconciled`

# \- `int\_claim\_reimbursement`

# \- `int\_data\_quality\_summary`

# 

# &#x20;Marts

# This is the reporting layer used by dashboards.

# 

# Main models:

# \- `fct\_encounters`

# \- `dim\_department`

# \- `dim\_provider`

# \- `mart\_department\_revenue\_summary`

# \- `mart\_provider\_revenue\_summary`

# \- `mart\_data\_quality\_summary`

# 

# QA checks in scope

# 

# The repo includes logic for checks such as:

# \- duplicate billing transactions

# \- orphan billing rows

# \- missing provider IDs

# \- unmapped or inconsistent status values

# \- provider and department mismatch checks

# \- paid amount greater than billed amount

# \- source load count and exception tracking

# 

# Run

# 

# ```bash

# dbt seed --full-refresh

# dbt run

# dbt test

# ```

# 

# Reporting note

# 

# Power BI and Tableau should point to mart models only.

# 

# Staging and intermediate models exist to clean, reconcile, and test the data before it gets reported.

# 

