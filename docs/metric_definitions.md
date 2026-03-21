Metric Definitions

Total Encounters

Count of distinct encounter_id where encounter_status is completed.

Total Billed Amount

Sum of billed_amount for billing records tied to a valid encounter.

Total Allowed Amount

Sum of allowed_amount for billing records tied to a valid encounter.

Total Paid Amount

Sum of paid_amount for billing records tied to a valid encounter.

Revenue Per Encounter

Total paid amount divided by total encounters. Returns null when encounter count is zero.

Completion Rate

Completed encounters divided by all scheduled encounters in scope.

Data quality rules

- encounter_id is unique at encounter grain
- Billing records must join to a valid encounter
- paid_amount cannot exceed billed_amount
- Zero-dollar billing lines remain in staging for audit visibility and are not treated as revenue