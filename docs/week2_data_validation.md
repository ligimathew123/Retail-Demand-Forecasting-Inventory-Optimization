# Week 2 - Data Validation

## Staging Sales Validation

The `stg_sales` table was inspected and validated as the starting point for
the Week 2 analytical data pipeline.

### Dataset Summary

- Total rows: 152,450
- Unique items: 3,049
- Unique stores: 10
- Number of days currently staged: 5
- Sales column type: INT64
- Sales minimum: 0
- Sales maximum: 436
- Average sales: 0.870587

### Schema

| Column | Data Type |
|---|---|
| id | STRING |
| item_id | STRING |
| dept_id | STRING |
| cat_id | STRING |
| store_id | STRING |
| state_id | STRING |
| d | STRING |
| sales | INT64 |

### Source Tables

The project currently contains:

- `sales_train_evaluation`
- `sales_cleaned`
- `sell_prices`
- `Calendar`
- `stg_sales`

### Week 2 Next Step

The validated `stg_sales` table will be used to build the analytical
sales fact model and prepare the data for feature engineering and demand
forecasting.