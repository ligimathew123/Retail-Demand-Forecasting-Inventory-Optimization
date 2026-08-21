
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(sell_price IS NULL) AS missing_prices,
  COUNTIF(sell_price < 0) AS negative_prices,
  MIN(sell_price) AS minimum_price,
  MAX(sell_price) AS maximum_price,
  AVG(sell_price) AS average_price
FROM `retail_forecasting.sell_prices`;






No missing prices → ✅
No negative prices → ✅
All prices are positive → ✅
Price range is $0.01–$107.32 → reasonable for validation
Average price is approximately $4.41


Pricing information quality check — COMPLETED ✅
