import streamlit as st
import pandas as pd
from google.cloud import bigquery


# ==========================================
# PAGE CONFIGURATION
# ==========================================

st.set_page_config(
    page_title="Retail Demand Forecasting & Inventory Optimization",
    page_icon="📦",
    layout="wide"
)


# ==========================================
# TITLE
# ==========================================

st.title("📦 Retail Demand Forecasting & Inventory Optimization")
st.markdown(
    "Machine Learning based demand forecasting and inventory recommendation system"
)

st.divider()


# ==========================================
# BIGQUERY CONNECTION
# ==========================================

PROJECT_ID = "retail-forecasting-506113"

TABLE_ID = (
    "retail-forecasting-506113."
    "retail_forecasting.inventory_optimization"
)


@st.cache_data
def load_inventory_data():

    client = bigquery.Client(project=PROJECT_ID)

    query = f"""
        SELECT
            item_id,
            store_id,
            average_daily_demand,
            demand_std,
            safety_stock,
            reorder_point,
            recommended_inventory
        FROM `{TABLE_ID}`
        ORDER BY recommended_inventory DESC
    """

    return client.query(query).to_dataframe()


# ==========================================
# LOAD DATA
# ==========================================

try:

    df = load_inventory_data()

except Exception as e:

    st.error("Unable to connect to BigQuery.")
    st.error(str(e))
    st.stop()


# ==========================================
# SIDEBAR
# ==========================================

st.sidebar.header("Dashboard Filters")

items = ["All"] + sorted(df["item_id"].unique().tolist())

selected_item = st.sidebar.selectbox(
    "Select Item",
    items
)


stores = ["All"] + sorted(df["store_id"].unique().tolist())

selected_store = st.sidebar.selectbox(
    "Select Store",
    stores
)


# ==========================================
# APPLY FILTERS
# ==========================================

filtered_df = df.copy()

if selected_item != "All":

    filtered_df = filtered_df[
        filtered_df["item_id"] == selected_item
    ]

if selected_store != "All":

    filtered_df = filtered_df[
        filtered_df["store_id"] == selected_store
    ]


# ==========================================
# KPI SECTION
# ==========================================

st.subheader("📊 Inventory Overview")

col1, col2, col3, col4 = st.columns(4)


with col1:

    st.metric(
        "Products / Stores",
        len(filtered_df)
    )


with col2:

    st.metric(
        "Avg Daily Demand",
        f"{filtered_df['average_daily_demand'].mean():.2f}"
    )


with col3:

    st.metric(
        "Total Safety Stock",
        f"{filtered_df['safety_stock'].sum():.2f}"
    )


with col4:

    st.metric(
        "Recommended Inventory",
        f"{filtered_df['recommended_inventory'].sum():.2f}"
    )
# ==========================================
# FORECAST MODEL PERFORMANCE
# ==========================================

st.subheader("🤖 Forecast Model Performance")

metric_col1, metric_col2, metric_col3 = st.columns(3)

with metric_col1:
    st.metric("Model", "LightGBM")

with metric_col2:
    st.metric("MAE", "12.16")

with metric_col3:
    st.metric("RMSE", "15.37")


st.divider()

# ==========================================
# DEMAND FORECAST
# ==========================================

st.subheader("📊 Actual vs Predicted Demand")

forecast_query = """
SELECT
    item_id,
    store_id,
    ds,
    actual_demand,
    predicted_demand
FROM `retail-forecasting-506113.retail_forecasting.lightgbm_forecasts`
ORDER BY ds
"""

forecast_client = bigquery.Client(project=PROJECT_ID)

forecast_df = forecast_client.query(
    forecast_query
).to_dataframe()

forecast_df["ds"] = pd.to_datetime(forecast_df["ds"])


# ==========================================
# FORECAST FILTERS
# ==========================================

forecast_col1, forecast_col2 = st.columns(2)

with forecast_col1:

    forecast_items = [
        "All"
    ] + sorted(
        forecast_df["item_id"].unique().tolist()
    )

    forecast_item = st.selectbox(
        "Forecast Item",
        forecast_items
    )


with forecast_col2:

    forecast_stores = [
        "All"
    ] + sorted(
        forecast_df["store_id"].unique().tolist()
    )

    forecast_store = st.selectbox(
        "Forecast Store",
        forecast_stores
    )


# ==========================================
# APPLY FORECAST FILTERS
# ==========================================

filtered_forecast = forecast_df.copy()

if forecast_item != "All":

    filtered_forecast = filtered_forecast[
        filtered_forecast["item_id"] == forecast_item
    ]

if forecast_store != "All":

    filtered_forecast = filtered_forecast[
        filtered_forecast["store_id"] == forecast_store
    ]


# ==========================================
# FORECAST CHART
# ==========================================

forecast_chart = (
    filtered_forecast
    .groupby("ds")[
        [
            "actual_demand",
            "predicted_demand"
        ]
    ]
    .mean()
)

st.line_chart(forecast_chart)


# ==========================================
# INVENTORY RECOMMENDATION CHART
# ==========================================

st.subheader("📈 Recommended Inventory by Item and Store")

chart_data = filtered_df.copy()

chart_data["location"] = (
    chart_data["item_id"]
    + " - "
    + chart_data["store_id"]
)

chart_data = chart_data.set_index("location")

st.bar_chart(
    chart_data["recommended_inventory"]
)


# ==========================================
# DEMAND VS REORDER POINT
# ==========================================

st.subheader("📦 Demand and Reorder Point")

comparison_data = filtered_df.copy()

comparison_data["location"] = (
    comparison_data["item_id"]
    + " - "
    + comparison_data["store_id"]
)

comparison_data = comparison_data.set_index("location")

st.bar_chart(
    comparison_data[
        [
            "average_daily_demand",
            "reorder_point"
        ]
    ]
)


# ==========================================
# SAFETY STOCK
# ==========================================

st.subheader("🛡️ Safety Stock")

safety_data = filtered_df.copy()

safety_data["location"] = (
    safety_data["item_id"]
    + " - "
    + safety_data["store_id"]
)

safety_data = safety_data.set_index("location")

st.bar_chart(
    safety_data["safety_stock"]
)


# ==========================================
# DATA TABLE
# ==========================================

st.subheader("📋 Inventory Recommendations")

display_df = filtered_df.copy()

display_df.columns = [
    "Item ID",
    "Store ID",
    "Average Daily Demand",
    "Demand Std",
    "Safety Stock",
    "Reorder Point",
    "Recommended Inventory"
]

st.dataframe(
    display_df,
    use_container_width=True,
    hide_index=True
)


# ==========================================
# PROJECT INFORMATION
# ==========================================

st.divider()

st.subheader("ℹ️ Model Information")

info_col1, info_col2, info_col3 = st.columns(3)

with info_col1:
    st.info("**Forecasting Model:** LightGBM")

with info_col2:
    st.info("**Lead Time:** 7 Days")

with info_col3:
    st.info("**Service Level:** 95%")


st.caption(
    "Retail Demand Forecasting & Inventory Optimization Project"
)