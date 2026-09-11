# E-commerce Warehouse Analytics

## Project overview
This portfolio project analyses warehouse and delivery performance for 20,001 cleaned order records from January through August 2026.

## Business questions
1. Which warehouses have the weakest delivery and return performance?
2. Which product categories drive gross order value?
3. How do order value and delivery performance change by month?
4. Where are low-inventory risk signals concentrated?

## Data preparation
- Removed 79 exact duplicate records.
- Filled 80 missing customer cities and 40 missing product categories with **Unknown**.
- Filled 60 missing processing times with the median (7.00 hours).
- Filled 60 missing shipping costs with the median (₹212.06).
- Added Month, Delivery_Gap_Days, Fulfillment_Hours, and Low_Stock_Flag. Low stock means Inventory_After is below 20 units.

## Main findings
- Gross order value is ₹6,75,05,368 across 20,001 orders.
- 79.1% of orders were delayed, with an average delivery gap of 1.46 days.
- WH-Central has the highest delay rate at 82.7%.
- WH-West has the highest return rate at 5.0%.
- Furniture contributes 33.7% of gross order value.

## Deliverables
- **ecommerce_warehouse_dashboard.xlsx**: dashboard, performance tables, trends, clean data, and data dictionary.
- **cleaned_ecommerce_warehouse.csv**: cleaned analysis-ready dataset.
- **analysis_queries.sql**: reusable SQL analysis queries.

## Tools
Excel or Power BI for dashboarding, SQL for analysis, and Python/pandas or equivalent for data preparation.
