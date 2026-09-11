# Retail Demand Forecasting & Inventory Optimization

A data analytics and machine learning project for forecasting retail demand and supporting inventory planning using the **M5 Walmart retail sales dataset**.

The project combines **Python, SQL, Google BigQuery, dbt, Prophet, LightGBM, and Streamlit** to build an end-to-end retail forecasting and inventory optimization workflow.

---

## 📌 Project Overview

Retail businesses need accurate demand forecasts to maintain the right inventory levels.

If demand is underestimated, businesses may face:

* Stockouts
* Lost sales
* Poor customer satisfaction
* Emergency replenishment

If demand is overestimated, businesses may face:

* Overstocking
* Higher storage costs
* Excess working capital
* Inventory waste

This project aims to transform historical retail sales data into **forecast-driven inventory planning insights**.

The workflow covers:

**Raw Data → Data Validation → SQL/dbt Transformation → Feature Engineering → Forecasting → Model Evaluation → Inventory Optimization → Interactive Dashboard**

---

## 🎯 Project Objectives

The main objectives of this project are to:

* Analyze historical retail sales data
* Validate and clean retail datasets
* Identify demand trends and seasonal patterns
* Build analytical tables using SQL and dbt
* Engineer time-series forecasting features
* Develop demand forecasting models
* Compare forecasting model performance
* Generate future demand forecasts
* Support inventory planning and replenishment decisions
* Build an interactive Streamlit dashboard
* Provide what-if analysis for business decision-making

---

# 📊 Dataset

## M5 Forecasting Dataset

The project uses the **M5 Forecasting dataset**, based on Walmart retail sales.

The dataset contains hierarchical information covering:

* Stores
* States
* Departments
* Categories
* Products/items
* Daily sales
* Calendar information
* Events and holidays
* Product prices

The original dataset is not stored directly in this repository because of its large size.

### Main M5 datasets

| Dataset                  | Purpose                               |
| ------------------------ | ------------------------------------- |
| `sales_train_evaluation` | Historical daily product-level sales  |
| `sell_prices`            | Product price information             |
| `calendar`               | Dates, events and calendar attributes |

---

# 🛠️ Technology Stack

| Area                    | Technology             |
| ----------------------- | ---------------------- |
| Programming             | Python                 |
| Data Analysis           | Pandas, NumPy          |
| Visualization           | Matplotlib             |
| Machine Learning        | LightGBM, Scikit-learn |
| Time-Series Forecasting | Prophet                |
| Data Warehouse          | Google BigQuery        |
| Query Language          | SQL                    |
| Data Transformation     | dbt                    |
| Dashboard               | Streamlit              |
| Version Control         | Git & GitHub           |
| Notebook Environment    | Google Colab           |

---

# ☁️ Data Warehouse

The project uses **Google BigQuery** as the analytical data warehouse.

### BigQuery Project

```text
retail-forecasting-506113
```

### Dataset

```text
retail_forecasting
```

### Important analytical tables

```text
Calendar
sales_train_evaluation
sell_prices
stg_sales
sales_cleaned
sales_features
sales_calendar_features
sales_price_features
modeling_features
final_feature_table
prophet_training_data
prophet_training_data_ready
lightgbm_training_data
lightgbm_forecasts
inventory_optimization
```

---

# 🔄 Project Workflow

```text
                    M5 Walmart Dataset
                           │
                           ▼
                 Data Extraction & Loading
                           │
                           ▼
                  Google BigQuery
                           │
                           ▼
                 Data Quality Validation
                           │
                           ▼
                    SQL Transformations
                           │
                           ▼
                       dbt Models
                           │
                           ▼
                   Feature Engineering
                           │
              ┌────────────┴────────────┐
              ▼                         ▼
          Prophet                    LightGBM
              │                         │
              └────────────┬────────────┘
                           ▼
                   Model Evaluation
                           │
                           ▼
                  Demand Forecasting
                           │
                           ▼
                 Inventory Optimization
                           │
                           ▼
                  Streamlit Dashboard
                           │
                           ▼
                 Business Insights
```

---

# 🗓️ Development Progress

## Week 1 — Data Architecture & ETL

### Completed

* Google Cloud project setup
* BigQuery enabled
* BigQuery dataset created
* M5 data loaded into BigQuery
* Raw tables created
* Sales data validation
* Price data validation
* Calendar validation
* Data cleaning and quality checks
* SQL validation queries

### Data Quality Results

#### Sales Data

| Check          |  Result |
| -------------- | ------: |
| Rows validated | 914,700 |
| Missing sales  |       0 |
| Negative sales |       0 |
| Minimum sales  |       0 |
| Maximum sales  |     436 |
| Average sales  |  0.8673 |

#### Price Data

| Check           |    Result |
| --------------- | --------: |
| Rows            | 6,841,121 |
| Missing prices  |         0 |
| Negative prices |         0 |
| Minimum price   |      0.01 |
| Maximum price   |    107.32 |
| Average price   |    4.4110 |

