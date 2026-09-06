{{ config(materialized='table') }}

WITH sales_wide AS (

    SELECT *
    FROM `retail-forecasting-506113.retail_forecasting.sales_train_evaluation`

),

sales_long AS (

    SELECT
        id,
        item_id,
        dept_id,
        cat_id,
        store_id,
        state_id,
        d,
        sales
    FROM sales_wide
    UNPIVOT (
        sales FOR d IN (
            d_1, d_2, d_3, d_4, d_5
        )
    )

)

SELECT
    id,
    item_id,
    dept_id,
    cat_id,
    store_id,
    state_id,
    d,
    sales
FROM sales_long