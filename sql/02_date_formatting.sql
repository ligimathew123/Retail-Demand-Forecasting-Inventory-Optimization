-- Retail Forecasting Project
-- Date Formatting and Validation
-- Week 1: Data Preparation

-- 1. Inspect calendar date format
SELECT
  date,
  d,
  weekday,
  month,
  year
FROM `retail-forecasting-506113.retail_forecasting.Calendar`
ORDER BY date
LIMIT 20;


-- 2. Validate date range
SELECT
  MIN(date) AS start_date,
  MAX(date) AS end_date,
  COUNT(*) AS total_dates,
  COUNT(DISTINCT date) AS unique_dates
FROM `retail-forecasting-506113.retail_forecasting.Calendar`;


-- 3. Check for missing dates
SELECT
  COUNTIF(date IS NULL) AS missing_dates
FROM `retail-forecasting-506113.retail_forecasting.Calendar`;


-- 4. Check date-to-day mapping
SELECT
  date,
  d,
  weekday,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  EXTRACT(DAY FROM date) AS day
FROM `retail-forecasting-506113.retail_forecasting.Calendar`
ORDER BY date
LIMIT 20;
