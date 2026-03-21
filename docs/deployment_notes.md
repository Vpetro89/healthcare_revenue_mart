Deployment Notes

Release sequence

1. Run dbt seed
2. Run dbt run --select staging
3. Run dbt run --select intermediate
4. Run dbt run --select marts
5. Run dbt test
6. Refresh Power BI dataset after all tests pass

Promotion controls

- Do not refresh reports until all tests pass
- Limit BI access to mart schemas only
- Review and resolve orphan or duplicate failures before release

Recommended environment structure

- DEV for logic changes
- UAT for reconciliation and stakeholder review
- PROD for report refresh and scheduled use