-- Retail Forecasting Project
-- BigQuery Data Quality Checks
-- Week 1: Raw Data Validation

-- 1. Check total sales records
SELECT COUNT(*) AS total_rows
FROM `retail-forecasting-506113.retail_forecasting.sales_train_evaluation`;


-- 2. Check sales table identifier completeness
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(id IS NULL OR id = '') AS missing_id,
  COUNTIF(item_id IS NULL OR item_id = '') AS missing_item_id,
  COUNTIF(dept_id IS NULL OR dept_id = '') AS missing_dept_id,
  COUNTIF(cat_id IS NULL OR cat_id = '') AS missing_cat_id,
  COUNTIF(store_id IS NULL OR store_id = '') AS missing_store_id,
  COUNTIF(state_id IS NULL OR state_id = '') AS missing_state_id
FROM `retail-forecasting-506113.retail_forecasting.sales_train_evaluation`;


-- 3. Check sales volume range
SELECT
  MIN(d_1) AS minimum_sales_d1,
  MAX(d_1) AS maximum_sales_d1,
  AVG(d_1) AS average_sales_d1
FROM `retail-forecasting-506113.retail_forecasting.sales_train_evaluation`;


-- 4. Check calendar date quality
SELECT
  COUNT(*) AS total_calendar_rows,
  MIN(date) AS earliest_date,
  MAX(date) AS latest_date,
  COUNT(DISTINCT date) AS unique_dates,
  COUNTIF(date IS NULL) AS missing_dates
FROM `retail-forecasting-506113.retail_forecasting.Calendar`;


-- 5. Check sell price data quality
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(store_id IS NULL OR store_id = '') AS missing_store_id,
  COUNTIF(item_id IS NULL OR item_id = '') AS missing_item_id,
  COUNTIF(wm_yr_wk IS NULL) AS missing_week,
  COUNTIF(sell_price IS NULL) AS missing_price,
  COUNTIF(sell_price < 0) AS negative_price,
  MIN(sell_price) AS minimum_price,
  MAX(sell_price) AS maximum_price,
  AVG(sell_price) AS average_price
FROM `retail-forecasting-506113.retail_forecasting.sell_prices`;
