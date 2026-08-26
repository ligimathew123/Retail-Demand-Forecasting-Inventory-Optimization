-- Week 2 Day 1
-- Feature Engineering Setup for Retail Demand Forecasting

-- 1. Create a long-format sales table
-- Convert daily sales columns into date/value rows

CREATE OR REPLACE TABLE `retail_forecasting.sales_long_format` AS

SELECT
  id,
  item_id,
  dept_id,
  cat_id,
  store_id,
  state_id,
  d,
  sales
FROM
  `retail_forecasting.sales_train_evaluation`;

-- 2. Check the created dataset

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT item_id) AS unique_items,
  COUNT(DISTINCT store_id) AS unique_stores,
  COUNT(DISTINCT d) AS unique_days
FROM
  `retail_forecasting.sales_long_format`;

-- 3. Check sales statistics

SELECT
  MIN(sales) AS minimum_sales,
  MAX(sales) AS maximum_sales,
  AVG(sales) AS average_sales
FROM
  `retail_forecasting.sales_long_format`;