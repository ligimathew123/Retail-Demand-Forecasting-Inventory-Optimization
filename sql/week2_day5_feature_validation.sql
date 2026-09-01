-- Week 2 Day 5
-- Feature Validation for Retail Demand Forecasting

-- 1. Check total rows
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT item_id) AS unique_items,
  COUNT(DISTINCT store_id) AS unique_stores,
  COUNT(DISTINCT d) AS unique_days
FROM
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features`;


-- 2. Check for NULL values in important columns
SELECT
  COUNTIF(item_id IS NULL) AS null_item_id,
  COUNTIF(store_id IS NULL) AS null_store_id,
  COUNTIF(d IS NULL) AS null_day,
  COUNTIF(sales IS NULL) AS null_sales
FROM
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features`;


-- 3. Check sales values
SELECT
  MIN(sales) AS minimum_sales,
  MAX(sales) AS maximum_sales,
  AVG(sales) AS average_sales
FROM
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features`;


-- 4. Check calendar features
SELECT
  MIN(day_number) AS minimum_day,
  MAX(day_number) AS maximum_day,
  MIN(week_number) AS minimum_week,
  MAX(week_number) AS maximum_week,
  MIN(month_number) AS minimum_month,
  MAX(month_number) AS maximum_month,
  MIN(quarter_number) AS minimum_quarter,
  MAX(quarter_number) AS maximum_quarter
FROM
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features`;


-- 5. Check weekend distribution
SELECT
  is_weekend,
  COUNT(*) AS total_records
FROM
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features`
GROUP BY
  is_weekend
ORDER BY
  is_weekend;