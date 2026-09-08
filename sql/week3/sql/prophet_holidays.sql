CREATE OR REPLACE TABLE
`retail-forecasting-506113.retail_forecasting.prophet_holidays` AS

SELECT
  date AS ds,
  event_name_1 AS holiday
FROM
  `retail-forecasting-506113.retail_forecasting.Calendar`
WHERE
  event_name_1 IS NOT NULL

UNION ALL

SELECT
  date AS ds,
  event_name_2 AS holiday
FROM
  `retail-forecasting-506113.retail_forecasting.Calendar`
WHERE
  event_name_2 IS NOT NULL;
