# Retail-Demand-Forecasting-Inventory-Optimization
Retail demand forecasting and inventory optimization platform using the M5 Walmart dataset, Python, SQL, dbt, Prophet, LightGBM, and Streamlit.
# Retail Demand Forecasting & Inventory Optimization

## 📌 Project Overview

This project focuses on building an automated analytics platform for retail and supply chain teams to forecast future product demand and support data-driven inventory decisions.

The system uses historical Walmart retail sales data to analyze sales trends, seasonality, promotional events, pricing, and store/product-level patterns. Forecasting models will be used to predict future demand and generate inventory restocking recommendations.

The project is being developed as a 4-week data analytics and machine learning project.

---

## 🎯 Objectives

* Analyze historical retail sales data.
* Identify demand trends and seasonal patterns.
* Transform and prepare sales data for forecasting.
* Build time-series demand forecasting models.
* Compare forecasting model performance.
* Generate inventory reorder recommendations.
* Develop an interactive dashboard for demand and inventory analysis.
* Support proactive, data-driven inventory planning.

---

## 📊 Data Source

**Primary Dataset:** M5 Forecasting Dataset – Walmart historical sales data

The dataset contains hierarchical retail sales information covering:

* Stores
* Departments
* Products/Items
* Product categories
* Daily sales
* Calendar events
* Pricing information

> The original dataset is not stored directly in this repository because of its large size.

---

## 🛠️ Technology Stack

| Component            | Technology        |
| -------------------- | ----------------- |
| Programming          | Python            |
| Database / Warehouse | Google BigQuery   |
| Query Language       | SQL               |
| Data Transformation  | dbt               |
| Forecasting          | Prophet, LightGBM |
| Visualization        | Streamlit         |
| Version Control      | Git & GitHub      |

---

## 🔄 Project Workflow

```text
M5 Walmart Sales Data
        ↓
Data Extraction & Loading
        ↓
Data Quality Checks
        ↓
SQL / dbt Transformations
        ↓
Feature Engineering
        ↓
Demand Forecasting
        ↓
Forecast Evaluation
        ↓
Inventory Optimization
        ↓
Streamlit Dashboard
```

---

## 📅 Development Plan

### Week 1 – Data Architecture & ETL

* Set up the data warehouse.
* Load the M5 dataset.
* Perform initial data exploration.
* Implement data quality checks.
* Standardize dates, sales, and pricing information.
* ## Week 1 Progress

### Day 1–3: BigQuery Setup
- Created Google Cloud project for the Retail Forecasting project
- Enabled BigQuery
- Created the BigQuery dataset
- Prepared tables for the M5 dataset
- Loaded raw M5 data into BigQuery

### Day 4–7: Data Quality & Cleaning
- Added data quality checks
- Validated dates and sales volumes
- Checked sell price data
- Implemented data cleaning using SQL/Python
- Week 1 – Data Quality Checks, add:
- 

Sales volume validation completed
Total rows checked: 914,700
Negative sales: 0
Missing sales: 0
Minimum sales: 0
Maximum sales: 436
Average sales: 0.8673
Result: Sales-volume data passed basic quality checks
Week 1: Data Architecture & ETL

Day 1–3
✓ BigQuery project setup
✓ Dataset and table creation
✓ Raw M5 dataset loaded
✓ Data loading/extraction process documented

Day 4–7
✓ Sales-volume quality validation
→ Price-data quality validation
→ Date formatting validation
→ Data cleaning/validation SQL
## Week 1 – Data Architecture & ETL

### Data Quality & Validation

Performed data quality checks in Google BigQuery on the M5 Retail Forecasting dataset.

#### Sales Data
- Total rows: 30,490
- Missing sales values checked: 0
- Negative sales values checked: 0
- Sales range: 0–117
- Average sales: 1.7822

#### Price Data
- Total rows: 6,841,121
- Missing prices: 0
- Negative prices: 0
- Price range: 0.01–107.32
- Average price: 4.4110

#### Calendar Data
- Total rows: 1,969
- Missing dates: 0
- Unique dates: 1,969
- Date range: 2011-01-29 to 2016-06-19

### Validation Result

All major data quality checks passed successfully. No missing or negative values were identified in the validated sales and price fields, and the calendar contained complete unique dates for the available period.

BigQuery → Data loading → Cleaning → Validation → SQL documentation → GitHub

### Week 2 – Data Transformation with dbt

* Configure dbt.
* Create staging models.
* Transform and aggregate sales data.
* Build analytical data marts.
* Document data lineage and transformation logic.

### Week 3 – Time-Series Forecasting

* Analyze demand trends and seasonality.
* Implement Prophet forecasting.
* Develop LightGBM forecasting models.
* Evaluate forecasting performance.
* Store forecast results for analysis.

### Week 4 – Dashboard & Inventory Optimization

* Build an interactive Streamlit dashboard.
* Display 30-day demand forecasts.
* Develop inventory/reorder recommendations.
* Implement what-if analysis.
* Perform final testing and documentation.

---

## 📈 Expected Outputs

The completed platform will provide:

* Historical sales analysis
* Store and product-level demand trends
* 30-day demand forecasts
* Actual vs predicted sales comparison
* Forecast accuracy metrics
* Inventory risk identification
* Reorder recommendations
* Price/promotion what-if analysis
* Interactive business dashboard

---

## 📁 Repository Structure

```text
retail-demand-forecasting/
│
├── data/
│   └── README.md
│
├── notebooks/
│
├── src/
│
├── sql/
│
├── dbt/
│
├── models/
│
├── dashboard/
│
├── docs/
│
├── requirements.txt
├── .gitignore
└── README.md
```

---

## 👥 Project Team

**Team Size:** 2 Members

The project responsibilities are divided across data engineering, data transformation, forecasting, inventory optimization, and dashboard development.

---

## 🚧 Project Status

**Status:** In Development

Current phase:

> Project setup and data preparation

Features will be added progressively throughout the 4-week development cycle.

---

## 💡 Expected Business Impact

The solution aims to help retail and supply chain teams:

* Reduce stockout-related revenue loss.
* Identify products with high future demand.
* Reduce unnecessary overstocking.
* Improve inventory planning.
* Support proactive procurement decisions.
* Improve overall supply chain efficiency.

---

## 📚 Future Enhancements

Potential future improvements include:

* Automated model retraining.
* Real-time inventory updates.
* Advanced demand forecasting models.
* Automated alerts for low-stock products.
* Cloud deployment.
* Integration with enterprise inventory systems.

---

## 📄 License

This project is developed for educational and internship purposes.
