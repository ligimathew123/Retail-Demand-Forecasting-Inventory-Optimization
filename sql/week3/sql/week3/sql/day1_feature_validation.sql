-- ============================================================
-- Week 3 - Day 1
-- Final Feature Table Validation
-- Project: Retail Demand Forecasting & Inventory Optimization
-- Dataset: M5 Forecasting Dataset
-- ============================================================


-- ------------------------------------------------------------
-- Check 1: NULL Value Validation
-- ------------------------------------------------------------

SELECT
  COUNT(*) AS total_rows,
  COUNTIF(sales IS NULL) AS null_sales,
  COUNTIF(sales_lag_1 IS NULL) AS null_lag_1,
  COUNTIF(sales_lag_2 IS NULL) AS null_lag_2,
  COUNTIF(sales_diff_1 IS NULL) AS null_diff_1,
  COUNTIF(sales_rolling_3 IS NULL) AS null_rolling_3
FROM `retail-forecasting-506113.retail_forecasting.final_feature_table`;


-- ------------------------------------------------------------
-- Check 2: Duplicate Record Validation
-- Check uniqueness of item_id + store_id + d
-- ------------------------------------------------------------

SELECT
  item_id,
  store_id,
  d,
  COUNT(*) AS record_count
FROM `retail-forecasting-506113.retail_forecasting.final_feature_table`
GROUP BY
  item_id,
  store_id,
  d
HAVING COUNT(*) > 1
ORDER BY record_count DESC;


-- ------------------------------------------------------------
-- Check 3: Sales Value Validation
-- Check for negative or invalid sales values
-- ------------------------------------------------------------

SELECT
  COUNTIF(sales < 0) AS negative_sales,
  MIN(sales) AS minimum_sales,
  MAX(sales) AS maximum_sales,
  AVG(sales) AS average_sales
FROM `retail-forecasting-506113.retail_forecasting.final_feature_table`;


-- ------------------------------------------------------------
-- Check 4: Feature Coverage Validation
-- Check how many rows contain populated engineered features
-- ------------------------------------------------------------

SELECT
  COUNT(*) AS total_rows,
  COUNT(sales_lag_1) AS lag_1_populated,
  COUNT(sales_lag_2) AS lag_2_populated,
  COUNT(sales_diff_1) AS diff_1_populated,
  COUNT(sales_rolling_3) AS rolling_3_populated
FROM `retail-forecasting-506113.retail_forecasting.final_feature_table`;
