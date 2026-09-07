-- HR Turnover Analysis
-- Business question: which department has the highest turnover rate,
-- and what is the most common reason for leaving in each department?

-- Part 1: Turnover rate by department
SELECT
  departamento AS department,
  COUNT(*) AS total,
  SUM(CASE WHEN data_desligamento IS NOT NULL THEN 1 ELSE 0 END) AS departed,
  ROUND(100.0 * SUM(CASE WHEN data_desligamento IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 1) AS turnover_rate_pct
FROM funcionarios
GROUP BY departamento
ORDER BY turnover_rate_pct DESC;

-- Part 2: Most common departure reason by department
SELECT
  departamento AS department,
  motivo_desligamento AS departure_reason,
  COUNT(*) AS count
FROM funcionarios
WHERE motivo_desligamento IS NOT NULL
GROUP BY departamento, motivo_desligamento
ORDER BY department, count DESC;
