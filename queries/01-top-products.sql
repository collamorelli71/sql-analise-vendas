-- =============================================
-- QUERY 01: Top 10 Products by Revenue
-- Techniques: GROUP BY, SUM, ORDER BY, JOIN
-- =============================================
-- Business Question: Which products generate the most revenue?

SELECT
    p.name AS product_name,
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(AVG(oi.unit_price), 2) AS avg_selling_price
FROM order_items oi
JOIN products p ON p.id = oi.product_id
GROUP BY p.name, p.category
ORDER BY total_revenue DESC
LIMIT 10;
