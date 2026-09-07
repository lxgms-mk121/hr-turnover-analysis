# HR Turnover Analysis (SQL)

## Business question
Which department has the highest turnover rate, and what is the most common reason for leaving in each department?

## Tools
- SQL (SQLite)
- Fictional HR dataset (120 employees, 5 departments)

## Approach
1. Counted total employees and departed employees per department.
2. Calculated the turnover rate per department: `(departed / total) * 100`.
3. Broke down the most common departure reason within each department.

## Key findings
- **Marketing** had the highest turnover rate (36%), driven mainly by "Termination by company."
- **Comercial**, **Operações**, and **Tecnologia** had turnover closer to 17-21%, mostly driven by voluntary resignations.
- Turnover rate (not just raw headcount) was needed to get an accurate comparison — Marketing had the most departures in absolute numbers, but this only became meaningful once compared against department size.

## Query
See [`turnover_by_department.sql`](./turnover_by_department.sql) for the full query.

```sql
SELECT
  departamento AS department,
  COUNT(*) AS total,
  SUM(CASE WHEN data_desligamento IS NOT NULL THEN 1 ELSE 0 END) AS departed,
  ROUND(100.0 * SUM(CASE WHEN data_desligamento IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 1) AS turnover_rate_pct
FROM funcionarios
GROUP BY departamento
ORDER BY turnover_rate_pct DESC;
```

## Notes
This is a first, intentionally simple project built while learning SQL fundamentals. The goal was to go from raw data to a real business answer end-to-end, not to demonstrate advanced technique.
