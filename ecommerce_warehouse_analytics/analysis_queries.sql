-- E-commerce warehouse analytics queries
-- Assumes a table named ecommerce_warehouse_clean.

-- 1. Warehouse performance
SELECT warehouse_id,
       COUNT(*) AS orders,
       ROUND(SUM(order_value), 2) AS gross_order_value,
       ROUND(AVG(CASE WHEN delivery_status = 'Delayed' THEN 1.0 ELSE 0.0 END) * 100, 1) AS delay_rate_pct,
       ROUND(AVG(CASE WHEN return_status = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 1) AS return_rate_pct,
       ROUND(AVG(actual_delivery_days - expected_delivery_days), 2) AS average_delivery_gap_days
FROM ecommerce_warehouse_clean
GROUP BY warehouse_id
ORDER BY delay_rate_pct DESC;

-- 2. Monthly trend
SELECT DATE_TRUNC('month', order_date) AS month,
       COUNT(*) AS orders,
       ROUND(SUM(order_value), 2) AS gross_order_value,
       ROUND(AVG(CASE WHEN delivery_status = 'Delayed' THEN 1.0 ELSE 0.0 END) * 100, 1) AS delay_rate_pct
FROM ecommerce_warehouse_clean
GROUP BY 1
ORDER BY 1;

-- 3. Category contribution
SELECT product_category,
       COUNT(*) AS orders,
       ROUND(SUM(order_value), 2) AS gross_order_value,
       ROUND(SUM(order_value) / SUM(SUM(order_value)) OVER () * 100, 1) AS revenue_share_pct
FROM ecommerce_warehouse_clean
GROUP BY product_category
ORDER BY gross_order_value DESC;

-- 4. Low stock risk by warehouse
SELECT warehouse_id,
       COUNT(*) AS low_stock_order_lines,
       ROUND(AVG(inventory_after), 1) AS average_inventory_after
FROM ecommerce_warehouse_clean
WHERE inventory_after < 20
GROUP BY warehouse_id
ORDER BY low_stock_order_lines DESC;