#### Calendar Data

| Check         |                   Result |
| ------------- | -----------------------: |
| Rows          |                    1,969 |
| Missing dates |                        0 |
| Unique dates  |                    1,969 |
| Date range    | 2011-01-29 to 2016-06-19 |

### Week 1 Result

The major sales, price and calendar quality checks were completed successfully.

---

# Week 2 — Data Transformation & dbt

### Completed

* dbt project configuration
* Staging model creation
* Sales transformation
* Feature preparation
* Analytical table development
* Data lineage and transformation documentation
* Final feature table preparation

---

# Week 3 — Demand Forecasting

## Day 1 — Feature Table Validation

The final analytical feature table was validated before model training.

### Table

```text
retail-forecasting-506113.retail_forecasting.final_feature_table
```

### Validation Results

| Check                  |  Result | Status |
| ---------------------- | ------: | ------ |
| Total rows             | 152,450 | ✅ PASS |
| NULL sales             |       0 | ✅ PASS |
| Negative sales         |       0 | ✅ PASS |
| Minimum sales          |       0 | ✅ PASS |
| Maximum sales          |     436 | ✅ PASS |
| Average sales          |  0.8706 | ✅ PASS |
| Lag 1 populated        | 121,960 | ✅ PASS |
| Lag 2 populated        |  91,470 | ✅ PASS |
| Difference 1 populated | 121,960 | ✅ PASS |
| Rolling 3 populated    | 152,450 | ✅ PASS |

The feature table was confirmed ready for model training and validation.

---

# 📈 Feature Engineering

The forecasting dataset contains historical and time-based features.

### Main features

```text
item_id
dept_id
cat_id
store_id
state_id
sales_lag_1
sales_lag_2
sales_diff_1
sales_rolling_3
day_number
week_number
month_number
quarter_number
is_weekend
```

### Lag Features

Lag features capture previous sales observations:

```text
sales_lag_1
sales_lag_2
```

These features help the model understand recent demand behavior.

### Difference Feature

```text
sales_diff_1
```

This represents the change between consecutive observations and helps capture short-term demand movement.

### Rolling Feature

```text
sales_rolling_3
```

This captures recent demand patterns using a rolling three-period calculation.

### Calendar Features

The project also uses:

* Day number
* Week number
* Month
* Quarter
* Weekend indicator

---

# 🔮 Forecasting Models

## Prophet

Prophet is used for time-series forecasting and to analyze:

* Trend
* Seasonality
* Holiday effects
* High-volume products
* Demand patterns over time

Prophet is particularly useful for understanding the time-series structure of retail demand.

---

## LightGBM

LightGBM is used as the machine-learning forecasting model for granular demand prediction.

The model uses historical demand, product/store information and time-based features.

### Model Configuration

```python
LGBMRegressor(
    objective="regression",
    n_estimators=500,
    learning_rate=0.05,
    num_leaves=31,
    max_depth=-1,
    subsample=0.8,
    colsample_bytree=0.8,
    random_state=42
)
```

### Validation Strategy

The dataset is split chronologically rather than randomly.

This is important because future observations should not be used to train a model that predicts the past.

The validation period represents later observations in the time series.

---

# 📊 LightGBM Model Evaluation

The current LightGBM validation results are:

| Metric                              | Result |
| ----------------------------------- | -----: |
| MAE                                 | 0.0413 |
| RMSE                                | 0.8601 |
| Negative predictions after clipping |      0 |

Negative predictions close to zero were clipped using:

```python
y_pred_fixed = np.maximum(y_pred, 0)
```

This is appropriate for demand forecasting because sales demand cannot be negative.

> **Note:** Additional model comparison and evaluation will be documented as the forecasting phase progresses.

---

# 📅 Forecast Generation

The forecasting pipeline is designed to generate future demand predictions at item/store level.

A previously generated forecast output contained:

| Metric         |     Result |
| -------------- | ---------: |
| Forecast rows  |        140 |
| Items          |          2 |
| Stores         |          4 |
| Forecast start | 2016-04-25 |
| Forecast end   | 2016-05-22 |

Future iterations will expand the forecast generation to support the dashboard's 30-day demand forecasting requirement.

---

# 📦 Inventory Optimization

The forecasting output will be used to support inventory planning.

The inventory optimization layer focuses on:

* Expected demand
* Forecast-based stock planning
* Reorder requirements
* High-demand product identification
* Stockout risk
* Overstock risk

The goal is to move from:

```text
Historical Inventory Planning
            ↓
Forecast-Based Inventory Planning
```

---

# 🖥️ Streamlit Dashboard

The project includes an interactive Streamlit dashboard for business users.

The dashboard is designed to allow users to explore:

* Store-level demand
* Product/category demand
* Historical sales
* Forecasted demand
* Forecast trends
* Inventory indicators
* Business KPIs

