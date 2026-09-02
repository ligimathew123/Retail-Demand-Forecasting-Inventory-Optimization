-- Week 2 Day 6
-- Price Feature Engineering for Retail Demand Forecasting

CREATE OR REPLACE TABLE
`retail-forecasting-506113.retail_forecasting.sales_price_features` AS

SELECT
    s.item_id,
    s.store_id,
    s.d,
    s.sales,
    p.sell_price,

    LAG(p.sell_price) OVER (
        PARTITION BY s.item_id, s.store_id
        ORDER BY s.d
    ) AS price_lag_1,

    p.sell_price -
    LAG(p.sell_price) OVER (
        PARTITION BY s.item_id, s.store_id
        ORDER BY s.d
    ) AS price_change,

    SAFE_DIVIDE(
        p.sell_price -
        LAG(p.sell_price) OVER (
            PARTITION BY s.item_id, s.store_id
            ORDER BY s.d
        ),
        LAG(p.sell_price) OVER (
            PARTITION BY s.item_id, s.store_id
            ORDER BY s.d
        )
    ) * 100 AS price_change_pct

FROM
`retail-forecasting-506113.retail_forecasting.stg_sales` s

LEFT JOIN
`retail-forecasting-506113.retail_forecasting.sell_prices` p
ON s.item_id = p.item_id
AND s.store_id = p.store_id;