# Retail Demand Forecasting & Inventory Optimization

## Project Overview

This project uses historical Walmart retail sales data from the M5 Forecasting dataset to analyse sales patterns, forecast product demand, and support inventory planning decisions.

The objective is to demonstrate how data analytics, SQL, cloud data warehousing, and machine learning can help retailers make data-driven decisions.

## Business Problem

Retailers need to estimate future product demand to maintain appropriate inventory levels.

- Underestimating demand can lead to stockouts and lost sales.
- Overestimating demand can result in excess inventory and higher storage costs.

This project explores demand forecasting as a way to support better inventory planning.

## Tools and Technologies

- **Python:** Pandas, NumPy, Scikit-learn
- **SQL:** Data validation and transformation
- **Google BigQuery:** Data storage and analytical queries
- **dbt:** Data transformation and modelling
- **LightGBM:** Demand forecasting
- **Prophet:** Time-series forecasting exploration
- **Streamlit:** Interactive dashboard prototype
- **Git and GitHub:** Version control and documentation
- **Google Colab:** Notebook-based development

## Dataset

The project uses the M5 Walmart retail sales dataset, which contains information about:

- Historical daily product sales
- Stores, departments and product categories
- Calendar dates and events
- Product prices

The original dataset is not included in this repository because of its size.

## Project Workflow

1. Load retail sales, price and calendar data into BigQuery.
2. Validate data quality and check for missing or invalid values.
3. Transform data using SQL and dbt.
4. Create features such as lagged sales, rolling averages and calendar variables.
5. Explore time-series forecasting and develop a LightGBM forecasting model.
6. Evaluate model performance using MAE and RMSE.
7. Generate product/store-level demand forecasts.
8. Explore inventory planning indicators and visualise results through a Streamlit dashboard prototype.

## Data Quality and Feature Engineering

The documented validation checks include:

- Sales, price and calendar data quality checks.
- Missing and negative value checks.
- A validated analytical feature table containing **152,450 rows and 16 columns**.
- Lag, difference, rolling and calendar features to capture historical demand patterns.

## Model Evaluation

The LightGBM forecasting model was evaluated using Mean Absolute Error (MAE) and Root Mean Squared Error (RMSE).

| Metric | Result |
|---|---:|
| MAE | 12.16 |
| RMSE | 15.37 |

- **MAE (12.16):** The model's predictions differed from actual sales by an average absolute amount of approximately 12.16 units, assuming the target variable represents sales units.
- **RMSE (15.37):** This metric penalises larger prediction errors more heavily than MAE.

These metrics help assess the accuracy of the demand forecasting model on the test dataset.


These values should be interpreted in the context of the target variable and its scale. The final notebook should be used as the source of truth for the reported metrics.

A documented forecast output contains 140 rows covering two items and four stores over the period from April 25 to May 22, 2016. This is a limited forecast output, not evidence of a fully implemented 30-day forecasting system for every product and store.

## Dashboard and Inventory Planning

The repository includes a Streamlit dashboard application intended to help users explore historical demand, forecasts, product/store selections and inventory indicators.

The project explores how forecasts can support:

- Identifying products with higher expected demand.
- Planning replenishment.
- Monitoring potential stockout and overstock risks.
- Improving inventory-related decisions.

The dashboard's runtime connection to the data source should be verified before describing it as a fully deployed application.

## Key Learning Outcomes

This project provided practical exposure to:

- Retail sales data analysis.
- Data cleaning and quality validation.
- SQL transformations and BigQuery.
- Feature engineering for time-series forecasting.
- LightGBM model evaluation.
- Forecast interpretation and inventory planning.
- GitHub documentation and project organisation.

## Limitations and Future Improvements

- Expand forecasting coverage across more products and stores.
- Reconcile and document final model evaluation metrics.
- Validate dashboard execution and data-source connectivity.
- Improve inventory optimisation with clearly defined reorder-point and safety-stock calculations.
- Add price and promotion features before attempting price-impact forecasting.
- Explore automated forecast monitoring and deployment.

## Repository Structure

- `notebooks/` — analysis and forecasting notebooks
- `sql/` — SQL transformations and validation queries
- `models/` — model-related files
- `Dashboards/` — dashboard-related resources
- `docs/` — project documentation
- `REPORTS/` — reports
- `app.py` — Streamlit dashboard application
- `bigquery.ipynb` — BigQuery workflow notebook

## Project Team

Team size: 2 members.

The repository contains work across data preparation, SQL, forecasting and dashboard development. Individual contributions should be described separately and accurately when presenting the project in interviews.

## Conclusion

This project demonstrates a retail analytics workflow that connects historical sales data, data transformation, demand forecasting and inventory planning. It helped develop practical skills in SQL, Python, BigQuery and forecasting analysis.
