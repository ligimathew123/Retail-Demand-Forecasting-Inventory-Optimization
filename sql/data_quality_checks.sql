-- M5 Retail Forecasting
-- Overall Data Quality Validation
-- Week 1: Data Cleaning & Validation


-- 1. Sales Validation
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(d_1941 IS NULL) AS missing_sales_d1941,
  COUNTIF(d_1941 < 0) AS negative_sales_d1941,
  MIN(d_1941) AS minimum_sales_d1941,
  MAX(d_1941) AS maximum_sales_d1941,
  AVG(d_1941) AS average_sales_d1941
FROM `retail-forecasting-506113.retail_forecasting.sales_cleaned`;


-- 2. Price Validation
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(sell_price IS NULL) AS missing_prices,
  COUNTIF(sell_price < 0) AS negative_prices,
  MIN(sell_price) AS minimum_price,
  MAX(sell_price) AS maximum_price,
  AVG(sell_price) AS average_price
FROM `retail-forecasting-506113.retail_forecasting.sell_prices`;


-- 3. Calendar Validation
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(date IS NULL) AS missing_dates,
  MIN(date) AS minimum_date,
  MAX(date) AS maximum_date,
  COUNT(DISTINCT date) AS unique_dates
FROM `retail-forecasting-506113.retail_forecasting.Calendar`;
