-- Week 2 Day 9
-- Feature Quality Checks

-- 1. Check total records and NULL values

SELECT
  COUNT(*) AS total_rows,
  COUNTIF(item_id IS NULL) AS null_item_id,
  COUNTIF(store_id IS NULL) AS null_store_id,
  COUNTIF(d IS NULL) AS null_day,
  COUNTIF(sales IS NULL) AS null_sales,
  COUNTIF(sales_lag_1 IS NULL) AS null_lag_1,
  COUNTIF(sales_lag_2 IS NULL) AS null_lag_2,
  COUNTIF(sales_rolling_3 IS NULL) AS null_rolling_3
FROM
  `retail-forecasting-506113.retail_forecasting.modeling_features`;


-- 2. Check sales feature statistics

SELECT
  MIN(sales) AS minimum_sales,
  MAX(sales) AS maximum_sales,
  AVG(sales) AS average_sales,
  MIN(sales_lag_1) AS minimum_lag_1,
  MAX(sales_lag_1) AS maximum_lag_1,
  AVG(sales_lag_1) AS average_lag_1,
  MIN(sales_rolling_3) AS minimum_rolling_3,
  MAX(sales_rolling_3) AS maximum_rolling_3,
  AVG(sales_rolling_3) AS average_rolling_3
FROM
  `retail-forecasting-506113.retail_forecasting.modeling_features`;


-- 3. Check calendar feature distribution

SELECT
  day_number,
  week_number,
  month_number,
  quarter_number,
  is_weekend,
  COUNT(*) AS total_records
FROM
  `retail-forecasting-506113.retail_forecasting.modeling_features`
GROUP BY
  day_number,
  week_number,
  month_number,
  quarter_number,
  is_weekend
ORDER BY
  day_number;