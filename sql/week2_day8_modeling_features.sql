-- Week 2 Day 8
-- Combine Sales and Calendar Features

CREATE OR REPLACE TABLE
  `retail-forecasting-506113.retail_forecasting.modeling_features` AS

SELECT
  sf.*,
  cf.day_number,
  cf.week_number,
  cf.month_number,
  cf.quarter_number,
  cf.is_weekend
FROM
  `retail-forecasting-506113.retail_forecasting.sales_features` AS sf
LEFT JOIN
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features` AS cf
ON
  sf.item_id = cf.item_id
  AND sf.store_id = cf.store_id
  AND sf.d = cf.d;

-- Validate the modeling table

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT item_id) AS unique_items,
  COUNT(DISTINCT store_id) AS unique_stores,
  COUNT(DISTINCT d) AS unique_days
FROM
  `retail-forecasting-506113.retail_forecasting.modeling_features`;

-- Check the generated features

SELECT *
FROM
  `retail-forecasting-506113.retail_forecasting.modeling_features`
LIMIT 10;