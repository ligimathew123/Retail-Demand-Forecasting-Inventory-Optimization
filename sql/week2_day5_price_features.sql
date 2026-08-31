-- Week 2 Day 5
-- Price Feature Engineering for Retail Demand Forecasting

CREATE OR REPLACE TABLE `retail_forecasting.sales_price_features` AS

SELECT
    s.item_id,
    s.store_id,
    s.d,
    s.sales,
    p.wm_yr_wk,
    p.sell_price
FROM
    `retail_forecasting.stg_sales` s
LEFT JOIN
    `retail_forecasting.sell_prices` p
ON
    s.item_id = p.item_id
    AND s.store_id = p.store_id;

-- Check total rows
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT item_id) AS unique_items,
    COUNT(DISTINCT store_id) AS unique_stores,
    COUNT(DISTINCT d) AS unique_days
FROM
    `retail_forecasting.sales_price_features`;

-- Check price statistics
SELECT
    MIN(sell_price) AS minimum_price,
    MAX(sell_price) AS maximum_price,
    AVG(sell_price) AS average_price
FROM
    `retail_forecasting.sales_price_features`;