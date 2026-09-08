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
            {% for i in range(1, 1942) %}
                d_{{ i }}{% if not loop.last %},{% endif %}
            {% endfor %}
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