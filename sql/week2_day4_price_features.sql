-- Week 2 Day 4
-- Price Feature Engineering for Retail Demand Forecasting

CREATE OR REPLACE TABLE `retail-forecasting-506113.retail_forecasting.sales_price_features` AS

SELECT
  s.item_id,
  s.store_id,
  s.d,
  s.sales,
  p.wm_yr_wk,
  p.sell_price,

  AVG(p.sell_price) OVER (
    PARTITION BY s.item_id, s.store_id
  ) AS avg_price,

  MIN(p.sell_price) OVER (
    PARTITION BY s.item_id, s.store_id
  ) AS min_price,

  MAX(p.sell_price) OVER (
    PARTITION BY s.item_id, s.store_id
  ) AS max_price,

  p.sell_price -
  AVG(p.sell_price) OVER (
    PARTITION BY s.item_id, s.store_id
  ) AS price_difference

FROM
  `retail-forecasting-506113.retail_forecasting.stg_sales` AS s

LEFT JOIN
  `retail-forecasting-506113.retail_forecasting.sell_prices` AS p
ON
  s.item_id = p.item_id
  AND s.store_id = p.store_id;