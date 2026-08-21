-- Retail Forecasting Project
-- Sales Volume Validation
-- Week 1: Data Quality Checks

SELECT
  COUNT(*) AS total_rows,
  SUM(d_1) AS total_sales_d1,
  MIN(d_1) AS minimum_sales_d1,
  MAX(d_1) AS maximum_sales_d1,
  AVG(d_1) AS average_sales_d1,
  COUNTIF(d_1 < 0) AS negative_sales_d1,
  COUNTIF(d_1 IS NULL) AS missing_sales_d1
FROM `retail-forecasting-506113.retail_forecasting.sales_train_evaluation`;
