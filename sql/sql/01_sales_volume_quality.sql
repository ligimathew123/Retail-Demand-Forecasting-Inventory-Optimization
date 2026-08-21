SELECT
  COUNT(*) AS total_rows,
  COUNTIF(sales < 0) AS negative_sales,
  COUNTIF(sales IS NULL) AS missing_sales,
  MIN(sales) AS minimum_sales,
  MAX(sales) AS maximum_sales,
  AVG(sales) AS average_sales
FROM `your_project.your_dataset.your_table`;
