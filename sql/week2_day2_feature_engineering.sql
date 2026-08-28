-- Week 2 Day 2
-- Create lag and rolling features for retail demand forecasting

CREATE OR REPLACE TABLE
  `retail-forecasting-506113.retail_forecasting.sales_features` AS

WITH feature_base AS (
  SELECT
    item_id,
    dept_id,
    cat_id,
    store_id,
    state_id,
    d,
    sales,

    -- Previous day's sales
    LAG(sales, 1) OVER (
      PARTITION BY item_id, store_id
      ORDER BY CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64)
    ) AS sales_lag_1,

    -- Sales from two days ago
    LAG(sales, 2) OVER (
      PARTITION BY item_id, store_id
      ORDER BY CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64)
    ) AS sales_lag_2

  FROM
    `retail-forecasting-506113.retail_forecasting.stg_sales`
)

SELECT
  *,
  
  -- Difference from previous day
  sales - sales_lag_1 AS sales_diff_1,

  -- Average sales over the current and previous two days
  AVG(sales) OVER (
    PARTITION BY item_id, store_id
    ORDER BY CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64)
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS sales_rolling_3

FROM feature_base;