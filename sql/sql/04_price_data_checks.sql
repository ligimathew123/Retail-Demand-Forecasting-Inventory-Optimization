-- Retail Forecasting Project
-- Sell Price Data Validation
-- Week 1: Data Quality Checks

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
