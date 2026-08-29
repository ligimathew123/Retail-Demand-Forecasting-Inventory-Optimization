-- Week 2 Day 3
-- Calendar features for retail demand forecasting

CREATE OR REPLACE TABLE
  `retail-forecasting-506113.retail_forecasting.sales_calendar_features` AS

SELECT
  item_id,
  dept_id,
  cat_id,
  store_id,
  state_id,
  d,
  sales,
  sales_lag_1,
  sales_lag_2,
  sales_diff_1,
  sales_rolling_3,

  -- Numeric day identifier
  CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64) AS day_number,

  -- Week number
  DIV(CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64) - 1, 7) + 1 AS week_number,

  -- Month number assuming 30-day periods for this staging dataset
  DIV(CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64) - 1, 30) + 1 AS month_number,

  -- Quarter number
  DIV(CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64) - 1, 90) + 1 AS quarter_number,

  -- Weekend flag based on sequential day number
  CASE
    WHEN MOD(CAST(REGEXP_EXTRACT(d, r'(\d+)') AS INT64) - 1, 7) IN (5, 6)
      THEN 1
    ELSE 0
  END AS is_weekend

FROM
  `retail-forecasting-506113.retail_forecasting.sales_features`;