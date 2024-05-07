{{ config(severity = 'warn') }}

SELECT 
  violation_code,
  SUM(fee_usd) as total_revenue
FROM
  {{ref('silver_parking_violations_codes')}}
GROUP BY
  violation_code
HAVING
  NOT (total_revenue >= 1)