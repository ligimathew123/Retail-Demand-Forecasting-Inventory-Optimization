-- Week 2 Day 7
-- Create Final Feature Table for Retail Demand Forecasting

CREATE OR REPLACE TABLE
  `retail-forecasting-506113.retail_forecasting.final_feature_table` AS

SELECT
  *
FROM
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features`;

-- Check the final feature table

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT item_id) AS unique_items,
  COUNT(DISTINCT store_id) AS unique_stores,
  COUNT(DISTINCT d) AS unique_days
FROM
  `retail-forecasting-506113.retail_forecasting.final_feature_table`;

-- Preview the data

SELECT *
FROM
  `retail-forecasting-506113.retail_forecasting.final_feature_table`
LIMIT 10;