### Planned dashboard workflow

```text
Select Store
     ↓
Select Category / Item
     ↓
View Historical Demand
     ↓
View 30-Day Forecast
     ↓
Review Inventory Indicators
     ↓
Business Decision
```

---

# 🔍 What-If Scenario Analysis

A what-if analysis component is planned to support business scenario evaluation.

Example:

```text
Scenario:
10% Price Reduction

        ↓

Estimate potential demand impact

        ↓

Compare with baseline demand

        ↓

Evaluate inventory requirement

        ↓

Support pricing and inventory decisions
```

### Important modeling note

The current LightGBM model is trained using demand and time-based features and **does not directly learn price elasticity**.

Therefore, a price scenario should not be interpreted as a causal price-response prediction unless price is incorporated into the trained forecasting model.

Future development can include a price-aware forecasting model using the available `sell_prices` data.

---

# 📁 Repository Structure

The current repository is organized around data, notebooks, SQL, models, dashboards and documentation.

```text
Retail-Demand-Forecasting-Inventory-Optimization/
│
├── data/
│   └── raw/
│
├── notebooks/
│   ├── bigquery.ipynb
│   ├── lightgbm_forecasting.ipynb
│   └── ...
│
├── sql/
│   ├── ...
│
├── models/
│   └── lightgbm_model.pkl
│
├── models/
│   └── staging/
│       └── stg_sales.sql
│
├── Dashboards/
│   └── ...
│
├── docs/
│   └── ...
│
├── REPORTS/
│   └── ...
│
├── app.py
├── dbt_project.yml
├── .gitignore
└── README.md
```

> The repository structure may continue to evolve as additional forecasting, dashboard and inventory modules are completed.

---

# 📌 Key Project Outputs

The completed solution is intended to provide:

### Data Analytics

* Historical sales analysis
* Product-level demand analysis
* Store-level demand analysis
* Trend and seasonality analysis

### Machine Learning

* Demand forecasting
* Time-aware model validation
* LightGBM forecasting
* Prophet forecasting
* Model performance evaluation

### Inventory Planning

* Forecast-based inventory planning
* Demand-driven replenishment insights
* High-demand item identification
* Stockout-risk analysis
* Overstock-risk analysis

### Business Intelligence

* Interactive Streamlit dashboard
* Forecast visualization
* KPI reporting
* What-if scenario analysis

---

# 💡 Business Value

The project demonstrates how retail analytics can connect:

```text
DATA
  ↓
FORECAST
  ↓
INVENTORY
  ↓
BUSINESS DECISION
```

The solution aims to help retail teams:

* Improve demand visibility
* Reduce stockout risk
* Avoid unnecessary overstock
* Improve replenishment planning
* Identify high-demand products
* Support data-driven procurement decisions
* Improve operational efficiency

---

# 🚀 Future Enhancements

Future improvements may include:

* Full 30-day item-level forecasting
* Price-aware demand forecasting
* Advanced price elasticity modeling
* Promotion impact analysis
* Safety-stock optimization
* Reorder-point optimization
* Automated model retraining
* Forecast monitoring
* Model drift detection
* Real-time inventory integration
* Automated low-stock alerts
* Cloud deployment
* Enterprise inventory system integration

---

# 👥 Project Team

**Team Size:** 2 Members

The project covers multiple areas including:

* Data engineering
* Data validation
* SQL transformation
* dbt modeling
* Feature engineering
* Time-series forecasting
* Machine learning
* Inventory optimization
* Dashboard development

---

# 📊 Project Status

**Current Status: In Development**

### Completed

* ✅ BigQuery setup
* ✅ M5 dataset loading
* ✅ Data quality validation
* ✅ SQL transformations
* ✅ dbt staging/transformation
* ✅ Feature engineering
* ✅ Final feature table validation
* ✅ Prophet forecasting work
* ✅ LightGBM model development
* ✅ LightGBM model evaluation
* ✅ Model artifact generation

### In Progress

* 🔄 Model comparison
* 🔄 Extended forecast generation
* 🔄 Inventory optimization
* 🔄 Streamlit dashboard refinement
* 🔄 What-if scenario analysis
* 🔄 Final documentation and project handover

---

# 📚 Learning Outcomes

This project provides practical experience in:

* Retail analytics
* Demand forecasting
* Time-series analysis
* Feature engineering
* Machine learning
* SQL
* BigQuery
* dbt
* Git and GitHub
* Model evaluation
* Business analytics
* Inventory optimization
* Dashboard development

---

# 📄 License

This project is developed for **educational and internship purposes**.

The M5 Forecasting dataset belongs to its respective data provider and is not redistributed through this repository.

---

## 🔗 Project Repository

**GitHub:**
`https://github.com/ligimathew123/Retail-Demand-Forecasting-Inventory-Optimization`
