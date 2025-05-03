# Order-Data-Analysis
# 📦 Order Data Cleaning & Sales Analysis with Pandas and SQL

This project focuses on cleaning and analyzing an orders dataset containing various product and sales-related fields. The goal is to derive actionable insights from raw data using Python (Pandas) for preprocessing and SQL for analysis.

---

## 🧾 Dataset Overview

The dataset contains the following columns:
- `order_id`, `order_date`, `ship_mode`, `segment`, `country`, `city`, `state`, `postal_code`, `region`,  
- `category`, `sub_category`, `product_id`, `quantity`, `discount`, `sale_price`, `profit`

---

## 🧹 Data Cleaning (with Pandas)
- Handled missing values and data type conversions
- Extracted relevant time-based features like `year`, `month`, and `year-month`
- Standardized and validated fields such as `category`, `sub_category`, and `region`

---

## 📊 Sales Analysis (with SQL)

Key business questions answered:

1. **Top 10 Highest Revenue-Generating Products**
   - Identified based on total sales revenue across the dataset.

2. **Top 5 Highest Selling Products in Each Region**
   - Grouped and ranked using SQL window functions.

3. **Month-over-Month Sales Growth: 2022 vs 2023**
   - Calculated the monthly growth rates and compared year-on-year performance.

4. **Highest Sales Month per Category**
   - Used SQL ranking to determine which month saw peak sales for each product category.

5. **Sub-Category with Highest Profit Growth (2023 vs 2022)**
   - Computed percentage increase in profit year-over-year at the sub-category level.

---

## 💻 Technologies Used
- **Python** – Data wrangling using Pandas
- **SQL** – Analytical queries (CTEs, window functions)
- **Jupyter Notebooks** – Exploration and documentation

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/varshaverma22/order-data-analysis.git
   cd order-data-analysis
