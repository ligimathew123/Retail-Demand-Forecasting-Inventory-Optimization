-- Week 3: Demand Forecasting Analysis

-- Top-selling item-store combinations
SELECT
    item_id,
    store_id,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_daily_sales,
    MAX(sales) AS max_daily_sales
FROM `retail-forecasting-506113.retail_forecasting.modeling_features`
GROUP BY item_id, store_id
ORDER BY total_sales DESC
LIMIT 20;


-- Demand statistics by store
SELECT
    store_id,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_daily_sales,
    MAX(sales) AS maximum_daily_sales
FROM `retail-forecasting-506113.retail_forecasting.modeling_features`
GROUP BY store_id
ORDER BY total_sales DESC;


-- Demand statistics by department
SELECT
    dept_id,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_daily_sales
FROM `retail-forecasting-506113.retail_forecasting.modeling_features`
GROUP BY dept_id
ORDER BY total_sales DESC;
