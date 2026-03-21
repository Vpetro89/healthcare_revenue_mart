Known Data Issues

Department naming drift

Source extracts include multiple spellings and abbreviations for the same department. Staging models standardize these values before reporting.

Orphan billing transactions

Some billing records do not have a matching encounter. These rows are retained in staging for investigation and excluded from mart outputs.

Duplicate billing transactions

Upstream extracts may repeat billing_txn_id values. Duplicate checks run in dbt tests and should be reviewed before release.

Mixed encounter status values

Source data includes inconsistent status values such as Completed, completeD, and No Show. Staging logic normalizes these values.

Zero-dollar claims activity

Zero billed or paid records remain available for operational review but are not treated as revenue.